object frmEditingReport: TfrmEditingReport
  Left = 354
  Top = 256
  Width = 863
  Height = 465
  Caption = 'frmEditingReport'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object stat1: TStatusBar
    Left = 0
    Top = 419
    Width = 855
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object dbgrdhRepSIM: TDBGridEh
    Left = 0
    Top = 0
    Width = 655
    Height = 419
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = ds1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    IndicatorOptions = [gioShowRowIndicatorEh]
    PopupMenu = pm1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnl1: TPanel
    Left = 655
    Top = 0
    Width = 200
    Height = 419
    Align = alRight
    TabOrder = 2
    object lbl2: TLabel
      Left = 65
      Top = 56
      Width = 112
      Height = 13
      Caption = 'ID '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072' '#8470'1'
    end
    object lbl1: TLabel
      Left = 60
      Top = 32
      Width = 29
      Height = 13
      Caption = #1044#1072#1090#1072':'
    end
    object lbl3: TLabel
      Left = 65
      Top = 168
      Width = 112
      Height = 13
      Caption = 'ID '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072' '#8470'2'
    end
    object dtpDate: TDateTimePicker
      Left = 96
      Top = 24
      Width = 97
      Height = 21
      Date = 41137.684692013890000000
      Time = 41137.684692013890000000
      TabOrder = 0
    end
    object cbbIDAccount2: TDBLookupComboboxEh
      Left = 56
      Top = 184
      Width = 121
      Height = 21
      EditButtons = <>
      KeyField = 'FID'
      ListField = 'F_CODE; F_IDACCOUNT'
      ListSource = frmFinance.ds1
      TabOrder = 1
      Visible = True
    end
    object cbbIDAccount1: TDBLookupComboboxEh
      Left = 56
      Top = 72
      Width = 121
      Height = 21
      EditButtons = <>
      KeyField = 'FID'
      ListField = 'F_CODE; F_IDACCOUNT'
      ListSource = frmFinance.ds1
      TabOrder = 2
      Visible = True
    end
    object edtSum1: TEdit
      Left = 56
      Top = 104
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'edtSum1'
    end
    object edtSum2: TEdit
      Left = 56
      Top = 216
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'edtSum2'
    end
    object btnSave: TBitBtn
      Left = 16
      Top = 376
      Width = 75
      Height = 25
      TabOrder = 5
      Kind = bkOK
    end
    object btnClose: TBitBtn
      Left = 104
      Top = 376
      Width = 75
      Height = 25
      TabOrder = 6
      Kind = bkCancel
    end
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 96
    Top = 88
  end
  object ds1: TDataSource
    DataSet = cds
    Left = 48
    Top = 264
  end
  object cds: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'cdsSimka'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'cdsIn'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'cdsSMS'
        DataType = ftInteger
      end
      item
        Name = 'cdsOwner'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'cdsBalance'
        DataType = ftFloat
      end
      item
        Name = 'ID_RS'
        DataType = ftInteger
      end
      item
        Name = 'IDSimka'
        DataType = ftInteger
      end
      item
        Name = 'IDIn'
        DataType = ftInteger
      end
      item
        Name = 'IDOwner'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 48
    Top = 224
    object intgrfldID_RS: TIntegerField
      DisplayWidth = 7
      FieldKind = fkInternalCalc
      FieldName = 'ID_RS'
    end
    object intgrfldIDSimka: TIntegerField
      DisplayWidth = 10
      FieldKind = fkInternalCalc
      FieldName = 'IDSimka'
    end
    object intgrfldIDIn: TIntegerField
      DisplayWidth = 10
      FieldKind = fkInternalCalc
      FieldName = 'IDIn'
    end
    object intgrfldIDOwner: TIntegerField
      DisplayWidth = 10
      FieldKind = fkInternalCalc
      FieldName = 'IDOwner'
    end
    object strngfldSimka: TStringField
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'cdsSimka'
      LookupDataSet = frmSimka.pfbdtst1
      LookupKeyFields = 'SID'
      LookupResultField = 'S_NUMBER'
      KeyFields = 'IDSimka'
      Lookup = True
    end
    object strngfldIn: TStringField
      DisplayWidth = 6
      FieldName = 'cdsIn'
    end
    object intgrfldSMS: TIntegerField
      DisplayWidth = 10
      FieldName = 'cdsSMS'
    end
    object strngfldOwner: TStringField
      DisplayWidth = 15
      FieldName = 'cdsOwner'
    end
    object fltfldBalance: TFloatField
      DisplayWidth = 10
      FieldName = 'cdsBalance'
    end
  end
  object actlst1: TActionList
    Left = 48
    Top = 88
    object actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      OnExecute = actEditExecute
      OnUpdate = actEditingUpdate
    end
  end
  object pm1: TPopupMenu
    Left = 96
    Top = 40
    object mniEdit: TMenuItem
      Action = actEdit
    end
  end
end
