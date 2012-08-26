object frmMain: TfrmMain
  Left = 266
  Top = 308
  Width = 862
  Height = 371
  Caption = #1056#1072#1089#1093#1086#1076' '#1084#1080#1085#1091#1090' '#1052#1058#1057
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrdh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 854
    Height = 246
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = DM.ds1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    IndicatorOptions = [gioShowRowIndicatorEh]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'RD_DATE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F_IDACCOUNT'
        Footers = <>
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'RD_FNCE1SUM'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F_IDACCOUNT1'
        Footers = <>
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'RD_FNCE2SUM'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'S_NUMBER'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'TP_NAME'
        Footers = <>
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'TP_ABON_BOARD'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'TP_SMS_MONTH'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'RS_SMS'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'RS_BALANCE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'D_NUM'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'D_TITLE'
        Footers = <>
        Width = 51
      end
      item
        EditButtons = <>
        FieldName = 'RD_ID'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'RE_SURNAME'
        Footers = <>
        Width = 82
      end
      item
        EditButtons = <>
        FieldName = 'RS_IN'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'RS_SIMKA'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'RS_OWNER'
        Footers = <>
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 246
    Width = 854
    Height = 52
    Align = alBottom
    TabOrder = 1
    object btnNewRecord: TButton
      Left = 24
      Top = 16
      Width = 140
      Height = 25
      Action = actInsert
      TabOrder = 0
    end
    object btnEditRecord: TButton
      Left = 168
      Top = 16
      Width = 140
      Height = 25
      Action = actEdit
      TabOrder = 1
    end
    object btnDeleteRecord: TButton
      Left = 312
      Top = 16
      Width = 140
      Height = 25
      Action = actDelete
      TabOrder = 2
    end
    object btnFinance: TButton
      Left = 472
      Top = 16
      Width = 55
      Height = 25
      Caption = 'Finance'
      TabOrder = 3
      Visible = False
      OnClick = btnFinanceClick
    end
    object btnTarifPlan: TButton
      Left = 536
      Top = 16
      Width = 55
      Height = 25
      Caption = 'TarifPlan'
      TabOrder = 4
      Visible = False
      OnClick = btnTarifPlanClick
    end
    object btnSimka: TButton
      Left = 600
      Top = 16
      Width = 55
      Height = 25
      Caption = 'Simka'
      TabOrder = 5
      Visible = False
      OnClick = btnSimkaClick
    end
    object btnDevise: TButton
      Left = 664
      Top = 16
      Width = 55
      Height = 25
      Caption = 'Devise'
      TabOrder = 6
      Visible = False
    end
    object btnOwner: TButton
      Left = 728
      Top = 16
      Width = 55
      Height = 25
      Caption = 'Owner'
      TabOrder = 7
      Visible = False
    end
    object btnAutentification: TButton
      Left = 792
      Top = 16
      Width = 55
      Height = 25
      Action = actAutentification
      TabOrder = 8
    end
  end
  object stat1: TStatusBar
    Left = 0
    Top = 298
    Width = 854
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object actlst1: TActionList
    Left = 48
    Top = 64
    object actInsert: TAction
      Caption = #1053#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
      OnExecute = actInsertExecute
      OnUpdate = actInsertUpdate
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
      OnExecute = actDeleteExecute
      OnUpdate = actEditUpdate
    end
    object actAutentification: TAction
      Caption = #1042#1086#1081#1090#1080
      Hint = #1042#1086#1081#1090#1080' '#1087#1086#1076' '#1089#1074#1086#1080#1084' '#1083#1086#1075#1080#1085#1086#1084' '#1080' '#1087#1072#1088#1086#1083#1077#1084
      OnExecute = actAutentificationExecute
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
  end
end
