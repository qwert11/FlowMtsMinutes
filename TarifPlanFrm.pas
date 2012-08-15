unit TarifPlanFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChaildFrm, ActnList, Menus, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, DB, FIBDataSet, pFIBDataSet;

type
  TfrmTarifPlan = class(TChaildForm)
    edtTarifPlan: TEdit;
    edtAbonBoard: TEdit;
    edtSmsMonth: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    pfbdtst1TPID: TFIBIntegerField;
    pfbdtst1TP_NAME: TFIBStringField;
    pfbdtst1TP_ABON_BOARD: TFIBBCDField;
    pfbdtst1TP_SMS_MONTH: TFIBIntegerField;
    procedure btnSaveClick(Sender: TObject); override;
  private
    { Private declarations }
  public
    { Public declarations }     
  end;

var
  frmTarifPlan: TfrmTarifPlan;

implementation

{$R *.dfm}

procedure TfrmTarifPlan.btnSaveClick(Sender: TObject);
begin
  with pfbdtst1 do begin
    ParamByName('TPID').AsInteger := FieldByName('TPID').AsInteger;

    if (FEditorState in [esEdit, esInsert]) and
        (edtTarifPlan.Text = NullAsStringValue) then
      Exit;

    ParamByName('TP_NAME').AsString := edtTarifPlan.Text;
    ParamByName('TP_ABON_BOARD').AsString := edtAbonBoard.Text;
    ParamByName('TP_SMS_MONTH').AsString := edtSmsMonth.Text;
  end;

  inherited;
end;

end.
