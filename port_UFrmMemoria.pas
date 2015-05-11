unit port_UFrmMemoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, port_PascalInterpreter, StdCtrls;

type
  TListaDePonteiros = class
  private
    FLstOrig: TList;
    FLstDest: TList;
  public
    constructor Cria;
    destructor Destroy; override;
    function IndiceNaLista(Item: TListItem): Integer;
    procedure Inclui(Item: TListItem);
    procedure Exclui(Item: TListItem);
    property ListaOrig: TList read FLstOrig;
    property ListaDest: TList read FLstDest;
  end;

  TFrmMemoria = class(TForm)
    Button1: TButton;
    ImgPtrDoido: TImage;
    Timer1: TTimer;
    ListViewPtrNulo: TListView;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FLstPtr: TListaDePonteiros;
    FBitmap: TBitmap;
    FBitmapSeta: TBitmap;
    FBitmapNulo: TBitmap;
    FBitmapDoido: TBitmap;
    FUltimaTrilha: Integer;
    FItemNulo: TListItem;
    FTopMem: TListItem;
    FTopHeap: TListItem;
    FTemPonteiro: Boolean;
    function PesquisaEnder(Ender: Integer): TListItem;
    function TentaAtualizarComoPonteiro(Ender: Integer;
        Valor: String): TListItem;
    procedure DesenhaPonteiro(Canvas: TCanvas; Orig, Dest: TListItem);
    procedure DesenhaPonteiroEspecial(Canvas: TCanvas; X, Y: Integer;
        Bitmap: TBitmap);
    procedure ObtemY1Y2(Orig, Dest: TListItem; var Y1, Y2: Integer);
    function AjusteVerticalHeap: Integer;
    function ObtemTrilha: Integer;
    function CriaSeta(CorFrente, CorFundo: TColor): TBitmap;
    function CriaNulo(CorFrente, CorFundo: TColor): TBitmap;
    function CriaDoido(CorFrente, CorFundo: TColor): TBitmap;
  public
    procedure Limpa;
    procedure IncluiVar(Nome: String; Ender: Integer; Global: Boolean);
    procedure ExcluiVar(Ender: Integer);
    procedure AtualizaVar(Ender: Integer; Valor: String);
    procedure MudaEnder(Antigo, Novo: Integer);
    procedure IncluiSubrotina(Nome: String);
    procedure LiberaUltimoEscopo;
    procedure AtualizaPonteiros;
    procedure MarcaComoPonteiro(Ender: Integer);
    procedure IniciaAtualizacao;
    procedure TerminaAtualizacao;
  end;

var
  FrmMemoria: TFrmMemoria;

implementation

{$R *.dfm}

uses Types, UITypes, port_UFrmDSL, port_PasTokens;

const
  MEM_OFFSET_Y = 24;

{ TFrmMemoria }

procedure TFrmMemoria.AtualizaVar(Ender: Integer; Valor: String);
var
  Item: TListItem;
begin
  // primeiro, tenta atualizar como ponteiro
  Item := TentaAtualizarComoPonteiro(Ender, Valor);

  // se não era ponteiro, atualiza como variável normal
  if Item <> nil then
    Item.SubItems[0] := Valor;
end;

procedure TFrmMemoria.MudaEnder(Antigo, Novo: Integer);
var
  Item: TListItem;
begin
  Item := PesquisaEnder(Antigo);
  if Item <> nil then
    Item.Data := Pointer(Novo);
end;

procedure TFrmMemoria.IncluiSubrotina(Nome: String);
var
  Item: TListItem;
  Tam: Integer;
begin
  Item := FrmDSL.ListViewMem.Items.Add();
//  Item.Caption := '******* ' + Nome;
  Item.Caption := Nome;
  Item.Data := Pointer(-1);
  Item.MakeVisible(False);
  Item.ImageIndex := 22; // imagem para ativação de rotina

  // verifica limite
  Tam := FrmDSL.ListViewMem.Items.Count;
  if (Tam >= MEM_ITENS_MAX) then
    raise EInterpreterException.Create(sDiagramaDaMemoriaCheio, 1, 1, nil);
end;

procedure TFrmMemoria.IncluiVar(Nome: String; Ender: Integer;
    Global: Boolean);
var
  Item: TListItem;
  Tam: Integer;
begin
  // não mostra a variável especial RESULT_NAME
  if Nome = RESULT_NAME then
    Exit;

  // seleciona uma das duas listas (mem ou heap)
  if Global then
  begin
    Item := FrmDSL.ListViewMem.Items.Add();
    Tam := FrmDSL.ListViewMem.Items.Count;
  end
  else
  begin
    Item := FrmDSL.ListViewHeap.Items.Add();
    Tam := FrmDSL.ListViewHeap.Items.Count;
  end;

  // verifica limite
  if (Tam >= MEM_ITENS_MAX) then
    raise EInterpreterException.Create(sDiagramaDaMemoriaCheio, 1, 1, nil);

  // preenche o item
  Item.Caption := Nome;
  Item.SubItems.Add('?');
  Item.Data := Pointer(Ender);
  Item.MakeVisible(False);
  Item.ImageIndex := -1;
end;

procedure TFrmMemoria.ExcluiVar(Ender: Integer);
var
  Item: TListItem;
begin
  // pesquisa o item através do endereço
  Item := PesquisaEnder(Ender);
  if Item = nil then
    Exit; // nada a fazer!

  // exclui (talvez) da lista de ponteiros
  FLstPtr.Exclui(Item);

  // elimina o item (certifica que é da heap)
  if Item.ListView = FrmDSL.ListViewHeap then
    FrmDSL.ListViewHeap.Items.Delete(Item.Index);
end;

procedure TFrmMemoria.LiberaUltimoEscopo;
var
  I: Integer;
begin
  // obtenha o último item
  I := FrmDSL.ListViewMem.Items.Count - 1;

  // libere as variáveis
  while (I >= 0) and (FrmDSL.ListViewMem.Items[I].Data <> Pointer(-1)) do
  begin
    // exclui (talvez) da lista de ponteiros
    FLstPtr.Exclui(FrmDSL.ListViewMem.Items[I]);

    // exclui da listview
    FrmDSL.ListViewMem.Items.Delete(I);
    I := I - 1;
  end;

  // libera a marca de inicio de subrotina
  if I >= 0 then
    FrmDSL.ListViewMem.Items.Delete(I);
end;

procedure TFrmMemoria.Limpa;
begin
  FrmDSL.ListViewMem.Clear;
  FrmDSL.ListViewHeap.Clear;
  FLstPtr.ListaOrig.Clear;
  FLstPtr.ListaDest.Clear;
  FUltimaTrilha := 0;

  // no início, sempre limpa a área de ponteiros
  FTemPonteiro := True;
  AtualizaPonteiros;
  FTemPonteiro := False;
end;

function TFrmMemoria.PesquisaEnder(Ender: Integer): TListItem;
begin
  // verifica se Ender está na memória
  Result := FrmDSL.ListViewMem.FindData(0, Pointer(Ender), True, False);

  // se não encontrou, tenta na heap
  if Result = nil then
    Result := FrmDSL.ListViewHeap.FindData(0, Pointer(Ender), True, False);
end;

procedure TFrmMemoria.FormCreate(Sender: TObject);
begin
  FLstPtr := TListaDePonteiros.Cria;
  FBitmap := TBitmap.Create;
  FBitmap.Canvas.Brush.Color := FrmDSL.PnlPonteiros.Color;
  FBitmapSeta := CriaSeta(clBlack, FBitmap.Canvas.Brush.Color);
  FBitmapNulo := CriaNulo(clBlack, FBitmap.Canvas.Brush.Color);
  FBitmapDoido := CriaDoido(clBlack, FBitmap.Canvas.Brush.Color);
  FItemNulo := ListViewPtrNulo.Items.Add;
end;

procedure TFrmMemoria.FormDestroy(Sender: TObject);
begin
  FLstPtr.Free;
  FBitmap.Free;
  FBitmapSeta.Free;
  FBitmapNulo.Free;
end;

procedure TFrmMemoria.AtualizaPonteiros;
var
  ItemOrig, ItemDest: TListItem;
  I: Integer;
begin
  // nada a fazer se não tiver ponteiro
  if (not FTemPonteiro) or (FrmDSL.Closing) then
    Exit;

  // ajusta o tamanho do bitmap
  FBitmap.Width := FrmDSL.PaintBoxMem.Width;
  FBitmap.Height := FrmDSL.PaintBoxMem.Height;

  // limpa tudo
  FBitmap.Canvas.FillRect(Rect(0, 0, FBitmap.Width, FBitmap.Height));

  // inicializa valor usado na seleção das trilhas verticais
  FUltimaTrilha := 15;

  // desenha as setas
  for I := 0 to FLstPtr.ListaOrig.Count - 1 do
  begin
    ItemOrig := TListItem(FLstPtr.ListaOrig[I]);
    ItemDest := TListItem(FLstPtr.ListaDest[I]);
    DesenhaPonteiro(FBitmap.Canvas, ItemOrig, ItemDest);
  end;

  // transfere o bitmap para a tela
  FrmDSL.PaintBoxMem.Canvas.Draw(0, 0, FBitmap);
end;

function TFrmMemoria.TentaAtualizarComoPonteiro(Ender: Integer;
  Valor: String): TListItem;
var
  Ind: Integer;
  EnderDest: Integer;
  ItemDest: TListItem;
begin
  // pesquisa o item através do endereço
  Result := PesquisaEnder(Ender);
  if Result = nil then
    Exit; // nada a fazer!

  // pesquisa na lista de ponteiros
  Ind := FLstPtr.IndiceNaLista(Result);
  if Ind < 0 then
    Exit; // não é ponteiro

  // trata-se de ponteiro; coloca * como valor
  Result.SubItems[0] := ' * ';

  // Result := nil indicando que a atualização será realizada
  Result := nil;

  // obtém valor numérico do endereço destino
  EnderDest := StrToInt(Valor);

  // obtém item destino (presume que vai encontrar)
  if EnderDest = 0 then
    ItemDest := FItemNulo
  else
    ItemDest := PesquisaEnder(EnderDest);

  // atualiza item de destino na lista
  FLstPtr.ListaDest[Ind] := ItemDest;
end;

procedure TFrmMemoria.DesenhaPonteiro(Canvas: TCanvas; Orig,
  Dest: TListItem);
var
  X1, Y1, X2, Y2, XTrilha: Integer;
begin
  // obtém Y1 e Y2
  ObtemY1Y2(Orig, Dest, Y1, Y2);

  // obtém X1 e X2
  X1 := FrmDSL.PaintBoxMem.Width;
  X2 := X1;

  // trata caso especial (nulo)
  if Dest = FItemNulo then
  begin
    DesenhaPonteiroEspecial(Canvas, X1, Y1, FBitmapNulo);
    Exit;
  end;

  // trata caso especial (doido)
  if Dest = nil then
  begin
    DesenhaPonteiroEspecial(Canvas, X1, Y1, FBitmapDoido);
    Exit;
  end;

  // obtém a trilha
  XTrilha := ObtemTrilha();

  // desenha
  Canvas.MoveTo(X1, Y1);
  Canvas.LineTo(XTrilha, Y1);
  Canvas.LineTo(XTrilha, Y2);
  Canvas.LineTo(X2, Y2);

  // desenha a seta
  Canvas.Draw(X2 - 6, Y2 - 3, FBitmapSeta);
end;

procedure TFrmMemoria.DesenhaPonteiroEspecial(Canvas: TCanvas; X, Y: Integer;
    Bitmap: TBitmap);
begin
  Canvas.MoveTo(X, Y);
  Canvas.LineTo(X - 10, Y);
  Canvas.LineTo(X - 10, Y + 3);

  // desenha o bitmap
  Canvas.Draw(X - 14, Y + 3, Bitmap);
end;

procedure TFrmMemoria.ObtemY1Y2(Orig, Dest: TListItem; var Y1,
  Y2: Integer);
begin
  // obtém Y1
  Y1 := Orig.DisplayRect(drBounds).Top;

  // obtém Y2
  if Dest = nil then
    Y2 := -1
  else
    Y2 := Dest.DisplayRect(drBounds).Top;

  // ajusta Y1
  if Orig.ListView = FrmDSL.ListViewMem then
    Y1 := Y1 + MEM_OFFSET_Y
  else
    Y1 := Y1 + AjusteVerticalHeap();

  // ajusta Y2
  if (Dest <> nil) and (Dest.ListView = FrmDSL.ListViewMem) then
    Y2 := Y2 + MEM_OFFSET_Y
  else
    Y2 := Y2 + AjusteVerticalHeap();

  // ajusta pequena diferença para origem e destino
  Y1 := Y1 + 2;
  Y2 := Y2 - 2;
end;

function TFrmMemoria.AjusteVerticalHeap: Integer;
begin
  Result := FrmDSL.PnlHeap.Top + 24;
end;

function TFrmMemoria.ObtemTrilha: Integer;
begin
  Result := (FUltimaTrilha + 5) mod 16;
  FUltimaTrilha := Result;
end;

function TFrmMemoria.CriaSeta(CorFrente, CorFundo: TColor): TBitmap;
var
  Y: Integer;
begin
  Result := TBitmap.Create;
  Result.Width := 6;
  Result.Height := 7;
  Result.Canvas.Brush.Color := CorFundo;
  Result.Canvas.FillRect(Rect(0, 0, Result.Width, Result.Height));

  // desenha a seta (estupidez?)
  for Y := 0 to 6 do
    Result.Canvas.Pixels[0, Y] := CorFrente;
  for Y := 1 to 5 do
    Result.Canvas.Pixels[1, Y] := CorFrente;
  for Y := 1 to 5 do
    Result.Canvas.Pixels[2, Y] := CorFrente;
  for Y := 2 to 4 do
    Result.Canvas.Pixels[3, Y] := CorFrente;
  for Y := 2 to 4 do
    Result.Canvas.Pixels[4, Y] := CorFrente;
  Result.Canvas.Pixels[5, 3] := CorFrente;
end;

function TFrmMemoria.CriaNulo(CorFrente, CorFundo: TColor): TBitmap;
var
  X: Integer;
begin
  Result := TBitmap.Create;
  Result.Width := 9;
  Result.Height := 9;
  Result.Canvas.Brush.Color := CorFundo;
  Result.Canvas.FillRect(Rect(0, 0, Result.Width, Result.Height));

  // desenha o símbolo de nulo
  for X := 0 to 8 do
    Result.Canvas.Pixels[X, 0] := CorFrente;
  for X := 1 to 7 do
    Result.Canvas.Pixels[X, 2] := CorFrente;
  for X := 2 to 6 do
    Result.Canvas.Pixels[X, 4] := CorFrente;
  for X := 3 to 5 do
    Result.Canvas.Pixels[X, 6] := CorFrente;
  Result.Canvas.Pixels[4, 8] := CorFrente;
end;

function TFrmMemoria.CriaDoido(CorFrente, CorFundo: TColor): TBitmap;
begin
  Result := TBitmap(ImgPtrDoido.Picture.Graphic);
end;

procedure TFrmMemoria.MarcaComoPonteiro(Ender: Integer);
var
  Item: TListItem;
begin
  Item := PesquisaEnder(Ender);
  if Item = nil then
    Exit; // não deve acontecer!

  // inclui na lista de ponteiros
  FLstPtr.Inclui(Item);
  FTemPonteiro := True;
end;



{ TListaDePonteiros }

constructor TListaDePonteiros.Cria;
begin
  FLstOrig := TList.Create;
  FLstDest := TList.Create;
end;

destructor TListaDePonteiros.Destroy;
begin
  FLstOrig.Free;
  FLstDest.Free;
end;

procedure TListaDePonteiros.Inclui(Item: TListItem);
begin
  FLstOrig.Add(Item);
  FLstDest.Add(nil);
end;

procedure TListaDePonteiros.Exclui(Item: TListItem);
var
  Ind: Integer;
begin
  Ind := FLstOrig.Remove(Item);
  if Ind >= 0 then
    FLstDest.Delete(Ind);

  // varre a lista de destino, substituindo Item por nil
  for Ind := 0 to FLstDest.Count - 1 do
    if FLstDest[Ind] = Item then
      FLstDest[Ind] := nil;
end;

function TListaDePonteiros.IndiceNaLista(Item: TListItem): Integer;
begin
  Result := FLstOrig.IndexOf(Item);
end;

procedure TFrmMemoria.Timer1Timer(Sender: TObject);
begin
  if (FrmDSL.ListViewMem.TopItem <> FTopMem) or
     (FrmDSL.ListViewHeap.TopItem <> FTopHeap) then
  begin
    FTopMem := FrmDSL.ListViewMem.TopItem;
    FTopHeap := FrmDSL.ListViewHeap.TopItem;
    AtualizaPonteiros;
  end;
end;

procedure TFrmMemoria.IniciaAtualizacao;
begin
  FrmDSL.ListViewMem.Items.BeginUpdate;
  Timer1.Enabled := False;
end;

procedure TFrmMemoria.TerminaAtualizacao;
begin
  FrmDSL.ListViewMem.Items.EndUpdate;
  AtualizaPonteiros;
  Timer1.Enabled := True;
end;

end.
