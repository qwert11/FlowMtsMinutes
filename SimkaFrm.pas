unit SimkaFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChaildFrm, ActnList, Menus, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, DB, FIBDataSet, pFIBDataSet, DBCtrls, fib, ComCtrls;

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
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSimka: TfrmSimka;

implementation

uses TarifPlanFrm, CustomerFunctions;

{$R *.dfm}

procedure TfrmSimka.btnSaveClick(Sender: TObject);
begin
  with pfbdtst1 do
  try

    QueryPrepare;

    case FEditorState of
      esEdit: with QUpdate do begin
        if VarIsEmpty(dblkcbbTarifPlan.KeyValue) then
          raise Exception.Create('Заполните поля');
        ParamByName('P_SID').AsInteger := pfbdtst1.FieldByName('SID').AsInteger;
        ParamByName('P_S_TARIFPLAN').Value := dblkcbbTarifPlan.KeyValue;
        ParamByName('P_S_NUMBER').AsString := edtNumber.Text;
      end;

      esInsert: with QInsert do begin
        if VarIsEmpty(dblkcbbTarifPlan.KeyValue) then
          raise Exception.Create('Заполните поля');
        ParamByName('P_S_TARIFPLAN').Value := dblkcbbTarifPlan.KeyValue;
        ParamByName('P_S_NUMBER').AsString := edtNumber.Text;
      end;

      esDelete: with QDelete do begin
        ParamByName('P_SID').AsInteger := pfbdtst1.FieldByName('SID').AsInteger;
      end;
    end;
    
    inherited;
  except
    on EFIBError do begin
      Application.MessageBox('Обратитесь к разработчику',
          'Ошибка базы данных', MB_ICONERROR);
      Abort;
    end;
    on E: Exception do begin
      Application.MessageBox(PChar(E.Message + #13#10 +
          'Введите верные данные и повторите попытку'),
          'Ошибка', MB_ICONERROR);
      Abort;
    end;
  end;
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

procedure TfrmSimka.edtNumberKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  MaskKeyEdit(Sender, Key, ['0'..'9']);
end;

procedure TfrmSimka.FormCreate(Sender: TObject);
begin
  inherited;
  FCheckComponents.Add(edtNumber);
  FCheckComponents.Add(dblkcbbTarifPlan);
end;

end.



