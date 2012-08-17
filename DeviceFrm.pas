unit DeviceFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChaildFrm, DB, FIBDataSet, pFIBDataSet, ActnList, Menus,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDevice: TfrmDevice;

implementation

{$R *.dfm}

procedure TfrmDevice.btnSaveClick(Sender: TObject);
begin
  with pfbdtst1 do begin
    if not pfbdtst1.Eof then
      ParamByName('DID').AsInteger := FieldByName('DID').AsInteger;

    if (FEditorState in [esEdit, esInsert]) and
        ((edtNum.Text = NullAsStringValue) or (edtTitle.Text = NullAsStringValue)) then
      Exit;

    ParamByName('D_Num').AsString := edtNum.Text;
    ParamByName('D_Title').AsString := edtTitle.Text;
  end;

  inherited;
end;

end.
