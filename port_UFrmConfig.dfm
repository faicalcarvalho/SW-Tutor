object FrmConfig: TFrmConfig
  Left = 193
  Top = 115
  BorderStyle = bsDialog
  Caption = 'Op'#231#245'es do Ambiente'
  ClientHeight = 256
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 407
    Height = 215
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Diret'#243'rios dos m'#243'dulos'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ListBox: TListBox
        Left = 8
        Top = 8
        Width = 305
        Height = 169
        ItemHeight = 13
        ScrollWidth = 1000
        TabOrder = 0
      end
      object BtnIncluir: TButton
        Left = 320
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Incluir'
        TabOrder = 1
        OnClick = BtnIncluirClick
      end
      object BtnExcluir: TButton
        Left = 320
        Top = 40
        Width = 75
        Height = 25
        Caption = '&Excluir'
        TabOrder = 2
        OnClick = BtnExcluirClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 215
    Width = 407
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BtnOk: TButton
      Left = 240
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object BtnCancelar: TButton
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
