unit CustomerGlobals;

interface

const
  DEF_USER = 'Anonimous';
  CONFIG_FILE = 'Config.INI';

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
  user: TUser;

implementation

initialization
  user.login := DEF_USER;
end.
