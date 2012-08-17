unit DM_;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    pfbtrnsctn1: TpFIBTransaction;
    pfbtrnsView: TpFIBTransaction;
    ds1: TDataSource;
    pfbdtstView: TpFIBDataSet;
    fbdtfldViewRD_DATE: TFIBDateField;
    fbcdfldViewRD_FNCE1SUM: TFIBBCDField;
    fbcdfldViewRD_FNCE2SUM: TFIBBCDField;
    fbstrngfldViewRE_SURNAME: TFIBStringField;
    fbstrngfldViewTP_NAME: TFIBStringField;
    fbcdfldViewTP_ABON_BOARD: TFIBBCDField;
    fbntgrfldViewTP_SMS_MONTH: TFIBIntegerField;
    fbntgrfldViewRS_SMS: TFIBIntegerField;
    fbcdfldViewRS_BALANCE: TFIBBCDField;
    fbntgrfldViewD_NUM: TFIBIntegerField;
    fbstrngfldViewD_TITLE: TFIBStringField;
    fbstrngfldViewO_NAME: TFIBStringField;
    fbstrngfldViewS_NUMBER: TFIBStringField;
    fbstrngfldViewF_IDACCOUNT: TFIBStringField;
    fbstrngfldViewF_IDACCOUNT1: TFIBStringField;
    fbntgrfldViewRD_ID: TFIBIntegerField;
    fbntgrfldViewRS_SIMKA: TFIBIntegerField;
    fbntgrfldViewRS_OWNER: TFIBIntegerField;
    fbntgrfldViewRS_IN: TFIBIntegerField;
    fbntgrfldViewRSID: TFIBIntegerField;
    fbntgrfldViewRD_FINANCE1: TFIBIntegerField;
    fbntgrfldViewRD_FINANCE2: TFIBIntegerField;
    fbntgrfldViewRD_RESPONS: TFIBIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
