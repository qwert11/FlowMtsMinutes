inherited frmUsers: TfrmUsers
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited pfbdtst1: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE RESPONS'
      'SET '
      '    RE_SURNAME = :P_RE_SURNAME,'
      '    RE_NAME = :P_RE_NAME,'
      '    RE_PATRONYMIC = :P_RE_PATRONYMIC,'
      '    RE_PASSWORD = :P_RE_PASSWORD,'
      '    RE_LOGIND = :P_RE_LOGIND'
      'WHERE'
      '    REID = :P_REID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    RESPONS'
      'WHERE'
      '        REID = :P_REID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO RESPONS('
      '    RE_SURNAME,'
      '    RE_NAME,'
      '    RE_PATRONYMIC,'
      '    RE_PASSWORD,'
      '    RE_LOGIND'
      ')'
      'VALUES('
      '    :P_RE_SURNAME,'
      '    :P_RE_NAME,'
      '    :P_RE_PATRONYMIC,'
      '    :P_RE_PASSWORD,'
      '    :P_RE_LOGIND'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    REID,'
      '    RE_SURNAME,'
      '    RE_NAME,'
      '    RE_PATRONYMIC,'
      '    RE_PASSWORD,'
      '    RE_LOGIND'
      'FROM'
      '    RESPONS '
      ''
      ' WHERE '
      '        RESPONS.REID = :P_REID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    REID,'
      '    RE_SURNAME,'
      '    RE_NAME,'
      '    RE_PATRONYMIC,'
      '    RE_PASSWORD,'
      '    RE_LOGIND'
      'FROM'
      '    RESPONS ')
    Active = True
  end
end
