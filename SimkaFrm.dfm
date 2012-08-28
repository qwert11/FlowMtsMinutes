inherited frmSimka: TfrmSimka
  Left = 659
  Top = 253
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
        FieldName = 'TarifPlan'
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
    object btnTarifPlan: TSpeedButton [2]
      Left = 168
      Top = 24
      Width = 23
      Height = 22
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FF3F96BD0076A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7EBAD30078AB0078ABFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF007BAE00B7EB007BAEFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7EBDD600A5D900B8EC00
        7EB1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0081B400BAEE00B8EC0081B4FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7EC0D907AADC06
        B9EB0ABCED0085B8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3FA5CB
        0089BC0089BC0089BC0089BC099CCE05AFE20BB7E818C0EE0089BCFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF7EC4DD1CB3E01BC0EE1BC0EE1BC0EE14BBEA0B
        B2E300A9DD0EB5E52AC5EF008DC0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        0092C532CBF232CAF238CFF446D7FA4FDDFE4FDDFE48D8FB45D7FA3DCCF10092
        C5FF00FFFF00FFFF00FFFF00FFFF00FF7EC8E237BDE56EE5FF6EE5FF6EE5FFA5
        F2FFDDFFFFDDFFFFDDFFFFDDFFFFA5E5F20096CAFF00FFFF00FFFF00FFFF00FF
        FF00FF009ACE89ECFF89ECFF89ECFF89ECFF66D8F322AEDA009ACE009ACE009A
        CE009ACE3FB1D8FF00FFFF00FFFF00FFFF00FF7ECCE651C9E9A3F2FFA3F2FFA3
        F2FFA3F2FF7ADDF4009ED2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00A1D5BAF7FFBAF7FFBAF7FFBAF7FFBAF7FF8BE2F400A1D5FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7ECFE967D1ECCFFCFFCF
        FCFFCFFCFFCFFCFFCFFCFF9AE6F500A4D8FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00A7DBDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFA5E9
        F600A7DBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7ED2EC16B2E036
        BEE657CCEB6ED5EE6ED5EE57CCEB36BEE616B2E03FBDE4FF00FF}
      OnClick = btnTarifPlanClick
    end
    object edtNumber: TEdit
      Left = 16
      Top = 64
      Width = 121
      Height = 21
      MaxLength = 12
      TabOrder = 4
      Text = 'edtNumber'
      OnKeyPress = edtNumberKeyPress
    end
    object dblkcbbTarifPlan: TDBLookupComboBox
      Left = 16
      Top = 24
      Width = 145
      Height = 21
      KeyField = 'TPID'
      ListField = 'TP_NAME; TP_SMS_MONTH'
      ListSource = frmTarifPlan.ds1
      TabOrder = 5
    end
  end
  inherited pfbdtst1: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SIMKA'
      'SET '
      '    S_TARIFPLAN = :P_S_TARIFPLAN,'
      '    S_NUMBER = :P_S_NUMBER'
      'WHERE'
      '    SID = :P_SID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SIMKA'
      'WHERE'
      '    SID = :P_SID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SIMKA('
      '    S_TARIFPLAN,'
      '    S_NUMBER'
      ')'
      'VALUES('
      '    :P_S_TARIFPLAN,'
      '    :P_S_NUMBER'
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
      '    SIMKA.SID = :P_SID'
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
      Origin = 'SIMKA.SID'
    end
    object pfbdtst1S_TARIFPLAN: TFIBIntegerField
      FieldName = 'S_TARIFPLAN'
      Origin = 'SIMKA.S_TARIFPLAN'
    end
    object pfbdtst1S_NUMBER: TFIBStringField
      FieldName = 'S_NUMBER'
      Origin = 'SIMKA.S_NUMBER'
      Size = 12
      EmptyStrToNull = True
    end
    object crncyfldpfbdtst1AbonBoard: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'AbonBoard'
      LookupDataSet = frmTarifPlan.pfbdtst1
      LookupKeyFields = 'TPID'
      LookupResultField = 'TP_ABON_BOARD'
      KeyFields = 'S_TARIFPLAN'
      Origin = 'TARIF_PLAN.TP_ABON_BOARD'
      Lookup = True
    end
    object strngfldpfbdtst1TarifPlan: TStringField
      FieldKind = fkLookup
      FieldName = 'TarifPlan'
      LookupDataSet = frmTarifPlan.pfbdtst1
      LookupKeyFields = 'TPID'
      LookupResultField = 'TP_ABON_BOARD'
      KeyFields = 'S_TARIFPLAN'
      Origin = 'TARIF_PLAN.TP_NAME'
      Size = 50
      Lookup = True
    end
    object intgrfldpfbdtst1SMS_Month: TIntegerField
      DefaultExpression = '0'
      FieldKind = fkLookup
      FieldName = 'SMS_Month'
      LookupDataSet = frmTarifPlan.pfbdtst1
      LookupKeyFields = 'TPID'
      LookupResultField = 'TP_SMS_MONTH'
      KeyFields = 'S_TARIFPLAN'
      Origin = 'TARIF_PLAN.TP_SMS_MONTH'
      Lookup = True
    end
  end
end
