inherited frmOwner: TfrmOwner
  Left = 619
  Top = 343
  Caption = 'frmOwner'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgrd1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'OID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'O_NAME'
        Visible = True
      end>
  end
  inherited pnl1: TPanel
    object lbl1: TLabel [0]
      Left = 16
      Top = 40
      Width = 49
      Height = 13
      Caption = #1042#1083#1072#1076#1077#1083#1077#1094
    end
    object edtOwner: TEdit
      Left = 16
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'edtOwner'
    end
  end
  inherited pfbdtst1: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OWNER'
      'SET '
      '    O_NAME = :O_NAME'
      'WHERE'
      '    OID = :OID')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    OWNER'
      'WHERE'
      '    OID = :OID    ')
    InsertSQL.Strings = (
      'INSERT INTO OWNER('
      '    O_NAME'
      ')'
      'VALUES('
      '    :O_NAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    OID,'
      '    O_NAME'
      'FROM'
      '    OWNER ')
    SelectSQL.Strings = (
      'SELECT'
      '    OID,'
      '    O_NAME'
      'FROM'
      '    OWNER ')
    object pfbdtst1OID: TFIBIntegerField
      FieldName = 'OID'
    end
    object pfbdtst1O_NAME: TFIBStringField
      FieldName = 'O_NAME'
      Size = 50
      EmptyStrToNull = True
    end
  end
end
