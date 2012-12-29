object Form1: TForm1
  Left = 192
  Top = 164
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 384
  ClientWidth = 1140
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object led1: TShape
    Left = 16
    Top = 16
    Width = 25
    Height = 25
    Shape = stCircle
  end
  object wb1: TWebBrowser
    Left = 544
    Top = 16
    Width = 577
    Height = 345
    TabOrder = 0
    OnProgressChange = wb1ProgressChange
    OnTitleChange = wb1TitleChange
    OnDocumentComplete = wb1DocumentComplete
    ControlData = {
      4C000000A23B0000A82300000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Memo1: TMemo
    Left = 16
    Top = 56
    Width = 521
    Height = 313
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 56
    Top = 16
    Width = 481
    Height = 24
    TabOrder = 2
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 365
    Width = 1140
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object ProgressBar1: TProgressBar
    Left = 383
    Top = 19
    Width = 150
    Height = 17
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 308
    Top = 19
    Width = 73
    Height = 17
    Caption = 'timer'
    ModalResult = 4
    TabOrder = 5
    OnClick = BitBtn1Click
    NumGlyphs = 2
  end
  object Timer1: TTimer
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 16
    Top = 48
  end
  object XPManifest1: TXPManifest
    Left = 16
    Top = 88
  end
end
