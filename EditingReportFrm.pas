unit EditingReportFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, DBGridEh, StdCtrls, Mask, DBCtrlsEh,
  DBLookupEh, pFIBDataSet, DBGridEhGrouping, GridsEh, Grids,
  MemTableDataEh, Db, DataDriverEh, DBClient, DBGrids, MConnect, ActnList,
  Menus, Buttons;

type
  TEditingReport = (erEdit, erInsert);

  TfrmEditingReport = class(TForm)
    tmr1: TTimer;
    stat1: TStatusBar;
    dbgrdhRepSIM: TDBGridEh;
    ds1: TDataSource;
    cds: TClientDataSet;
    dtpDate: TDateTimePicker;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    cbbIDAccount2: TDBLookupComboboxEh;
    cbbIDAccount1: TDBLookupComboboxEh;
    edtSum1: TEdit;
    edtSum2: TEdit;
    pnl1: TPanel;
    intgrfldIDSimka: TIntegerField;
    intgrfldIDIn: TIntegerField;
    intgrfldIDOwner: TIntegerField;
    intgrfldID_RS: TIntegerField;
    actlst1: TActionList;
    actEdit: TAction;
    pm1: TPopupMenu;
    mniEdit: TMenuItem;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    strngfldSimka: TStringField;
    strngfldIn: TStringField;
    intgrfldSMS: TIntegerField;
    strngfldOwner: TStringField;
    fltfldBalance: TFloatField;
    strngfldSAbonBoard: TStringField;
    strngfldSTarifPlan: TStringField;
    intgrfldSSMSMonth: TIntegerField;
    procedure tmr1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actEditingUpdate(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure dbgrdhRepSIMKeyPress(Sender: TObject; var Key: Char);
    procedure strngfldSimkaGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
    FEditingReport: TEditingReport;
//    procedure FillSimkaPkLst;
//    procedure FillDevicePkLst;
//    procedure FillOvnerPkLst;
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


{$R *.dfm}

constructor TfrmEditingReport.Create(AOwner: TComponent;
  AEditingReport: TEditingReport);
begin
  inherited Create(AOwner);
  FEditingReport := AEditingReport;
end;

procedure TfrmEditingReport.tmr1Timer(Sender: TObject);
begin
  stat1.Panels[PNL_INF_TIMER].Text := TimeToStr(Now)
end;


procedure TfrmEditingReport.FormActivate(Sender: TObject);
begin
  { TODO 5 : раскоментировать и добавить вход по паролю }
//  if user.login = DEF_USER then
//    Exit;

  // чистим edit-ты
  ClearEdit(Self);

  Caption := 'Сегодня: ' + DateToStr(Date) + '' + user.Patronymic + '.' +
    user.Name[1] + user.Patronymic[1];

  dtpDate.Date := Date;

  cds.Open;
                 
//   заполняем PickList Simka
////  FillSimkaPkLst;
////
//   заполняем PickList In
////  FillDevicePkLst;
////
//   заполняем PickList Ovner
////  FillOvnerPkLst;

  with frmMain.dbgrdh1.DataSource.DataSet do
    case FEditingReport of
      erEdit:
        begin
          if Eof then
            Exit;
          stat1.Panels[PNL_INF_STAT_EDIT].Text := 'Редактирование записи: ' +
            FieldByName('RD_ID').AsString;

          stat1.Panels[PNL_INF_RESPONS].Text := 'Отчет составил: ' +
            FieldByName('RE_SURNAME').AsString;

          // инициируем поля с последнего заполнения если оно есть
          First;
          while not Eof do begin
            cds.Append;
            try
              strngfldSimka.Value := FieldByName('S_NUMBER').AsString + '/' +
                FieldByName('TP_NAME').AsString + '/' + FieldByName('TP_ABON_BOARD').AsString + '/' +
                FieldByName('TP_SMS_MONTH').AsString;
              intgrfldIDSimka.Value := FieldByName('RS_SIMKA').AsInteger;

              cds.FieldByName('cdsIn').AsString := FieldByName('D_NUM').AsString + '/' +
                FieldByName('D_TITLE').AsString;
              cds.FieldByName('IDIn').Value := FieldByName('RS_IN').AsInteger;

              cds.FieldByName('cdsSMS').AsString := FieldByName('RS_SMS').AsString;

              cds.FieldByName('cdsOwner').AsString := FieldByName('O_NAME').AsString;
              cds.FieldByName('IDOwner').Value := FieldByName('RS_OWNER').AsInteger;

              cds.FieldByName('ID_RS').Value := FieldByName('RS_ID').AsInteger;

              cds.Post;
            except
              on E: Exception do begin
                cds.Cancel;
                Application.MessageBox(PChar(E.Message), 'Ошибка добавления данных', MB_ICONERROR);
              end;
            end;
          end;

          First;
          if not Eof then begin
            cbbIDAccount1.KeyField := FieldByName('RD_FINANCE1').Value;
            edtSum1.Text := FieldByName('RD_FNCE1SUM').AsString;
            cbbIDAccount2.KeyField := FieldByName('RD_FINANCE2').Value;
            edtSum2.Text := FieldByName('RD_FNCE2SUM').AsString;
          end;
        end;
      erInsert: begin
          stat1.Panels[PNL_INF_STAT_EDIT].Text := 'Новая запись';
          stat1.Panels[PNL_INF_RESPONS].Text := 'Отчет составил: ' +
            FieldByName('RE_SURNAME').AsString;

          // заполняем поля по умолчанию если они имеются (умолчания)
          First;
          while not Eof do begin
            cds.Append;
            try
              strngfldSimka.Value := FieldByName('S_NUMBER').AsString + '/' +
                  FieldByName('TP_NAME').AsString + '/' + FieldByName('TP_ABON_BOARD').AsString + '/' +
                  FieldByName('TP_SMS_MONTH').AsString;
              intgrfldIDSimka.Value := FieldByName('RS_SIMKA').AsInteger;

              cds.FieldByName('cdsIn').AsString := FieldByName('D_NUM').AsString + '/' +
                FieldByName('D_TITLE').AsString;
              cds.FieldByName('IDIn').Value := FieldByName('RS_IN').AsInteger;

              //cds.FieldByName('cdsSMS').AsString := FieldByName('RS_SMS').AsString;

              cds.FieldByName('cdsOwner').AsString := FieldByName('O_NAME').AsString;
              cds.FieldByName('IDOwner').Value := FieldByName('RS_OWNER').AsInteger;

              //cds.FieldByName('ID_RS').Value := FieldByName('RS_ID').AsInteger;

              cds.Post;
            except
              on E: Exception do begin
                cds.Cancel;
                Application.MessageBox(PChar(E.Message), 'Ошибка добавления данных', MB_ICONERROR);
              end;
            end;
          end;
          
          First;
          if not Eof then begin
            cbbIDAccount1.KeyField := FieldByName('RD_FINANCE1').Value;
            //edtSum1.Text := FieldByName('RD_FNCE1SUM').AsString;
            cbbIDAccount2.KeyField := FieldByName('RD_FINANCE2').Value;
            //edtSum2.Text := FieldByName('RD_FNCE2SUM').AsString;
          end;
        end;

    end;
end;

{procedure TfrmEditingReport.FillDevicePkLst;
begin
  // заполняем PickList In
  dbgrdhRepSIM.FindFieldColumn('cdsIn').PickList.Clear;
  frmDevice.pfbdtst1.First;
  with frmDevice.pfbdtst1 do
    while not Eof do begin
      dbgrdhRepSIM.FindFieldColumn('cdsIn').PickList.AddObject(
          FieldByName('D_NUM').AsString + '/' +   // симка в устройстве №
          FieldByName('D_TITLE').AsString         //назв. устройства
          , Pointer(FieldByName('DID').AsInteger));
      Next;
    end;
end;

procedure TfrmEditingReport.FillOvnerPkLst;
begin
  // заполняем PickList Owner
  dbgrdhRepSIM.FindFieldColumn('cdsOwner').PickList.Clear;
  frmOwner.pfbdtst1.First;
  with frmOwner.pfbdtst1 do
    while not Eof do begin
      dbgrdhRepSIM.FindFieldColumn('cdsOwner').PickList.AddObject(
          FieldByName('OName').AsString //владелец симки тел.
          , Pointer(FieldByName('OID').AsInteger));
      Next;
    end;
end;

procedure TfrmEditingReport.FillSimkaPkLst;
begin
  // заполняем PickList Simka
  dbgrdhRepSIM.FindFieldColumn('cdsSimka').PickList.Clear;
  frmSimka.pfbdtst1.First;
  with frmSimka.pfbdtst1 do
    while not Eof do begin
      dbgrdhRepSIM.FindFieldColumn('cdsSimka').PickList.AddObject(
          FieldByName('SNumber').AsString + '/' +   //номер тел.
          FieldByName('TarifPlan').AsString + '/' + //тарифн. план
          FieldByName('AbonFoard').AsString + '/' + //абон. плата
          FieldByName('SMS_Month').AsString //SMS на месяц
          , Pointer(FieldByName('SID').AsInteger));
      Next;
    end;
end;}

procedure TfrmEditingReport.actEditingUpdate(Sender: TObject);
begin
  with dbgrdhRepSIM.Columns[dbgrdhRepSIM.SelectedIndex] do
      (Sender as TAction).Enabled := (FieldName = 'cdsSimka') or
      (FieldName = 'cdsIn') or (FieldName = 'cdsOwner');
end;

procedure TfrmEditingReport.actEditExecute(Sender: TObject);
begin
  with dbgrdhRepSIM.Columns[dbgrdhRepSIM.SelectedIndex] do
    if FieldName = 'cdsSimka' then begin
      frmSimka.ShowModal
    end else
    if FieldName = 'cdsIn' then begin
      frmDevice.ShowModal
    end else
    if FieldName = 'cdsOwner' then begin
      frmOwner.ShowModal
    end;
end;

procedure TfrmEditingReport.dbgrdhRepSIMKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
    actEditExecute(nil);
end;

procedure TfrmEditingReport.strngfldSimkaGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := strngfldSimka.AsString + ' ' + strngfldSTarifPlan.AsString
end;

end.
