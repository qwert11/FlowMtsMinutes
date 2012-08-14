unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles;

type
  TfrmMain = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DM_;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
  function ReadIni(ASection, AString : String) : Variant;
  var
    sIniFile: TIniFile;
    sPath: String[60];
  begin
    GetDir(0, sPath);
    sIniFile := TIniFile.Create(sPath + '\Name.INI');
    try
      Result := sIniFile.ReadString(ASection, AString, ' ');
    finally
      sIniFile.Free;
    end;
  end;
begin

end;

end.
