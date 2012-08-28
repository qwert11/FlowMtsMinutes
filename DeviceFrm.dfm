inherited frmDevice: TfrmDevice
  Left = 862
  Top = 331
  Caption = 'frmDevice'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgrd1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'DID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_NUM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_TITLE'
        Visible = True
      end>
  end
  inherited pnl1: TPanel
    object lbl1: TLabel [0]
      Left = 16
      Top = 8
      Width = 94
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
    end
    object lbl2: TLabel [1]
      Left = 16
      Top = 48
      Width = 110
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
    end
    object edtNum: TEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'edtNum'
      OnKeyPress = edtNumKeyPress
    end
    object edtTitle: TEdit
      Left = 16
      Top = 64
      Width = 121
      Height = 21
      MaxLength = 20
      TabOrder = 5
      Text = 'edtTitle'
    end
  end
  inherited pfbdtst1: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE DEVICE'
      'SET '
      '    D_NUM = :P_D_NUM,'
      '    D_TITLE = :P_D_TITLE'
      'WHERE'
      '    DID = :P_DID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    DEVICE'
      'WHERE'
      '    DID = :P_DID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO DEVICE('
      '    DID,'
      '    D_NUM,'
      '    D_TITLE'
      ')'
      'VALUES('
      '    :P_DID,'
      '    :P_D_NUM,'
      '    :P_D_TITLE'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    DID,'
      '    D_NUM,'
      '    D_TITLE'
      'FROM'
      '    DEVICE '
      ''
      'WHERE '
      '    DEVICE.DID = :P_DID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    DID,'
      '    D_NUM,'
      '    D_TITLE'
      'FROM'
      '    DEVICE ')
    Active = True
    object pfbdtst1DID: TFIBIntegerField
      FieldName = 'DID'
      Origin = 'DEVICE.DID'
    end
    object pfbdtst1D_NUM: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'D_NUM'
      Origin = 'DEVICE.D_NUM'
    end
    object pfbdtst1D_TITLE: TFIBStringField
      FieldName = 'D_TITLE'
      Origin = 'DEVICE.D_TITLE'
      EmptyStrToNull = True
    end
  end
end
