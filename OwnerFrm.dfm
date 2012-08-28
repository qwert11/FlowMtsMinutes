inherited frmOwner: TfrmOwner
  Left = 798
  Top = 334
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
      MaxLength = 50
      TabOrder = 4
      Text = 'edtOwner'
    end
  end
  inherited pfbdtst1: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OWNER'
      'SET '
      '    O_NAME = :P_O_NAME'
      'WHERE'
      '    OID = :P_OID')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    OWNER'
      'WHERE'
      '    OID = :P_OID    ')
    InsertSQL.Strings = (
      'INSERT INTO OWNER('
      '    O_NAME'
      ')'
      'VALUES('
      '    :P_O_NAME'
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
    Active = True
    object pfbdtst1OID: TFIBIntegerField
      FieldName = 'OID'
      Origin = 'OWNER.OID'
    end
    object pfbdtst1O_NAME: TFIBStringField
      FieldName = 'O_NAME'
      Origin = 'OWNER.O_NAME'
      Size = 50
      EmptyStrToNull = True
    end
  end
end
