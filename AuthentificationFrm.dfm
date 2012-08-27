object frmAuthentification: TfrmAuthentification
  Left = 568
  Top = 347
  Width = 264
  Height = 148
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1083#1086#1075#1080#1085' '#1080' '#1087#1072#1088#1086#1083#1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 15
    Top = 32
    Width = 29
    Height = 13
    Caption = #1083#1086#1075#1080#1085
  end
  object lbl2: TLabel
    Left = 15
    Top = 56
    Width = 36
    Height = 13
    Caption = #1087#1072#1088#1086#1083#1100
  end
  object txtRegistration: TStaticText
    Left = 32
    Top = 88
    Width = 69
    Height = 17
    Hint = #1053#1072#1078#1084#1080#1090#1077', '#1095#1090#1086' '#1073#1099' '#1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100#1089#1103
    Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
    TabOrder = 0
    OnClick = txtRegistrationClick
  end
  object cbbLogin: TDBLookupComboboxEh
    Left = 72
    Top = 24
    Width = 177
    Height = 21
    Hint = #1042#1074#1077#1076#1080#1090#1077' '#1083#1086#1075#1080#1085
    EditButtons = <>
    KeyField = 'REID'
    ListField = 'RE_LOGIND'
    ListSource = frmUsers.ds1
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object btn1: TBitBtn
    Left = 136
    Top = 80
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = btn1Click
    Kind = bkOK
  end
  object edtPassword: TEdit
    Left = 72
    Top = 48
    Width = 177
    Height = 21
    Hint = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
    PasswordChar = '*'
    TabOrder = 3
    Text = 'edtPasswordqqqqqqqqqqqqqqqqqqq'
    OnClick = edtPasswordClick
  end
end
