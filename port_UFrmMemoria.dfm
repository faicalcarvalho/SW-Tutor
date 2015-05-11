object FrmMemoria: TFrmMemoria
  Left = 578
  Top = 126
  Width = 222
  Height = 221
  Caption = 'Mem'#243'ria'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ImgPtrDoido: TImage
    Left = 136
    Top = 16
    Width = 9
    Height = 9
    HelpType = htKeyword
    Picture.Data = {
      07544269746D6170BE000000424DBE0000000000000076000000280000000900
      0000090000000100040000000000480000000000000000000000100000000000
      000000000000000080000080000000808000800000008000800080800000C0C0
      C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00777997777000000077777777700000007779977770000000777997777000
      0000777799777000000077777997700000007997779970000000799777997000
      00007799999770000000}
  end
  object Button1: TButton
    Left = 40
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object ListViewPtrNulo: TListView
    Left = 120
    Top = 136
    Width = 73
    Height = 41
    Columns = <
      item
        Caption = 'nul'
      end>
    Items.Data = {
      360000000200000000000000FFFFFFFFFFFFFFFF0000000000000000046E756C
      6F00000000FFFFFFFFFFFFFFFF000000000000000000}
    TabOrder = 1
    ViewStyle = vsReport
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 160
    Top = 64
  end
end
