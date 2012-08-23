unit OwnerFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChaildFrm, ActnList, Menus, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, DB, FIBDataSet, pFIBDataSet, fib, ComCtrls;

type
  TfrmOwner = class(TChaildForm)
    pfbdtst1OID: TFIBIntegerField;
    pfbdtst1O_NAME: TFIBStringField;
    edtOwner: TEdit;
    lbl1: TLabel;
    procedure btnSaveClick(Sender: TObject); override;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOwner: TfrmOwner;

implementation

{$R *.dfm}

procedure TfrmOwner.btnSaveClick(Sender: TObject);
begin
  with pfbdtst1 do
  try

    QueryPrepare;

    case FEditorState of
      esEdit: with QUpdate do begin
        if edtOwner.Text = NullAsStringValue then
          raise Exception.Create('Заполните поля');
        ParamByName('P_OID').AsInteger := pfbdtst1.FieldByName('OID').AsInteger;
        ParamByName('P_O_NAME').AsString := edtOwner.Text;
      end;
      esInsert: with QInsert do begin
        if (edtOwner.Text = NullAsStringValue) then
          raise Exception.Create('Заполните поля');
        ParamByName('P_O_NAME').AsString := edtOwner.Text;
      end;
      esDelete: with QDelete do begin
        ParamByName('P_OID').AsInteger := pfbdtst1.FieldByName('OID').AsInteger;
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

procedure TfrmOwner.FormCreate(Sender: TObject);
begin
  inherited;
  FCheckComponents.Add(edtOwner)
end;

end.
