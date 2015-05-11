unit port_UFrmExamples;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFrmExamples = class(TForm)
    ListBox1: TListBox;
    BtnOk: TButton;
    BtnCancel: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ProgramString: String;
    function ProgramName: String;
  end;

var
  FrmExamples: TFrmExamples;

implementation

{$R *.DFM}

const

sVersao = 'Beta 0.96'; // 16-ago-2007

sHelloWorld: String =
'/* Exibe uma breve saudação na tela */' + #13#10 +
'programa olá;' + #13#10 +
'início' + #13#10 +
'  escreva("Olá!");' + #13#10 +
'fim.';


sHilbert: String =

  '/* Este programa mostra um padrão gráfico ' + #13#10 +
  '   chamado "curvas de Hilbert", em homenagem ' + #13#10 +
  '   a seu inventor, o matemático D. Hilbert.' + #13#10 +
  '   Publicado em "Algorithms and Data' + #13#10 +
  '   Structures", de Niklaus Wirth' + #13#10 +
  '   (Prentice-Hall, 1986) */' + #13#10 +
  'programa hilbert;' + #13#10 +
  'inclui "gra*";' + #13#10 +
  'inclui "mat*";' + #13#10 +
  '' + #13#10 +
  'const' + #13#10 +
  '  TAM_QUAD = 200;' + #13#10 +
  '  LARG = 200;' + #13#10 +
  '  ALTU = 200;' + #13#10 +
  '' + #13#10 +
  'var' + #13#10 +
  '  i, x0, y0, u: inteiro;' + #13#10 +
  '' + #13#10 +
  'procedimento lin_rel(dx, dy: inteiro);' + #13#10 +
  'var' + #13#10 +
  '  x, y: inteiro;' + #13#10 +
  'início' + #13#10 +
  '  x := obt_caneta_x(tela) + dx;' + #13#10 +
  '  y := obt_caneta_y(tela) + dy;' + #13#10 +
  '  dsn_lin(tela, x, y);' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  'procedimento lin(dir, dist: inteiro);' + #13#10 +
  'var' + #13#10 +
  '  x: inteiro;' + #13#10 +
  'início' + #13#10 +
  '  x := arredonde(dist * sen(PI/4));' + #13#10 +
  '  escolha (dir)' + #13#10 +
  '    caso 0: lin_rel(dist, 0);' + #13#10 +
  '    caso 1: lin_rel(x, -x);' + #13#10 +
  '    caso 2: lin_rel(0, -dist);' + #13#10 +
  '    caso 3: lin_rel(-x, -x);' + #13#10 +
  '    caso 4: lin_rel(-dist, 0);' + #13#10 +
  '    caso 5: lin_rel(-x, x);' + #13#10 +
  '    caso 6: lin_rel(0, dist);' + #13#10 +
  '    caso 7: lin_rel(x, x);' + #13#10 +
  '  fim;' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  '/* adiante */' + #13#10 +
  'procedimento a(i: inteiro); adiante;' + #13#10 +
  'procedimento b(i: inteiro); adiante;' + #13#10 +
  'procedimento c(i: inteiro); adiante;' + #13#10 +
  'procedimento d(i: inteiro); adiante;' + #13#10 +
  '' + #13#10 +
  'procedimento a(i: inteiro);' + #13#10 +
  'início' + #13#10 +
  '  se (i > 0)' + #13#10 +
  '  início' + #13#10 +
  '    d(i - 1); lin(4, u); a(i - 1); lin(6, u);' + #13#10 +
  '    a(i - 1); lin(0, u); b(i-1);' + #13#10 +
  '  fim;' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  'procedimento b(i: inteiro);' + #13#10 +
  'início' + #13#10 +
  '  se (i > 0)' + #13#10 +
  '  início' + #13#10 +
  '    c(i - 1); lin(2, u); b(i - 1); lin(0, u);' + #13#10 +
  '    b(i - 1); lin(6, u); a(i - 1);' + #13#10 +
  '  fim;' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  'procedimento c(i: inteiro);' + #13#10 +
  'início' + #13#10 +
  '  se (i > 0)' + #13#10 +
  '  início' + #13#10 +
  '    b(i - 1); lin(0, u); c(i - 1); lin(2, u);' + #13#10 +
  '    c(i - 1); lin(4, u); d(i - 1);' + #13#10 +
  '  fim;' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  'procedimento d(i: inteiro);' + #13#10 +
  'início' + #13#10 +
  '  se (i > 0)' + #13#10 +
  '  início' + #13#10 +
  '    a(i - 1); lin(6, u); d(i - 1); lin(4, u);' + #13#10 +
  '    d(i - 1); lin(2, u); c(i - 1);' + #13#10 +
  '  fim;' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  'início' + #13#10 +
  '  x0 := LARG div 2; y0 := ALTU div 2;' + #13#10 +
  '  u := TAM_QUAD; i := 0;' + #13#10 +
  '  repita' + #13#10 +
  '    i := i + 1;' + #13#10 +
  '    u := u div 2;' + #13#10 +
  '    x0 := x0 + (u div 2);' + #13#10 +
  '    y0 := y0 - (u div 2);' + #13#10 +
  '    alt_pos_caneta(tela, x0, y0);' + #13#10 +
  '  até (i = 5);' + #13#10 +
  '  a(i);' + #13#10 +
  'fim.' + #13#10;

sMondrian: String =
  '/* Este programa exibe um padrão gráfico criado por Mondrian */' + #13#10 +
  'programa mondrian;' + #13#10 +
  'inclui "gra*";' + #13#10 +
  'inclui "mat*";' + #13#10 +
  '' + #13#10 +
  'const' + #13#10 +
  '  MIN_AREA = 400;' + #13#10 +
  '  MIN_EDGE = 19;' + #13#10 +
  '' + #13#10 +
  'funcao max(x, y: inteiro): inteiro;' + #13#10 +
  'início' + #13#10 +
  '  se (x > y)' + #13#10 +
  '    retorne x' + #13#10 +
  '  senão' + #13#10 +
  '    retorne y;' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  'procedimento subdivide_canvas(x, y, width, height: inteiro);' + #13#10 +
  'var' + #13#10 +
  '  divider: inteiro;' + #13#10 +
  'início' + #13#10 +
  '  se (width * height >= MIN_AREA)' + #13#10 +
  '    se (width > height)' + #13#10 +
  '    início' + #13#10 +
  '      divider := max(mat_random(width), MIN_EDGE);' + #13#10 +
  '      alt_pos_caneta(tela, x + divider, y);' + #13#10 +
  '      dsn_lin(tela, x + divider, y + height);' + #13#10 +
  '      subdivide_canvas(x, y, divider, height);' + #13#10 +
  '      subdivide_canvas(x+divider, y, width-divider, height);' + #13#10 +
  '    fim' + #13#10 +
  '    senão início' + #13#10 +
  '      divider := max(mat_random(height), MIN_EDGE);' + #13#10 +
  '      alt_pos_caneta(tela, x, y + divider);' + #13#10 +
  '      dsn_lin(tela, width + x, y + divider);' + #13#10 +
  '      subdivide_canvas(x, y, width, divider);' + #13#10 +
  '      subdivide_canvas(x, y+divider, width, height-divider);' + #13#10 +
  '    fim;' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  'início' + #13#10 +
  '  dsn_ret(tela, 9, 9, 200 + MIN_EDGE, 200 + MIN_EDGE);' + #13#10 +
  '  gra_alt_cor_caneta(tela, COR_AZUL);' + #13#10 +
  '  subdivide_canvas(10, 10, 200, 200);' + #13#10 +
  'fim.' + #13#10;

sRandomTest: String =
  '/* Teste randômico */' + #13#10 +
  'programa teste_random;' + #13#10 +
  'inclui "gra*";' + #13#10 +
  'inclui "mat*";' + #13#10 +
  '' + #13#10 +
  'const' + #13#10 +
  '  SZ = 150;' + #13#10 +
  'var' + #13#10 +
  '  c: arranjo [0..3] de inteiro;' + #13#10 +
  '  i: inteiro;' + #13#10 +
  '  x, y, z: inteiro;' + #13#10 +
  'início' + #13#10 +
  '  c[0] := COR_VERMELHO;' + #13#10 +
  '  c[1] := COR_VERDE;' + #13#10 +
  '  c[2] := COR_AZUL;' + #13#10 +
  '  c[3] := COR_AMARELO;' + #13#10 +
  '  para (i := 0; i < 500; inc(i))' + #13#10 +
  '  início' + #13#10 +
  '    gra_mudeCorDoPincel(c[mat_random(4)]);' + #13#10 +
  '    x := mat_random(SZ); y := mat_random(SZ);' + #13#10 +
  '    z := mat_random(SZ div 4);' + #13#10 +
  '    escolha (mat_random(2))' + #13#10 +
  '      caso 0: gra_desenheRetangulo(x, y, x+z, y+z);' + #13#10 +
  '      caso 1: gra_desenheElipse(x, y, x+z, y+z);' + #13#10 +
  '    fim;' + #13#10 +
  '  fim;' + #13#10 +
  'fim.' + #13#10;

sSierpinski: String =
  '/*' + #13#10 +
  '  Decarva SW-Tutor ' + sVersao + #13#10 +
  '  Sierpinski.pac' + #13#10 +
  '*/' + #13#10 +
  'programa Sierpinski;' + #13#10 +
  'inclui "gra*";' + #13#10 +
  'inclui "mat*";' + #13#10 +
  '' + #13#10 +
  'const' + #13#10 +
  '  SquareSize = 200;' + #13#10 +
  '  Width = 200;' + #13#10 +
  '  Height = 200;' + #13#10 +
  'var' + #13#10 +
  '  i, x0, y0, u: inteiro;' + #13#10 +
  '' + #13#10 +
  'procedimento lineRel(dx, dy: inteiro);' + #13#10 +
  'var' + #13#10 +
  '  x,y: inteiro;' + #13#10 +
  'início' + #13#10 +
  '  x := gra_x() + dx;' + #13#10 +
  '  y := gra_y() + dy;' + #13#10 +
  '  gra_desenheLinha(x, y);' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  'procedimento line(direction, distance: inteiro);' + #13#10 +
  'var' + #13#10 +
  '  x: inteiro;' + #13#10 +
  'início' + #13#10 +
  '  x := mat_arredonde(distance * mat_sen(PI/4));' + #13#10 +
  '  escolha (direction)' + #13#10 +
  '    caso 0: lineRel(distance, 0);' + #13#10 +
  '    caso 1: lineRel(x, -x);' + #13#10 +
  '    caso 2: lineRel(0, -distance);' + #13#10 +
  '    caso 3: lineRel(-x, -x);' + #13#10 +
  '    caso 4: lineRel(-distance, 0);' + #13#10 +
  '    caso 5: lineRel(-x, x);' + #13#10 +
  '    caso 6: lineRel(0, distance);' + #13#10 +
  '    caso 7: lineRel(x, x);' + #13#10 +
  '  fim;' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  '/* forwards */' + #13#10 +
  'procedimento B(i: inteiro); adiante;' + #13#10 +
  'procedimento C(i: inteiro); adiante;' + #13#10 +
  'procedimento D(i: inteiro); adiante;' + #13#10 +
  '' + #13#10 +
  'procedimento A(i: inteiro);' + #13#10 +
  'início' + #13#10 +
  '  se (i>0)' + #13#10 +
  '  início' + #13#10 +
  '    A(i-1); line(7,u); B(i-1); line(0, 2*u);' + #13#10 +
  '    D(i-1); line(1,u); A(i-1);' + #13#10 +
  '  fim;' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  'procedimento B(i: inteiro);' + #13#10 +
  'início' + #13#10 +
  '  se (i>0)' + #13#10 +
  '  início' + #13#10 +
  '    B(i-1); line(5,u); C(i-1); line(6,2*u);' + #13#10 +
  '    A(i-1); line(7,u); B(i-1);' + #13#10 +
  '  fim;' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  'procedimento C(i: inteiro);' + #13#10 +
  'início' + #13#10 +
  '  se (i>0)' + #13#10 +
  '  início' + #13#10 +
  '    C(i-1); line(3,u); D(i-1); line(4,2*u);' + #13#10 +
  '    B(i-1); line(5,u); C(i-1);' + #13#10 +
  '  fim;' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  'procedimento D(i: inteiro);' + #13#10 +
  'início' + #13#10 +
  '  se (i>0)' + #13#10 +
  '  início' + #13#10 +
  '    D(i-1); line(1,u); A(i-1); line(2,2*u);' + #13#10 +
  '    C(i-1); line(3,u); D(i-1);' + #13#10 +
  '  fim;' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  'início' + #13#10 +
  '  i := 0;   ' + #13#10 +
  '  u := SquareSize div 4; ' + #13#10 +
  '  x0 := Width div 2; ' + #13#10 +
  '  y0 := Height div 2 - u;' + #13#10 +
  '  repita' + #13#10 +
  '    i := i+1;' + #13#10 +
  '    x0 := x0 - u;' + #13#10 +
  '    u := u div 2;' + #13#10 +
  '    y0 := y0 - u;' + #13#10 +
  '    gra_mudeXY(x0, y0);' + #13#10 +
  '  até (i = 4);' + #13#10 +
  '  A(i); line(7,u); B(i); line(5,u);' + #13#10 +
  '  C(i); line(3,u); D(i); line(1,u);' + #13#10 +
  'fim.' + #13#10;

sQuickSort: String =
  '/*' + #13#10 +
  '  Decarva SW-Tutor ' + sVersao + #13#10 +
  '  QuickSort.pac' + #13#10 +
  '*/' + #13#10 +
  'programa QuickSort;' + #13#10 +
  'inclui "gra*";' + #13#10 +
  'inclui "mat*";' + #13#10 +
  '' + #13#10 +
  'const' + #13#10 +
  '  N = 100;' + #13#10 +
  '' + #13#10 +
  'tipo' + #13#10 +
  '  TArray = arranjo [0..N] de inteiro;' + #13#10 +
  '' + #13#10 +
  'var' + #13#10 +
  '  A: TArray;' + #13#10 +
  '' + #13#10 +
  'procedimento PaintLine(I, Len: inteiro);' + #13#10 +
  'início' + #13#10 +
  '  gra_mudeXY(0, I * 2 + 1);' + #13#10 +
  '  gra_desenheLinha(Len, I * 2 + 1);' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  'procedimento InitA();' + #13#10 +
  'var' + #13#10 +
  '  i: inteiro;' + #13#10 +
  'início' + #13#10 +
  '  gra_mudeCorDaCaneta(COR_VERMELHA);' + #13#10 +
  '  para (i := 0; i <= N; inc(i))' + #13#10 +
  '  início' + #13#10 +
  '    A[i] := mat_random(250);' + #13#10 +
  '    PaintLine(i, A[i]);' + #13#10 +
  '  fim;' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  'procedimento VisualSwap(A, B, I, J: inteiro);' + #13#10 +
  'início' + #13#10 +
  '  gra_mudeCorDaCaneta(COR_PRATA);' + #13#10 +
  '  PaintLine(I, A);' + #13#10 +
  '  PaintLine(J, B);' + #13#10 +
  '  gra_mudeCorDaCaneta(COR_VERMELHA);' + #13#10 +
  '  PaintLine(I, B);' + #13#10 +
  '  PaintLine(J, A);' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  'procedimento QuickSort(var A: TArray; iLo, iHi: inteiro);' + #13#10 +
  'var' + #13#10 +
  '  Lo, Hi, Mid, T: inteiro;' + #13#10 +
  'início' + #13#10 +
  '  Lo := iLo;' + #13#10 +
  '  Hi := iHi;' + #13#10 +
  '  Mid := A[(Lo + Hi) div 2];' + #13#10 +
  '  repita' + #13#10 +
  '    enquanto (A[Lo] < Mid) Lo:=Lo+1;' + #13#10 +
  '    enquanto (A[Hi] > Mid) Hi:=Hi-1;' + #13#10 +
  '    se (Lo <= Hi)' + #13#10 +
  '    início' + #13#10 +
  '      VisualSwap(A[Lo], A[Hi], Lo, Hi);' + #13#10 +
  '      T := A[Lo];' + #13#10 +
  '      A[Lo] := A[Hi];' + #13#10 +
  '      A[Hi] := T;' + #13#10 +
  '      Lo:=Lo+1;' + #13#10 +
  '      Hi:=Hi-1 ;' + #13#10 +
  '    fim;' + #13#10 +
  '  até (Lo > Hi);' + #13#10 +
  '  se (Hi > iLo) QuickSort(A, iLo, Hi);' + #13#10 +
  '  se (Lo < iHi) QuickSort(A, Lo, iHi);' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  'início' + #13#10 +
  '  InitA();' + #13#10 +
  '  QuickSort(A, 0, N);' + #13#10 +
  'fim.' + #13#10;

sFractalStar: String =
  '/*' + #13#10 +
  ' Este programa mostra um padrão gráfico ' + #13#10 +
  ' chamado "Estrela Fractal".' + #13#10 +
  ' Publicado em "Algorithms in C",' + #13#10 +
  ' de Robert Sedgewick(Prentice-Hall, 1990)' + #13#10 +
  '*/' + #13#10 +
  'programa FractalStar;' + #13#10 +
  'inclui "gra*";' + #13#10 +
  '' + #13#10 +
  'procedimento box(x,y,r: inteiro);' + #13#10 +
  'início' + #13#10 +
  '  gra_desenheRetangulo(x-r, y-r, x+r, y+r);' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  'procedimento star(x,y,r: inteiro);' + #13#10 +
  'início' + #13#10 +
  '  se (r>1)' + #13#10 +
  '  início' + #13#10 +
  '    star(x-r,y+r,r div 2);' + #13#10 +
  '    star(x+r,y+r,r div 2);' + #13#10 +
  '    star(x-r,y-r,r div 2);' + #13#10 +
  '    star(x+r,y-r,r div 2);' + #13#10 +
  '    box(x,y,r);' + #13#10 +
  '  fim;' + #13#10 +
  'fim;' + #13#10 +
  '' + #13#10 +
  'início' + #13#10 +
  '// experimente retirar os comentarios  ' + #13#10 +
  '//  gra_mudeCorDoPincel(COR_VERMELHA);' + #13#10 +
  '//  gra_mudeCorDaCaneta(COR_VERMELHA);' + #13#10 +
  '  star(100,100,50);' + #13#10 +
  'fim.';



const
  MAX_PROGS = 7;

var
  Exmpl: array [1..MAX_PROGS] of String;

  Names: array [1..MAX_PROGS] of String = (
    'olá.pac',
    'hilbert.pac',
    'mondrian.pac',
    'random_test.pac',
    'sierpinski.pac',
    'quick_sort.pac',
    'fractal_star.pac'
  );

procedure TFrmExamples.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to MAX_PROGS do
    ListBox1.Items.Add(Names[I]);
  ListBox1.ItemIndex := 0;
  Exmpl[1] := sHelloWorld;
  Exmpl[2] := sHilbert;
  Exmpl[3] := sMondrian;
  Exmpl[4] := sRandomTest;
  Exmpl[5] := sSierpinski;
  Exmpl[6] := sQuickSort;
  Exmpl[7] := sFractalStar;
  ListBox1Click(Self);
end;

procedure TFrmExamples.ListBox1Click(Sender: TObject);
var
  N: Integer;
  S, Prog: String;
begin
  S := '';
  if ListBox1.ItemIndex >= 0 then
  begin
    Prog := Exmpl[ListBox1.ItemIndex + 1];
    N := Pos(#13#10'program', Prog);
    S := Copy(Prog, 1, N - 1);
  end;
  Memo1.Text := S;
end;

function TFrmExamples.ProgramString: String;
begin
  Result := '';
  if ListBox1.ItemIndex >= 0 then
    Result := Exmpl[ListBox1.ItemIndex + 1];
end;

function TFrmExamples.ProgramName: String;
begin
  Result := '';
  if ListBox1.ItemIndex >= 0 then
    Result := ExtractFilePath(Application.ExeName) +
            Names[ListBox1.ItemIndex + 1];
end;

procedure TFrmExamples.FormShow(Sender: TObject);
begin
  ListBox1.ItemIndex := 0;
  FocusControl(ListBox1);
end;

end.
