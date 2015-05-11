object FrmLeia: TFrmLeia
  Left = 192
  Top = 107
  ActiveControl = EdtValor
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Decarva Software Lab'
  ClientHeight = 173
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 16
    Top = 144
    Width = 65
    Height = 18
    Caption = 'Termine'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object Button1: TButton
    Left = 158
    Top = 104
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object EdtValor: TLabeledEdit
    Left = 16
    Top = 40
    Width = 353
    Height = 21
    EditLabel.Width = 40
    EditLabel.Height = 13
    EditLabel.HelpType = htKeyword
    EditLabel.Caption = 'EdtValor'
    TabOrder = 0
  end
end
