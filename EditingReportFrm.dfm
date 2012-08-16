object frmEditingReport: TfrmEditingReport
  Left = 541
  Top = 196
  Width = 762
  Height = 456
  Caption = 'frmEditingReport'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object stat1: TStatusBar
    Left = 0
    Top = 410
    Width = 754
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
    Width = 496
    Height = 410
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
    Left = 496
    Top = 0
    Width = 258
    Height = 410
    Align = alRight
    TabOrder = 2
    object lbl2: TLabel
      Left = 73
      Top = 56
      Width = 112
      Height = 13
      Caption = 'ID '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072' '#8470'1'
    end
    object lbl1: TLabel
      Left = 156
      Top = 32
      Width = 29
      Height = 13
      Caption = #1044#1072#1090#1072':'
    end
    object lbl3: TLabel
      Left = 73
      Top = 168
      Width = 112
      Height = 13
      Caption = 'ID '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072' '#8470'2'
    end
    object dtpDate: TDateTimePicker
      Left = 88
      Top = 24
      Width = 97
      Height = 21
      Date = 41137.684692013890000000
      Time = 41137.684692013890000000
      TabOrder = 0
    end
    object cbbIDAccount2: TDBLookupComboboxEh
      Left = 64
      Top = 184
      Width = 121
      Height = 21
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object cbbIDAccount1: TDBLookupComboboxEh
      Left = 64
      Top = 72
      Width = 121
      Height = 21
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
    object edSum1: TEdit
      Left = 64
      Top = 104
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'edSum1'
    end
    object edtSum2: TEdit
      Left = 64
      Top = 216
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'edtSum2'
    end
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 392
    Top = 336
  end
  object ds1: TDataSource
    DataSet = cds1
    Left = 280
    Top = 288
  end
  object cds1: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'cdsSimka'
        DataType = ftInteger
      end
      item
        Name = 'cdsIn'
        DataType = ftInteger
      end
      item
        Name = 'cdsSMS'
        DataType = ftInteger
      end
      item
        Name = 'cdsOwner'
        DataType = ftInteger
      end
      item
        Name = 'cdsBalance'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 280
    Top = 256
    Data = {
      6C0000009619E0BD0100000018000000050000000000030000006C0008636473
      53696D6B61040001000000000005636473496E04000100000000000663647353
      4D530400010000000000086364734F776E657204000100000000000A63647342
      616C616E636508000400000000000000}
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'cdsSimka'
        DataType = ftInteger
      end
      item
        Name = 'cdsIn'
        DataType = ftInteger
      end
      item
        Name = 'cdsSMS'
        DataType = ftInteger
      end
      item
        Name = 'cdsOwner'
        DataType = ftInteger
      end
      item
        Name = 'cdsBalance'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 280
    Top = 256
    Data = {
      6C0000009619E0BD0100000018000000050000000000030000006C0008636473
      53696D6B61040001000000000005636473496E04000100000000000663647353
      4D530400010000000000086364734F776E657204000100000000000A63647342
      616C616E636508000400000000000000}
  end
  object ClientDataSet2: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'cdsSimka'
        DataType = ftInteger
      end
      item
        Name = 'cdsIn'
        DataType = ftInteger
      end
      item
        Name = 'cdsSMS'
        DataType = ftInteger
      end
      item
        Name = 'cdsOwner'
        DataType = ftInteger
      end
      item
        Name = 'cdsBalance'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 280
    Top = 256
    Data = {
      6C0000009619E0BD0100000018000000050000000000030000006C0008636473
      53696D6B61040001000000000005636473496E04000100000000000663647353
      4D530400010000000000086364734F776E657204000100000000000A63647342
      616C616E636508000400000000000000}
  end
end
