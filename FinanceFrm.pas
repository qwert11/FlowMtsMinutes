unit FinanceFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChaildFrm, ActnList, Menus, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, DB, FIBDataSet, pFIBDataSet, fib, ComCtrls;

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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFinance: TfrmFinance;

implementation

{$R *.dfm}

procedure TfrmFinance.btnSaveClick(Sender: TObject);
begin
  with pfbdtst1 do
  try
    QueryPrepare;

    case FEditorState of
      esEdit: with QUpdate do begin
        if edtIDAccount.Text = NullAsStringValue then
          raise Exception.Create('Заполните поля');
        ParamByName('P_FID').AsInteger := pfbdtst1.FieldByName('FID').AsInteger;
        ParamByName('P_F_IDACCOUNT').AsString := edtIDAccount.Text;
        ParamByName('P_F_CODE').AsString := edtCode.Text;
      end;

      esInsert: with QInsert do begin
        if (edtIDAccount.Text = NullAsStringValue) then
          raise Exception.Create('Заполните поля');

        ParamByName('P_F_IDACCOUNT').AsString := edtIDAccount.Text;
        ParamByName('P_F_CODE').AsString := edtCode.Text;
      end;
      
      esDelete: with QDelete do begin
        ParamByName('P_FID').AsInteger := pfbdtst1.FieldByName('FID').AsInteger;
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

procedure TfrmFinance.FormCreate(Sender: TObject);
begin
  inherited;
  FCheckComponents.Add(edtIDAccount)
end;

end.
