program SimReportDay;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {frmMain},
  ChaildFrm in 'include\ChaildFrm.pas' {ChaildForm},
  SimkaFrm in 'SimkaFrm.pas' {frmSimka},
  TarifPlanFrm in 'TarifPlanFrm.pas' {frmTarifPlan},
  FinanceFrm in 'FinanceFrm.pas' {frmFinance},
  OwnerFrm in 'OwnerFrm.pas' {frmOwner},
  DM_ in 'DM_.pas' {DM: TDataModule},
  CustomerFunctions in 'CustomerFunctions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TChaildForm, ChaildForm);
  Application.CreateForm(TfrmSimka, frmSimka);
  Application.CreateForm(TfrmTarifPlan, frmTarifPlan);
  Application.CreateForm(TfrmFinance, frmFinance);
  Application.CreateForm(TfrmOwner, frmOwner);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.