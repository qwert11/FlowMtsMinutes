unit UsersFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChaildFrm, ActnList, DB, FIBDataSet, pFIBDataSet, Menus,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TfrmUsers = class(TChaildForm)
    fbntgrfldpfbdtst1REID: TFIBIntegerField;
    fpfbdtst1RE_SURNAME: TFIBStringField;
    fpfbdtst1RE_NAME: TFIBStringField;
    fpfbdtst1RE_PATRONYMIC: TFIBStringField;
    fpfbdtst1RE_PASSWORD: TFIBStringField;
    fpfbdtst1RE_LOGIND: TFIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsers: TfrmUsers;

implementation

{$R *.dfm}

end.
