unit CustomerGlobals;

interface

const
  DEF_USER = 'Anonimous';
  CONFIG_FILE = 'Config.INI';
  SIMKA_REPORT_LOG = 'SimkaReportLog.txt';

type
  TDomainTitle = string[50];

  TUser = record
    login: TDomainTitle;
    ID: Integer;
    Name: TDomainTitle;
    Patronymic: TDomainTitle;// PATRONYMIC
    Surname: TDomainTitle;
  end;

var
  user: TUser = (login: DEF_USER; ID: -1; Name: DEF_USER; Patronymic: DEF_USER; Surname: DEF_USER);

implementation

initialization

end.
