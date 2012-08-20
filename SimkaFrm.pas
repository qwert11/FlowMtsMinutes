unit SimkaFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChaildFrm, ActnList, Menus, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, DB, FIBDataSet, pFIBDataSet, DBCtrls;

type
  TfrmSimka = class(TChaildForm)
    edtNumber: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    pfbdtst1SID: TFIBIntegerField;
    pfbdtst1S_TARIFPLAN: TFIBIntegerField;
    pfbdtst1S_NUMBER: TFIBStringField;
    dblkcbbTarifPlan: TDBLookupComboBox;
    strngfldpfbdtst1TarifPlan: TStringField;
    crncyfldpfbdtst1AbonBoard: TCurrencyField;
    intgrfldpfbdtst1SMS_Month: TIntegerField;
    btnTarifPlan: TSpeedButton;
    procedure btnSaveClick(Sender: TObject); override;
    procedure btnTarifPlanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSimka: TfrmSimka;

implementation

uses TarifPlanFrm;

{$R *.dfm}

procedure TfrmSimka.btnSaveClick(Sender: TObject);
begin
  with pfbdtst1 do begin
    ParamByName('SID').AsInteger := FieldByName('SID').AsInteger;

    if (FEditorState in [esEdit, esInsert]) and
        (VarIsNull(dblkcbbTarifPlan.KeyValue) or VarIsEmpty(dblkcbbTarifPlan.KeyValue)) then
      Exit;

    ParamByName('S_TARIFPLAN').AsInteger := dblkcbbTarifPlan.KeyValue;
    ParamByName('S_NUMBER').AsString := edtNumber.Text;
  end;
                     // dblkcbbTarifPlan заполнить лист 
  inherited;
end;

procedure TfrmSimka.btnTarifPlanClick(Sender: TObject);
begin
  inherited;
  frmTarifPlan.ShowModal;
  with frmTarifPlan do begin
    if ModalResult <> mrOK then
      Exit;
    dblkcbbTarifPlan.KeyValue := pfbdtst1TPID.Value;
  end;
end;

end.
