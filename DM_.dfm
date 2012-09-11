object DM: TDM
  OldCreateOrder = False
  Left = 1426
  Top = 715
  Height = 259
  Width = 174
  object DB: TpFIBDatabase
    Connected = True
    DBName = '192.168.1.153:D:\Prog\FlowMtsMinutes\REPORTMTS.FDB'
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
    Active = True
    DefaultDatabase = DB
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 56
    Top = 64
  end
  object pfbtrnsView: TpFIBTransaction
    Active = True
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 56
    Top = 112
  end
  object ds1: TDataSource
    DataSet = pfbdtstView
    Left = 104
    Top = 160
  end
  object pfbdtstView: TpFIBDataSet
    SelectSQL.Strings = (
      'select '
      '    report_day.rd_date,'
      '    report_day.rd_fnce1sum,'
      '    report_day.rd_fnce2sum,'
      '    respons.re_surname,'
      '    tarif_plan.tp_name,'
      '    tarif_plan.tp_abon_board,'
      '    tarif_plan.tp_sms_month,'
      '    report_simka.rs_sms,'
      '    report_simka.rs_balance,'
      '    device.d_num,'
      '    device.d_title,'
      '    owner.o_name,'
      '    simka.s_number,'
      '    finance.f_idaccount,'
      '    finance1.f_idaccount,'
      '    report_day.rd_id,'
      '    report_simka.rs_simka,'
      '    report_simka.rs_owner,'
      '    report_simka.rs_in,'
      '    report_simka.rsid,'
      '    report_day.rd_finance1,'
      '    report_day.rd_finance2,'
      '    report_day.rd_respons,'
      '    respons.re_name,'
      '    respons.re_patronymic'
      'from report_day'
      
        '   inner join report_simka on (report_day.rd_id = report_simka.r' +
        's_reportday)'
      '   inner join device on (report_simka.rs_in = device.did)'
      '   inner join owner on (report_simka.rs_owner = owner.oid)'
      '   inner join simka on (report_simka.rs_simka = simka.sid)'
      
        '   inner join tarif_plan on (simka.s_tarifplan = tarif_plan.tpid' +
        ')'
      
        '   inner join finance finance1 on (report_day.rd_finance1 = fina' +
        'nce1.fid)'
      
        '   left outer join respons on (report_day.rd_respons = respons.r' +
        'eid)'
      '   inner join finance on (report_day.rd_finance2 = finance.fid)'
      
        'order by report_day.rd_date, report_simka.rs_owner, report_simka' +
        '.rsid')
    Transaction = pfbtrnsView
    Database = DB
    Left = 56
    Top = 160
    object fbntgrfldViewRSID: TFIBIntegerField
      FieldName = 'RSID'
      Origin = 'REPORT_SIMKA.RSID'
    end
    object fbdtfldViewRD_DATE: TFIBDateField
      FieldName = 'RD_DATE'
      Origin = 'REPORT_DAY.RD_DATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object fbstrngfldViewF_IDACCOUNT: TFIBStringField
      FieldName = 'F_IDACCOUNT'
      Origin = 'FINANCE.F_IDACCOUNT'
      Size = 50
      EmptyStrToNull = True
    end
    object fbcdfldViewRD_FNCE1SUM: TFIBBCDField
      FieldName = 'RD_FNCE1SUM'
      Origin = 'REPORT_DAY.RD_FNCE1SUM'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object fbstrngfldViewF_IDACCOUNT1: TFIBStringField
      FieldName = 'F_IDACCOUNT1'
      Origin = 'FINANCE.F_IDACCOUNT'
      Size = 50
      EmptyStrToNull = True
    end
    object fbcdfldViewRD_FNCE2SUM: TFIBBCDField
      FieldName = 'RD_FNCE2SUM'
      Origin = 'REPORT_DAY.RD_FNCE2SUM'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object fbstrngfldViewS_NUMBER: TFIBStringField
      FieldName = 'S_NUMBER'
      Origin = 'SIMKA.S_NUMBER'
      Size = 12
      EmptyStrToNull = True
    end
    object fbstrngfldViewO_NAME: TFIBStringField
      FieldName = 'O_NAME'
      Origin = 'OWNER.O_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object fbstrngfldViewTP_NAME: TFIBStringField
      FieldName = 'TP_NAME'
      Origin = 'TARIF_PLAN.TP_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object fbcdfldViewTP_ABON_BOARD: TFIBBCDField
      FieldName = 'TP_ABON_BOARD'
      Origin = 'TARIF_PLAN.TP_ABON_BOARD'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object fbntgrfldViewTP_SMS_MONTH: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'TP_SMS_MONTH'
      Origin = 'TARIF_PLAN.TP_SMS_MONTH'
    end
    object fbntgrfldViewRS_SMS: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'RS_SMS'
      Origin = 'REPORT_SIMKA.RS_SMS'
    end
    object fbcdfldViewRS_BALANCE: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'RS_BALANCE'
      Origin = 'REPORT_SIMKA.RS_BALANCE'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object fbntgrfldViewD_NUM: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'D_NUM'
      Origin = 'DEVICE.D_NUM'
    end
    object fbstrngfldViewD_TITLE: TFIBStringField
      FieldName = 'D_TITLE'
      Origin = 'DEVICE.D_TITLE'
      EmptyStrToNull = True
    end
    object fbntgrfldViewRD_ID: TFIBIntegerField
      FieldName = 'RD_ID'
      Origin = 'REPORT_DAY.RD_ID'
    end
    object fbstrngfldViewRE_SURNAME: TFIBStringField
      FieldName = 'RE_SURNAME'
      Origin = 'RESPONS.RE_SURNAME'
      OnGetText = fbstrngfldViewRE_SURNAMEGetText
      Size = 50
      EmptyStrToNull = True
    end
    object fbstrngfldViewRE_NAME: TFIBStringField
      FieldName = 'RE_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object fbstrngfldViewRE_PATRONYMIC: TFIBStringField
      FieldName = 'RE_PATRONYMIC'
      Size = 50
      EmptyStrToNull = True
    end
    object fbntgrfldViewRS_IN: TFIBIntegerField
      FieldName = 'RS_IN'
      Origin = 'REPORT_SIMKA.RS_IN'
    end
    object fbntgrfldViewRS_SIMKA: TFIBIntegerField
      FieldName = 'RS_SIMKA'
      Origin = 'REPORT_SIMKA.RS_SIMKA'
    end
    object fbntgrfldViewRS_OWNER: TFIBIntegerField
      FieldName = 'RS_OWNER'
      Origin = 'REPORT_SIMKA.RS_OWNER'
    end
    object fbntgrfldViewRD_FINANCE1: TFIBIntegerField
      FieldName = 'RD_FINANCE1'
      Origin = 'REPORT_DAY.RD_FINANCE1'
    end
    object fbntgrfldViewRD_FINANCE2: TFIBIntegerField
      FieldName = 'RD_FINANCE2'
      Origin = 'REPORT_DAY.RD_FINANCE2'
    end
    object fbntgrfldViewRD_RESPONS: TFIBIntegerField
      FieldName = 'RD_RESPONS'
      Origin = 'REPORT_DAY.RD_RESPONS'
    end
  end
  object pfbqryDelete: TpFIBQuery
    Transaction = pfbtrnsctn1
    Database = DB
    SQL.Strings = (
      'DELETE FROM REPORT_DAY'
      'WHERE'
      '    RD_ID=:P_RD_ID')
    Left = 104
    Top = 112
  end
end
