unit port_UQuadro;

interface

uses
  Forms, Graphics, SysUtils, Classes, Controls, Buttons, StdCtrls,
  ExtCtrls, UMeusComps;

resourcestring
  sXXX = 'Memória insuficiente';

type

  { TQuadro }

  TQuadro = class
  private
    FBmp: Graphics.TBitmap;
    FPenColor: TColor;
    FLstEvento, FLstSubst: TList;
    procedure IniBmpDefault;
  protected
    constructor Cria;
    function obt_canvas(): TCanvas; virtual; abstract;
    function obt_canvas2(): TCanvas; virtual;
    function obt_control(): TControl; virtual; abstract;
    function obt_fonte2(): TFont; virtual;
    function obt_fonte(): TFont; virtual; abstract;
    function obt_bmp(): Graphics.TBitmap; virtual;
  public
    destructor Destroy; override;
    procedure alt_cor_janela(cor: Integer); virtual; abstract;
    procedure alt_cor_fonte(cor: TColor);
    procedure alt_cor_caneta(cor: TColor); virtual;
    procedure alt_cor_pincel(cor: TColor);
    procedure alt_estilo_caneta(est: TPenStyle);
    procedure alt_estilo_pincel(est: TBrushStyle);
    procedure alt_modo_caneta(modo: TPenMode);
    procedure alt_nome_fonte(nome: String);
    procedure alt_estilo_fonte(est: TFontStyles);
    procedure alt_pixel(x, y, cor: Integer);
    procedure alt_pos_janela(x, y: Integer);
    procedure alt_pos_caneta(x, y: Integer);
    procedure alt_tam_janela(larg, altu: Integer);
    procedure alt_tam_caneta(tam: Integer);
    procedure alt_tam_fonte(tam: Integer);
    procedure alt_txt_janela(txt: String); virtual; abstract;
    procedure alt_vis_janela(vis: Boolean);

    procedure dsn_arco(x1, y1, x2, y2, x3, y3, x4, y4: Integer);
    procedure dsn_bezier(cx1, cy1, cx2, cy2, x, y: Integer);
    procedure dsn_cir(x1, y1, x2, y2: Integer);
    procedure dsn_corte(x1, y1, x2, y2, x3, y3, x4, y4: Integer);
    procedure dsn_fatia(x1, y1, x2, y2, x3, y3, x4, y4: Integer);
    procedure dsn_lin(x, y: Integer);
    procedure dsn_lin_sel(x, y: Integer);
    procedure dsn_ret(x1, y1, x2, y2: Integer);
    procedure dsn_ret_sel(x1, y1, x2, y2: Integer);
    procedure dsn_ret_canvas(Cnv: TCanvas; x1, y1, x2, y2: Integer);
    procedure dsn_ret_cheio(x1, y1, x2, y2: Integer);
    procedure dsn_tri(x1, y1, x2, y2: Integer);
    procedure dsn_txt(x, y: Integer; txt: String);
    procedure cop_janela_ret(x1, y1, x2, y2: Integer; jan_orig: TQuadro);

    function obt_caneta_x(): Integer;
    function obt_caneta_y(): Integer;
    function obt_txt_janela(): String; virtual; abstract;
    function obt_win_control(): TWinControl; virtual; abstract;
    procedure obt_tam_janela(var larg, altu: Integer); virtual;

    function caixa_marcada(): Boolean; virtual;

    procedure reg_evento(Evento, Substituto: Integer);
    function tem_evento_subst(Evento: Integer; var Substituto: Integer): Boolean;

    procedure cop_janela(x, y: Integer; jan_orig: TQuadro); virtual;
    procedure crg_img(nome_img: String); virtual;
    property Bmp: Graphics.TBitmap read FBmp;
  end;

  TQuadroTela = class(TQuadro)
  protected
    function obt_canvas(): TCanvas; override;
    function obt_control(): TControl; override;
  public
    constructor Cria;
    function obt_fonte(): TFont; override;
    function obt_win_control(): TWinControl; override;
    procedure alt_txt_janela(txt: String); override;
    function obt_txt_janela(): String; override;
    procedure alt_cor_janela(cor: Integer); override;
    procedure cop_janela(x, y: Integer; jan_orig: TQuadro); override;
    procedure crg_img(nome_img: String); override;
  end;

  TQuadroForm = class(TQuadro)
  private
    FForm: TForm;
  protected
    function obt_canvas(): TCanvas; override;
    function obt_control(): TControl; override;
  public
    constructor Cria(Frm: TForm);
    destructor Destroy; override;
    function obt_fonte(): TFont; override;
    function obt_win_control(): TWinControl; override;
    procedure alt_txt_janela(txt: String); override;
    function obt_txt_janela(): String; override;
    procedure alt_cor_janela(cor: Integer); override;

    procedure cop_janela(x, y: Integer; jan_orig: TQuadro); override;
    procedure crg_img(nome_img: String); override;
  end;

  TQuadroPanel = class(TQuadro)
  private
    FPanel: TMeuPanel;
  protected
    function obt_canvas(): TCanvas; override;
    function obt_canvas2(): TCanvas; override;
    function obt_control(): TControl; override;
  public
    constructor Cria(Panel: TMeuPanel);
    destructor Destroy; override;
    function obt_fonte(): TFont; override;
    function obt_fonte2(): TFont; override;
    function obt_win_control(): TWinControl; override;
    procedure alt_txt_janela(txt: String); override;
    function obt_txt_janela(): String; override;
    procedure alt_cor_janela(cor: Integer); override;
    procedure obt_tam_janela(var larg, altu: Integer); override;
  end;

  TQuadroGroupBox = class(TQuadro)
  private
    FGroupBox: TMeuGroupBox;
  protected
    function obt_canvas(): TCanvas; override;
    function obt_canvas2(): TCanvas; override;
    function obt_control(): TControl; override;
  public
    constructor Cria(GroupBox: TMeuGroupBox);
    destructor Destroy; override;
    function obt_fonte(): TFont; override;
    function obt_fonte2(): TFont; override;
    function obt_win_control(): TWinControl; override;
    procedure alt_txt_janela(txt: String); override;
    function obt_txt_janela(): String; override;
    procedure alt_cor_janela(cor: Integer); override;
    procedure obt_tam_janela(var larg, altu: Integer); override;
  end;

  TQuadroBotao = class(TQuadro)
  private
    FSpeedButton: TMeuSpeedButton;
  protected
    function obt_canvas(): TCanvas; override;
    function obt_canvas2(): TCanvas; override;
    function obt_control(): TControl; override;
  public
    constructor Cria(SpeedButton: TMeuSpeedButton);
    destructor Destroy; override;
    function obt_fonte(): TFont; override;
    function obt_fonte2(): TFont; override;
    function obt_win_control(): TWinControl; override;
    procedure alt_txt_janela(txt: String); override;
    function obt_txt_janela(): String; override;
    procedure alt_cor_janela(cor: Integer); override;
    procedure obt_tam_janela(var larg, altu: Integer); override;
  end;

  TQuadroRotulo = class(TQuadro)
  private
    FLabel: TLabel;
  protected
    function obt_canvas(): TCanvas; override;
    function obt_canvas2(): TCanvas; override;
    function obt_control(): TControl; override;
  public
    constructor Cria(Lbl: TLabel);
    destructor Destroy; override;
    function obt_fonte(): TFont; override;
    function obt_fonte2(): TFont; override;
    function obt_win_control(): TWinControl; override;
    procedure alt_txt_janela(txt: String); override;
    function obt_txt_janela(): String; override;
    procedure alt_cor_janela(cor: Integer); override;
    procedure obt_tam_janela(var larg, altu: Integer); override;
  end;

  TQuadroEditorLin = class(TQuadro)
  private
    FEdit: TEdit;
  protected
    function obt_canvas(): TCanvas; override;
    function obt_canvas2(): TCanvas; override;
    function obt_control(): TControl; override;
  public
    constructor Cria(Edit: TEdit);
    destructor Destroy; override;
    function obt_fonte(): TFont; override;
    function obt_fonte2(): TFont; override;
    function obt_win_control(): TWinControl; override;
    procedure alt_txt_janela(txt: String); override;
    function obt_txt_janela(): String; override;
    procedure alt_cor_janela(cor: Integer); override;
    procedure obt_tam_janela(var larg, altu: Integer); override;
  end;

  TQuadroCaixaMarca = class(TQuadro)
  private
    FCheckBox: TCheckBox;
  protected
    function obt_canvas(): TCanvas; override;
    function obt_canvas2(): TCanvas; override;
    function obt_control(): TControl; override;
  public
    constructor Cria(CheckBox: TCheckBox);
    destructor Destroy; override;
    function obt_fonte(): TFont; override;
    function obt_fonte2(): TFont; override;
    function obt_win_control(): TWinControl; override;
    procedure alt_txt_janela(txt: String); override;
    function obt_txt_janela(): String; override;
    procedure alt_cor_janela(cor: Integer); override;
    function caixa_marcada(): Boolean; override;
    procedure obt_tam_janela(var larg, altu: Integer); override;
  end;

  TQuadroCaixaEscolha = class(TQuadro)
  private
    FRadioButton: TRadioButton;
  protected
    function obt_canvas(): TCanvas; override;
    function obt_control(): TControl; override;
    function obt_canvas2(): TCanvas; override;
  public
    constructor Cria(RadioButton: TRadioButton);
    destructor Destroy; override;
    function obt_fonte(): TFont; override;
    function obt_fonte2(): TFont; override;
    function obt_win_control(): TWinControl; override;
    procedure alt_txt_janela(txt: String); override;
    function obt_txt_janela(): String; override;
    procedure alt_cor_janela(cor: Integer); override;
    function caixa_marcada(): Boolean; override;
    procedure obt_tam_janela(var larg, altu: Integer); override;
  end;

  TQuadroCaixaLista = class(TQuadro)
  private
    FListBox: TListBox;
  protected
    function obt_canvas(): TCanvas; override;
    function obt_canvas2(): TCanvas; override;
    function obt_control(): TControl; override;
  public
    constructor Cria(ListBox: TListBox);
    destructor Destroy; override;
    function obt_fonte(): TFont; override;
    function obt_fonte2(): TFont; override;
    function obt_win_control(): TWinControl; override;
    procedure alt_txt_janela(txt: String); override;
    function obt_txt_janela(): String; override;
    procedure alt_cor_janela(cor: Integer); override;
    procedure obt_tam_janela(var larg, altu: Integer); override;
  end;

  TQuadroCaixaComb = class(TQuadro)
  private
    FComboBox: TComboBox;
  protected
    function obt_canvas(): TCanvas; override;
    function obt_canvas2(): TCanvas; override;
    function obt_control(): TControl; override;
  public
    constructor Cria(ComboBox: TComboBox);
    destructor Destroy; override;
    function obt_fonte(): TFont; override;
    function obt_fonte2(): TFont; override;
    function obt_win_control(): TWinControl; override;
    procedure alt_txt_janela(txt: String); override;
    function obt_txt_janela(): String; override;
    procedure alt_cor_janela(cor: Integer); override;
    procedure obt_tam_janela(var larg, altu: Integer); override;
  end;

  TQuadroImagem = class(TQuadro)
  private
    FImagem: TImage;
  protected
    function obt_canvas(): TCanvas; override;
    function obt_canvas2(): TCanvas; override;
    function obt_control(): TControl; override;
    function obt_bmp(): Graphics.TBitmap; override;
  public
    constructor Cria(Imagem: TImage);
    destructor Destroy; override;
    procedure crg_img(nome: String); override;
    function obt_fonte(): TFont; override;
    function obt_fonte2(): TFont; override;
    function obt_win_control(): TWinControl; override;
    procedure alt_txt_janela(txt: String); override;
    function obt_txt_janela(): String; override;
    procedure alt_cor_janela(cor: Integer); override;
    procedure obt_tam_janela(var larg, altu: Integer); override;
  end;

  TQuadroEditorTxt = class(TQuadro)
  private
    FEditorTxt: TMemo;
  protected
    function obt_canvas(): TCanvas; override;
    function obt_canvas2(): TCanvas; override;
    function obt_control(): TControl; override;
  public
    constructor Cria(EditorTxt: TMemo);
    destructor Destroy; override;
    function obt_fonte(): TFont; override;
    function obt_fonte2(): TFont; override;
    function obt_win_control(): TWinControl; override;
    procedure alt_txt_janela(txt: String); override;
    function obt_txt_janela(): String; override;
    procedure alt_cor_janela(cor: Integer); override;
    procedure obt_tam_janela(var larg, altu: Integer); override;
  end;

  TQuadroBitmap = class(TQuadro)
  private
    FBitmap: Graphics.TBitmap;
  protected
    function obt_canvas(): TCanvas; override;
    function obt_canvas2(): TCanvas; override;
    function obt_control(): TControl; override;
    function obt_bmp(): Graphics.TBitmap; override;
  public
    constructor Cria(Bitmap: Graphics.TBitmap);
    destructor Destroy; override;
    procedure crg_img(nome: String); override;
    function obt_fonte(): TFont; override;
    function obt_fonte2(): TFont; override;
    function obt_win_control(): TWinControl; override;
    procedure alt_txt_janela(txt: String); override;
    function obt_txt_janela(): String; override;
    procedure alt_cor_janela(cor: Integer); override;
    procedure obt_tam_janela(var larg, altu: Integer); override;
  end;

implementation

uses Types, port_UFrmDSL;

{ TQuadro }

procedure TQuadro.alt_cor_caneta(cor: TColor);
var
  Cnv: TCanvas;
begin
  Cnv := obt_canvas2();
  if (Cnv <> nil) then
    Cnv.Pen.Color := cor;
  Cnv := obt_canvas();
  if (Cnv <> nil) then
    Cnv.Pen.Color := cor;
  FPenColor := cor;
end;

procedure TQuadro.alt_cor_fonte(cor: TColor);
var
  Fnt: TFont;
begin
  Fnt := obt_fonte2();
  if (Fnt <> nil) then
    Fnt.Color := cor;
  Fnt := obt_fonte();
  if (Fnt <> nil) then
    Fnt.Color := cor;
end;

procedure TQuadro.alt_cor_pincel(cor: TColor);
var
  Cnv: TCanvas;
begin
  Cnv := obt_canvas2();
  if (Cnv <> nil) then
    Cnv.Brush.Color := cor;
  Cnv := obt_canvas();
  if (Cnv <> nil) then
    Cnv.Brush.Color := cor;
end;

procedure TQuadro.alt_estilo_caneta(est: TPenStyle);
var
  Cnv: TCanvas;
begin
  Cnv := obt_canvas2();
  if (Cnv <> nil) then
    Cnv.Pen.Style := est;
  Cnv := obt_canvas();
  if (Cnv <> nil) then
    Cnv.Pen.Style := est;
end;

procedure TQuadro.alt_estilo_fonte(est: TFontStyles);
var
  Fnt: TFont;
begin
  Fnt := obt_fonte2();
  if (Fnt <> nil) then
    Fnt.Style := est;
  Fnt := obt_fonte();
  if (Fnt <> nil) then
    Fnt.Style := est;
end;

procedure TQuadro.alt_estilo_pincel(est: TBrushStyle);
var
  Cnv: TCanvas;
begin
  Cnv := obt_canvas2();
  if (Cnv <> nil) then
    Cnv.Brush.Style := est;
  Cnv := obt_canvas();
  if (Cnv <> nil) then
    Cnv.Brush.Style := est;
end;

procedure TQuadro.alt_modo_caneta(modo: TPenMode);
var
  Cnv: TCanvas;
begin
  Cnv := obt_canvas2();
  if (Cnv <> nil) then
    Cnv.Pen.Mode := modo;
  Cnv := obt_canvas();
  if (Cnv <> nil) then
    Cnv.Pen.Mode := modo;
end;

procedure TQuadro.alt_nome_fonte(nome: String);
var
  Fnt: TFont;
begin
  Fnt := obt_fonte2();
  if (Fnt <> nil) then
    Fnt.Name := nome;
  Fnt := obt_fonte();
  if (Fnt <> nil) then
    Fnt.Name := nome;
end;

procedure TQuadro.alt_pixel(x, y, cor: Integer);
var
  Cnv: TCanvas;
begin
  Cnv := obt_canvas2(); // desenha no bitmap
  if (Cnv <> nil) then
    Cnv.Pixels[x, y] := cor;
  Cnv := obt_canvas();
  if (Cnv <> nil) then
    Cnv.Pixels[x, y] := cor;
end;

procedure TQuadro.alt_pos_janela(x, y: Integer);
var
  Ctl: TControl;
begin
  Ctl := obt_control();
  if (Ctl <> nil) then
    Ctl.SetBounds(x, y, Ctl.Width, Ctl.Height);
end;

procedure TQuadro.alt_pos_caneta(x, y: Integer);
var
  Cnv: TCanvas;
begin
  Cnv := obt_canvas2();
  if (Cnv <> nil) then
    Cnv.MoveTo(x, y);
  Cnv := obt_canvas();
  if (Cnv <> nil) then
    Cnv.MoveTo(x, y);
end;

procedure TQuadro.alt_tam_janela(larg, altu: Integer);
var
  Ctl: TControl;
begin
  Ctl := obt_control();
  if (Ctl <> nil) then
    Ctl.SetBounds(Ctl.Left, Ctl.Top, larg, altu);
end;

procedure TQuadro.alt_tam_caneta(tam: Integer);
var
  Cnv: TCanvas;
begin
  Cnv := obt_canvas2();
  if (Cnv <> nil) then
    Cnv.Pen.Width := tam;
  Cnv := obt_canvas();
  if (Cnv <> nil) then
    Cnv.Pen.Width := tam;
end;

procedure TQuadro.alt_tam_fonte(tam: Integer);
var
  Fnt: TFont;
begin
  Fnt := obt_fonte2();
  if (Fnt <> nil) then
    Fnt.Size := tam;
  Fnt := obt_fonte();
  if (Fnt <> nil) then
    Fnt.Size := tam;
end;

procedure TQuadro.alt_vis_janela(vis: Boolean);
var
  Ctl: TControl;
begin
  Ctl := obt_control();
  if (Ctl <> nil) then
    Ctl.Visible := vis;
end;

procedure TQuadro.cop_janela(x, y: Integer; jan_orig: TQuadro);
begin
  FBmp.Canvas.Draw(x, y, jan_orig.obt_bmp());
end;

procedure TQuadro.crg_img(nome_img: String);
begin
  // carrega o bitmap
  FBmp.LoadFromResourceName(HInstance, nome_img);
end;

constructor TQuadro.Cria;
begin
  FBmp := Graphics.TBitmap.Create;
  IniBmpDefault;
  FPenColor := clBlack; // usada qdo a dimensão do retângulo é 1x1
end;

destructor TQuadro.Destroy;
begin
  FBmp.Free;
  FLstEvento.Free;
  FLstSubst.Free;
end;

procedure TQuadro.dsn_arco(x1, y1, x2, y2, x3, y3, x4, y4: Integer);
var
  Cnv: TCanvas;
begin
  Cnv := obt_canvas2(); // desenha no bitmap
  if (Cnv <> nil) then
    Cnv.Arc(x1, y1, x2, y2, x3, y3, x4, y4);
  Cnv := obt_canvas();
  if (Cnv <> nil) then
    Cnv.Arc(x1, y1, x2, y2, x3, y3, x4, y4);
end;

procedure TQuadro.dsn_bezier(cx1, cy1, cx2, cy2, x, y: Integer);
var
  Cnv: TCanvas;
  V: array [0..2] of TPoint;
begin
  // pontos de controle
  V[0].X := cx1; V[0].Y := cy1;
  V[1].X := cx2; V[1].Y := cy2;

  // ponto final
  V[2].X := x; V[2].Y := y;

  Cnv := obt_canvas2(); // no bitmap
  if (Cnv <> nil) then
    Cnv.PolyBezierTo(V);
  Cnv := obt_canvas();
  if (Cnv <> nil) then
    Cnv.PolyBezierTo(V);
end;

procedure TQuadro.dsn_cir(x1, y1, x2, y2: Integer);
var
  Cnv: TCanvas;
begin
  Cnv := obt_canvas2(); // desenha no bitmap
  if (Cnv <> nil) then
    Cnv.Ellipse(x1, y1, x1+x2, y1+y2);
  Cnv := obt_canvas();
  if (Cnv <> nil) then
    Cnv.Ellipse(x1, y1, x1+x2, y1+y2);
end;

procedure TQuadro.dsn_corte(x1, y1, x2, y2, x3, y3, x4, y4: Integer);
var
  Cnv: TCanvas;
begin
  Cnv := obt_canvas2(); // desenha no bitmap
  if (Cnv <> nil) then
    Cnv.Chord(x1, y1, x2, y2, x3, y3, x4, y4);
  Cnv := obt_canvas();
  if (Cnv <> nil) then
    Cnv.Chord(x1, y1, x2, y2, x3, y3, x4, y4);
end;

procedure TQuadro.dsn_fatia(x1, y1, x2, y2, x3, y3, x4, y4: Integer);
var
  Cnv: TCanvas;
begin
  Cnv := obt_canvas2(); // desenha no bitmap
  if (Cnv <> nil) then
    Cnv.Pie(x1, y1, x2, y2, x3, y3, x4, y4);
  Cnv := obt_canvas();
  if (Cnv <> nil) then
    Cnv.Pie(x1, y1, x2, y2, x3, y3, x4, y4);
end;

procedure TQuadro.dsn_lin(x, y: Integer);
var
  Cnv: TCanvas;
begin
  Cnv := obt_canvas2(); // desenha no bitmap
  if (Cnv <> nil) then
    Cnv.LineTo(x, y);
  Cnv := obt_canvas();
  if (Cnv <> nil) then
    Cnv.LineTo(x, y);
end;

procedure TQuadro.dsn_lin_sel(x, y: Integer);
var
  SalvaPenMode: TPenMode;
  Cnv: TCanvas;
begin
  Cnv := obt_canvas2();
  if (Cnv <> nil) then
  begin
    SalvaPenMode := Cnv.Pen.Mode;
    Cnv.Pen.Mode := pmNotXor;
    Cnv.LineTo(x, y);
    Cnv.Pen.Mode := SalvaPenMode;
  end;
  Cnv := obt_canvas();
  if (Cnv <> nil) then
  begin
    SalvaPenMode := Cnv.Pen.Mode;
    Cnv.Pen.Mode := pmNotXor;
    Cnv.LineTo(x, y);
    Cnv.Pen.Mode := SalvaPenMode;
  end;
end;

procedure TQuadro.dsn_ret(x1, y1, x2, y2: Integer);
begin
  dsn_ret_canvas(obt_canvas2(), x1, y1, x2, y2);
  dsn_ret_canvas(obt_canvas(), x1, y1, x2, y2);
end;

procedure TQuadro.dsn_ret_cheio(x1, y1, x2, y2: Integer);
var
  Cnv: TCanvas;
begin
  Cnv := obt_canvas2(); // desenha no bitmap
  if (Cnv <> nil) then
    Cnv.FillRect(Rect(x1, y1, x1+x2, y1+y2));
  Cnv := obt_canvas();
  if (Cnv <> nil) then
    Cnv.FillRect(Rect(x1, y1, x1+x2, y1+y2));
end;

procedure TQuadro.dsn_tri(x1, y1, x2, y2: Integer);
var
  Cnv: TCanvas;
  Px: Integer;
begin
//  Px := (x2 - x1) div 2 + x1;
  Px := x1 + (x2 div 2);
  Cnv := obt_canvas2(); // desenha no bitmap
  if (Cnv <> nil) then
    Cnv.Polygon([Point(x1, y1+y2-1), Point(Px, y1), Point(x1+x2-1, y1+y2-1)]);
  Cnv := obt_canvas();
  if (Cnv <> nil) then
    Cnv.Polygon([Point(x1, y1+y2-1), Point(Px, y1), Point(x1+x2-1, y1+y2-1)]);
end;

procedure TQuadro.dsn_txt(x, y: Integer; txt: String);
var
  Cnv: TCanvas;
  BrushStyle: TBrushStyle;
begin
  Cnv := obt_canvas2(); // desenha no bitmap
  if (Cnv <> nil) then
  begin
    BrushStyle := Cnv.Brush.Style;
    Cnv.Brush.Style := bsClear;
    Cnv.TextOut(x, y, txt);
    Cnv.Brush.Style := BrushStyle;
  end;
  Cnv := obt_canvas();
  if (Cnv <> nil) then
  begin
    BrushStyle := Cnv.Brush.Style;
    Cnv.Brush.Style := bsClear;
    Cnv.TextOut(x, y, txt);
    Cnv.Brush.Style := BrushStyle;
  end;
end;

procedure TQuadro.IniBmpDefault;
const
  TAM_JANELA = 1024;
begin
  FBmp.Width := TAM_JANELA;
  FBmp.Height := TAM_JANELA;

  FBmp.Canvas.Brush.Color := clBtnFace; // ATENÇÃO - Mesma cor da propriedade
                                         // Color do componente PaintBox
  FBmp.Canvas.FillRect(Rect(0, 0, TAM_JANELA, TAM_JANELA));
  FBmp.Canvas.Font.Name := 'Arial'; // Mesma fonte padrão
//  FBmp.Transparent := True;
//  FBmp.TransparentMode := tmFixed;
//  FBmp.TransparentColor := clBtnFace; // ATENÇÃO - Ver comentário acima
end;

function TQuadro.obt_caneta_x: Integer;
var
  Cnv: TCanvas;
begin
  Cnv := obt_canvas();
  if (Cnv = nil) then
    Result := 0 // não deveria acontecer
  else
    Result := Cnv.PenPos.X;
end;

function TQuadro.obt_caneta_y: Integer;
var
  Cnv: TCanvas;
begin
  Cnv := obt_canvas();
  if (Cnv = nil) then
    Result := 0 // não deveria acontecer
  else
    Result := Cnv.PenPos.Y;
end;

function TQuadro.obt_canvas2: TCanvas;
begin
  Result := FBmp.Canvas; // usado na implementação de "double buffering"
end;

function TQuadro.obt_fonte2: TFont;
begin
  Result := FBmp.Canvas.Font;
end;

procedure TQuadro.dsn_ret_canvas(Cnv: TCanvas; x1, y1, x2, y2: Integer);
begin // esta rotina irá implementar (futuramente) a alteração relativa
      // à reforma dos retângulos: x, y, larg, altu.
  if (Cnv <> nil) then
    Cnv.Rectangle(x1, y1, x1+x2, y1+y2);
end;

procedure TQuadro.reg_evento(Evento, Substituto: Integer);
begin
  // cria as listas, se ainda não foram criadas
  if FLstEvento = nil then
    FLstEvento := TList.Create;
  if FLstSubst = nil then
    FLstSubst := TList.Create;

  // insere o par
  FLstEvento.Add(Pointer(Evento));
  FLstSubst.Add(Pointer(Substituto));
end;

function TQuadro.tem_evento_subst(Evento: Integer; var Substituto: Integer): Boolean;
var
  Ind: Integer;
begin
  // presume que não vai encontrar
  Result := False;
  if FLstEvento = nil then
    Exit; // procedimento reg_evento nem foi chamado

  Ind := FLstEvento.IndexOf(Pointer(Evento));
  if Ind < 0 then
    Exit;

  // encontrou
  Result := True;
  Substituto := Integer(FLstSubst[Ind]);
end;

function TQuadro.caixa_marcada: Boolean;
begin
  Result := False; // default para a maioria dos TQuadro
end;

function TQuadro.obt_bmp: Graphics.TBitmap;
begin
  Result := FBmp;
end;

procedure TQuadro.cop_janela_ret(x1, y1, x2, y2: Integer; jan_orig: TQuadro);
var
  cnv_dest: TCanvas;
  bmp: Graphics.TBitmap;
begin
  // obtém bmp de origem
  bmp := jan_orig.obt_bmp();
  if bmp = nil then
    Exit; // nada a fazer

  // copia no bitmap doble buffering
  cnv_dest := obt_canvas2();
  if cnv_dest <> nil then
    cnv_dest.StretchDraw(Rect(x1, y1, x1 + x2, y1 + y2), bmp);

  // copia no canvas base
  cnv_dest := obt_canvas();
  if cnv_dest <> nil then
    cnv_dest.StretchDraw(Rect(x1, y1, x1 + x2, y1 + y2), bmp);

(*
  // copia no bitmap doble buffering
  cnv_dest := obt_canvas2();
  if cnv_dest <> nil then
  begin
    copy_mode := cnv_dest.CopyMode;
    cnv_dest.CopyMode := cmSrcCopy;
    cnv_dest.CopyRect(Rect(x1, y1, x2, y2), cnv_orig, Rect(rx1, ry1, rx2, ry2));
    cnv_dest.CopyMode := copy_mode;
  end;

  // copia no canvas base
  cnv_dest := obt_canvas();
  if cnv_dest <> nil then
  begin
    copy_mode := cnv_dest.CopyMode;
    cnv_dest.CopyMode := cmSrcCopy;
    cnv_dest.CopyRect(Rect(x1, y1, x2, y2), cnv_orig, Rect(rx1, ry1, rx2, ry2));
    cnv_dest.CopyMode := copy_mode;
  end;
*)
end;

procedure TQuadro.obt_tam_janela(var larg, altu: Integer);
begin
  larg := FBmp.Width;
  altu := FBmp.Height;
end;

procedure TQuadro.dsn_ret_sel(x1, y1, x2, y2: Integer);
var
  Cnv: TCanvas;
begin
  Cnv := obt_canvas2();
  if (Cnv <> nil) then
    Cnv.DrawFocusRect(Rect(x1, y1, x1+x2, y1+y2));
  Cnv := obt_canvas();
  if (Cnv <> nil) then
    Cnv.DrawFocusRect(Rect(x1, y1, x1+x2, y1+y2));
end;

{ TQuadroTela }

procedure TQuadroTela.alt_cor_janela(cor: Integer);
begin
  // nada a fazer ?

end;

procedure TQuadroTela.alt_txt_janela(txt: String);
begin
  // nada a fazer
end;

procedure TQuadroTela.cop_janela(x, y: Integer; jan_orig: TQuadro);
begin
  inherited cop_janela(x, y, jan_orig);
  FrmDsl.PaintBox.Canvas.Draw(x, y, jan_orig.obt_bmp());
end;

procedure TQuadroTela.crg_img(nome_img: String);
begin
  inherited crg_img(nome_img);
  FrmDSL.PaintBox.Repaint;
end;

constructor TQuadroTela.Cria;
begin
  inherited Cria;
  // nada específico a fazer
end;

function TQuadroTela.obt_canvas: TCanvas;
begin
  Result := FrmDSL.PaintBox.Canvas;
end;

function TQuadroTela.obt_control: TControl;
begin
  Result := nil; // a princípio, as operações sobre a tela
                 // principal não se aplicam
end;

function TQuadroTela.obt_fonte: TFont;
begin
  Result := FrmDSL.PaintBox.Canvas.Font;
end;

function TQuadroTela.obt_txt_janela: String;
begin
  Result := '';
end;

function TQuadroTela.obt_win_control: TWinControl;
begin
  Result := FrmDSL.ScrollBoxGra;
end;

{ TQuadroForm }

procedure TQuadroForm.alt_cor_janela(cor: Integer);
begin
  FForm.Color := TColor(cor);
end;

procedure TQuadroForm.alt_txt_janela(txt: String);
begin
  FForm.Caption := txt;
end;

procedure TQuadroForm.cop_janela(x, y: Integer; jan_orig: TQuadro);
begin
  inherited cop_janela(x, y, jan_orig);
  if FForm.Visible then
    FForm.Canvas.Draw(x, y, jan_orig.obt_bmp());
end;

procedure TQuadroForm.crg_img(nome_img: String);
begin
  inherited crg_img(nome_img);
  if FForm.Visible then
    FForm.Repaint;
end;

constructor TQuadroForm.Cria(Frm: TForm);
const
  F_LEFT = 2048;
  F_TOP = 2048;
begin
  inherited Cria;
  FForm := Frm;
//  // coloca o novo form "fora" da tela
//  FForm.SetBounds(F_LEFT, F_TOP, Frm.Width, Frm.Height);
end;

destructor TQuadroForm.Destroy;
begin
  inherited Destroy;
  FForm.Free;
end;

function TQuadroForm.obt_canvas: TCanvas;
begin
  Result := FForm.Canvas;
end;

function TQuadroForm.obt_control: TControl;
begin
  Result := FForm;
end;

function TQuadroForm.obt_fonte: TFont;
begin
  Result := FForm.Canvas.Font;
end;

function TQuadroForm.obt_txt_janela: String;
begin
  Result := FForm.Caption;
end;

function TQuadroForm.obt_win_control: TWinControl;
begin
  Result := FForm;
end;

{ TQuadroPanel }

constructor TQuadroPanel.Cria(Panel: TMeuPanel);
begin
// não precisa do bitmap herdado
  FPanel := Panel;
end;

destructor TQuadroPanel.Destroy;
begin
  FPanel.Free;
end;

procedure TQuadroPanel.alt_cor_janela(cor: Integer);
begin
  FPanel.Color := TColor(cor);
end;

procedure TQuadroPanel.alt_txt_janela(txt: String);
begin
  FPanel.Caption := txt;
end;

function TQuadroPanel.obt_canvas: TCanvas;
begin
  Result := FPanel.Canvas;
end;

function TQuadroPanel.obt_control: TControl;
begin
  Result := FPanel;
end;

function TQuadroPanel.obt_win_control: TWinControl;
begin
  Result := FPanel;
end;

function TQuadroPanel.obt_canvas2: TCanvas;
begin
  Result := nil;
end;

function TQuadroPanel.obt_fonte: TFont;
begin
  Result := FPanel.Font;
end;

function TQuadroPanel.obt_fonte2: TFont;
begin
  Result := nil;
end;

function TQuadroPanel.obt_txt_janela: String;
begin
  Result := FPanel.Caption;
end;

procedure TQuadroPanel.obt_tam_janela(var larg, altu: Integer);
begin
  larg := FPanel.Width;
  altu := FPanel.Height;
end;

{ TQuadroGroupBox }

constructor TQuadroGroupBox.Cria(GroupBox: TMeuGroupBox);
begin
  FGroupBox := GroupBox;
end;

destructor TQuadroGroupBox.Destroy;
begin
  FGroupBox.Free;
end;

procedure TQuadroGroupBox.alt_cor_janela(cor: Integer);
begin
  FGroupBox.Color := TColor(cor);
end;

procedure TQuadroGroupBox.alt_txt_janela(txt: String);
begin
  FGroupBox.Caption := txt;
end;

function TQuadroGroupBox.obt_canvas: TCanvas;
begin
  Result := FGroupBox.Canvas;
end;

function TQuadroGroupBox.obt_control: TControl;
begin
  Result := FGroupBox;
end;

function TQuadroGroupBox.obt_win_control: TWinControl;
begin
  Result := FGroupBox;
end;

function TQuadroGroupBox.obt_canvas2: TCanvas;
begin
  Result := nil;
end;

function TQuadroGroupBox.obt_fonte: TFont;
begin
  Result := FGroupBox.Font;
end;

function TQuadroGroupBox.obt_fonte2: TFont;
begin
  Result := nil;
end;

function TQuadroGroupBox.obt_txt_janela: String;
begin
  Result := FGroupBox.Caption;
end;

procedure TQuadroGroupBox.obt_tam_janela(var larg, altu: Integer);
begin
  larg := FGroupBox.Width;
  altu := FGroupBox.Height;
end;

{ TQuadroBotao }

procedure TQuadroBotao.alt_cor_janela(cor: Integer);
begin
  // parece que não é possível alterar a cor de um SpeedButton
end;

procedure TQuadroBotao.alt_txt_janela(txt: String);
begin
  FSpeedButton.Caption := txt;
end;

constructor TQuadroBotao.Cria(SpeedButton: TMeuSpeedButton);
begin
  FSpeedButton := SpeedButton;
end;

destructor TQuadroBotao.Destroy;
begin
  FSpeedButton.Free;
end;

function TQuadroBotao.obt_canvas: TCanvas;
begin
  Result := nil; //FSpeedButton.Canvas;
end;

function TQuadroBotao.obt_canvas2: TCanvas;
begin
  Result := nil;
end;

function TQuadroBotao.obt_control: TControl;
begin
  Result := FSpeedButton;
end;

function TQuadroBotao.obt_fonte: TFont;
begin
  Result := FSpeedButton.Font;
end;

function TQuadroBotao.obt_fonte2: TFont;
begin
  Result := nil;
end;

procedure TQuadroBotao.obt_tam_janela(var larg, altu: Integer);
begin
  larg := FSpeedButton.Width;
  altu := FSpeedButton.Height;
end;

function TQuadroBotao.obt_txt_janela: String;
begin
  Result := FSpeedButton.Caption;
end;

function TQuadroBotao.obt_win_control: TWinControl;
begin
  Result := nil;
end;

{ TQuadroRotulo }

procedure TQuadroRotulo.alt_cor_janela(cor: Integer);
begin
  FLabel.Color := cor;
end;

procedure TQuadroRotulo.alt_txt_janela(txt: String);
begin
  FLabel.Caption := txt;
end;

constructor TQuadroRotulo.Cria(Lbl: TLabel);
begin
  FLabel := Lbl;
end;

destructor TQuadroRotulo.Destroy;
begin
  FLabel.Free;
end;

function TQuadroRotulo.obt_canvas: TCanvas;
begin
  Result := nil;
end;

function TQuadroRotulo.obt_canvas2: TCanvas;
begin
  Result := nil;
end;

function TQuadroRotulo.obt_control: TControl;
begin
  Result := FLabel;
end;

function TQuadroRotulo.obt_fonte: TFont;
begin
  Result := FLabel.Font;
end;

function TQuadroRotulo.obt_fonte2: TFont;
begin
  Result := nil;
end;

procedure TQuadroRotulo.obt_tam_janela(var larg, altu: Integer);
begin
  larg := FLabel.Width;
  altu := FLabel.Height;
end;

function TQuadroRotulo.obt_txt_janela: String;
begin
  Result := FLabel.Caption;
end;

function TQuadroRotulo.obt_win_control: TWinControl;
begin
  Result := nil;
end;

{ TQuadroEditorLin }

procedure TQuadroEditorLin.alt_cor_janela(cor: Integer);
begin
  FEdit.Color := cor;
end;

procedure TQuadroEditorLin.alt_txt_janela(txt: String);
begin
  txt := AdjustLineBreaks(txt, tlbsCRLF); // converte lf para crlf
  FEdit.Text := txt;
end;

constructor TQuadroEditorLin.Cria(Edit: TEdit);
begin
  FEdit := Edit;
end;

destructor TQuadroEditorLin.Destroy;
begin
  FEdit.Free;
end;

function TQuadroEditorLin.obt_canvas: TCanvas;
begin
  Result := nil;
end;

function TQuadroEditorLin.obt_canvas2: TCanvas;
begin
  Result := nil;
end;

function TQuadroEditorLin.obt_control: TControl;
begin
  Result := FEdit;
end;

function TQuadroEditorLin.obt_fonte: TFont;
begin
  Result := FEdit.Font;
end;

function TQuadroEditorLin.obt_fonte2: TFont;
begin
  Result := nil;
end;

procedure TQuadroEditorLin.obt_tam_janela(var larg, altu: Integer);
begin
  larg := FEdit.Width;
  altu := FEdit.Height;
end;

function TQuadroEditorLin.obt_txt_janela: String;
begin
  Result := FEdit.Text;
end;

function TQuadroEditorLin.obt_win_control: TWinControl;
begin
  Result := nil;
end;

{ TQuadroCaixaMarca }

procedure TQuadroCaixaMarca.alt_cor_janela(cor: Integer);
begin
  FCheckBox.Color := cor;
end;

procedure TQuadroCaixaMarca.alt_txt_janela(txt: String);
begin
  FCheckBox.Caption := txt;
end;

function TQuadroCaixaMarca.caixa_marcada: Boolean;
begin
  Result := FCheckBox.Checked;
end;

constructor TQuadroCaixaMarca.Cria(CheckBox: TCheckBox);
begin
  FCheckBox := CheckBox;
end;

destructor TQuadroCaixaMarca.Destroy;
begin
  FCheckBox.Free;
end;

function TQuadroCaixaMarca.obt_canvas: TCanvas;
begin
  Result := nil;
end;

function TQuadroCaixaMarca.obt_canvas2: TCanvas;
begin
  Result := nil;
end;

function TQuadroCaixaMarca.obt_control: TControl;
begin
  Result := FCheckBox;
end;

function TQuadroCaixaMarca.obt_fonte: TFont;
begin
  Result := FCheckBox.Font;
end;

function TQuadroCaixaMarca.obt_fonte2: TFont;
begin
  Result := nil;
end;

procedure TQuadroCaixaMarca.obt_tam_janela(var larg, altu: Integer);
begin
  larg := FCheckBox.Width;
  altu := FCheckBox.Height;
end;

function TQuadroCaixaMarca.obt_txt_janela: String;
begin
  Result := FCheckBox.Caption;
end;

function TQuadroCaixaMarca.obt_win_control: TWinControl;
begin
  Result := nil;
end;

{ TQuadroCaixaEscolha }

procedure TQuadroCaixaEscolha.alt_cor_janela(cor: Integer);
begin
  FRadioButton.Color := cor;
end;

procedure TQuadroCaixaEscolha.alt_txt_janela(txt: String);
begin
  FRadioButton.Caption := txt;
end;

function TQuadroCaixaEscolha.caixa_marcada: Boolean;
begin
  Result := FRadioButton.Checked;  
end;

constructor TQuadroCaixaEscolha.Cria(RadioButton: TRadioButton);
begin
  FRadioButton := RadioButton;
end;

destructor TQuadroCaixaEscolha.Destroy;
begin
  FRadioButton.Free;
end;

function TQuadroCaixaEscolha.obt_canvas: TCanvas;
begin
  Result := nil;
end;

function TQuadroCaixaEscolha.obt_canvas2: TCanvas;
begin
  Result := nil;
end;

function TQuadroCaixaEscolha.obt_control: TControl;
begin
  Result := FRadioButton;
end;

function TQuadroCaixaEscolha.obt_fonte: TFont;
begin
  Result := FRadioButton.Font;
end;

function TQuadroCaixaEscolha.obt_fonte2: TFont;
begin
  Result := nil;
end;

procedure TQuadroCaixaEscolha.obt_tam_janela(var larg, altu: Integer);
begin
  larg := FRadioButton.Width;
  altu := FRadioButton.Height;
end;

function TQuadroCaixaEscolha.obt_txt_janela: String;
begin
  Result := FRadioButton.Caption;
end;

function TQuadroCaixaEscolha.obt_win_control: TWinControl;
begin
  Result := nil;
end;

{ TQuadroCaixaLista }

procedure TQuadroCaixaLista.alt_cor_janela(cor: Integer);
begin
  FListBox.Color := cor;
end;

procedure TQuadroCaixaLista.alt_txt_janela(txt: String);
begin
  txt := AdjustLineBreaks(txt, tlbsCRLF); // converte lf para crlf
  FListBox.Items.Text := txt;
end;

constructor TQuadroCaixaLista.Cria(ListBox: TListBox);
begin
  FListBox := ListBox;
end;

destructor TQuadroCaixaLista.Destroy;
begin
  FListBox.Free;
end;

function TQuadroCaixaLista.obt_canvas: TCanvas;
begin
  Result := nil;
end;

function TQuadroCaixaLista.obt_canvas2: TCanvas;
begin
  Result := nil;
end;

function TQuadroCaixaLista.obt_control: TControl;
begin
  Result := FListBox;
end;

function TQuadroCaixaLista.obt_fonte: TFont;
begin
  Result := FListBox.Font;
end;

function TQuadroCaixaLista.obt_fonte2: TFont;
begin
  Result := nil;
end;

procedure TQuadroCaixaLista.obt_tam_janela(var larg, altu: Integer);
begin
  larg := FListBox.Width;
  altu := FListBox.Height;
end;

function TQuadroCaixaLista.obt_txt_janela: String;
begin
  Result := FListBox.Items.Text;
  Result := AdjustLineBreaks(Result, tlbsLF); // converte crlf para lf
end;

function TQuadroCaixaLista.obt_win_control: TWinControl;
begin
  Result := nil;
end;

{ TQuadroCaixaComb }

procedure TQuadroCaixaComb.alt_cor_janela(cor: Integer);
begin
  FComboBox.Color := cor;
end;

procedure TQuadroCaixaComb.alt_txt_janela(txt: String);
begin
  txt := AdjustLineBreaks(txt, tlbsCRLF); // converte lf para crlf
  FComboBox.Items.Text := txt;
end;

constructor TQuadroCaixaComb.Cria(ComboBox: TComboBox);
begin
  FComboBox := ComboBox;
end;

destructor TQuadroCaixaComb.Destroy;
begin
  FComboBox.Free;
end;

function TQuadroCaixaComb.obt_canvas: TCanvas;
begin
  Result := nil;
end;

function TQuadroCaixaComb.obt_canvas2: TCanvas;
begin
  Result := nil;
end;

function TQuadroCaixaComb.obt_control: TControl;
begin
  Result := FComboBox;
end;

function TQuadroCaixaComb.obt_fonte: TFont;
begin
  Result := FComboBox.Font;
end;

function TQuadroCaixaComb.obt_fonte2: TFont;
begin
  Result := nil;
end;

procedure TQuadroCaixaComb.obt_tam_janela(var larg, altu: Integer);
begin
  larg := FComboBox.Width;
  altu := FComboBox.Height;
end;

function TQuadroCaixaComb.obt_txt_janela: String;
begin
  Result := FComboBox.Items.Text;
  Result := AdjustLineBreaks(Result, tlbsLF); // converte crlf para lf
end;

function TQuadroCaixaComb.obt_win_control: TWinControl;
begin
  Result := nil;
end;

{ TQuadroImagem }

procedure TQuadroImagem.alt_cor_janela(cor: Integer);
begin
  // nada
end;

procedure TQuadroImagem.alt_txt_janela(txt: String);
begin
  // nada
end;

procedure TQuadroImagem.crg_img(nome: String);
var
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  // por enquanto, a carga só pode ser de 'resources'
  Bmp.LoadFromResourceName(HInstance, nome);
end;

constructor TQuadroImagem.Cria(Imagem: TImage);
begin
  FImagem := Imagem;
end;

destructor TQuadroImagem.Destroy;
begin
  FImagem.Free;
end;

function TQuadroImagem.obt_bmp: Graphics.TBitmap;
begin
  Result := FImagem.Picture.Bitmap;
end;

function TQuadroImagem.obt_canvas: TCanvas;
begin
  Result := FImagem.Canvas;
end;

function TQuadroImagem.obt_canvas2: TCanvas;
begin
  Result := nil;
end;

function TQuadroImagem.obt_control: TControl;
begin
  Result := FImagem;
end;

function TQuadroImagem.obt_fonte: TFont;
begin
  Result := nil;
end;

function TQuadroImagem.obt_fonte2: TFont;
begin
  Result := nil;
end;

procedure TQuadroImagem.obt_tam_janela(var larg, altu: Integer);
begin
  larg := FImagem.Width;
  altu := FImagem.Height;
end;

function TQuadroImagem.obt_txt_janela: String;
begin
  Result := '';
end;

function TQuadroImagem.obt_win_control: TWinControl;
begin
  Result := nil;
end;

{ TQuadroEditorTxt }

procedure TQuadroEditorTxt.alt_cor_janela(cor: Integer);
begin
  FEditorTxt.Color := cor;
end;

procedure TQuadroEditorTxt.alt_txt_janela(txt: String);
begin
  txt := AdjustLineBreaks(txt, tlbsCRLF); // converte lf para crlf
  FEditorTxt.Text := txt;
end;

constructor TQuadroEditorTxt.Cria(EditorTxt: TMemo);
begin
  FEditorTxt := EditorTxt;
end;

destructor TQuadroEditorTxt.Destroy;
begin
  FEditorTxt.Free;
end;

function TQuadroEditorTxt.obt_canvas: TCanvas;
begin
  Result := nil;
end;

function TQuadroEditorTxt.obt_canvas2: TCanvas;
begin
  Result := nil;
end;

function TQuadroEditorTxt.obt_control: TControl;
begin
  Result := FEditorTxt;
end;

function TQuadroEditorTxt.obt_fonte: TFont;
begin
  Result := FEditorTxt.Font;
end;

function TQuadroEditorTxt.obt_fonte2: TFont;
begin
  Result := nil;
end;

procedure TQuadroEditorTxt.obt_tam_janela(var larg, altu: Integer);
begin
  larg := FEditorTxt.Width;
  altu := FEditorTxt.Height;
end;

function TQuadroEditorTxt.obt_txt_janela: String;
begin
  Result := FEditorTxt.Text;
  Result := AdjustLineBreaks(Result, tlbsLF); // converte crlf para lf
end;

function TQuadroEditorTxt.obt_win_control: TWinControl;
begin
  Result := nil;
end;

{ TQuadroBitmap }

procedure TQuadroBitmap.alt_cor_janela(cor: Integer);
begin
  // nada a fazer
end;

procedure TQuadroBitmap.alt_txt_janela(txt: String);
begin
  // nada a fazer
end;

procedure TQuadroBitmap.crg_img(nome: String);
begin
  inherited;

end;

constructor TQuadroBitmap.Cria(Bitmap: TBitmap);
begin
  FBitmap := Bitmap;
end;

destructor TQuadroBitmap.Destroy;
begin
  FBitmap.Free;
end;

function TQuadroBitmap.obt_bmp: Graphics.TBitmap;
begin
  Result := FBitmap;
end;

function TQuadroBitmap.obt_canvas: TCanvas;
begin
  Result := FBitmap.Canvas;
end;

function TQuadroBitmap.obt_canvas2: TCanvas;
begin
  Result := nil;
end;

function TQuadroBitmap.obt_control: TControl;
begin
  Result := nil;
end;

function TQuadroBitmap.obt_fonte: TFont;
begin
  Result := FBitmap.Canvas.Font;
end;

function TQuadroBitmap.obt_fonte2: TFont;
begin
  Result := nil;
end;

procedure TQuadroBitmap.obt_tam_janela(var larg, altu: Integer);
begin
  larg := FBitmap.Width;
  altu := FBitmap.Height;
end;

function TQuadroBitmap.obt_txt_janela: String;
begin
  Result := '';
end;

function TQuadroBitmap.obt_win_control: TWinControl;
begin
  Result := nil;
end;

end.
