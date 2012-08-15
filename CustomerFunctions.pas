unit CustomerFunctions;

interface

uses
  IniFiles, SysUtils, StdCtrls, Windows, DBCtrlsEh,
  DBLookupEh, Forms, pFIBDataSet, Classes, Controls, Variants;

type
  TReadIni = (riString, riInteger, riBool, riDate, riFloat);
  TMask = set of Char;


function ReadIni(ASection, AString : String; ReadIni: TReadIni) : Variant;

procedure MaskKeyEdit(Sender: TObject; var Key: Char; AMask: TMask);

procedure ClearEdit(frm: TForm);
procedure CloseTDBLookupComboboxEh(frm: TForm);
procedure SetDblkCbbFrom_IbTbl_Frm(Frm: TForm; Cbb: TDBLookupComboboxEh;
  tbl: TpFIBDataSet; DM: TDataModule);

implementation

uses CustomerGlobals;

// ������ ��������� �� ini �����
function ReadIni(ASection, AString : String; ReadIni: TReadIni) : Variant;
var
  sIniFile: TIniFile;
  sPath: String[60];
begin
  GetDir(0, sPath);
  sIniFile := TIniFile.Create(sPath + '\' + CONFIG_FILE);
  try
    case ReadIni of
      riString: Result := sIniFile.ReadString(ASection, AString, ' ');
      riInteger: Result := sIniFile.ReadInteger(ASection, AString, 0);
      riBool: Result := sIniFile.ReadBool(ASection, AString, True);
      riDate: Result := sIniFile.ReadDate(ASection, AString, Date);
      riFloat: Result := sIniFile.ReadFloat(ASection, AString, 0);
    end;
  finally
    sIniFile.Free;
  end;
end;

// ����� ��� TEdit
procedure MaskKeyEdit(Sender: TObject; var Key: Char; AMask: TMask);
begin                             // '0'..'9',DecimalSeparator
  if not (Sender is TEdit) then
    Abort;

  if Key = ',' then
    Key := DecimalSeparator; // ������� �������� �� ����������� ��� �����

  if Key = '.' then
    Key := DecimalSeparator; // ����� �������� �� ��������� (�� ������ ������)

  if not ((Key in AMask) or (Key in [#8,#13]))  // ������� ������� ������������
    or ((Key = DecimalSeparator) // ��� ����� ���� ����� �����������
    and (POS (DecimalSeparator, TEdit(Sender).Text) > 0)) // ������ �� ������ ���������
    or ((Key = '-') and (POS ('-', TEdit(Sender).Text) > 0)) // ������ �� ������ �����
    or ((Key = '-') and (TEdit(Sender).SelStart <> 0)) // ������ �� ����� �� ������� �����
    then // (����� � ���������� ������� �� ��� ����� ��� ���������)
  begin
    Key := #0; // ����������� ������ �������� �����
    MessageBeep (MB_OK); // ��� � ������
  end;
end;

procedure CloseTDBLookupComboboxEh(frm: TForm);
var
  I: Integer;
begin
  with frm do
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TDBLookupComboboxEh then
      if (Components[I] as TDBLookupComboboxEh).ListVisible then
        (Components[I] as TDBLookupComboboxEh).CloseUp(True);
end;

procedure ClearEdit(frm: TForm);
var
  I: Integer;
begin
  with frm do
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TEdit then
      (Components[I] as TEdit).Clear;
end;

//��������� TDBLookupComboBox �� TpFIBDataSet
procedure SetDblkCbbFrom_IbTbl_Frm(Frm: TForm; Cbb: TDBLookupComboboxEh;
  tbl: TpFIBDataSet; DM: TDataModule);
begin
  Frm.ShowModal;
  with DM, Cbb, tbl do
  if Frm.ModalResult = mrOk then
    KeyValue := Fields[0].AsInteger
  else
    KeyValue := null
end;

end.
