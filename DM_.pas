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
    pfbdtstViewRD_DATE: TFIBDateField;
    pfbdtstViewRD_FNCE1SUM: TFIBBCDField;
    pfbdtstViewRD_FNCE2SUM: TFIBBCDField;
    pfbdtstViewRE_SURNAME: TFIBStringField;
    pfbdtstViewTP_NAME: TFIBStringField;
    pfbdtstViewTP_ABON_BOARD: TFIBBCDField;
    pfbdtstViewTP_SMS_MONTH: TFIBIntegerField;
    pfbdtstViewRS_SMS: TFIBIntegerField;
    pfbdtstViewRS_BALANCE: TFIBBCDField;
    pfbdtstViewD_NUM: TFIBIntegerField;
    pfbdtstViewD_TITLE: TFIBStringField;
    pfbdtstViewO_NAME: TFIBStringField;
    pfbdtstViewS_NUMBER: TFIBStringField;
    pfbdtstViewF_IDACCOUNT: TFIBStringField;
    pfbdtstViewF_IDACCOUNT1: TFIBStringField;
    fbntgrfldViewRD_ID: TFIBIntegerField;
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
