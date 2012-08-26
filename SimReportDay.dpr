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
  CustomerFunctions in 'CustomerFunctions.pas',
  CustomerGlobals in 'CustomerGlobals.pas',
  EditingReportFrm in 'EditingReportFrm.pas' {frmEditingReport},
  DeviceFrm in 'DeviceFrm.pas' {frmDevice},
  AuthentificationFrm in 'AuthentificationFrm.pas' {frmAuthentification},
  RegistrationFrm in 'RegistrationFrm.pas' {frmRegistration},
  UsersFrm in 'UsersFrm.pas' {frmUsers};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Отчет по SIM картам';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmDevice, frmDevice);
  Application.CreateForm(TfrmAuthentification, frmAuthentification);
  Application.CreateForm(TfrmRegistration, frmRegistration);
  Application.CreateForm(TfrmUsers, frmUsers);
  //Application.CreateForm(TChaildForm, ChaildForm);
  Application.CreateForm(TfrmTarifPlan, frmTarifPlan);  
  Application.CreateForm(TfrmSimka, frmSimka);
  Application.CreateForm(TfrmFinance, frmFinance);
  Application.CreateForm(TfrmOwner, frmOwner);
  // Application.CreateForm(TfrmEditingReport, frmEditingReport);
  Application.Run;
end.
