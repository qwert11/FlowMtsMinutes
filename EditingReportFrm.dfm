object frmEditingReport: TfrmEditingReport
  Left = 528
  Top = 221
  Width = 638
  Height = 538
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
    Top = 492
    Width = 630
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
  object cbbIDAccount: TDBLookupComboboxEh
    Left = 336
    Top = 64
    Width = 121
    Height = 21
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 520
    Top = 456
  end
end
