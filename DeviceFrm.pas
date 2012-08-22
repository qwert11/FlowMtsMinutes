unit DeviceFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChaildFrm, DB, FIBDataSet, pFIBDataSet, ActnList, Menus,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, fib, ComCtrls;

type
  TfrmDevice = class(TChaildForm)
    pfbdtst1DID: TFIBIntegerField;
    pfbdtst1D_NUM: TFIBIntegerField;
    pfbdtst1D_TITLE: TFIBStringField;
    edtNum: TEdit;
    lbl1: TLabel;
    edtTitle: TEdit;
    lbl2: TLabel;
    procedure btnSaveClick(Sender: TObject); override;
    procedure edtNumKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDevice: TfrmDevice;

implementation

uses CustomerFunctions;

{$R *.dfm}

procedure TfrmDevice.btnSaveClick(Sender: TObject);
begin
  with pfbdtst1 do
  try

    QueryPrepare;

    case FEditorState of
      esEdit: with QUpdate do begin
        if edtNum.Text = NullAsStringValue then
          raise Exception.Create('Заполните поля');
        ParamByName('P_DID').AsInteger := pfbdtst1.FieldByName('DID').AsInteger;
        EditFieldInt(ParamByName('P_D_Num'), edtNum.Text);
        ParamByName('P_D_Title').AsString := ToStrNull(edtTitle.Text);
      end;
      esInsert: with QInsert do begin
        if (edtNum.Text = NullAsStringValue) then
          raise Exception.Create('Заполните поля');
        EditFieldInt(ParamByName('P_D_Num'), edtNum.Text);
        ParamByName('P_D_Title').AsString := ToStrNull(edtTitle.Text);
      end;
      esDelete: with QDelete do begin
        ParamByName('DID').AsInteger := pfbdtst1.FieldByName('DID').AsInteger;
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

procedure TfrmDevice.edtNumKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  MaskKeyEdit(Sender, Key, ['0'..'9']);
end;

procedure TfrmDevice.FormCreate(Sender: TObject);
begin
  inherited;
  FCheckComponents.Add(edtNum);
end;

end.
