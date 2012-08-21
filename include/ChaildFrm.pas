unit ChaildFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Menus, IBDatabase,
  DB, IBCustomDataSet, IBQuery, DBCtrls, ActnList, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery, fib;

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
    actlst1: TActionList;
    act1: TAction;
    pfbdtst1: TpFIBDataSet;
    ds1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Insert1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject); virtual;
    procedure FormShow(Sender: TObject);
    procedure dbgrd1DblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    procedure NullAllField;
  public
    { Public declarations }
    FEditorState: TEditorSetState;
  protected
    procedure QueryPrepare;
  end;

var
  ChaildForm: TChaildForm;

implementation

uses MainFrm, DM_;


{$R *.dfm}

{ TODO 2 -oAcrion -cUpdate : UPDATE для Edit, Insert, Delete }

procedure TChaildForm.FormCreate(Sender: TObject);
begin
  FEditorState := esNone;
  btnSave.Enabled := False;
  pfbdtst1.Open
end;

procedure TChaildForm.Edit1Click(Sender: TObject);
begin
  FEditorState := esEdit;
  btnSave.Enabled := True;
end;

procedure TChaildForm.Insert1Click(Sender: TObject);
begin
  FEditorState := esInsert;
  btnSave.Enabled := True;
end;

// вызывает метод потомка потому что virtual
procedure TChaildForm.Delete1Click(Sender: TObject);
begin
  FEditorState := esNone;
  if Application.MessageBox('Вы действительно хотите удалить запись?',
      'Удаление', MB_ICONQUESTION + MB_YESNO) = ID_YES then
    FEditorState := esDelete;
  btnSaveClick(nil)
end;

procedure TChaildForm.btnCancelClick(Sender: TObject);
begin
  FEditorState := esNone;
  btnSave.Enabled := False;
  NullAllField;
end;

procedure TChaildForm.btnSaveClick(Sender: TObject);
begin
  try
    with pfbdtst1 do
    case FEditorState of
      esDelete: begin
        if dbgrd1.DataSource.DataSet.Eof then
          Exit;
        Delete;
        Post;
        Close;
        Open;
      end;

      esEdit: begin
        if dbgrd1.DataSource.DataSet.Eof then
          Exit;
        Edit;
        Post;
        Close;
        Open;
      end;

      esInsert: begin
        Insert;
        Post;
        Close;
        Open;
      end;
        
    else
      raise Exception.Create('Не определенное значение FEditorState');
    end;  
  except
    on EFIBError do begin
      Application.MessageBox('Обратитесь к разработчику',
          'Ошибка базы данных', MB_ICONERROR);
      Abort;
    end;  
    on E: Exception do begin
      DM.pfbtrnsctn1.Rollback;
      Application.MessageBox(PChar(E.Message), 'Ошибка', MB_ICONERROR);
    end;
  end;

  btnCancelClick(nil);
end;

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

procedure TChaildForm.dbgrd1DblClick(Sender: TObject);
begin
  ModalResult := mrNone;
  if not dbgrd1.DataSource.DataSet.Eof then
    ModalResult := mrOk;
end;

procedure TChaildForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  pfbdtst1.Close
end;

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

end.
