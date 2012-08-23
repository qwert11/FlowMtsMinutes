unit EditingReportFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, DBGridEh, StdCtrls, Mask, DBCtrlsEh,
  DBLookupEh, pFIBDataSet, DBGridEhGrouping, GridsEh, Grids,
  MemTableDataEh, Db, DataDriverEh, DBClient, DBGrids, MConnect, ActnList,
  Menus, Buttons, FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase;

type
  TEditingReport = (erEdit, erInsert);

  TfrmEditingReport = class(TForm)
    tmr1: TTimer;
    stat1: TStatusBar;
    dbgrdhRepSIM: TDBGridEh;
    ds1: TDataSource;
    dtpDate: TDateTimePicker;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    cbbIDAccount2: TDBLookupComboboxEh;
    cbbIDAccount1: TDBLookupComboboxEh;
    edtSum1: TEdit;
    edtSum2: TEdit;
    pnl1: TPanel;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    cdsTmpER: TClientDataSet;
    intgrfldTmpERcSimka: TIntegerField;
    intgrfldTmpERcIn: TIntegerField;
    intgrfldTmpERcSMS: TIntegerField;
    intgrfldTmpERcOwner: TIntegerField;
    crncyfldTmpERcBalance: TCurrencyField;
    strngfldTmpERSimNumber: TStringField;
    strngfldTmpERSimTarifPlan: TStringField;
    crncyfldTmpERSimAbonBoard: TCurrencyField;
    intgrfldTmpERDeviceNumbr: TIntegerField;
    strngfldTmpERDeviceName: TStringField;
    intgrfldTmpERcIDRepSim: TIntegerField;
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
    strngfldTmpEROwner: TStringField;
    actSave: TAction;
    pfbtrnsctUpdate: TpFIBTransaction;
    pfbqryUpdate: TpFIBQuery;
    procedure tmr1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgrdhRepSIMKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actEditUpdate(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure strngfldTmpERSimNumberGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure actSaveExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure strngfldTmpERDeviceNameGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cbbIDAccount1KeyPress(Sender: TObject; var Key: Char);
    procedure edtSum1KeyPress(Sender: TObject; var Key: Char);
    procedure cdsTmpERBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FEditingReport: TEditingReport;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent;
        AEditingReport: TEditingReport); reintroduce;
  end;

var
  frmEditingReport: TfrmEditingReport;

implementation

uses CustomerGlobals, MainFrm, DM_, CustomerFunctions, FinanceFrm,
  OwnerFrm, SimkaFrm, TarifPlanFrm, DeviceFrm;

const
  PNL_INF_STAT_EDIT = 0;
  PNL_INF_TIMER = 1;
  PNL_INF_RESPONS = 2;

  
  FN_ER_LOOKUP_SIMKA = 'SimNumber';
  FN_ER_LOOKUP_DEVICE = 'DeviceName';
  FN_ER_LOOKUP_OWNER = 'Owner';

var
  TimerStop: TTime;
  old_rd_id: Integer; // редактируемая запись ReportDay

{$R *.dfm}

constructor TfrmEditingReport.Create(AOwner: TComponent;
  AEditingReport: TEditingReport);
begin
  inherited Create(AOwner);
  FEditingReport := AEditingReport;
end;

procedure TfrmEditingReport.tmr1Timer(Sender: TObject);
begin
  stat1.Panels[PNL_INF_TIMER].Text := TimeToStr(Now - TimerStop)
end;


procedure TfrmEditingReport.FormActivate(Sender: TObject);
begin
  { TODO 5 : раскоментировать и добавить вход по паролю }
  if user.login = DEF_USER then begin
    {$IFDEF TESTMODE}
    {$ELSE}
    MessageBox(0, 'Неверный логин и пароль', 'ошибка', MB_ICONERROR);
    Exit;
    {$ENDIF}
  end;

  TimerStop := Time;

  // чистим edit-ты
  ClearEdit(Self);

  Caption := 'Сегодня: ' + DateToStr(Date) + ' ' +
    user.Patronymic + ' ' + user.Name[1] + '.' + user.Patronymic[1] + '.';

  dtpDate.Date := Date;

  if not cdsTmpER.Active then
    cdsTmpER.CreateDataSet;

  with frmMain.dbgrdh1.DataSource.DataSet do
    case FEditingReport of
      erEdit:
        begin
          if Eof then
            Exit;
          stat1.Panels[PNL_INF_STAT_EDIT].Text := 'Редактирование записи: ' +
            FieldByName('RD_ID').AsString;

          // запоминаем редактируемую запись ReportDay
          old_rd_id := FieldByName('RD_ID').Value;

          stat1.Panels[PNL_INF_RESPONS].Text := 'Отчет составил: ' +
            FieldByName('RE_SURNAME').AsString;

          // инициируем поля с последнего заполнения если оно есть
          First;
          // 
          if not Eof then begin
            cbbIDAccount1.KeyField := FieldByName('RD_FINANCE1').Value;
            edtSum1.Text := FieldByName('RD_FNCE1SUM').AsString;
            cbbIDAccount2.KeyField := FieldByName('RD_FINANCE2').Value;
            edtSum2.Text := FieldByName('RD_FNCE2SUM').AsString;
          end;
          // CDS          
          while not Eof do begin
            cdsTmpER.Append;
            try
              intgrfldTmpERcSimka.Value := FieldByName('RS_SIMKA').AsInteger;
              intgrfldTmpERcIn.Value := FieldByName('RS_IN').AsInteger;
              intgrfldTmpERcSMS.Value := FieldByName('RS_SMS').AsInteger;
              intgrfldTmpERcOwner.Value := FieldByName('RS_OWNER').AsInteger;
              crncyfldTmpERcBalance.Value := FieldByName('RS_BALANCE').AsInteger;
              intgrfldTmpERcIDRepSim.Value := FieldByName('RS_ID').AsInteger;

              cdsTmpER.Post;
            except
              on E: Exception do begin
                cdsTmpER.Cancel;
                Application.MessageBox(PChar(E.Message), 'Ошибка добавления данных', MB_ICONERROR);
                Break;
              end;
            end;
          end;
        end;
      erInsert: begin
          stat1.Panels[PNL_INF_STAT_EDIT].Text := 'Новая запись';
          stat1.Panels[PNL_INF_RESPONS].Text := 'Отчет составил: ' +
            user.Patronymic + ' ' + user.Name[1] + '.' + user.Patronymic[1] + '.';

          // заполняем поля по умолчанию если они имеются (умолчания)
          // - т.е. берем данные с последнего отчета 
          First;
          // 
          if not Eof then begin
            cbbIDAccount1.KeyField := FieldByName('RD_FINANCE1').Value;
            cbbIDAccount2.KeyField := FieldByName('RD_FINANCE2').Value;
          end;
          // CDS
          while not Eof do begin
            cdsTmpER.Append;
            try
              intgrfldTmpERcSimka.Value := FieldByName('RS_SIMKA').AsInteger;
              intgrfldTmpERcIn.Value := FieldByName('RS_IN').AsInteger;
              intgrfldTmpERcOwner.Value := FieldByName('RS_OWNER').AsInteger;
              crncyfldTmpERcBalance.Value := FieldByName('RS_BALANCE').AsInteger;

              cdsTmpER.Post;
            except
              on E: Exception do begin
                cdsTmpER.Cancel;
                Application.MessageBox(PChar(E.Message), 'Ошибка добавления данных', MB_ICONERROR);
                Break;
              end;
            end;
          end;
        end;

    end;
end;

procedure TfrmEditingReport.dbgrdhRepSIMKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
    actEditExecute(nil);
end;

procedure TfrmEditingReport.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CloseAllCombobox(Self)
end;

procedure TfrmEditingReport.actEditUpdate(Sender: TObject);
begin
  with dbgrdhRepSIM.Columns[dbgrdhRepSIM.SelectedIndex] do
      (Sender as TAction).Enabled := (FieldName = FN_ER_LOOKUP_SIMKA) or
      (FieldName = FN_ER_LOOKUP_DEVICE) or (FieldName = FN_ER_LOOKUP_OWNER);
end;

procedure TfrmEditingReport.actEditExecute(Sender: TObject);
begin
  with dbgrdhRepSIM.Columns[dbgrdhRepSIM.SelectedIndex] do
    if (FieldName = FN_ER_LOOKUP_SIMKA) or (FieldName = FN_ER_LOOKUP_DEVICE) or
        (FieldName = FN_ER_LOOKUP_OWNER) then begin
      if not (cdsTmpER.State in [dsEdit, dsInsert]) then
        cdsTmpER.Edit;

      if FieldName = FN_ER_LOOKUP_SIMKA then with frmSimka do begin
        ShowModal;
        if ModalResult = mrOK then
          intgrfldTmpERcSimka.Value := pfbdtst1SID.Value;
      end else
      if FieldName = FN_ER_LOOKUP_DEVICE then with frmDevice do begin
        ShowModal;
        if ModalResult = mrOK then
          intgrfldTmpERcIn.Value := pfbdtst1DID.Value;
      end else
      if FieldName = FN_ER_LOOKUP_OWNER then with frmOwner do begin
        ShowModal;
        if ModalResult = mrOK then
          intgrfldTmpERcOwner.Value := pfbdtst1OID.Value;
      end;
    end;
end;

procedure TfrmEditingReport.strngfldTmpERSimNumberGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := strngfldTmpERSimNumber.Value + '/ ' +
    strngfldTmpERSimTarifPlan.Value + '/ ' + crncyfldTmpERSimAbonBoard.AsString 
end;

procedure TfrmEditingReport.actSaveExecute(Sender: TObject);
var
  RDB_DB_KEY_LAST_REPORT_DAY: Integer;
begin
  { TODO 5 -oUpdate -cChecked : проверить введенные данные }
  with pfbqryUpdate, pfbtrnsctUpdate do
  try
    StartTransaction;
    Close;

    case FEditingReport of
      erEdit: begin
        SQL.Text := 'ALTER INDEX REPORT_DAY_DATE INACTIVE';
        ExecQuery;
        Close;

        SQL.Text := 'UPDATE REPORT_DAY SET RD_DATE = ''' + DateToStr(dtpDate.Date) + ''', ' +
            'RD_FINANCE1 = ' + VarToStr(cbbIDAccount1.KeyValue) + ', ' +
            'RD_FNCE1SUM = ' + ToStrPoint(edtSum1.Text) + ', ' +
            'RD_FINANCE2 = ' + VarToStr(cbbIDAccount2.KeyValue) + ', ' +
            'RD_FNCE2SUM = ' + ToStrPoint(edtSum2.Text) + ', ' +
            'RD_RESPONS = ' + IntToStr(user.ID) + ' ' +
            'WHERE RD_ID = ' + IntToStr(old_rd_id);
        ExecQuery;
        Close;

        SQL.Text := 'ALTER INDEX REPORT_DAY_DATE ACTIVE';
        ExecQuery;
        Close;

        with cdsTmpER do begin
          First;
          while not Eof do begin
            pfbqryUpdate.Close;
            SQL.Text := 'UPDATE REPORT_SIMKA SET RS_SIMKA = ' + intgrfldTmpERcSimka.AsString + ', ' +
                'RS_IN = ' + intgrfldTmpERcIn.AsString + ', ' +
                'RS_SMS = ' + intgrfldTmpERcSMS.AsString + ', ' +
                'RS_REPORTDAY = ' + IntToStr(old_rd_id) + ', ' +
                'RS_OWNER = ' + intgrfldTmpERcOwner.AsString + ', ' +
                'RS_BALANCE = ' + crncyfldTmpERcBalance.AsString + ' ' +
                'WHERE RSID = ' + intgrfldTmpERcIDRepSim.AsString;
            ExecQuery;
            Next;
          end;
        end;
      end;

      erInsert: begin
        SQL.Text := 'ALTER INDEX REPORT_DAY_DATE INACTIVE';
        ExecQuery;
        Close;

        SQL.Text := 'INSERT INTO REPORT_DAY (RD_DATE, RD_FINANCE1, RD_FNCE1SUM, RD_FINANCE2, RD_FNCE2SUM, RD_RESPONS) VALUES ' +
            '(''' + DateToStr(dtpDate.Date) + ''',' + VarToStr(cbbIDAccount1.KeyValue) + ', ' + ToStrPoint(edtSum1.Text) + ', ' +
            VarToStr(cbbIDAccount2.KeyValue) + ', ' + ToStrPoint(edtSum2.Text) + ', ' + IntToStr(user.ID) + ') RETURNING RD_ID';
        {$IFDEF DEBUG}      // TESTMODE
        ShowMessage(SQL.Text);
        Abort;
        {$ENDIF}
        ExecQuery;
        RDB_DB_KEY_LAST_REPORT_DAY := Fields[0].AsInteger;

        SQL.Text := 'ALTER INDEX REPORT_DAY_DATE ACTIVE';
        ExecQuery;
        Close;

        with cdsTmpER do begin
          First;
          while not Eof do begin
            pfbqryUpdate.Close;
            SQL.Text := 'INSERT INTO REPORT_SIMKA (RS_SIMKA, RS_IN, RS_SMS, RS_REPORTDAY, RS_OWNER, RS_BALANCE) VALUES ' + '(' +
                intgrfldTmpERcSimka.AsString + ', ' + intgrfldTmpERcIn.AsString + ', ' +
                intgrfldTmpERcSMS.AsString + ', ' + IntToStr(RDB_DB_KEY_LAST_REPORT_DAY) + ', ' +
                intgrfldTmpERcOwner.AsString + ', ' + crncyfldTmpERcBalance.AsString + ')';
            {$IFDEF DEBUG}}      // TESTMODE
            ShowMessage(SQL.Text);
            Abort;
            {$ENDIF}
            ExecQuery;
            Next;
          end;
        end;
      end;
    else
      raise Exception.Create('Не определено состояние редактирования!' + #13#10 +
        'Обратитесь к разработчику');
    end;

    Commit;
    Close;
    Active := False;
  except
    on E: Exception do begin
      Rollback;
      Application.MessageBox(PChar(E.Message), 'ошибка', MB_ICONERROR);
      Halt;
    end;
  end;  

end;

procedure TfrmEditingReport.actSaveUpdate(Sender: TObject);
var
  bEnabled: Boolean;
begin
  // дата (красная), ID лицевого счета 1,2 и сумма 1,2
  // состояние набора данных
  // набор данных
  bEnabled := True;

  if Trunc(dtpDate.Date) <> Trunc(Date) then
    dtpDate.Color := clRed
  else
    dtpDate.Color := clWindow;

  if cdsTmpER.Eof then
    bEnabled := False;

  if (cbbIDAccount1.KeyValue = Null) or
      not TestFloat(edtSum1.Text) or
      (cbbIDAccount2.KeyValue = Null) or
      not TestFloat(edtSum2.Text) then
    bEnabled := False;

  if cdsTmpER.State <> dsBrowse then
    bEnabled := False;

  (Sender as TAction).Enabled := bEnabled;
end;

procedure TfrmEditingReport.FormDestroy(Sender: TObject);
begin
  if Assigned(cdsTmpER.DataSetField) then
    cdsTmpER.EmptyDataSet
end;

procedure TfrmEditingReport.strngfldTmpERDeviceNameGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := strngfldTmpERDeviceName.Value + '/№' + intgrfldTmpERDeviceNumbr.AsString
end;

procedure TfrmEditingReport.cbbIDAccount1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then begin
    frmFinance.ShowModal;
    with frmFinance do
    if ModalResult = mrOk then
      (Sender as TDBLookupComboboxEh).KeyValue := pfbdtst1.FieldByName('FID').AsInteger;
  end;
end;

procedure TfrmEditingReport.edtSum1KeyPress(Sender: TObject;
  var Key: Char);
begin
  MaskKeyEdit(Sender, Key, ['0'..'9',DecimalSeparator]);
end;

procedure TfrmEditingReport.cdsTmpERBeforePost(DataSet: TDataSet);
  procedure ShowWarning(F: TField);
  const
    COUNT_SHOWS = 3;
  var
    I: Integer;
  begin
    if VarIsNull(F.AsVariant) then begin
      Application.ProcessMessages;
      tmr1.Enabled := False;
      try

      { TODO 1 -oBefoPost -cошибки  : переводить фокус на плохую ячейку }
//        if @F = @intgrfldTmpERcSimka then
//          dbgrdhRepSIM.SelectedField := strngfldTmpERSimNumber else
//        if @F = @intgrfldTmpERcIn then
//          dbgrdhRepSIM.SelectedField := strngfldTmpERDeviceName else
//        if @F = @intgrfldTmpERcOwner then
//           dbgrdhRepSIM.SelectedField := strngfldTmpEROwner
//        else
//          dbgrdhRepSIM.SelectedField := F;
        

        dbgrdhRepSIM.Refresh;
        dbgrdhRepSIM.SetFocus;
        for I := 1 to COUNT_SHOWS do begin
          stat1.Panels[PNL_INF_TIMER].Text := 'Введите в ' +
            dbgrdhRepSIM.FieldColumns[F.FieldName].Title.Caption;
          stat1.Refresh;
          Sleep(400);
          stat1.Panels[PNL_INF_TIMER].Text := '';
          stat1.Refresh;
          Sleep(100);
        end;
      finally
        tmr1.Enabled := True;
      end;
      Abort;
    end;
  end;
begin
  ShowWarning(intgrfldTmpERcSimka);
  ShowWarning(intgrfldTmpERcIn);
  ShowWarning(intgrfldTmpERcSMS);
  ShowWarning(intgrfldTmpERcOwner);
  ShowWarning(crncyfldTmpERcBalance);
end;

end.
