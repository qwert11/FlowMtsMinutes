inherited frmTarifPlan: TfrmTarifPlan
  Left = 481
  Top = 208
  Caption = 'frmTarifPlan'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgrd1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'TPID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_NAME'
        Width = 181
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_ABON_BOARD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_SMS_MONTH'
        Visible = True
      end>
  end
  inherited pnl1: TPanel
    object lbl1: TLabel [0]
      Left = 16
      Top = 8
      Width = 80
      Height = 13
      Caption = #1058#1072#1088#1080#1092#1085#1099#1081' '#1087#1083#1072#1085
    end
    object lbl2: TLabel [1]
      Left = 16
      Top = 48
      Width = 98
      Height = 13
      Caption = #1040#1073#1086#1085#1077#1085#1090#1089#1082#1072#1103' '#1087#1083#1072#1090#1072
    end
    object lbl3: TLabel [2]
      Left = 152
      Top = 48
      Width = 110
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1057#1052#1057' '#1085#1072' '#1084#1077#1089#1103#1094
    end
    object edtTarifPlan: TEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'edtTarifPlan'
    end
    object edtAbonBoard: TEdit
      Left = 16
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 5
      Text = 'edtAbonBoard'
    end
    object edtSmsMonth: TEdit
      Left = 152
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 6
      Text = 'edtSmsMonth'
    end
  end
  inherited pfbdtst1: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TARIF_PLAN'
      'SET '
      '    TP_NAME = :TP_NAME,'
      '    TP_ABON_BOARD = :TP_ABON_BOARD,'
      '    TP_SMS_MONTH = :TP_SMS_MONTH'
      'WHERE'
      '    TPID = :TPID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TARIF_PLAN'
      'WHERE'
      '    TPID = :TPID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TARIF_PLAN('
      '    TP_NAME,'
      '    TP_ABON_BOARD,'
      '    TP_SMS_MONTH'
      ')'
      'VALUES('
      '    :TP_NAME,'
      '    :TP_ABON_BOARD,'
      '    :TP_SMS_MONTH'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    TPID,'
      '    TP_NAME,'
      '    TP_ABON_BOARD,'
      '    TP_SMS_MONTH'
      'FROM'
      '    TARIF_PLAN '
      ''
      'WHERE '
      '    TARIF_PLAN.TPID = :TPID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    TPID,'
      '    TP_NAME,'
      '    TP_ABON_BOARD,'
      '    TP_SMS_MONTH'
      'FROM'
      '    TARIF_PLAN ')
    Active = True
    object pfbdtst1TPID: TFIBIntegerField
      FieldName = 'TPID'
    end
    object pfbdtst1TP_NAME: TFIBStringField
      FieldName = 'TP_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object pfbdtst1TP_ABON_BOARD: TFIBBCDField
      FieldName = 'TP_ABON_BOARD'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object pfbdtst1TP_SMS_MONTH: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'TP_SMS_MONTH'
    end
  end
  object ibqry1: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 152
    Top = 96
    ParamData = <
      item
        DataType = ftString
        Name = 'eee'
        ParamType = ptUnknown
      end>
  end
end
