unit OwnerFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChaildFrm, ActnList, Menus, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, DB, FIBDataSet, pFIBDataSet;

type
  TfrmOwner = class(TChaildForm)
    pfbdtst1OID: TFIBIntegerField;
    pfbdtst1O_NAME: TFIBStringField;
    edtOwner: TEdit;
    lbl1: TLabel;
    procedure btnSaveClick(Sender: TObject); override;
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
  with pfbdtst1 do begin
    if not pfbdtst1.Eof then
      ParamByName('OID').AsInteger := FieldByName('OID').AsInteger;

    if (FEditorState in [esEdit, esInsert]) and
        (edtOwner.Text = NullAsStringValue) then
      Exit;

    ParamByName('O_NAME').AsString := edtOwner.Text;
  end;

  inherited;
end;

end.
