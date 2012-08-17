inherited frmSimka: TfrmSimka
  Left = 765
  Top = 243
  Caption = 'frmSimka'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgrd1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'SID'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'S_TARIFPLAN'
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'S_NUMBER'
        Width = 173
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
      Width = 86
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
    end
    object edtNumber: TEdit
      Left = 16
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'edtNumber'
    end
    object dblkcbbTarifPlan: TDBLookupComboBox
      Left = 16
      Top = 24
      Width = 145
      Height = 21
      ListSource = frmTarifPlan.ds1
      TabOrder = 5
    end
  end
  inherited pfbdtst1: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SIMKA'
      'SET '
      '    S_TARIFPLAN = :S_TARIFPLAN,'
      '    S_NUMBER = :S_NUMBER'
      'WHERE'
      '    SID = :SID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SIMKA'
      'WHERE'
      '    SID = :SID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SIMKA('
      '    S_TARIFPLAN,'
      '    S_NUMBER'
      ')'
      'VALUES('
      '    :S_TARIFPLAN,'
      '    :S_NUMBER'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    SID,'
      '    S_TARIFPLAN,'
      '    S_NUMBER'
      'FROM'
      '    SIMKA '
      ''
      'WHERE '
      '    SIMKA.SID = :SID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    SID,'
      '    S_TARIFPLAN,'
      '    S_NUMBER'
      'FROM'
      '    SIMKA ')
    object pfbdtst1SID: TFIBIntegerField
      FieldName = 'SID'
    end
    object pfbdtst1S_TARIFPLAN: TFIBIntegerField
      FieldName = 'S_TARIFPLAN'
    end
    object pfbdtst1S_NUMBER: TFIBStringField
      FieldName = 'S_NUMBER'
      Size = 12
      EmptyStrToNull = True
    end
    object strngfldpfbdtst1TarifPlan: TStringField
      FieldKind = fkLookup
      FieldName = 'TarifPlan'
      LookupDataSet = frmTarifPlan.pfbdtst1
      LookupKeyFields = 'TPID'
      LookupResultField = 'TP_NAME'
      KeyFields = 'S_TARIFPLAN'
      Size = 50
      Lookup = True
    end
    object crncyfldpfbdtst1AbonBoard: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'AbonBoard'
      LookupDataSet = frmTarifPlan.pfbdtst1
      LookupKeyFields = 'TPID'
      LookupResultField = 'TP_ABON_BOARD'
      KeyFields = 'S_TARIFPLAN'
      Lookup = True
    end
    object intgrfldpfbdtst1SMS_Month: TIntegerField
      FieldKind = fkLookup
      FieldName = 'SMS_Month'
      LookupDataSet = frmTarifPlan.pfbdtst1
      LookupKeyFields = 'TPID'
      LookupResultField = 'TP_SMS_MONTH'
      KeyFields = 'S_TARIFPLAN'
      Lookup = True
    end
  end
end
