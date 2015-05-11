object FrmPasta: TFrmPasta
  Left = 193
  Top = 115
  BorderStyle = bsDialog
  Caption = 'Selecione uma pasta'
  ClientHeight = 276
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 235
    Width = 385
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BtnOk: TButton
      Left = 224
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object BtnCancelar: TButton
      Left = 304
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object ShellTreeView: TShellTreeView
    Left = 0
    Top = 0
    Width = 385
    Height = 235
    ObjectTypes = [otFolders]
    Root = 'rfDesktop'
    UseShellImages = True
    Align = alClient
    AutoRefresh = False
    Indent = 19
    ParentColor = False
    RightClickSelect = True
    ShowRoot = False
    TabOrder = 1
  end
end
