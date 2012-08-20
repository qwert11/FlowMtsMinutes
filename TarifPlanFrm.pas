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
  DM.pfbtrnsctn1.Active := False;
  DM.pfbtrnsctn1.StartTransaction;
  with DM.pfbtrnsctn1 do
  try
    with pfbdtst1, QInsert do begin
      //ParamByName('TPID').AsInteger := pfbdtst1.FieldByName('TPID').AsInteger;
      Prepare;
      if (FEditorState in [esEdit, esInsert]) and
          (edtTarifPlan.Text = NullAsStringValue) then
        Exit;

      ParamByName('TP_NAME').AsString := ''' +edtTarifPlan.Text + ''';
      //ParamByName('TP_ABON_BOARD').AsFloat := StrToFloat(edtAbonBoard.Text);
      //ParamByName('TP_SMS_MONTH').AsInteger := StrToInt(edtSmsMonth.Text);
    end;
    //inherited;
    pfbdtst1.Insert;
    Commit;
    pfbdtst1.Close;
    pfbdtst1.Open;
  except
    Rollback;
    Application.MessageBox('Ошибка', '', MB_ICONERROR);
  end;
end;

end.
