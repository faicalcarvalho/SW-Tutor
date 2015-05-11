unit UFrmExample2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

type
  TFrmExample2 = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    ListBox1: TListBox;
    Label1: TLabel;
    Panel4: TPanel;
    Image1: TImage;
    BtnAbrir: TButton;
    BtnCancelar: TButton;
    procedure ListBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FBmpResName: TStringList;
    FFileName: TStringList;
    FSelIndex: Integer;
  public
    { Public declarations }
    function Execute: Boolean;
    procedure CarregaExemploSelecionado;
    procedure CarregaPrimeiroExemplo;
  end;

var
  FrmExample2: TFrmExample2;

implementation

{$R *.dfm}

uses
  StrUtils, UFrmEditor, port_UFrmConfig;

function CarregaImg(Img: TImage; Nome: String): Boolean;
var
  Bmp: Graphics.TBitmap;
begin
  Result := True;
  Bmp := Graphics.TBitmap.Create;
  try
    Bmp.LoadFromResourceName(HInstance, Nome);
    Img.Picture.Bitmap.Assign(Bmp);
  except
    Result := False;
  end;
  Bmp.Free;
end;

procedure TFrmExample2.ListBox1Click(Sender: TObject);
begin
  CarregaImg(Image1, FBmpResName[ListBox1.ItemIndex]);
end;

procedure TFrmExample2.FormShow(Sender: TObject);
begin
//  ListBox1.ItemIndex := 0;
  ListBox1Click(Self);
  ListBox1.SetFocus;
end;

procedure TFrmExample2.FormCreate(Sender: TObject);
begin
  FBmpResName := TStringList.Create;
  FFileName := TStringList.Create;
  FBmpResName.Add('Bmp-Ola');             FFileName.Add('olá');
  FBmpResName.Add('Bmp-Fato-ou-Fita');    FFileName.Add('fato-ou-fita');
  FBmpResName.Add('Bmp-Retangulo');       FFileName.Add('retângulo');
  FBmpResName.Add('Bmp-Circulo');         FFileName.Add('círculo');
  FBmpResName.Add('Bmp-Triangulo');       FFileName.Add('triângulo');
  FBmpResName.Add('Bmp-Linha');           FFileName.Add('linha');
  FBmpResName.Add('Bmp-Linhas');          FFileName.Add('linhas');
  FBmpResName.Add('Bmp-Retangulos-Coloridos'); FFileName.Add('retângulos-coloridos');
  FBmpResName.Add('Bmp-Tamanhos-Caneta'); FFileName.Add('tamanhos-caneta');
  FBmpResName.Add('Bmp-Estilos-Caneta');  FFileName.Add('estilos-caneta');
  FBmpResName.Add('Bmp-Texto-Grafico');   FFileName.Add('texto-gráfico');
  FBmpResName.Add('Bmp-Quadrados');       FFileName.Add('quadrados');
  FBmpResName.Add('Bmp-Sucessor');        FFileName.Add('sucessor');
  FBmpResName.Add('Bmp-Metade');          FFileName.Add('metade');
  FBmpResName.Add('Bmp-Metade-2');        FFileName.Add('metade-2');
  FBmpResName.Add('Bmp-Clicou');          FFileName.Add('clicou');
  FBmpResName.Add('Bmp-Clicou-Aqui');     FFileName.Add('clicou-aqui');
  FBmpResName.Add('Bmp-Clicou-Aqui-Oval');FFileName.Add('clicou-aqui-oval');
  FBmpResName.Add('Bmp-Clicou-na-Linha'); FFileName.Add('clicou-na-linha');
  FBmpResName.Add('Bmp-Esquerda-ou-Direita');FFileName.Add('esquerda-ou-direita');
  FBmpResName.Add('Bmp-No-Corredor');     FFileName.Add('no-corredor');
  FBmpResName.Add('Bmp-Fora-do-Corredor');FFileName.Add('fora-do-corredor');
  FBmpResName.Add('Bmp-Nove-Retangulos'); FFileName.Add('nove-retângulos');
  FBmpResName.Add('Bmp-Retangulos');      FFileName.Add('retângulos');
  FBmpResName.Add('Bmp-Cone-Curvo');      FFileName.Add('cone-curvo');
  FBmpResName.Add('Bmp-Tab-Quadrados');   FFileName.Add('tab-quadrados');
  FBmpResName.Add('Bmp-Curvas-Bezier');   FFileName.Add('curvas-bezier');
  FBmpResName.Add('Bmp-Clica-no-Retangulo'); FFileName.Add('clica-no-retângulo');
  FBmpResName.Add('Bmp-N-Cliques');       FFileName.Add('n-cliques');
  FBmpResName.Add('Bmp-Arco-Fatia');      FFileName.Add('arco-fatia');
  FBmpResName.Add('Bmp-Fatias-Coloridas');FFileName.Add('fatias-coloridas');
  FBmpResName.Add('Bmp-Tres-Figuras');    FFileName.Add('três-figuras');
  FBmpResName.Add('Bmp-P1p2p3');          FFileName.Add('p1p2p3');
  FBmpResName.Add('Bmp-Robo');            FFileName.Add('robô');
  FBmpResName.Add('Bmp-Marcas');          FFileName.Add('marcas');
  FBmpResName.Add('Bmp-Tamanho-Texto');   FFileName.Add('tamanho-texto');
  FBmpResName.Add('Bmp-Caracteres');      FFileName.Add('caracteres');
  FBmpResName.Add('Bmp-Ovais');           FFileName.Add('ovais');
  FBmpResName.Add('Bmp-Menor');           FFileName.Add('menor');
  FBmpResName.Add('Bmp-Texto-Invertido'); FFileName.Add('texto-invertido');
  FBmpResName.Add('Bmp-Primeiras-Teclas');FFileName.Add('primeiras-teclas');
  FBmpResName.Add('Bmp-Eventos');         FFileName.Add('eventos');
  FBmpResName.Add('Bmp-Aloc-Var-Local');  FFileName.Add('aloc-var-local');
  FBmpResName.Add('Bmp-Passagem-Args');   FFileName.Add('passagem-args');
  FBmpResName.Add('Bmp-Linhas-Conectadas');FFileName.Add('linhas-conectadas');
  FBmpResName.Add('Bmp-Raios');           FFileName.Add('raios');
  FBmpResName.Add('Bmp-Desenho-com-Mouse');FFileName.Add('desenho-com-mouse');
  FBmpResName.Add('Bmp-Coord-Mouse');     FFileName.Add('coord-mouse');
  FBmpResName.Add('Bmp-Figuras-Aleatorias');FFileName.Add('figuras-aleatórias');
  FBmpResName.Add('Bmp-Spray');           FFileName.Add('spray');
  FBmpResName.Add('Bmp-Contagem-Regressiva'); FFileName.Add('contagem-regressiva');
  FBmpResName.Add('Bmp-Contagem-Regressiva-Dez'); FFileName.Add('contagem-regressiva-dez');
  FBmpResName.Add('Bmp-Tic-Tac');         FFileName.Add('tic-tac');
  FBmpResName.Add('Bmp-Gary-Chaffee-Idea-2');FFileName.Add('gary-chaffee-idea-2');
  FBmpResName.Add('Bmp-Arranjo-Simples'); FFileName.Add('arranjo-simples');
  FBmpResName.Add('Bmp-Pontos-Conectados');FFileName.Add('pontos-conectados');
  FBmpResName.Add('Bmp-Mesa-de-Bilhar');  FFileName.Add('mesa-de-bilhar');
  FBmpResName.Add('Bmp-Figuras-Aleatorias-Jan');FFileName.Add('figuras-aleatórias-jan');
  FBmpResName.Add('Bmp-Itens-Graficos');  FFileName.Add('itens-gráficos');
  FBmpResName.Add('Bmp-Edita-Rotulo');    FFileName.Add('edita-rótulo');
  FBmpResName.Add('Bmp-Eventos-de-Itens');FFileName.Add('eventos-de-itens');
  FBmpResName.Add('Bmp-Foto-Rio');        FFileName.Add('foto-rio');
  FBmpResName.Add('Bmp-Moldura');         FFileName.Add('moldura');
  FBmpResName.Add('Bmp-Inverte-Arq');     FFileName.Add('inverte-arq');
  FBmpResName.Add('Bmp-Ponteiros');       FFileName.Add('ponteiros');
  FBmpResName.Add('Bmp-Serpente');        FFileName.Add('serpente');
  FBmpResName.Add('Bmp-Quadrado-no-Clique');FFileName.Add('quadrado-no-clique');
  FBmpResName.Add('Bmp-Jogo-do-Caos');    FFileName.Add('jogo-do-caos');
  FBmpResName.Add('Bmp-Estrela');         FFileName.Add('estrela');
  FBmpResName.Add('Bmp-Recursao-Enquanto'); FFileName.Add('recursão-enquanto');
  FBmpResName.Add('Bmp-Tri-Sierp');       FFileName.Add('tri-sierp');
  FBmpResName.Add('Bmp-Fatorial');        FFileName.Add('fatorial');
  FBmpResName.Add('Bmp-Teste-Ordenacao-Visual'); FFileName.Add('teste-ordenação-visual');
  FBmpResName.Add('Bmp-Oito-Rainhas');    FFileName.Add('oito-rainhas');
  FBmpResName.Add('Bmp-Arvore-Bin-Psq');  FFileName.Add('árvore-bin-psq');
  FBmpResName.Add('Bmp-Andromeda');       FFileName.Add('andrômeda');
  FBmpResName.Add('Bmp-Estrela-Fractal'); FFileName.Add('estrela-fractal');
  FBmpResName.Add('Bmp-Pintor');          FFileName.Add('pintor');
  FBmpResName.Add('Bmp-Reveillon');       FFileName.Add('reveillon');
  FBmpResName.Add('Bmp-Curva-de-Sierpinski');FFileName.Add('curva-sierpinski');
  FBmpResName.Add('Bmp-Fractais-MRCM');   FFileName.Add('fractais-mrcm');
  FBmpResName.Add('Bmp-Jogo-da-Memoria'); FFileName.Add('jogo-da-memória');
  FBmpResName.Add('Bmp-Curva-de-Hilbert');FFileName.Add('curva-hilbert');
  Self.Width := 900;
end;

procedure TFrmExample2.CarregaExemploSelecionado;
var
  Str: TStringList;
  Res: TResourceStream;
  NomeRes, NomeArq: String;

  function BmpParaArq(S: String): String;
  begin
    Result := 'Arq-' + AnsiMidStr(S, 5, Length(S) - 4);
  end;

(*
  function BmpParaNomeArq(S: String): String;
  var
    I: Integer;
  begin
    Result := AnsiMidStr(S, 5, Length(S) - 4); // tira o prefixo 'Bmp-'
    Result := AnsiLowerCase(Result);               // só minúsculas
    for I := 1 to Length(Result) do            // troca '-' por '_'
      if Result[I] = '-' then
        Result[I] := '_';
    Result := Result + FrmConfig.ExtensaoDefaultPrg();
  end;
*)

begin
  // cria o resource
  NomeRes := BmpParaArq(FBmpResName[ListBox1.ItemIndex]);
  Res := TResourceStream.Create(HInstance, NomeRes, RT_RCDATA);

  // cria o tstringlist com base no res
  Str := TStringList.Create;
  Str.LoadFromStream(Res);

  // abre uma aba no editor
  NomeArq := FFileName[ListBox1.ItemIndex] + FrmConfig.ExtensaoDefaultPrg();
  NomeArq := FrmConfig.NomeProgramaCompleto(NomeArq);
  FrmEditor.AddTab(Str, NomeArq, True);

  Str.Free;
  Res.Free;
  FSelIndex := ListBox1.ItemIndex;
end;

function TFrmExample2.Execute: Boolean;
begin
  ListBox1.ItemIndex := FSelIndex;
  ListBox1Click(Self);
  Result := ShowModal() = mrOk;
end;

procedure TFrmExample2.CarregaPrimeiroExemplo;
begin
  ListBox1.ItemIndex := 0;
  CarregaExemploSelecionado;
end;

end.
