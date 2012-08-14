unit ChaildFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Menus, IBDatabase,
  DB, IBCustomDataSet, IBQuery, DBCtrls, ActnList, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet;

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
  private
    { Private declarations }
    procedure NullAllField;
  public
    { Public declarations }
    FEditorState: TEditorSetState;
  end;

var
  ChaildForm: TChaildForm;

implementation

uses MainFrm, DM_;


{$R *.dfm}

{ TODO 2 -oAcrion -cUpdate : UPDATE ��� Edit, Insert, Delete }

procedure TChaildForm.FormCreate(Sender: TObject);
begin
  FEditorState := esNone;
  btnSave.Enabled := False
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

// �������� ����� ������� ������ ��� virtual
procedure TChaildForm.Delete1Click(Sender: TObject);
begin
  FEditorState := esNone;
  if Application.MessageBox('�� ������������� ������ ������� ������?',
      '��������', MB_ICONQUESTION + MB_YESNO) = ID_YES then
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
  case FEditorState of
    esDelete:
      begin
        if dbgrd1.DataSource.DataSet.Eof then
          Exit;
        pfbdtst1.Delete;
      end;

    esEdit:
      begin
        if dbgrd1.DataSource.DataSet.Eof then
          Exit;      
        pfbdtst1.Edit;
      end;
      
    esInsert:
      pfbdtst1.Insert;
  else
    Exit;
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
  NullAllField
end;

procedure TChaildForm.dbgrd1DblClick(Sender: TObject);
begin
  ModalResult := mrNone;
  if not dbgrd1.DataSource.DataSet.Eof then
    ModalResult := mrOk;
end;

end.