unit AuthentificationFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, DBCtrlsEh, DBLookupEh, StdCtrls, Mask, Buttons;

type
  TfrmAuthentification = class(TForm)
    txtRegistration: TStaticText;
    cbbLogin: TDBLookupComboboxEh;
    btn1: TBitBtn;
    edtPassword: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure txtRegistrationClick(Sender: TObject);
    procedure edtPasswordClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuthentification: TfrmAuthentification;

implementation

uses UsersFrm, CustomerGlobals, RegistrationFrm;

var
  CountEnter: Integer = 0;

{$R *.dfm}

procedure TfrmAuthentification.btn1Click(Sender: TObject);
begin
  ModalResult := mrNone;
  Inc(CountEnter);
  if CountEnter > 15 then begin
    ShowMessage('Вы исчерпали на сегодня лимит попыток входа под ' +
      'своим логином и паролем. Попробуйте зайти завтра. ;-)');
    Exit;
  end;

  with frmUsers, user do begin
    if  (edtPassword.Text <> fpfbdtst1RE_PASSWORD.Value) or
        (cbbLogin.KeyValue <> fbntgrfldpfbdtst1REID.Value) then begin
      Application.MessageBox('Введите верно логин и пароль',
        PChar('Предупреждение №' + IntToStr(CountEnter)), MB_ICONWARNING);
      Exit
    end;
    login := fpfbdtst1RE_LOGIND.Value;
    ID := fbntgrfldpfbdtst1REID.Value;
    Surname := fpfbdtst1RE_SURNAME.Value;
    Name := fpfbdtst1RE_NAME.Value;
    Patronymic := fpfbdtst1RE_PATRONYMIC.Value;
  end;
  ModalResult := mrOk;
end;

procedure TfrmAuthentification.txtRegistrationClick(Sender: TObject);
begin
  {$IFDEF TESTMODE}
  frmUsers.Show
  {$ELSE}
  frmRegistration.ShowModal
  {$ENDIF}
end;

procedure TfrmAuthentification.edtPasswordClick(Sender: TObject);
begin
  edtPassword.SelectAll
end;

end.
