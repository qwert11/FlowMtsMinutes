object DM: TDM
  OldCreateOrder = False
  Left = 1095
  Top = 360
  Height = 150
  Width = 174
  object DB: TpFIBDatabase
    DBName = 'REPORTMTS.FDB'
    DBParams.Strings = (
      'password=masterkey'
      'user_name=SYSDBA'
      'lc_ctype=WIN1251')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 56
    Top = 16
  end
  object pfbtrnsctn1: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 56
    Top = 64
  end
end