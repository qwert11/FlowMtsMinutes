unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DBGridEhGrouping, ExtCtrls, GridsEh, DBGridEh,
  ActnList, Menus, StdCtrls, DB, DBTables, BDE, DBXpress, pFIBErrorHandler;

type
  TfrmMain = class(TForm)
    dbgrdh1: TDBGridEh;
    pnl1: TPanel;
    actlst1: TActionList;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    pm1: TPopupMenu;
    mniInsert: TMenuItem;
    mniEdit: TMenuItem;
    mniN1: TMenuItem;
    mniDelete: TMenuItem;
    mm1: TMainMenu;
    mniFile1: TMenuItem;
    mniRecord1: TMenuItem;
    mniInsert1: TMenuItem;
    mniEdit1: TMenuItem;
    mniN2: TMenuItem;
    mniDelete1: TMenuItem;
    btnNewRecord: TButton;
    btnEditRecord: TButton;
    btnDeleteRecord: TButton;
    btnFinance: TButton;
    btnTarifPlan: TButton;
    btnSimka: TButton;
    procedure FormCreate(Sender: TObject);
    procedure actEditUpdate(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure btnFinanceClick(Sender: TObject);
    procedure btnTarifPlanClick(Sender: TObject);
    procedure btnSimkaClick(Sender: TObject);
    procedure ApplicationEventException(Sender: TObject; E: Exception);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DM_, CustomerFunctions, EditingReportFrm, FinanceFrm, TarifPlanFrm,
  SimkaFrm;

{$R *.dfm}
{ TODO 5 -oDEFINE -cTEST : Убрать в настройках проэкта из DEFINE TESTMODE }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Application.OnException := ApplicationEventException;

  with DM do
    try
      WindowState := ReadIni('Window', 'WindowState', riInteger);
      if not DB.Connected then begin
        DB.DatabaseName := ReadIni('Base', 'Patch', riString);
        DB.Connected := True;
      end;
      
      if not pfbdtstView.Active then
        pfbdtstView.Open; 
    except
      on E: Exception do begin
        Application.MessageBox(PChar(E.Message), 'Ошибка', MB_ICONERROR);
        Halt;
      end;
    end;
end;

procedure TfrmMain.actEditUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not dbgrdh1.DataSource.DataSet.Eof
end;

procedure TfrmMain.actInsertExecute(Sender: TObject);
var
  EditingReport: TfrmEditingReport;
begin
  EditingReport := TfrmEditingReport.Create((Sender as TComponent), erInsert);
  try
    EditingReport.ShowModal;
    if EditingReport.ModalResult = mrOk then begin
      {$IFNDEF TESTMODE}
      dbgrdh1.DataSource.DataSet.Close;
      dbgrdh1.DataSource.DataSet.Open;
      {$ENDIF}
    end;
  finally
    EditingReport.Free
  end;
end;

procedure TfrmMain.btnFinanceClick(Sender: TObject);
begin
  frmFinance.ShowModal
end;

procedure TfrmMain.btnTarifPlanClick(Sender: TObject);
begin
  frmTarifPlan.ShowModal
end;

procedure TfrmMain.btnSimkaClick(Sender: TObject);
begin
  frmSimka.ShowModal
end;

procedure TfrmMain.ApplicationEventException(Sender: TObject; E: Exception);
var
  err: DBIResult;
  EDlg: TForm;
begin
  if E is EDatabaseError then begin
     err := (E as EDBEngineError).errors[(E as EDBEngineError).errorcount - 1].errorcode;
     if (err = DBIERR_KEYVIOL) then
       showMessage('Ошибка Key violation!')
     else if (err = DBIERR_LOCKED) then
       showmessage('Запись блокирована другим пользователем')
     else if (err = DBIERR_FILELOCKED) then
       showmessage('Таблица блокирована кем-то еще')
     else
       showmessage('Другая ошибка DB') end else
  if E is EDatabaseError then begin
  { TODO 1 -oexception -cошибки  : сделать другой тип в место EDatabaseError }
    EDlg := CreateMessageDialog('Ошибка базы данных', mtError, [mbOK]);
    EDlg.ShowModal;
    EDlg.Release end
  else
     Application.MessageBox(PChar(E.Message), 'Ошибка', MB_ICONASTERISK);
end;

end.
