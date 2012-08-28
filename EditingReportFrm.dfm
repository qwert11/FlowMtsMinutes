object frmEditingReport: TfrmEditingReport
  Left = 305
  Top = 158
  Width = 738
  Height = 489
  Caption = 'frmEditingReport'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object stat1: TStatusBar
    Left = 0
    Top = 424
    Width = 730
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
    Width = 530
    Height = 424
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
    OnDrawColumnCell = dbgrdhRepSIMDrawColumnCell
    OnKeyPress = dbgrdhRepSIMKeyPress
    Columns = <
      item
        EditButtons = <>
        FieldName = 'cSimka'
        Footers = <>
        Title.Caption = #1058#1077#1083'. / '#1090#1072#1088'.'#1087#1083#1072#1085' / '#1072#1073#1086#1085'.'#1087#1083#1072#1090#1072
        Visible = False
        Width = 20
      end
      item
        EditButtons = <>
        FieldName = 'cIn'
        Footers = <>
        Title.Caption = #1059#1089#1090#1088#1086#1081#1089#1090#1074#1086' / '#8470
        Visible = False
        Width = 20
      end
      item
        EditButtons = <>
        FieldName = 'cOwner'
        Footers = <>
        Title.Caption = #1042#1083#1072#1076#1077#1083#1077#1094
        Visible = False
        Width = 20
      end
      item
        EditButtons = <>
        FieldName = 'cIDRepSim'
        Footers = <>
        Visible = False
        Width = 20
      end
      item
        EditButtons = <>
        FieldName = 'SimNumber'
        Footers = <>
        Title.Caption = #1058#1077#1083'. / '#1090#1072#1088'.'#1087#1083#1072#1085' / '#1072#1073#1086#1085'.'#1087#1083#1072#1090#1072
        Width = 153
      end
      item
        EditButtons = <>
        FieldName = 'cBalance'
        Footers = <>
        Title.Caption = #1041#1072#1083#1072#1085#1089' ('#1075#1088'.)'
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'cSMS'
        Footers = <>
        Title.Caption = 'SMS ('#1096#1090'.)'
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'SimTarifPlan'
        Footers = <>
        Visible = False
        Width = 31
      end
      item
        EditButtons = <>
        FieldName = 'SimAbonBoard'
        Footers = <>
        Visible = False
        Width = 35
      end
      item
        EditButtons = <>
        FieldName = 'DeviceNumbr'
        Footers = <>
        Visible = False
        Width = 25
      end
      item
        EditButtons = <>
        FieldName = 'DeviceName'
        Footers = <>
        Title.Caption = #1059#1089#1090#1088#1086#1081#1089#1090#1074#1086' / '#8470
        Width = 101
      end
      item
        EditButtons = <>
        FieldName = 'Owner'
        Footers = <>
        Title.Caption = #1042#1083#1072#1076#1077#1083#1077#1094
        Width = 102
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnl1: TPanel
    Left = 530
    Top = 0
    Width = 200
    Height = 424
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
      OnKeyPress = cbbIDAccount1KeyPress
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
      OnKeyPress = cbbIDAccount1KeyPress
    end
    object edtSum1: TEdit
      Left = 56
      Top = 104
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'edtSum1'
      OnKeyPress = edtSum1KeyPress
    end
    object edtSum2: TEdit
      Left = 56
      Top = 216
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'edtSum2'
      OnKeyPress = edtSum1KeyPress
    end
    object btnSave: TBitBtn
      Left = 16
      Top = 376
      Width = 89
      Height = 25
      Action = actSave
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 5
      Kind = bkOK
    end
    object btnClose: TBitBtn
      Left = 120
      Top = 376
      Width = 75
      Height = 25
      TabOrder = 6
      Kind = bkCancel
    end
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 88
    Top = 64
  end
  object ds1: TDataSource
    DataSet = cdsTmpER
    Left = 48
    Top = 264
  end
  object cdsTmpER: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'cSimka'
        DataType = ftInteger
      end
      item
        Name = 'cIn'
        DataType = ftInteger
      end
      item
        Name = 'cSMS'
        DataType = ftInteger
      end
      item
        Name = 'cOwner'
        DataType = ftInteger
      end
      item
        Name = 'cBalance'
        DataType = ftCurrency
      end
      item
        Name = 'cIDRepSim'
        DataType = ftInteger
      end>
    IndexDefs = <>
    FetchOnDemand = False
    Params = <>
    StoreDefs = True
    BeforePost = cdsTmpERBeforePost
    Left = 48
    Top = 232
    object intgrfldTmpERcSimka: TIntegerField
      DisplayWidth = 10
      FieldName = 'cSimka'
      Required = True
    end
    object intgrfldTmpERcIn: TIntegerField
      DisplayWidth = 10
      FieldName = 'cIn'
      Required = True
    end
    object intgrfldTmpERcSMS: TIntegerField
      DisplayWidth = 10
      FieldName = 'cSMS'
    end
    object intgrfldTmpERcOwner: TIntegerField
      DisplayWidth = 10
      FieldName = 'cOwner'
      Required = True
    end
    object crncyfldTmpERcBalance: TCurrencyField
      DisplayWidth = 10
      FieldName = 'cBalance'
    end
    object intgrfldTmpERcIDRepSim: TIntegerField
      DisplayWidth = 10
      FieldName = 'cIDRepSim'
    end
    object strngfldTmpERSimNumber: TStringField
      DisplayWidth = 22
      FieldKind = fkLookup
      FieldName = 'SimNumber'
      LookupDataSet = frmSimka.pfbdtst1
      LookupKeyFields = 'SID'
      LookupResultField = 'S_NUMBER'
      KeyFields = 'cSimka'
      OnGetText = strngfldTmpERSimNumberGetText
      Size = 50
      Lookup = True
    end
    object strngfldTmpERSimTarifPlan: TStringField
      DisplayWidth = 13
      FieldKind = fkLookup
      FieldName = 'SimTarifPlan'
      LookupDataSet = frmSimka.pfbdtst1
      LookupKeyFields = 'SID'
      LookupResultField = 'TarifPlan'
      KeyFields = 'cSimka'
      Lookup = True
    end
    object crncyfldTmpERSimAbonBoard: TCurrencyField
      DisplayWidth = 8
      FieldKind = fkLookup
      FieldName = 'SimAbonBoard'
      LookupDataSet = frmSimka.pfbdtst1
      LookupKeyFields = 'SID'
      LookupResultField = 'AbonBoard'
      KeyFields = 'cSimka'
      Lookup = True
    end
    object intgrfldTmpERDeviceNumbr: TIntegerField
      DisplayWidth = 7
      FieldKind = fkLookup
      FieldName = 'DeviceNumbr'
      LookupDataSet = frmDevice.pfbdtst1
      LookupKeyFields = 'DID'
      LookupResultField = 'D_NUM'
      KeyFields = 'cIn'
      Lookup = True
    end
    object strngfldTmpERDeviceName: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'DeviceName'
      LookupDataSet = frmDevice.pfbdtst1
      LookupKeyFields = 'DID'
      LookupResultField = 'D_TITLE'
      KeyFields = 'cIn'
      OnGetText = strngfldTmpERDeviceNameGetText
      Lookup = True
    end
    object strngfldTmpEROwner: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Owner'
      LookupDataSet = frmOwner.pfbdtst1
      LookupKeyFields = 'OID'
      LookupResultField = 'O_NAME'
      KeyFields = 'cOwner'
      Lookup = True
    end
  end
  object actlst1: TActionList
    Left = 48
    Top = 64
    object actInsert: TAction
      Caption = #1053#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
    end
    object actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      OnExecute = actEditExecute
      OnUpdate = actEditUpdate
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
    end
    object actSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnExecute = actSaveExecute
      OnUpdate = actSaveUpdate
    end
    object actApply: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnExecute = actApplyExecute
      OnUpdate = actApplyUpdate
    end
  end
  object pm1: TPopupMenu
    Left = 48
    Top = 112
    object mniInsert: TMenuItem
      Action = actInsert
    end
    object mniEdit: TMenuItem
      Action = actEdit
    end
    object mniN1: TMenuItem
      Caption = '-'
    end
    object mniDelete: TMenuItem
      Action = actDelete
    end
  end
  object mm1: TMainMenu
    Left = 88
    Top = 112
    object mniFile1: TMenuItem
      Caption = 'File'
    end
    object mniRecord1: TMenuItem
      Caption = 'Record'
      object mniInsert1: TMenuItem
        Action = actInsert
      end
      object mniEdit1: TMenuItem
        Action = actEdit
      end
      object mniN2: TMenuItem
        Caption = '-'
      end
      object mniDelete1: TMenuItem
        Action = actDelete
      end
    end
    object mniApply: TMenuItem
      Action = actApply
    end
  end
  object pfbtrnsctUpdate: TpFIBTransaction
    DefaultDatabase = DM.DB
    TimeoutAction = TARollback
    Left = 104
    Top = 232
  end
  object pfbqryUpdate: TpFIBQuery
    Transaction = pfbtrnsctUpdate
    Database = DM.DB
    Left = 104
    Top = 264
  end
end
