unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DBGridEhGrouping, ExtCtrls, GridsEh, DBGridEh,
  ActnList, Menus, StdCtrls, DB, DBTables, BDE, DBXpress,
  fib, ComCtrls, EditingReportFrm;

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
    btnDevise: TButton;
    btnOwner: TButton;
    stat1: TStatusBar;
    btnAutentification: TButton;
    actAutentification: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actEditUpdate(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure btnFinanceClick(Sender: TObject);
    procedure btnTarifPlanClick(Sender: TObject);
    procedure btnSimkaClick(Sender: TObject);
    procedure ApplicationEventException(Sender: TObject; E: Exception);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actAutentificationExecute(Sender: TObject);
    procedure actInsertUpdate(Sender: TObject);
    procedure SetEditReport(AEdit: TEditingReport);
  private
    { Private declarations }
    property EditReport: TEditingReport write SetEditReport;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DM_, CustomerFunctions, FinanceFrm, TarifPlanFrm,
  SimkaFrm, CustomerGlobals, AuthentificationFrm;

const
  PNL_INF_STATUS = 2;

{$R *.dfm}
{ TODO 5 -oDEFINE -cTEST : Убрать в настройках проэкта из DEFINE TESTMODE }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  
  {$IFDEF TESTMODE}
    btnFinance.Visible := True;
    btnTarifPlan.Visible := True;
    btnSimka.Visible := True;
    btnDevise.Visible := True;
    btnOwner.Visible := True;
    stat1.Panels[PNL_INF_STATUS].Text := 'Вы находитесь в режиме тестирования';
  {$ENDIF}

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

function CheckAutentification(WithAutentif: Boolean = False): Boolean;
begin
  Result := False;
  if user.login = DEF_USER then
    if not WithAutentif or (frmAuthentification.ShowModal <> mrOk) then
        Exit;
  Result := True
end;

procedure TfrmMain.actInsertUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := CheckAutentification
end;

procedure TfrmMain.actEditUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled :=
    not dbgrdh1.DataSource.DataSet.Eof and CheckAutentification
end;

procedure TfrmMain.actInsertExecute(Sender: TObject);
begin
  EditReport := erInsert
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
  error_string: string;
  ErrorsList: TStrings;
  sPatch: string[60];
  phnSimkaReportLog: string;
begin
  error_string := '';
  if E is EDatabaseError then begin
     err := (E as EDBEngineError).errors[(E as EDBEngineError).errorcount - 1].errorcode;
     if (err = DBIERR_KEYVIOL) then
       error_string := 'Ошибка Key violation!'
     else if (err = DBIERR_LOCKED) then
       error_string := 'Запись блокирована другим пользователем'
     else if (err = DBIERR_FILELOCKED) then
       error_string := 'Таблица блокирована кем-то еще'
     else
       error_string := 'Другая ошибка DB' end else
  if E is EFIBError then 
  { DONE  -oexception -cошибки  : отлавливать все ошибки}
    error_string := 'Ошибка базы данных FireBird';

  error_string := E.Message + ' ' + error_string;

  GetDir(0, sPatch);
  phnSimkaReportLog := sPatch + '\' + SIMKA_REPORT_LOG;

  ErrorsList := TStringList.Create;
  EDlg := CreateMessageDialog(error_string, mtError, [mbOK]);
  with ErrorsList do
  try
    if FileExists(phnSimkaReportLog) then
      LoadFromFile(phnSimkaReportLog);
    Add('');
    Add('');
    Add('{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{');
    Add(FormatDateTime('c', Now));
    Add('Пользователь: ID ' + IntToStr(user.ID) + ' ' + user.Surname + ' ' +
      user.Name + ' ' + user.Patronymic);
    Add(error_string);
    Add('}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}');
    SaveToFile(phnSimkaReportLog);

    EDlg.ShowModal;
  finally
    Free;
    EDlg.Release
  end;

end;

// удалить текущую запись
procedure TfrmMain.actDeleteExecute(Sender: TObject);
begin
  EditReport := erDelete
end;

procedure TfrmMain.actEditExecute(Sender: TObject);
begin
  EditReport := erEdit
end;

procedure TfrmMain.actAutentificationExecute(Sender: TObject);
begin
  frmAuthentification.ShowModal;
  if frmAuthentification.ModalResult = mrOK then
    stat1.Panels[PNL_INF_STATUS].Text := 'Вы зашли как (' + user.login + '): ' +
      user.Surname + ' ' + user.Name[1] + '.' + user.Patronymic[1] + '.'
end;


procedure TfrmMain.SetEditReport(AEdit: TEditingReport);
var
  EditingReport: TfrmEditingReport;
  ID: Integer;
begin
  if not CheckAutentification(True) then
    Exit;
    
  case AEdit of
    erEdit: begin
      EditingReport := TfrmEditingReport.Create(Self, erEdit);
      try
        EditingReport.ShowModal;
        if EditingReport.ModalResult = mrOk then begin
          dbgrdh1.DataSource.DataSet.Close;
          dbgrdh1.DataSource.DataSet.Open;
        end;
      finally
        EditingReport.Free
      end;
    end;
    
    erInsert: begin
      EditingReport := TfrmEditingReport.Create(Self, erInsert);
      try
        EditingReport.ShowModal;
        if EditingReport.ModalResult = mrOk then begin
          dbgrdh1.DataSource.DataSet.Close;
          dbgrdh1.DataSource.DataSet.Open;
        end;
      finally
        EditingReport.Free
      end;
    end;

    erDelete: begin
      if MessageDlg('Вы действительно хотите удалить запись', mtWarning,
          mbOKCancel, 0) <> mrOk then
        Exit;
      with DM, pfbqryDelete, pfbtrnsctn1 do
      try
        Close;
        if pfbdtstView.IsEmpty then
          raise EAbort.Create('Пустая таблица');
        ID := fbntgrfldViewRD_ID.Value;
        ParamByName('P_RD_ID').AsInteger := ID;
        ExecQuery;
        CommitRetaining;
        Close;
        pfbdtstView.Close;
        pfbdtstView.Open;
      except
        Rollback;
        MessageDlg('Нельзя удалить запись из пустой таблицы', mtError, [mbOK], 0);
      end;
    end;
  end;    
end;

end.
