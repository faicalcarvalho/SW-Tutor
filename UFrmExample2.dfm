object FrmExample2: TFrmExample2
  Left = 143
  Top = 55
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Exemplos'
  ClientHeight = 358
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 310
    Width = 653
    Height = 48
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alBottom
    TabOrder = 0
    object BtnAbrir: TButton
      Left = 591
      Top = 8
      Width = 169
      Height = 25
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Abrir no Editor'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object BtnCancelar: TButton
      Left = 768
      Top = 8
      Width = 75
      Height = 25
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 653
    Height = 40
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 10
      Width = 250
      Height = 18
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Selecione um dos exemplos da lista'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 653
    Height = 270
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    TabOrder = 2
    object ListBox1: TListBox
      Left = 1
      Top = 1
      Width = 214
      Height = 268
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 15
      Items.Strings = (
        'Ol'#225
        'Fato ou Fita'
        'Ret'#226'ngulo'
        'C'#237'rculo'
        'Tri'#226'ngulo'
        'Linha'
        'Linhas'
        'Ret'#226'ngulos Coloridos'
        'Tamanhos da Caneta'
        'Estilos da Caneta'
        'Texto na Sa'#237'da Gr'#225'fica'
        'Quadrados'
        'Sucessor'
        'Metade'
        'Metade (Simplificado)'
        'Clicou'
        'Clicou Aqui!'
        'Clicou Aqui com Oval'
        'Clicou na Linha'
        'Esquerda ou Direita'
        'No Corredor'
        'Fora do Corredor'
        'Nove Ret'#226'ngulos'
        'M'#250'ltiplos Ret'#226'ngulos'
        'Cone Curvo'
        'Tabela de Quadrados'
        'Curvas de Bezier'
        'Clica no Ret'#226'ngulo'
        'N Cliques'
        'Arco e Fatia'
        'Fatias Coloridas'
        'Tr'#234's Figuras'
        'P1p2p3'
        'Rob'#244
        'Marcas'
        'Tamanho de um Texto'
        'Caracteres'
        'Ovais'
        'Qual o Menor?'
        'Texto Invertido'
        'Primeiras Teclas'
        'Eventos'
        'Aloca'#231#227'o de Vari'#225'vel Local'
        'Passagem de Argumentos'
        'Linhas Conectadas'
        'Raios'
        'Desenhando com o Mouse'
        'Coordenadas do Mouse'
        'Figuras Aleat'#243'rias'
        'Spray'
        'Contagem Regressiva'
        'Contagem Regressiva de Dez'
        'Tic Tac'
        'Gary Chaffee - Idea 2'
        'Arranjo Simples'
        'Pontos Conectados'
        'Mesa de Bilhar'
        'Figuras Aleat'#243'rias em Outra Janela'
        'Itens Gr'#225'ficos'
        'Editando um R'#243'tulo'
        'Tratando Eventos de Itens Gr'#225'ficos'
        'Uma Foto do Rio de Janeiro'
        'Moldura'
        'Inverte o Texto de um Arquivo'
        'Ponteiros'
        'Serpente'
        'Quadrado no Clique'
        'O Jogo do Caos'
        'Estrela'
        'Recurs'#227'o Enquanto...'
        'Tri'#226'ngulo de Sierpinski'
        'Fatorial'
        'Algoritmos de Ordena'#231#227'o com Visual'
        'Oito Rainhas'
        #193'rvore Bin'#225'ria de Pesquisa'
        'Andr'#244'meda'
        'Estrela Fractal'
        'Pintor'
        'Reveillon'
        'Curva de Sierpinski'
        'Fractais via MRCM'
        'O Jogo da Mem'#243'ria'
        'Curva de Hilbert')
      ParentFont = False
      TabOrder = 0
      OnClick = ListBox1Click
    end
    object Panel4: TPanel
      Left = 215
      Top = 1
      Width = 437
      Height = 268
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 4
      TabOrder = 1
      object Image1: TImage
        Left = 6
        Top = 6
        Width = 425
        Height = 256
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        Center = True
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 427
        ExplicitHeight = 258
      end
    end
  end
end
