inherited frmFinance: TfrmFinance
  Left = 721
  Top = 254
  Caption = 'frmFinance'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgrd1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'FID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F_IDACCOUNT'
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F_CODE'
        Visible = True
      end>
  end
  inherited pnl1: TPanel
    object lbl1: TLabel [0]
      Left = 16
      Top = 8
      Width = 92
      Height = 13
      Caption = 'ID '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
    end
    object lbl2: TLabel [1]
      Left = 16
      Top = 48
      Width = 19
      Height = 13
      Caption = #1050#1086#1076
    end
    object edtIDAccount: TEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'edtIDAccount'
    end
    object edtCode: TEdit
      Left = 16
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 5
      Text = 'edtCode'
    end
  end
  inherited pfbdtst1: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE FINANCE'
      'SET '
      '    F_IDACCOUNT = :F_IDACCOUNT,'
      '    F_CODE = :F_CODE'
      'WHERE'
      '    FID = :FID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    FINANCE'
      'WHERE'
      '        FID = :FID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO FINANCE('
      '    F_IDACCOUNT,'
      '    F_CODE'
      ')'
      'VALUES('
      '    :F_IDACCOUNT,'
      '    :F_CODE'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    FID,'
      '    F_IDACCOUNT,'
      '    F_CODE'
      'FROM'
      '    FINANCE '
      ''
      ' WHERE '
      '        FINANCE.FID = :FID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    FID,'
      '    F_IDACCOUNT,'
      '    F_CODE'
      'FROM'
      '    FINANCE ')
    Active = True
    object pfbdtst1FID: TFIBIntegerField
      FieldName = 'FID'
    end
    object pfbdtst1F_IDACCOUNT: TFIBStringField
      FieldName = 'F_IDACCOUNT'
      Size = 50
      EmptyStrToNull = True
    end
    object pfbdtst1F_CODE: TFIBStringField
      FieldName = 'F_CODE'
      Size = 30
      EmptyStrToNull = True
    end
  end
end
