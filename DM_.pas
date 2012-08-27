unit DM_;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery;

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
    pfbqryDelete: TpFIBQuery;
    fbstrngfldViewRE_NAME: TFIBStringField;
    fbstrngfldViewRE_PATRONYMIC: TFIBStringField;
    procedure fbstrngfldViewRE_SURNAMEGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.fbstrngfldViewRE_SURNAMEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
  function Get_N_P(const N, P: string): string;
    function GetI(I: string): string;
    begin
      if I = '' then
        Result := ''
      else
        Result := I[1] + '.'
    end;
  begin
    Result := GetI(N) + GetI(P)
  end;
begin
  Text := fbstrngfldViewRE_SURNAME.AsString + ' ' +
    Get_N_P(fbstrngfldViewRE_NAME.AsString, fbstrngfldViewRE_PATRONYMIC.AsString) 
end;

end.
