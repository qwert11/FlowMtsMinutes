unit TarifPlanFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChaildFrm, ActnList, Menus, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, DB, FIBDataSet, pFIBDataSet, IBCustomDataSet, IBQuery;

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

uses DM_;

{$R *.dfm}

procedure TfrmTarifPlan.btnSaveClick(Sender: TObject);
begin
  with pfbdtst1 do begin

    QueryPrepare;

    case FEditorState of
      esEdit: with QUpdate do begin
        if (edtTarifPlan.Text = NullAsStringValue) then
          Exit;

        ParamByName('P_OLD_TPID').AsInteger := FieldByName('TPID').AsInteger;
        ParamByName('P_TP_NAME').AsString := edtTarifPlan.Text;
        ParamByName('P_TP_ABON_BOARD').AsFloat := StrToFloat(edtAbonBoard.Text);
        ParamByName('P_TP_SMS_MONTH').AsInteger := StrToInt(edtSmsMonth.Text);
      end;
      esInsert: with QInsert do begin
        if (edtTarifPlan.Text = NullAsStringValue) then
          Exit;

        ParamByName('P_TP_NAME').AsString := edtTarifPlan.Text;
        ParamByName('P_TP_ABON_BOARD').AsString := edtAbonBoard.Text;
        ParamByName('P_TP_SMS_MONTH').AsString := edtSmsMonth.Text;
      end;
      esDelete: with QDelete do begin
        ParamByName('P_OLD_TPID').AsInteger := FieldByName('TPID').AsInteger;
      end;
    else
      Exit;
    end;      
  end;

  inherited;
end;

end.
