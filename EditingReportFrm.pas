unit EditingReportFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, DBGridEh, StdCtrls, Mask, DBCtrlsEh,
  DBLookupEh, pFIBDataSet, DBGridEhGrouping, GridsEh, Grids,
  MemTableDataEh, Db, DataDriverEh, DBClient;

type
  TEditingReport = (erEdit, erInsert);

  TfrmEditingReport = class(TForm)
    tmr1: TTimer;
    stat1: TStatusBar;
    dbgrdhRepSIM: TDBGridEh;
    ds1: TDataSource;
    cds1: TClientDataSet;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    dtpDate: TDateTimePicker;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    cbbIDAccount2: TDBLookupComboboxEh;
    cbbIDAccount1: TDBLookupComboboxEh;
    edSum1: TEdit;
    edtSum2: TEdit;
    pnl1: TPanel;
    procedure tmr1Timer(Sender: TObject);
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

uses CustomerGlobals, MainFrm, DM_, CustomerFunctions;

{$R *.dfm}

constructor TfrmEditingReport.Create(AOwner: TComponent;
  AEditingReport: TEditingReport);
begin
  inherited Create(AOwner);
  FEditingReport := AEditingReport;

  if user.login = DEF_USER then
    Exit;

  // чистим edit
  ClearEdit(Self);

  Caption := 'Сегодня: ' + DateToStr(Date) + '' + user.Patronymic + '.' +
    user.Name[1] + user.Patronymic[1];
  with frmMain.dbgrdh1.DataSource.DataSet do
  case FEditingReport of
    erEdit:
      begin
        if Eof then
          Exit;
        Caption := 'Редактирование записи: ' +
          FieldByName('RD_ID').AsString + Caption;
      end;
    erInsert:
      Caption := 'Новая запись: ' + Caption;
  end;
end;

procedure TfrmEditingReport.tmr1Timer(Sender: TObject);
begin
  stat1.Panels[2].Text := TimeToStr(Now)
end;


end.
