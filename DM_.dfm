object DM: TDM
  OldCreateOrder = False
  Left = 1472
  Top = 600
  Height = 259
  Width = 174
  object DB: TpFIBDatabase
    Connected = True
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
      '    report_day.rd_respons'
      'from device'
      '   inner join report_simka on (device.did = report_simka.rs_in)'
      
        '   inner join report_day on (report_simka.rs_reportday = report_' +
        'day.rd_id)'
      
        '   inner join finance finance1 on (report_day.rd_finance1 = fina' +
        'nce1.fid)'
      '   inner join respons on (report_day.rd_respons = respons.reid)'
      '   inner join finance on (report_day.rd_finance2 = finance.fid)'
      '   inner join owner on (report_simka.rs_owner = owner.oid)'
      '   inner join simka on (report_simka.rs_simka = simka.sid)'
      
        '   inner join tarif_plan on (simka.s_tarifplan = tarif_plan.tpid' +
        ')')
    Active = True
    Transaction = pfbtrnsView
    Database = DB
    Left = 56
    Top = 160
    object fbntgrfldViewRSID: TFIBIntegerField
      FieldName = 'RSID'
    end
    object fbdtfldViewRD_DATE: TFIBDateField
      FieldName = 'RD_DATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object fbstrngfldViewF_IDACCOUNT: TFIBStringField
      FieldName = 'F_IDACCOUNT'
      Size = 50
      EmptyStrToNull = True
    end
    object fbcdfldViewRD_FNCE1SUM: TFIBBCDField
      FieldName = 'RD_FNCE1SUM'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object fbstrngfldViewF_IDACCOUNT1: TFIBStringField
      FieldName = 'F_IDACCOUNT1'
      Size = 50
      EmptyStrToNull = True
    end
    object fbcdfldViewRD_FNCE2SUM: TFIBBCDField
      FieldName = 'RD_FNCE2SUM'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object fbstrngfldViewS_NUMBER: TFIBStringField
      FieldName = 'S_NUMBER'
      Size = 12
      EmptyStrToNull = True
    end
    object fbstrngfldViewO_NAME: TFIBStringField
      FieldName = 'O_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object fbstrngfldViewTP_NAME: TFIBStringField
      FieldName = 'TP_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object fbcdfldViewTP_ABON_BOARD: TFIBBCDField
      FieldName = 'TP_ABON_BOARD'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object fbntgrfldViewTP_SMS_MONTH: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'TP_SMS_MONTH'
    end
    object fbntgrfldViewRS_SMS: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'RS_SMS'
    end
    object fbcdfldViewRS_BALANCE: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'RS_BALANCE'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object fbntgrfldViewD_NUM: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'D_NUM'
    end
    object fbstrngfldViewD_TITLE: TFIBStringField
      FieldName = 'D_TITLE'
      EmptyStrToNull = True
    end
    object fbntgrfldViewRD_ID: TFIBIntegerField
      FieldName = 'RD_ID'
    end
    object fbstrngfldViewRE_SURNAME: TFIBStringField
      FieldName = 'RE_SURNAME'
      Size = 50
      EmptyStrToNull = True
    end
    object fbntgrfldViewRS_IN: TFIBIntegerField
      FieldName = 'RS_IN'
    end
    object fbntgrfldViewRS_SIMKA: TFIBIntegerField
      FieldName = 'RS_SIMKA'
    end
    object fbntgrfldViewRS_OWNER: TFIBIntegerField
      FieldName = 'RS_OWNER'
    end
    object fbntgrfldViewRD_FINANCE1: TFIBIntegerField
      FieldName = 'RD_FINANCE1'
    end
    object fbntgrfldViewRD_FINANCE2: TFIBIntegerField
      FieldName = 'RD_FINANCE2'
    end
    object fbntgrfldViewRD_RESPONS: TFIBIntegerField
      FieldName = 'RD_RESPONS'
    end
  end
end
