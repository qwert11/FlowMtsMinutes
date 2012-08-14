unit CustomerFunctions;

interface

uses
  IniFiles, SysUtils;

type
  TReadIni = (riString, riInteger, riBool, riDate, riFloat);

function ReadIni(ASection, AString : String; ReadIni: TReadIni) : Variant;

implementation

function ReadIni(ASection, AString : String; ReadIni: TReadIni) : Variant;
var
  sIniFile: TIniFile;
  sPath: String[60];
begin
  GetDir(0, sPath);
  sIniFile := TIniFile.Create(sPath + '\Config.INI');
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

end.
