unit ChaildFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Menus, IBDatabase,
  DB, IBCustomDataSet, IBQuery, DBCtrls, ActnList, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery, fib, ComCtrls;

type
  TEditorSetState = (esEdit, esInsert, esDelete, esNone);

  TChaildForm = class(TForm)
    dbgrd1: TDBGrid;
    btn1: TBitBtn;
    btn2: TBitBtn;
    pnl1: TPanel;
    mm1: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    Insert1: TMenuItem;
    Delete1: TMenuItem;
    btnSave: TButton;
    btnCancel: TButton;
    pm1: TPopupMenu;
    Edit2: TMenuItem;
    Insert2: TMenuItem;
    N1: TMenuItem;
    Delete2: TMenuItem;
    pfbdtst1: TpFIBDataSet;
    ds1: TDataSource;
    stat1: TStatusBar;
    actlst1: TActionList;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actSave: TAction;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Insert1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject); virtual;
    procedure FormShow(Sender: TObject);
    procedure dbgrd1DblClick(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    procedure NullAllField;
  public
    { Public declarations }
    FEditorState: TEditorSetState;
    FCheckComponents: TList;
  protected
    procedure QueryPrepare;
  end;

var
  ChaildForm: TChaildForm;

implementation

uses MainFrm, DM_, CustomerFunctions;

const
  STATE_PNL_SBAR = 0;

  INFO_PNL_SBAR = 1;

{$R *.dfm}


{ TODO 2 -oAcrion -cUpdate : UPDATE для Edit, Insert, Delete }

procedure TChaildForm.FormCreate(Sender: TObject);
begin
  FEditorState := esNone;
  btnSave.Enabled := False;
  pfbdtst1.Open;
  FCheckComponents := TList.Create;
end;

procedure TChaildForm.Edit1Click(Sender: TObject);
begin
  if pfbdtst1.Eof then begin
    btnCancelClick(nil);
    Abort;
  end;
  FEditorState := esEdit;
  stat1.Panels[STATE_PNL_SBAR].Text := 'Edit';
  btnSave.Enabled := True;
end;

procedure TChaildForm.Insert1Click(Sender: TObject);
begin
  FEditorState := esInsert;
  stat1.Panels[STATE_PNL_SBAR].Text := 'Insert';
  btnSave.Enabled := True;
end;

// вызывает метод потомка потому что virtual
procedure TChaildForm.Delete1Click(Sender: TObject);
begin
  FEditorState := esNone;
  stat1.Panels[STATE_PNL_SBAR].Text := 'Delete';
  stat1.Refresh;
  if Application.MessageBox('Вы действительно хотите удалить запись?',
      'Удаление', MB_ICONQUESTION + MB_YESNO) = ID_YES then
    FEditorState := esDelete;
  btnSaveClick(nil);
  stat1.Panels[STATE_PNL_SBAR].Text := '';
end;

// отмена
procedure TChaildForm.btnCancelClick(Sender: TObject);
begin
  FEditorState := esNone;
  btnSave.Enabled := False;
  stat1.Panels[STATE_PNL_SBAR].Text := '';
  NullAllField;
end;

// сохранить
procedure TChaildForm.btnSaveClick(Sender: TObject);
begin
  try
    try
      with pfbdtst1 do
      case FEditorState of
        esDelete: begin
          if dbgrd1.DataSource.DataSet.Eof then
            Exit;
          Delete;
        end;

        esEdit: begin
          if dbgrd1.DataSource.DataSet.Eof then
            Exit;
          Edit;
          Post;
        end;

        esInsert: begin
          Insert;
          Post;
        end;

      else
        raise EAbort.Create('Не определенное значение FEditorState');
      end;

      pfbdtst1.Close;
      pfbdtst1.Open;

      DM.pfbtrnsctn1.CommitRetaining;
    except
      on EFIBError do
        raise EAbort.Create('Ошибка базы данных' + #13#10 + 'Обратитесь к разработчику');
    end;
  except
    { DONE -oexception -cошибки  : проверить hook на ошибки }
    on E: Exception do begin
      DM.pfbtrnsctn1.Rollback;
      Application.MessageBox(PChar(E.Message), 'Ошибка', MB_ICONERROR);
      raise Exception.Create(E.Message);
    end;
  end;

  btnCancelClick(nil);
end;

// обнулить поля
procedure TChaildForm.NullAllField;
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TEdit then
      (Components[I] as TEdit).Clear else
    if Components[I] is TDBLookupComboBox then
      (Components[I] as TDBLookupComboBox).KeyValue := null
end;

procedure TChaildForm.FormShow(Sender: TObject);
begin
  NullAllField;
  if not pfbdtst1.Active then
    pfbdtst1.Open
end;

// выбрать и закрыть
procedure TChaildForm.dbgrd1DblClick(Sender: TObject);
begin
  ModalResult := mrNone;
  if not dbgrd1.DataSource.DataSet.Eof then
    ModalResult := mrOk;
end;

// подготовка 
procedure TChaildForm.QueryPrepare;
  procedure Prep(Q: TFIBQuery);
  begin
    if not Q.Prepared then
      Q.Prepare;
  end;
begin
  with pfbdtst1 do begin
    if not Active then
      Open;
    case FEditorState of
      esEdit: Prep(QUpdate);
      esInsert: Prep(QInsert);
      esDelete: Prep(QDelete);
    end;
  end;
end;

// возможно ли сохранение
procedure TChaildForm.actSaveUpdate(Sender: TObject);
const
  CheckInput = 'Заполните все поля';
var
  I: Integer;
begin
  case FEditorState of
    esEdit, esInsert: begin
      for I := 0 to FCheckComponents.Count - 1 do
        if (TObject(FCheckComponents.Items[I]) is TEdit) then
          actSave.Enabled :=
            (TObject(FCheckComponents.Items[I]) as TEdit).Text <> '' else
        if (TObject(FCheckComponents.Items[I]) is TDBLookupComboBox) then
          actSave.Enabled :=
            (TObject(FCheckComponents.Items[I]) as TDBLookupComboBox).KeyValue <> Null;

      if actSave.Enabled then
        stat1.Panels[INFO_PNL_SBAR].Text := NullAsStringValue else
      if stat1.Panels[INFO_PNL_SBAR].Text = NullAsStringValue then
          stat1.Panels[INFO_PNL_SBAR].Text := CheckInput
    end;
  else
    stat1.Panels[INFO_PNL_SBAR].Text := '';
    actSave.Enabled := False;
  end;
end;

procedure TChaildForm.FormDestroy(Sender: TObject);
begin
  FCheckComponents.Free;
  pfbdtst1.Close;
end;

// закрыть все комбо 
procedure TChaildForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CloseAllCombobox(Self)
end;

end.
