unit FinanceFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChaildFrm, ActnList, Menus, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, DB, FIBDataSet, pFIBDataSet;

type
  TfrmFinance = class(TChaildForm)
    edtIDAccount: TEdit;
    edtCode: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    pfbdtst1FID: TFIBIntegerField;
    pfbdtst1F_IDACCOUNT: TFIBStringField;
    pfbdtst1F_CODE: TFIBStringField; 
    procedure btnSaveClick(Sender: TObject); override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFinance: TfrmFinance;

implementation

{$R *.dfm}

// test git
procedure TfrmFinance.btnSaveClick(Sender: TObject);
begin
  with pfbdtst1 do begin
    if not pfbdtst1.Eof then
      ParamByName('FID').AsInteger := FieldByName('FID').AsInteger;

    if (FEditorState in [esEdit, esInsert]) and
        (edtIDAccount.Text = NullAsStringValue) then
      Exit;
      
    ParamByName('F_IDACCOUNT').AsString := edtIDAccount.Text;
    ParamByName('F_CODE').AsString := edtCode.Text;
  end;
  inherited;
end;

end.