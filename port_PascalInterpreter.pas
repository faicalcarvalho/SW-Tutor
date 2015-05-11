{
23/06/08:
  Desfiz alteração de inserir nos arrays a informação de tamanho
  (registrada em 12/05/06); há um bug que o diagrama da memória
  não mostra corretamente parâmetros var de tipo arranjo; ainda
  não sei a solução; o problema ocorre tanto com arranjos de
  uma dimensão como de múltiplas dimensões.

05/06/08:
  Implementei o procedimento novaJanela, que cria um novo form
  que pode então também ser usado como saída gráfica. Dentre as
  últimas alterações, está também a variável global Tela, que
  representa a paint box da tela principal do sw-tutor. Todas
  as rotinas de saída gráfica passaram a usar então, como primeiro
  argumento, a Tela ou então uma novaJanela.

10/01/08:
  Comecei uma série de alterações no nome das funções e
  principalmente na forma de escrever na tela, pois implementei
  um "double-buffer" de modo a facilitar o tratamento do evento
  "OnPaint". Agora os desenhos não mais desaparecem da tela, nem
  durante nem após a execução dos programas. Isto também foi uma
  observação feita pelo pessoal do CEFET.

16/08/07:
  Criei as funções txtParaReal e realParaTxt.
  A necessidade surgiu a partir de um exercício que a turma
  do CEFET está fazendo, dentro da experiência conduzida
  pelo prof. Dácio Guimarães.

12/05/06:
  Há uns dias, fiz a implementação de inserir nos arrays a
  informação de tamanho. Quando um array é alocado, no início
  da área de memória que ele ocupa há agora um valor inteiro
  (tipo Integer) que contém o tamanho do array, ou seja, o
  número de elementos. A idéia é abrir caminho para a implementação
  de parâmetros tipo "arranjo de T" e, na implementação da rotina,
  a função tamanho(x) retorna esse número de elementos.

16/03/06:
  Criei a função mat_potência(base, expoente).

21/02/06:
  Na criação de um quadro (frame), incluí o comando
    Bmp.Canvas.Brush.Color := clBtnFace; // ATENÇÃO - Mesma cor da propriedade
                                       // Color do componente PaintBox
  de modo que um quadro começa com um fundo semelhante ao da
  saída gráfica do \dsl.

14/02/06:
  Incluí janela de configuração das opções do ambiente; por
  enquanto, a única configuração é a lista de diretórios onde
  os módulos devem ser procurados, no processamento do comando
  'inclui'; Implementei também a respectiva alteração no
  comando 'inclui', de modo a pesquisar o módulo na lista de
  diretórios que pode estar configurada. Nesta implementação
  foram criados os módulos port_UFrmConfig.pas e port_UFrmPasta.

30/07/05:
  ATENÇÃO - Fiz um bocado de alterações sem registrar nesses
  comentários.
  Criei gra_estiqueQuadro e gra_quadroEstiqueQuadro.

03/07/05:
  Corrigi um problema no comando "caso". As constantes em
  TProd_MemberGroup não estavam sendo interpretadas durante
  a compilação e isto dava um erro na verificação de se o
  caso era repetido.

11/05/05:
  Alterei a avaliação de expressões lógicas, de modo a implementar
  o "curto-circuito", para os dois operadores, && e ||. Antes dessa
  alteração as expressões lógicas estavam sendo sempre avaliadas de
  forma completa, sem o "curto-circuito".

24/04/05:
  Corrigi bug TProduction.GetNewIdentifierList: identificadores iguais
  numa mesma lista estavam sendo permitidos.
  Corrigi pequeno bug em TProd_Procedure e TProd_Function: quando o nome
  da rotina estava sendo redeclarado, a mensagem de erro estava com
  informações erradas de nome, linha e coluna (estava pegando as do próximo
  token).

28/11/04:
  Acrescentei testes que verificam se a classe do argumento
  correspondente a parâmetro "var" é válida.
  Acrescentei testes que verificam a classe do argumento usado
  em "inc" e "dec".
  Acrescentei nova rotina do ambiente: evnt_mouseXY.

20/11/04:
  Alterei gra_mouseX e gra_mouseY para evnt_mouseX e evnt_mouseY,
  respectivamente.

22/09/04:
  Retirei a palavra "então" da sintaxe do comando "se".

  Retirei a palavra "faça" da sintaxe dos comandos "enquanto" e "para".

  Considerei ";" (ponto e vírgula) como um "comando" (Stmt):
  o caractere ";" foi incluído no Set_FirstStmt.

19/09/04:
  Implementei diferenciação entre maiúsculas e minúsculas.
  Pac-br passa a ser case-sensitive.

18/09/04:
  Alterei port_PasTokens de modo aos comentários serem entre /* e */.

  Incluí 'ponteiro' como palavra reservada. Declaração de ponteiro
  passa a ser: ponteiro para T, ao invés de ^T.

  Criei novo comando for (ForStmt_2), com sintaxe semelhante a C.
  Fiz parênteses serem obrigatórios nos comandos se, enquanto e
  no teste até do comando repita.

15/09/04:
  Voltei a usar o RichEdit ao invés do russo EdtPainter. Fico sem syntax
  highlight, mas sem bugs estranhos também.

  Alterei o port_PasTokens de modo a que os strings e caracteres fiquem
  delimitados por aspas duplas, ao invés das aspas simples (apóstrofos).
  Alterei também os exemplos, por causa disso.

  Alterei os strings das funções e procedimentos padrões, substituindo
  "dsl_" pelos prefixos "gra_", "mat_" e "evnt_". Alterei também os exemplos.

13/05/04:
  Alterei TProd_AssignStmt.Parse retirando o tratamento de atribuição
  ao nome da função (como no Pascal padrão). Agora, TProd_VarReference
  está sendo sempre "parsed". Para permitir o uso de uma função como uma
  referência opcionalmente qualificada (ou seja, seguida de . ou de ^),
  TProd_AssignStmt passou a ter o assinalamento opcional. Ficou mais
  simples fazer dessa forma, ao invés de alterar diretamente
  TProd_FunctionCall para incluir a qualificação opcional.
  Incluí um teste que, durante a interpretação, verifica se o comando
  RETORNE foi executado durante a execução de uma função.

12/02/04:
  Alterei a palavra reservada 'inclui' para 'inclua'. (Mexi no port_PasTokens
  e no componente EdtPainter).
  Acrescentei propriedade StandardModule na classe TSymbolInfo; alterei a
  forma de pesquisar por um símbolo na tabela de símbolos (TSymbolTable.Enter):
  passei a considerar que um símbolo só é encontrado se houve a prévia
  inclusão do respectivo módulo padrão.

11/02/04:
  Alterei o esquema do comando 'inclui': alguns módulos padrões são
  identificados de um modo especial: 'gra*', 'mat*', 'arq*' e 'evnt*'.
  Alterei os exemplos de modo a seguir o esquema de 'inclui'.

24/12/03:
  Alterei o código das teclas especiais: passei a usar valores pouco usados
  da parte inicial da tabela ASCII.

18/10/03:
  Incluí a rotina dsl_quadroCopieDeQuadro.

12/10/03:
  Alterei "EV_CLIC" para "EV_CLIQUE".

11/10/03:
  Corrigi um bug no evento EV_CLIC: ele não estava
  atualizando a posição do mouse.

17/07/03:
  Criei a rotina dsl_durma(milisegundos).

12/07/03:
  Criei as rotinas dsl_mudeIntervaloEventoTempo e
  dsl_intervaloEventoTempo.

11/07/03:
  Criei o evento EV_TAMANHO_TELA, que ocorre com o OnResize do
  painel que serve de base para a saída gráfica do DSL.
  Criei as rotinas dsl_larguraDaTela e dsl_alturaDaTela.

10/07/03:
  Alterei um pouco o esquema de eventos: passei o registro da
  posição de mouse para dentro do tratamento do evento (ou seja,
  o registro só ocorre se o programa estiver esperando pelo
  respectivo evento.

  Alterei também um "mais um" ou "menos um" relacionado com a
  cópia de quadro da tela ou para tela (o tom de dúvida é porque
  estou escrevendo no dia seguinte).

  Estas duas alterações combinadas resolveram um problema que
  havia no programa "PASTORALEMAO.PAS", que sempre deixava um
  "rastro" visível. O rastro foi totalmente eliminado.

20/04/03:
  No preenchimento inicial da tabela de símbolos, acrescentei
  identificadores de tipo cuja grafia com acento/til estava
  faltando: "lógico", "simOuNão", "não".

18/05/03:
  Criei a rotina VerifyDebug. Ela está sendo chamada no final
  da interpretação de chamada de procedimento e de função.
  O objetivo é fazer com que na execução passo a passo, o
  término da execução de uma rotina sempre passe pelo 'fim'
  do bloco da rotina. Esta rotina faz o que, até hoje, era
  feito exclusivamente na interpretação de TProd_Stmt.

  Alterei TProd_Stmt.Interpret, que passou a chamar a nova
  rotina, VerifyDebug.

  Em TProduction, criei as propriedades ProductionEndLine e
  ProductionEndCol, para facilitar a implementação descrita acima.
20/05/03:
  Passei a tratar o evento OnCustomOwnerDraw da listview que
  exibe o diagrama da memória, de modo a desenhar um pequeno
  bitmap quando o item corresponder a uma ativação de rotina.

21/05/03:
  Tentei usar a função GlobalMemoryStatus (no método CheckMemory
  de TProduction), mas não funcionou. Meu objetivo é detectar
  um loop recursivo (por exemplo) que esteja consumindo muita
  memória e interromper antes do crash. Mas, na forma como fiz,
  não deu certo. Se eu ativo um
    procedimento p; inicio p; fim;
  aparece, depois de um tempo, a mensagem Stack overflow.
  Comentei, então, CheckMemory e os pontos em que era chamado.

28/06/03:
  Alterei TProd_VarReference.Parse, incluindo no início um teste
  que confirma se o símbolo foi efetivamente declarado. Esta função
  é chamada de diferentes pontos, alguns testando isto antes de
  chamar a função, porém outros estão chamando sem fazer o teste.
}

unit port_PascalInterpreter;
{$POINTERMATH ON}

interface

uses
  Graphics, SysUtils, Classes, extctrls, port_PasTokens;

const
  MEM_ITENS_MAX = 10000;          // máximo de itens do diagrama da memória
  MEM_MEMO_SAIDA_MAX = 20000;     // máximo de caracteres na saída padrão
  MAX_RANGE = 10000;              // máximo de elementos num arranjo
  MAX_JANELAS = 10;               // máximo de janelas (forms)
  MAX_COMPONENTES = 500;          // máximo de componentes
  MAX_MPLAYERS = 40;              // máximo de media players
  MAX_TAM_JANELA = 1024;          // tamanho máximo para o bitmap da janela
  MAX_TAM_ARQ = 1024 * 1024 * 10; // tamanho máximo dos arquivos

  { Tipos de Eventos }
  EV_MOUSE_CLICK    = 1;    { $00000001 }
  EV_MOUSE_MOVE     = 2;    { $00000002 }
  EV_MOUSE_UP       = 4;    { $00000004 }
  EV_MOUSE_DOWN     = 8;    { $00000008 }
  EV_KEYBOARD       = 16;   { $00000010 }
  EV_TIME           = 32;   { $00000020 }
  EV_RESIZE         = 64;   { $00000040 }

  { Estados do mouse }
  EV_DIR = 1;
  EV_ESQ = 2;

  { Estados do teclado }
  EV_SHIFT = 1;
  EV_ALT = 2;
  EV_CTRL = 4;

  { Teclas especiais - vou usar códigos ASCII "pouco usados"; provavelmente,
    terei problemas no futuro; estou fazendo isso para permitir que o tratamento
    das teclas especiais seja igual ao das teclas normais }
  TECLA_INS       = Chr(1);
  TECLA_DEL       = Chr(2);
  TECLA_HOME      = Chr(3);
  TECLA_END       = Chr(4);
  TECLA_ESQUERDA  = Chr(5);
  TECLA_CIMA      = Chr(6);
  TECLA_DIREITA   = Chr(11);
  TECLA_BAIXO     = Chr(12);
  TECLA_PGUP      = Chr(14);
  TECLA_PGDN      = Chr(15);
  TECLA_F1        = Chr(16);
  TECLA_F2        = Chr(17);
  TECLA_F3        = Chr(18);
  TECLA_F4        = Chr(19);
  TECLA_F5        = Chr(20);
  TECLA_F6        = Chr(21);
  TECLA_F7        = Chr(22);
  TECLA_F8        = Chr(23);
  TECLA_F9        = Chr(24);
  TECLA_F10       = Chr(25);
  TECLA_F11       = Chr(28);
  TECLA_F12       = Chr(29);

  { estilos fonte }
  EF_NEGRITO    = 1;
  EF_ITALICO    = 2;
  EF_SUBLINHADO = 4;
  EF_RISCADO    = 8;

  RESULT_NAME     = 'result_2345632175694123546'; // um nome estranho

type
  { Events }

  TWriteEvent = procedure (Sender: TObject; S: String) of object;
  TReadIntegerEvent = procedure (Sender: TObject; var Value: Integer) of object;
  TReadRealEvent = procedure (Sender: TObject; var Value: Extended) of object;
  TReadStringEvent = procedure (Sender: TObject; var Value: String) of object;
  TReadCharEvent = procedure (Sender: TObject; var Value: Char) of object;
  TDebugEvent = procedure (Sender: TObject; Lin, Col: Integer;
    Parser: TPascalTokenizer) of object;
  TWaitForEvent = procedure (Sender: TObject; Events: Integer) of object;

  { TPascalInterpreter }

  TPascalInterpreter = class(TComponent)
  private
    C: Pointer; // TCompiler
    FGraphicImage: TImage;
    FCanvas: TCanvas;
    FFloatFormat: String;
    FOnReadChar: TReadCharEvent;
    FOnReadInteger: TReadIntegerEvent;
    FOnReadReal: TReadRealEvent;
    FOnReadString: TReadStringEvent;
    FOnWrite: TWriteEvent;
    FOnDebug: TDebugEvent;
    FOnWaitFor: TWaitForEvent;
    FBreakpointLine: Integer;
    FBreakpointFileName: String;
    FBreakOnNextStmt: Boolean;
    FProgramFile: String;
    procedure SetFloatFormat(const Value: String);
    procedure SetGraphicImage(const Value: TImage);
    procedure SetCanvas(const Value: TCanvas);
    procedure SetOnDebug(const Value: TDebugEvent);
    procedure SetOnReadChar(const Value: TReadCharEvent);
    procedure SetOnReadInteger(const Value: TReadIntegerEvent);
    procedure SetOnReadReal(const Value: TReadRealEvent);
    procedure SetOnReadString(const Value: TReadStringEvent);
    procedure SetOnWrite(const Value: TWriteEvent);
    procedure SetOnWaitFor(const Value: TWaitForEvent);
    procedure SetProgramFile(const Value: String);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Run(Source: TStrings; ProgramFileName: String);
    function Evaluate(Expression: String): String;
    procedure Stop;
    procedure SetBreakpoint(FileName: String; LineNumber: Integer);
    procedure BreakOnNextStatement;
    procedure RegisterMouseXY(X, Y: Integer);
    procedure RegisterLastEvent(Event: Integer; Sender: TObject);
    procedure RegisterShiftState(Shift: TShiftState);
    procedure RegisterKeyPressed(Key: Char);
    procedure RegisterKeyDown(Key: Word);
    procedure RegisterKeyUp(Key: Word);
    procedure TrataOnPaint(Sender: TObject);
  published
    property FloatFormat: String read FFloatFormat write SetFloatFormat;
    property GraphicImage: TImage read FGraphicImage
      write SetGraphicImage;
    property Canvas: TCanvas read FCanvas
      write SetCanvas;
    // events
    property OnWrite: TWriteEvent read FOnWrite
      write SetOnWrite;
    property OnReadChar: TReadCharEvent read FOnReadChar
      write SetOnReadChar;
    property OnReadInteger: TReadIntegerEvent read FOnReadInteger
      write SetOnReadInteger;
    property OnReadString: TReadStringEvent read FOnReadString
      write SetOnReadString;
    property OnReadReal: TReadRealEvent read FOnReadReal
      write SetOnReadReal;
    property OnDebug: TDebugEvent read FOnDebug
      write SetOnDebug;
    property OnWaitFor: TWaitForEvent read FOnWaitFor
      write SetOnWaitFor;
    property ProgramFile: String read FProgramFile
      write SetProgramFile;
  end;

  { TSymbolClass }

  TSymbolClass = (scConst, scType, scVar, scField, scPointer, scProcedure,
    scFunction, scVarParam);

resourcestring
  // Memory error and run-time errors
  sOutOfMemory = 'Memória insuficiente (OutOfMemory)';
  sHeapError = 'Memória insuficiente: erro na heap';
  sIndexOutOfRange = 'Indice inválido';
  sAssignmentOutOfRange = 'Atribuição inválida';
  sEvaluationError = 'Avaliação requer interpretação prévia';
  sFileNotFound = 'Arquivo ''%s'' não encontrado';
  sOutOfMemory80 = 'Execução interrompida devido ao excessivo consumo de memória';

  // Lexical errors
  sStringIncomplete = 'Texto incompleto';
  sUnexpectedEndOfSourceInComment = 'Fim de arquivo inesperado em um comentário';
  sPushBackError = 'Erro interno em PushBack';
  sInvalidRealNumber = 'Número real inválido';
  sInvalidIntNumber = 'Número inteiro inválido';
  sInvalidHexNumber = 'Número hexadecimal inválido';
  sInvalidControlString = 'Texto de controle inválido';

  // Syntax errors
  sValueNotAllowed = 'Valor não permitido';
  sIdentifierExpected = 'Identificador esperado';
  sTerminalExpected = '''%s'' esperado';
  sFileNameExpected = 'Nome de arquivo esperado';
//  sIntegerNumberExpected = 'Integer number expected';
  sIdentifierRedeclared = 'Identificador já declarado: ''%s''';
  sUndeclaredIdentifier = 'Identificador não declarado: ''%s''';
//  sIdentifierNotConst = '''%s'' is not a constant';
  sConstExpected = 'Constante esperada';
  sExpressionExpected = 'Expressão esperada';
  sStmtExpected = 'Comando esperado';
  sIncompatibleTypes = 'Tipos incompatíveis';
  sInvalidOperation = 'Operação inválida';
  sExecutionError = 'Erro de execução';
  sBoolExprExpected = 'Expressão lógica esperada';
  sIntExprExpected = 'Expressão inteira esperada';
  sRealVarExpected = 'Variável de tipo real esperada';
  sStringExprExpected = 'Expressão do tipo texto esperada';
  sToOrDownToExpected  = 'A ou DECR esperado';
  sUserBreak = 'Interrompido pelo usuário';
//  sSetSymbolValueError = 'Internal error in SetSymbolValue';
//  sSetAddressError = 'Internal error in SetAddress';
  sVarIdentExpected = 'Identificador de variável esperado';
  sTypeIdentExpected = 'Identificador de tipo esperado';
  sTypeExpected = 'Tipo esperado';
  sLowGTHigh = 'Limite inferior é maior que o limite superior';
  sIndiceInvalido = 'Tamanho especificado para o arranjo não é válido';
  sOrdinalTypeRequired = 'Tipo ordinal requerido';
  sSetsMayHave256 = 'Conjuntos podem ter até 256 elementos';
  sInvalidSetConstructor = 'Construtor de conjunto inválido';
  sInvalidIndexType = 'Tipo de índice inválido';
  sArrayTypeRequired = 'Tipo arranjo requerido';
  sRecordTypeRequired = 'Tipo registro requerido';
  sPointerTypeRequired = 'Tipo apontador requerido';
  sCheckPendentPointersError = 'Erro interno em CheckPendentPointers';
  sOperatorNotApplicable = 'Operador não aplicável a esse tipo de operando';
  sPromoteTo = 'Erro interno em PromoteTo';
//  sUnsatisfiedForward = 'Unsatisfied forward declaration';
  sDeclDiffers = 'Declaração de ''%s'' difere da declaração prévia';
  sNotEnoughActuals = 'Número insuficiente de argumentos';
  sWrongActual = 'Tipos dos argumentos e parâmetros var têm de ser idênticos';
  sWrongActual2 = 'Argumento não pode ser usado, pois o respectivo parâmetro está declarado como "var"';
  sTooManyActuals = 'Excesso de argumentos';
  sGetAddress = 'Erro interno em GetAddress';
  sSolveWith = 'Erro intero em SolveWithStmt';
//  sUnsolveVarParam = 'Internal error in UnsolveVarParam';
  sLeftSide = 'Lado esquerdo não pode ser atribuído';
  sDuplicateCase = 'Caso duplicado';
  sBreakOutsideLoop = 'QUEBRE fora de um comando repetitivo';
  sContinueOutsideLoop = 'CONTINUE fora de um comando repetitivo';
  sExitOutsideSubroutine = 'RETORNE fora de um bloco de sub-rotina';
  sSubroutineLevel = 'Esta versão não permite declaração de PROCEDIMENTO ou FUNÇÃO dentro de outra sub-rotina';
  sInvalidInteger = 'não é um número inteiro válido';
  sInvalidFloat = 'não é um número real válido';

  sFalhaInternaUltimoEvento = 'Falha interna no mecanismo de substituição de eventos';
  sFalhaArqTemp = 'Falha ao criar arquivo temporário';
  sFalhaToqSom = 'Falha ao tentar tocar o som especificado. Verifique por favor se o nome do som está correto';
  sFalhaToqSomExec = 'Falha ao tentar tocar o som especificado. Verifique por favor se o som especificado está correto';
  sCharTypeExpected = 'Expressão de tipo caractere esperada';
  sFrameTypeExpected = 'Expressão de tipo janela esperada';
  sFileTypeExpected = 'Expressão de tipo dsl_TipoArquivo esperada';
  sReaderTypeExpected = 'Expressão de tipo dsl_TipoLeitor esperada';
  sWriterTypeExpected = 'Expressão de tipo dsl_TipoEscritor esperada';
  sBadFileMode = 'Modo inválido especificado para um dsl_TipoArquivo';
  sFileNewFailed = 'Falha na execução de novoArquivo';
  sReaderHasCharFailed = 'Falha na execução de dsl_leitorTemCaractere';
  sReaderNextCharFailed = 'Falha na execução de dsl_leitorProximoCaractere';
  sWriterWriteCharFailed = 'Falha na execução de dsl_escritorEscrevaCaractere';
  sNoReturnExecutedInFunction = 'Função retornou sem executar o comando RETORNE';
  sDiagramaDaMemoriaCheio = 'Foi atingido o limite máximo de itens exibidos';
  sLimiteJanelasAtingido = 'Foi atingido o limite máximo de janelas que podem ser criadas';
  sLimiteComponentesAtingido = 'Foi atingido o limite máximo de componentes que podem ser criados';
  sLimiteMediaPlayersAtingido = 'Foi atingido o limite máximo de sons que podem ser criados';
  sMemoSaidaMax = 'Foi atingido o limite máximo de caracteres na saída padrão';
  sInvalidRange = 'Foi atingido o limite máximo permitido para o número de elementos num arranjo';
  sComponentTypeExpected = 'Expressão de tipo Componente esperada';
  sImagem = 'Imagem';
  sNaoEncontrada = 'não encontrada';
  sTamanhoJanelaMax = 'Tamanho inválido para as dimensões da janela';
  sArquivoNaoEncontrado = 'Erro ao tentar ler o arquivo';
  sVerifiqueNomeArq = 'Verifique por favor se o nome do arquivo está correto';
  sTamanhoArqInvalido = 'O tamanho do arquivo especificado é superior ao limite máximo permitido';
  sTamanhoTxtInvalido = 'O tamanho do texto especificado é superior ao limite máximo permitido';
  sErroGravandoArq = 'Houve uma falha ao tentar gravar o arquivo';

  // some standard procedures
  sRectangleProc = 'dsn_ret';
  sRectangleProc2 = 'dsn_ret';
  sTriangleProc = 'dsn_tri';
  sTriangleProc2 = 'dsn_tri';
  sEllipseProc = 'dsn_cir';
  sLineToProc = 'dsn_lin';
  sTextOutProc = 'dsn_txt';
  sAltPixel = 'alt_pixel';

  sMoveToProc = 'alt_pos_caneta';
  sSetPenColorProc = 'alt_cor_caneta';
  sSetPenWidthProc = 'alt_tam_caneta';

  sSetBrushColorProc = 'alt_cor_pincel';
  sSetBrushStyleProc = 'alt_estilo_pincel';

  sSetFontColorProc = 'alt_cor_fonte';
  sSetFontSizeProc = 'alt_tam_fonte';
  sSetFontNameProc = 'alt_nome_fonte';
  sSetFontStyleProc = 'alt_estilo_fonte';
  sTextWidth = 'obtLarguraTxt';
  sTextHeight = 'obtAlturaTxt';

  sWaitForProc = 'espere_por';

  sBreakProc = 'quebre';
  sContinueProc = 'continue';
  sExitProc = 'saia';
  sTerminateProc = 'termine';

  sCopyFrameProc = 'dsnQuadro';
  sFrameReadFromFileProc = 'leiaQuadroDeArq';
  sFrameDisposeProc = 'libQuadro';
  sFrameCopyFromScreenProc = 'copQuadroDaTela';
  sFrameCopyFromFrameProc = 'copQuadroDeQuadro';
  sFrameSetWidth = 'altDimQuadrogra_quadroMudeLargura';
  sFrameSetHeight = 'gra_quadroMudeAltura';
  sFrameRectangle = 'gra_quadroDesenheRetangulo';
  sFrameRectangle2 = 'gra_quadroDesenheRetângulo';
  sFrameEllipse = 'gra_quadroDesenheElipse';
  sFrameTriangle = 'gra_quadroDesenheTriangulo';
  sFrameTriangle2 = 'gra_quadroDesenheTriângulo';
  sFrameLineTo = 'gra_quadroDesenheLinha';
  sFrameMoveTo = 'gra_quadroMudeXY';
  sFramePenPosX = 'gra_quadroX';
  sFramePenPosY = 'gra_quadroY';
  sFrameTextOut = 'gra_quadroDesenheTexto';
  sFrameSetBrushColor = 'gra_quadroMudeCorDoPincel';
  sFrameBrushColor = 'gra_quadroCorDoPincel';
  sFrameSetPenColor = 'gra_quadroMudeCorDaCaneta';
  sFramePenColor = 'gra_quadroCorDaCaneta';
  sFrameSetPenWidth = 'gra_quadroMudeLarguraDaCaneta';
  sFramePenWidth = 'gra_quadroLarguraDaCaneta';
  sFrameSetFontColor = 'gra_quadroMudeCorDaFonte';
  sFrameFontColor = 'gra_quadroCorDaFonte';
  sFrameSetFontSize = 'gra_quadroMudeTamanhoDaFonte';
  sFrameFontSize = 'gra_quadroTamanhoDaFonte';
  sFrameSetFontName = 'gra_quadroMudeNomeDaFonte';
  sFrameFontName = 'gra_quadroNomeDaFonte';
  sFrameSetBrushStyle = 'gra_quadroMudeEstiloDoPincel';
  sFrameBrushStyle = 'gra_quadroEstiloDoPincel';
  sSetCopyMode = 'gra_mudeModoDeCopiar';
  sCopyMode = 'gra_modoDeCopiar';
  sFrameSetCopyMode = 'gra_quadroMudeModoDeCopiar';
  sFrameCopyMode = 'gra_quadroModoDeCopiar';

  sFrameTextWidth = 'gra_quadroLarguraDoTexto';
  sFrameTextHeight = 'gra_quadroAlturaDoTexto';
  sArc = 'dsn_arco';
  sFrameArc = 'dsn_arco';
  sChord = 'dsn_corte';
  sFrameChord = 'dsn_corte';                         // ok
  sPie = 'dsn_fatia';
  sFramePie = 'dsn_fatia';                           // ok
  sBezier = 'dsn_bezier';
  sFrameBezier = 'dsn_bezier';                       // ok
  sNow = 'agora';
  sFileExists = 'existe_arq';
  sFileNew = 'novo_arq';
  sFileDispose = 'lib_arq';
  sFileReader = 'arqLeitor';
  sFileWriter = 'arqEscritor';
  sFileNameComplete = 'arqNomeCompleto';
  sReaderHasChar = 'temCrt';
  sReaderNextChar = 'leitorProximoCaractere';
  sReaderNextChar2 = 'arq_leitorPróximoCaractere';
  sWriterWriteChar = 'arq_escritorEscrevaCaractere';
  sInc = 'inc';
  sDec = 'dec';
  sStretch = 'gra_estiqueQuadro';
  sFrameStretch = 'gra_quadroEstiqueQuadro';
  sFillRect = 'dsn_ret_cheio';
  sDsnLinSel = 'dsn_lin_sel';
  sDsnRetSel = 'dsn_ret_sel';

  // some standard functions
  sGetPenPosXFunc = 'obt_caneta_x';
  sGetPenPosYFunc = 'obt_caneta_y';
  sSqrtFunc = 'raiz';
  sLengthFunc = 'tamanho';
  sUpperCaseFunc = 'maiúscula';
  sUpperCaseFunc2 = 'maiúscula';
  sLowerCaseFunc = 'minúscula';
  sLowerCaseFunc2 = 'minúscula';
  sRoundFunc = 'arredonde';
  sSinFunc = 'sen';
  sCosFunc = 'cos';
  sRandomFunc = 'random';
  sPotencia = 'potência';
  sOrdFunc = 'crt_para_int';
  sChrFunc = 'int_para_crt';
  sIntToStrFunc = 'int_para_txt';
  sStrToIntFunc = 'txt_para_int';
  sCaracterEmFunc = 'caractere_em';
  sMouseXFunc = 'mouse_x';
  sMouseYFunc = 'mouse_y';
  sMouseXY = 'mouse_xy';
  sLastEventFunc = 'último_evento';
  sLastEventFunc2 = 'último_evento';
  sObtPixel = 'obt_pixel';
  sBrushColorFunc = 'obt_cor_pincel';
  sBrushStyleFunc = 'obt_estilo_pincel';
  sPenColorFunc = 'obt_cor_caneta';
  sPenWidthFunc = 'obt_tam_caneta';
  sFontColorFunc = 'obt_cor_fonte';
  sFontSizeFunc = 'obt_tam_fonte';
  sFontNameFunc = 'gra_nomeDaFonte';
  sBackgroundColorFunc = 'cor_do_fundo';
  sKeyPressedFunc = 'última_tecla';
  sNewFrameFunc = 'gra_quadroNovo';
  sFrameHeight = 'gra_quadroAltura';
  sFrameWidth = 'gra_quadroLargura';
  sColor = 'cor_rgb';
  sSetPenMode = 'alt_modo_caneta';
  sFrameSetPenMode = 'alt_modo_caneta';                   // ok
  sPenMode = 'obt_modo_caneta';
  sFramePenMode = 'obt_modo_caneta';                      // ok
  sSetPenStyle = 'alt_estilo_caneta';
  sFrameSetPenStyle = 'alt_estilo_caneta';                // ok
  sPenStyle = 'obt_estilo_caneta';
  sFramePenStyle = 'obt_estilo_caneta';                   // ok
  sScreenWidth = 'gra_larguraDaTela';
  sScreenHeight = 'gra_alturaDaTela';
  sSetTimeEventInterval = 'alt_ev_tempo';
  sTimeEventInterval = 'obt_ev_tempo';
  sSleep = 'durma';
  sMouseState = 'botão_mouse';
  sKeyboardState = 'estado_teclado';
  sDecodificaData = 'dcod_data';
  sDecodificaHora = 'dcod_hora';
  sCodificaData = 'cod_data';
  sCodificaHora = 'cod_hora';
  sFloatToStr = 'real_para_txt';
  sStrToFloat = 'txt_para_real';
  sNovaJanela = 'nova_janela';
  sAltVisJanela = 'alt_vis_janela';
  sToqSom = 'toq_som';
  sNovoBotao = 'novo_botão';
  sTstEvento = 'tstEvento';
  sNovoRotulo = 'novo_rótulo';
  sLibJanela = 'lib_janela';
  sAltPosJanela = 'alt_pos_janela';
  sCopImagem = 'cop_imagem';
  sCopImagemRet = 'cop_imagem_ret';
  sCopJanelaDist = 'cop_janela_dist';
  sCopJanelaDistRot = 'cop_janela_dist_rot';
  sCopJanelaRot = 'cop_janela_rot';
  sCrgImg = 'crg_img';
  sCrgJanela = 'crg_janela';
  sAltTamJanela = 'alt_tam_janela';
  sObtTamJanela = 'obt_tam_janela';
  sAltTxtJanela = 'alt_txt_janela';
  sObtTxtJanela = 'obt_txt_janela';
  sAltFonte = 'alt_fonte';
  sAltCor = 'alt_cor_janela';
  sNovoEdtLin = 'novo_editor_lin';
  sNovoEdtLinhas = 'novo_editor_txt';
  sNovaCxMarca = 'nova_caixa_marca';
  sNovaCxEscolha = 'nova_caixa_escolha';
  sNovaCxLst = 'nova_caixa_lista';
  sNovaCxCmb = 'nova_caixa_comb';
  sNovaCxGrupo = 'nova_caixa_grupo';
  sNovoPainel = 'novo_quadro';
  sNovaImagem = 'nova_imagem';
  sNovaImagemCrg = 'nova_imagem_crg';
  sNovoSom = 'novo_som';
  sObtPos = 'obt_pos_janela';
  sArqParaTxt = 'arq_para_txt';
  sTxtParaArq = 'txt_para_arq';
  sRegEvento = 'reg_evento';
  sCaixaMarcada = 'caixa_marcada';

procedure Register;

implementation

uses
  Types, UITypes, Forms, Windows, Dialogs, StdCtrls, Controls, Buttons, MPlayer,
  port_UFrmMemoria, port_UFrmDSL,
  g_Heap, port_RWStreams, port_UFrmConfig, port_UQuadro, Math, port_Recursos,
  port_UFrmJanela, UMeusComps, UCtrlMediaPlayers;

const
  CpModes: array [0..14] of Integer = (
    cmBlackness,
    cmDstInvert,
    cmMergeCopy,
    cmMergePaint,
    cmNotSrcCopy,
    cmNotSrcErase,
    cmPatCopy,
    cmPatInvert,
    cmPatPaint,
    cmSrcAnd,
    cmSrcCopy,
    cmSrcErase,
    cmSrcInvert,
    cmSrcPaint,
    cmWhiteness
  );

  PenModes: array [0..15] of TPenMode = (
    pmBlack,
    pmWhite,
    pmNop,
    pmNot,
    pmCopy,
    pmNotCopy,
    pmMergePenNot,
    pmMaskPenNot,
    pmMergeNotPen,
    pmMaskNotPen,
    pmMerge,
    pmNotMerge,
    pmMask,
    pmNotMask,
    pmXor,
    pmNotXor
  );

  { Módulos padrões }
  MODL_GRA = 'gra*';
  MODL_ARQ = 'arq*';
  MODL_EVNT = 'evnt*';
  MODL_MAT = 'mat*';
  MODL_PAC = 'pac*';
  MODL_MM = 'mm*';

type
  { Forwards }

  TCompiler = class;
  TProduction = class;
  TSymbolTable = class;
  TSymbolType = class;
  TSymbolInfo = class;
  TProd_Procedure = class;
  TProd_Function = class;
  TProd_FunctionCall = class;
  TProd_FormalParamList = class;
  TProd_Expression = class;
  TProd_SimpleExpression = class;
  TProd_Term = class;
  TProd_Factor = class;
  TProd_Stmt = class;

  { TTypeClass }

  TSymbolTypeClass = class of TSymbolType;

  { TTypeClass }

  TTypeClass = (tcInteger, tcBoolean, tcChar, tcEnum, tcSubrange, tcExtended,
                tcString, tcSet, tcArray, tcRecord, tcPointer, tcProcedure,
                tcFunction);

  { TSymbolType }

  TSymbolType = class
  private
    FSymbolTable: TSymbolTable;
    FTypeClass: TTypeClass;
    function GetSize: Integer; virtual; abstract;
    function GetAsString: String; virtual; abstract;
  public
    constructor Create(SymbolTable: TSymbolTable); virtual;
    procedure Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction); virtual; abstract;
    function ValueAsString(V: TSymbolInfo): String; virtual; abstract;
    function ValueThroughAddress(Address: Pointer): String; virtual; abstract;
    property Size: Integer read GetSize;
    property SymbolTable: TSymbolTable read FSymbolTable;
    property AsString: String read GetAsString;
    property TypeClass: TTypeClass read FTypeClass;
  end;

  { TOrdinalType }

  TOrdinalType = class(TSymbolType)
  private
    function GetRange: Integer; virtual; abstract;
    function GetMinValue: Integer; virtual; abstract;
    function GetMaxValue: Integer; virtual; abstract;
  public
    function OrdinalValue(V: TSymbolInfo): Integer; virtual; abstract;
    property Range: Integer read GetRange;
    property MinValue: Integer read GetMinValue;
    property MaxValue: Integer read GetMaxValue;
  end;

  { TIntegerType }

  TIntegerType = class(TOrdinalType)
  private
    function GetSize: Integer; override;
    function GetAsString: String; override;
    function GetRange: Integer; override;
    function GetMinValue: Integer; override;
    function GetMaxValue: Integer; override;
  public
    constructor Create(SymbolTable: TSymbolTable); override;
    function ValueAsString(V: TSymbolInfo): String; override;
    function ValueThroughAddress(Address: Pointer): String; override;
    procedure Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction); override;
    function OrdinalValue(V: TSymbolInfo): Integer; override;
  end;

  { TBooleanType }

  TBooleanType = class(TOrdinalType)
  private
    function GetSize: Integer; override;
    function GetAsString: String; override;
    function GetRange: Integer; override;
    function GetMinValue: Integer; override;
    function GetMaxValue: Integer; override;
  public
    constructor Create(SymbolTable: TSymbolTable); override;
    function ValueAsString(V: TSymbolInfo): String; override;
    function ValueThroughAddress(Address: Pointer): String; override;
    procedure Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction); override;
    function OrdinalValue(V: TSymbolInfo): Integer; override;
  end;

  { TExtendedType }

  TExtendedType = class(TSymbolType)
  public
    constructor Create(SymbolTable: TSymbolTable); override;
    function ValueAsString(V: TSymbolInfo): String; override;
    function ValueThroughAddress(Address: Pointer): String; override;
    procedure Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction); override;
  private
    function GetSize: Integer; override;
    function GetAsString: String; override;
  end;

  { TStringType }

  TStringType = class(TSymbolType)
  public
    constructor Create(SymbolTable: TSymbolTable); override;
    function ValueAsString(V: TSymbolInfo): String; override;
    function ValueThroughAddress(Address: Pointer): String; override;
    procedure Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction); override;
  private
    function GetSize: Integer; override;
    function GetAsString: String; override;
  end;

  { TCharType }

  TCharType = class(TOrdinalType)
  private
    function GetSize: Integer; override;
    function GetAsString: String; override;
    function GetRange: Integer; override;
    function GetMinValue: Integer; override;
    function GetMaxValue: Integer; override;
  public
    constructor Create(SymbolTable: TSymbolTable); override;
    function ValueAsString(V: TSymbolInfo): String; override;
    function ValueThroughAddress(Address: Pointer): String; override;
    procedure Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction); override;
    function OrdinalValue(V: TSymbolInfo): Integer; override;
  end;

  { TEnumType }

  TEnumType = class(TOrdinalType)
  private
    FEnums: TList;
    function GetSize: Integer; override;
    function GetAsString: String; override;
    function GetRange: Integer; override;
    function GetMinValue: Integer; override;
    function GetMaxValue: Integer; override;
  public
    constructor Create(SymbolTable: TSymbolTable); override;
    destructor Destroy; override;
    function ValueAsString(V: TSymbolInfo): String; override;
    function ValueThroughAddress(Address: Pointer): String; override;
    procedure Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction); override;
    function OrdinalValue(V: TSymbolInfo): Integer; override;
  end;

  { TSubrangeType }

  TSubrangeType = class(TOrdinalType)
  private
    FInf: TSymbolInfo;
    FSup: TSymbolInfo;
    FBaseType: TSymbolType;
    function GetSize: Integer; override;
    function GetAsString: String; override;
    function GetRange: Integer; override;
    function GetMinValue: Integer; override;
    function GetMaxValue: Integer; override;
  public
    constructor Create(SymbolTable: TSymbolTable); override;
    function ValueAsString(V: TSymbolInfo): String; override;
    function ValueThroughAddress(Address: Pointer): String; override;
    procedure Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction); override;
    function OrdinalValue(V: TSymbolInfo): Integer; override;
  end;

  { TSetType }

  TSetType = class(TSymbolType)
  public
    constructor Create(SymbolTable: TSymbolTable); override;
    function ValueAsString(V: TSymbolInfo): String; override;
    function ValueThroughAddress(Address: Pointer): String; override;
    procedure Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction); override;
  private
    FBaseType: TSymbolType;
    function GetSize: Integer; override;
    function GetAsString: String; override;
  end;

  { TArrayType }

  TArrayType = class(TSymbolType)
  public
    constructor Create(SymbolTable: TSymbolTable); override;
    function ValueAsString(V: TSymbolInfo): String; override;
    function ValueThroughAddress(Address: Pointer): String; override;
    procedure Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction); override;
  private
    FElemSymbol: TSymbolInfo;
    FIndexSymbol: TSymbolInfo;
    function GetSize: Integer; override;
    function GetAsString: String; override;
  end;

  { TRecordType }

  TRecordType = class(TSymbolType)
  public
    constructor Create(SymbolTable: TSymbolTable); override;
    destructor Destroy; override;
    function ValueAsString(V: TSymbolInfo): String; override;
    function ValueThroughAddress(Address: Pointer): String; override;
    procedure Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction); override;
  private
    FFieldList: TList;
    FSize: Integer;
    FScope: TSymbolTable;
    function GetSize: Integer; override;
    function GetAsString: String; override;
  end;

  { TPointerType }

  TPointerType = class(TSymbolType)
  public
    constructor Create(SymbolTable: TSymbolTable); override;
    function ValueAsString(V: TSymbolInfo): String; override;
    function ValueThroughAddress(Address: Pointer): String; override;
    procedure Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction); override;
  private
    FBaseType: TSymbolType;
    FBaseId: String; // for solving pending base type
    function GetSize: Integer; override;
    function GetAsString: String; override;
  end;

  { TProcedureType }

  TProcedureType = class(TSymbolType)
  public
    constructor Create(SymbolTable: TSymbolTable); override;
    function ValueAsString(V: TSymbolInfo): String; override;
    function ValueThroughAddress(Address: Pointer): String; override;
  private
    FProduction: TProd_Procedure;
    function GetSize: Integer; override;
    function GetAsString: String; override;
  end;

  { TFunctionType }

  TFunctionType = class(TSymbolType)
  public
    constructor Create(SymbolTable: TSymbolTable); override;
    function ValueAsString(V: TSymbolInfo): String; override;
    function ValueThroughAddress(Address: Pointer): String; override;
  private
    FProduction: TProd_Function;
    function GetSize: Integer; override;
    function GetAsString: String; override;
  end;

  { Set types }
  TSetInteger = set of 0..255;

  { Pointers }

  PBoolean = ^Boolean;
  PExtended = ^Extended;
  PInteger = ^Integer;
  PPointer = ^Pointer;
  PSetInteger = ^TSetInteger;

  { TSymbolInfo }

  TSymbolInfo = class
  private
    FSymbolClass: TSymbolClass;
    FSymbolTable: TSymbolTable;
    FSymbolType: TSymbolType;
    FOffset: Integer;
    FStandardModule: String;
//    FNameIndex: Integer;
    FName: String;
    FRecordType: TSymbolType; // only for fields
    function GetAsString: String; virtual;
    function GetAddress: Pointer;
    function GetVarParamAddress: Pointer;
  public
    constructor Create(SymbolTable: TSymbolTable; SymbolClass: TSymbolClass;
      SymbolType: TSymbolType);
    procedure Assign(Value: TSymbolInfo);
    property AsString: String read GetAsString;
    property Address: Pointer read GetAddress;
    property VarParamAddress: Pointer read GetVarParamAddress;
    property SymbolClass: TSymbolClass read FSymbolClass;
    property SymbolType: TSymbolType read FSymbolType;
    property SymbolOffset: Integer read FOffset;
    property SymbolTable: TSymbolTable read FSymbolTable;
    property RecordType: TSymbolType read FRecordType write FRecordType;
    property Name: String read FName {GetName};
    property StandardModule: String read FStandardModule write FStandardModule;
  end;

  { TSymbolTable }

  TSymbolTable = class
  private
    FCompiler: TCompiler;
    FConstOffset: Integer;
    FVarOffset: Integer;
    FConstArea: Pointer;
    FVarArea: TList;
    FTable: TStringList;
    FNewTables: TList;
    FInfos: TList;
    FTypes: TList;
    FScope: TList;
    FIsRecordScope: Boolean;
    FPendentPointer: TList; // of TProd_TypeDecl
    FForwards: TList; // of TProd_Procedure and TProd_Function
  public
    constructor Create(Compiler: TCompiler);
    destructor Destroy; override;
    procedure AddScope(SymbolTable: TSymbolTable);
    procedure SetActivation;
    procedure LibActivation;
    procedure ShowMemCleared;
    procedure ShowMemActivation;
    procedure MarkAsPointer(VAddr: Integer);
    procedure ChangeAddress(OldAddr, NewAddr: Integer);
    procedure UpdateVarParam(VAddr: Integer; Value: String);
    procedure ShowSubroutineCall(Name: String);
    procedure ShowSubroutineReturn;
    procedure ShowMemArray(VName: String; VType: TSymbolType; VAddr: Integer;
      Global: Boolean);
    procedure ShowMemRecord(VName: String; VType: TSymbolType; VAddr: Integer;
      Global: Boolean);
    procedure ShowMem(VName: String; VType: TSymbolType; VAddr: Integer;
      Global: Boolean);
    procedure DisposeArray(VType: TSymbolType; VAddr: Integer);
    procedure DisposeRecord(VType: TSymbolType; VAddr: Integer);
    procedure DisposeHeap(VType: TSymbolType; VAddr: Integer);
    procedure UpdateMem(VType: TSymbolType; VAddr: Integer);
    procedure UpdateMemArray(VType: TSymbolType; VAddr: Integer);
    procedure UpdateMemRecord(VType: TSymbolType; VAddr: Integer);
    function AllocSymbolInfo(SymbolClass: TSymbolClass;
      SymbolType: TSymbolType): TSymbolInfo;
    function AllocType(TypeClass: TSymbolTypeClass): TSymbolType;
    function FindSymbol(Name: String): TSymbolInfo;
    function Enter(Name: String; SymbolClass: TSymbolClass;
      SymbolType: TSymbolType; StdModule: String): TSymbolInfo;
    function NewSymbolTable: TSymbolTable;
    function DuplicateSymbolInfo(Symbol: TSymbolInfo): TSymbolInfo;
    procedure RemoveScope;
    procedure ShowTable(S: TStrings);
    procedure CheckPendentPointers;
    procedure AddPendentPointer(P: TProduction);
    procedure AddForward(P: TProduction);
//    procedure CheckForwards;
    function LookForForward(Id: String): TProduction;
    procedure InitArraySize(Mem: Pointer);
    class function SizeOfArraySize: Integer;
    property IsRecordScope: Boolean read FIsRecordScope write FIsRecordScope;
    property Compiler: TCompiler read FCompiler;
  end;

  EBreakException = class(EInterpreterException);
  EContinueException = class(EInterpreterException);
  EExitException = class(EInterpreterException);

  { TProductionClass }

  TProductionClass = class of TProduction;

  { TCompilerState }

  TCompilerState = (csInProcedure, csInFunction, csFindInScope, csInRepetitiveStmt,
    csInTypeDecl, csEvaluating, csBreakOnNextStmt, csInArrayDecl);
  TCompilerStates = set of TCompilerState;

  { TCompiler }

  TCompiler = class
  private
    FDeclTypeInteger: TSymbolType;
    FDeclTypeExtended: TSymbolType;
    FDeclTypeBoolean: TSymbolType;
    FDeclTypeString: TSymbolType;
    FDeclTypeChar: TSymbolType;
    FDeclTypePointer: TSymbolType;
    FOnWrite: TWriteEvent;
    FOnReadChar: TReadCharEvent;
    FOnReadInteger: TReadIntegerEvent;
    FOnReadString: TReadStringEvent;
    FOnReadReal: TReadRealEvent;
    FOnDebug: TDebugEvent;
    FOnWaitFor: TWaitForEvent;
    FParser: TPascalTokenizer;
    FSymbolTable: TSymbolTable;
    FSource: TStream;
    FParserStack: TList;
    FIncludeList: TStringList;
    FModlList: TStringList;
    FProduction: TProduction;
    FTerminate: Boolean;
    FState: TCompilerStates;
    FFloatFormat: String;
    FProgramName: String;
    FHeap: THeap;
    FCanvas: TCanvas;
    FProgramSymbolTable: TSymbolTable;
    FSubroutineSymbolTable: TSymbolTable;
    FBreakPointLine: Integer;
    FBreakpointFileName: String;
    FMouseX: Integer;
    FMouseY: Integer;
    FLastEvent: Integer;
    FLastEventSender: TObject;
    FShiftState: TShiftState;
    FKeyPressed: Char;
    FKeyDown: Word;
    FKeyUp: Word;
    FBitmapList: TList;
    FStreamList: TList;
    FTQuadroList: TList;
    FTMediaPlayerList: TList;
//    FCompList: TList;
    FTela: TQuadro;
    procedure InitializeSymbolTable;
    procedure DestroyBitmaps;
    procedure DestroyStreams;
    procedure DestroyTQuadroList;
    procedure DestroyTMediaPlayerList;
//    procedure DestroyCompList;
  public
    constructor Create;
    destructor Destroy; override;
    function Compile(Source: TStream;
      ProductionClass: TProductionClass): TProduction; overload;
    function Compile(Source: String;
      ProductionClass: TProductionClass): TProduction; overload;
    procedure Interpret;
    function Evaluate(Expression: String): String;
    procedure Stop;
    procedure Error(S: String);
    procedure ShowSyntaxTree(S: TStrings);
    procedure ShowSymbolTable(S: TStrings);
    procedure SetProgramSymbolTable(T: TSymbolTable);
    function SetSubroutineSymbolTable(T: TSymbolTable): TSymbolTable;
    function FindSymbol(Symbol: String): TSymbolInfo;
    procedure SetBreakpoint(FileName: String; LineNumber: Integer);
    procedure BreakOnNextStatement;
    procedure RegisterMouseXY(X, Y: Integer);
    procedure RegisterLastEvent(Event: Integer; Sender: TObject);
    procedure RegisterShiftState(Shift: TShiftState);
    procedure RegisterKeyPressed(Key: Char);
    procedure RegisterKeyDown(Key: Word);
    procedure RegisterKeyUp(Key: Word);
    procedure PushStream(FileName: String);
    procedure PushStringStream(S: String);
    procedure PopStream;
    procedure TrataOnPaint(Sender: TObject);
    procedure TrataOnClickBotao(Sender: TObject);
    procedure TrataOnMouseDownBotao(Sender: TObject; Button: TMouseButton;
                                    Shift: TShiftState; X, Y: Integer);
    procedure TrataOnMouseUpBotao(Sender: TObject; Button: TMouseButton;
                                    Shift: TShiftState; X, Y: Integer);
    property Parser: TPascalTokenizer read FParser;
    property Source: TStream read FSource;
    property SymbolTable: TSymbolTable read FSymbolTable;
    property DeclTypeInteger: TSymbolType read FDeclTypeInteger;
    property DeclTypeExtended: TSymbolType read FDeclTypeExtended;
    property DeclTypeBoolean: TSymbolType read FDeclTypeBoolean;
    property DeclTypeString: TSymbolType read FDeclTypeString;
    property DeclTypeChar: TSymbolType read FDeclTypeChar;
    property DeclTypePointer: TSymbolType read FDeclTypePointer;
    property State: TCompilerStates read FState write FState;
    property FloatFormat: String read FFloatFormat write FFloatFormat;
    property ProgramName: String read FProgramName write FProgramName;
    property Heap: THeap read FHeap;
    property Canvas: TCanvas read FCanvas
      write FCanvas;
    // events
    property OnWrite: TWriteEvent read FOnWrite
      write FOnWrite;
    property OnReadChar: TReadCharEvent read FOnReadChar
      write FOnReadChar;
    property OnReadInteger: TReadIntegerEvent read FOnReadInteger
      write FOnReadInteger;
    property OnReadString: TReadStringEvent read FOnReadString
      write FOnReadString;
    property OnReadReal: TReadRealEvent read FOnReadReal
      write FOnReadReal;
    property OnDebug: TDebugEvent read FOnDebug
      write FOnDebug;
    property OnWaitFor: TWaitForEvent read FOnWaitFor
      write FOnWaitFor;
  end;

  { TProduction }

  TProduction = class
  private
    FLevel: Integer;
    FProdLst: TList;
    FCompiler: TCompiler;
    FParent: TProduction;
    FPosition: Integer;
    FProductionLine: Integer;
    FProductionCol: Integer;
    FProductionEndLine: Integer;
    FProductionEndCol: Integer;
    FParser: TPascalTokenizer;
    FSymbolTable: TSymbolTable;
    FSymbolInfo: TSymbolInfo;
    FPromoted: TSymbolInfo;
    function GetProductions(Ind: Integer): TProduction;
    function GetProductionCount: Integer;
    function EstiloFonteParaInt(Fs: TFontStyles): Integer;
    function IntParaEstiloFonte(V: Integer): TFontStyles;
    function CarregaImg(Img: TImage; Nome: String): Boolean;
    function CarregaBmp(Bmp: Graphics.TBitmap; Nome: String): Boolean;
(*
    procedure PreparaTransfDistRot(Canvas: TCanvas; Rot: Extended; x, y: Integer);
    procedure RestauraTransfDistRot(Canvas: TCanvas);
*)
    function ExpandeNomeArq(Nome: String): String;
    function FileStreamToString(Fs: TFileStream): String;
    function GetParser: TPascalTokenizer;
  protected
    constructor Create(Compiler: TCompiler); virtual;
    procedure Operate(Result, S1, S2: TSymbolInfo; Op: TToken);
    function Compile(ProductionClass: TProductionClass): TProduction;
    procedure Check(Tokens: TTokens; ErrMsg: String);
    function CheckTypes(T1, T2: TSymbolType; Op: TToken): TSymbolType;
    procedure Error(S: String; Line, Col: Integer);
    function GetIdentifier: String;
    function GetNewIdentifier: String;
    procedure GetNewIdentifierList(Lst: TStringList);
//    function GetIntNumber: Integer;
    procedure GetTerminal(Token: TToken);
    procedure CheckTerminal(Token: TToken);
    function GetSymbolInfo: TSymbolInfo; virtual;
    procedure SkipTo(Tokens: TTokens);
    function PromoteTo(T: TSymbolType): Boolean; virtual;
    function ExecPromotion: Boolean; virtual;
    function FormalParamsOk(PFirst, PSecond: TProd_FormalParamList): Boolean;
    procedure ReplaceSymbolInfo(SiOld, SiNew: TSymbolInfo);
    function StandardProcedure(ProcName: String): Boolean;
    procedure VerifyDebug(Lin, Col: Integer; Parser: TPascalTokenizer);
    function IsStandardModule(FileName: String): Boolean;
//    procedure CheckMemory;

    property Level: Integer read FLevel;
    property Parent: TProduction read FParent;
    property Position: Integer read FPosition;
    property ProductionLine: Integer read FProductionLine;
    property ProductionCol: Integer read FProductionCol;
    property ProductionEndLine: Integer read FProductionEndLine;
    property ProductionEndCol: Integer read FProductionEndCol;
    property Parser: TPascalTokenizer read GetParser;
    property SymbolTable: TSymbolTable read FSymbolTable;
    property SymbolInfo: TSymbolInfo read FSymbolInfo write FSymbolInfo;
    property Promoted: TSymbolInfo read FPromoted write FPromoted;
  public
    destructor Destroy; override;
    procedure Parse; virtual; abstract;
    procedure Interpret; virtual;
    procedure ShowSyntaxTree(S: TStrings);
    function SolveWithStmt(P: TProduction; Symbol: TSymbolInfo): TSymbolInfo;
    property Compiler: TCompiler read FCompiler;
    property Productions[Ind: Integer]: TProduction
      read GetProductions; default;
    property ProductionCount: Integer
      read GetProductionCount;
  end;

  { TProd_Program }

  TProd_Program = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_Block }

  TProd_Block = class(TProduction)
  private
    FCompoundStmt: TProduction;
  public
    procedure Parse; override;
    procedure Interpret; override;
  end;

  { TProd_FormalParamList }

  TProd_FormalParamList = class(TProduction)
  private
    FParamLst: TList;
  public
    destructor Destroy; override;
    procedure Parse; override;
  end;

  { TProd_ParamDecl }

  TProd_ParamDecl = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_Procedure }

  TProd_Procedure = class(TProduction)
  private
    FBlock: TProduction;
    FParams: TProd_FormalParamList;
    FSymbolTable: TSymbolTable;
    FProcId: String;
  public
    procedure Parse; override;
    property ProcId: String read FProcId;
  end;

  { TProd_Function }

  TProd_Function = class(TProduction)
  private
    FBlock: TProduction;
    FParams: TProd_FormalParamList;
    FSymbolTable: TSymbolTable;
    FFuncId: String;
    FReturnType: TSymbolType;
    FSiResult: TSymbolInfo;
  public
    procedure Parse; override;
    property FuncId: String read FFuncId;
  end;

  { TProd_DeclPart }

  TProd_DeclPart = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_ConstDeclPart }

  TProd_ConstDeclPart = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_ConstDecl }

  TProd_ConstDecl = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_TypeDeclPart }

  TProd_TypeDeclPart = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_TypeDecl }

  TProd_TypeDecl = class(TProduction)
  private
    // both are for pending base type of pointers
    FBaseTypeId: String;
    FTypeId: String;
  public
    procedure Parse; override;
  end;

  { TProd_VarDeclPart }

  TProd_VarDeclPart = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_VarDecl }

  TProd_VarDecl = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_Type }

  TProd_Type = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_IncludeDecl }

  TProd_IncludeDecl = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_EnumType }

  TProd_EnumType = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_SubrangeType }

  TProd_SubrangeType = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_SetType }

  TProd_SetType = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_ArrayType }

  TProd_ArrayType = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_IndexType }

  TProd_IndexType = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_RecordType }

  TProd_RecordType = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_PointerType }

  TProd_PointerType = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_SetConstructor }

(*
  TProd_SetConstructor = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;
*)

  { TProd_MemberGroup }

  TProd_MemberGroup = class(TProduction)
  private
    FExprInf, FExprSup: TProd_Expression;
    function IsConst: Boolean;
    function InRange(Si: TSymbolInfo): Boolean;
    function InfSymbol: TSymbolInfo;
    function SupSymbol: TSymbolInfo;
  public
(*
    procedure Interpret; override;
*)
    procedure Parse; override;
  end;

  { TProd_QualifIndex }

  TProd_QualifIndex = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_QualifField }

  TProd_QualifField = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_QualifPointer }

  TProd_QualifPointer = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_ParamType }

  TProd_ParamType = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_VarReference }

  TProd_VarReference = class(TProduction)
  private
    FVarRef: TSymbolInfo;
    FWith: TSymbolInfo;
    FFieldOffset: Integer;
    FFuncCall: TProd_FunctionCall;
    FIsLValue: Boolean;
    FQualified: Boolean;
  public
    procedure Parse; override;
    procedure Interpret; override;
  end;

  { TProd_Expression }

  TProd_Expression = class(TProduction)
  private
    FSimpleExpr1: TProduction;
    FSimpleExpr2: TProduction;
    FRelOp: TToken;
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_SimpleExpression }

  TProd_SimpleExpression = class(TProduction)
  private
    FLstAddOp: TList;
  public
    constructor Create(Compiler: TCompiler); override;
    destructor Destroy; override;
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Term }

  TProd_Term = class(TProduction)
  private
    FLstMulOp: TList;
  public
    constructor Create(Compiler: TCompiler); override;
    destructor Destroy; override;
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Factor }

  TProd_Factor = class(TProduction)
  private
    FExpr: TProduction;
    FFact: TProduction;
    FSetExpr: TProduction;
    FVarRef: TProduction;
    FFuncCall: TProduction;
    FNegate: Boolean;
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Expression }

  TProd_ConstExpression = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_CompoundStmt }

  TProd_CompoundStmt = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_Stmt }

  TProd_Stmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_AssignStmt }

  TProd_AssignStmt = class(TProduction)
  private
    FIsAssignment: Boolean;
    FIsIncrDecr: Boolean;
    FTokIncrDecr: TToken;
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_PreAssignStmt }

  TProd_PreAssignStmt = class(TProduction)
  private
    FTokIncrDecr: TToken;
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_IfStmt }

  TProd_IfStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TCaseSelector }

  TCaseSelector = class
  private
    FLstMember: TList;
    FLstStmt: TList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddEntry(E: TProd_MemberGroup);
    procedure SetStmt(Stmt: TProd_Stmt);
    function TestCase(Si: TSymbolInfo): Boolean;
  end;

  { TProd_CaseStmt }

  TProd_CaseStmt = class(TProduction)
  private
    FCaseSel: TCaseSelector; // cases part
    FElseStmt: TProd_Stmt; // else part
  public
    destructor Destroy; override;
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_CaseEntry }

  TProd_CaseEntry = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_WhileStmt }

  TProd_WhileStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_RepeatStmt }

  TProd_RepeatStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_ForStmt }

  TProd_ForStmt = class(TProduction)
  private
    FExpr1: TProduction;
    FExpr2: TProduction;
    FStmt: TProduction;
    FDownTo: Boolean;
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  TProd_ForStmt_2 = class(TProduction)
  private
    FStmt1: TProduction;
    FExpr: TProduction;
    FStmt2: TProduction;
    FStmt: TProduction;
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_WithStmt }

  TProd_WithStmt = class(TProduction)
  private
    FRecordLst: TList; // of TProduction (record var references)
    FStmt: TProduction;
  public
    procedure Interpret; override;
    procedure Parse; override;
    destructor Destroy; override;
  end;

  { TProd_WriteStmt }

  TProd_WriteStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_WritelnStmt }

  TProd_WritelnStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_ReadStmt }

  TProd_ReadStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_NewStmt }

  TProd_NewStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_DisposeStmt }

  TProd_DisposeStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_ProcedureCall }

  TProd_ProcedureCall = class(TProduction)
  private
    FProcId: String;
  public
    procedure Parse; override;
    procedure Interpret; override;
    property ProcId: String read FProcId;
  end;

  { TProd_RectangleStmt }

  TProd_RectangleStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_DsnRetSel }

  TProd_DsnRetSel = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FillRect }

  TProd_FillRect = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_dsnLinSel }

  TProd_dsnLinSel = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_CopyFrameStmt }

  TProd_CopyFrameStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Stretch }

  TProd_Stretch = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameStretch }

  TProd_FrameStretch = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_TerminateStmt }

  TProd_TerminateStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_TriangleStmt }

  TProd_TriangleStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_EllipseStmt }

  TProd_EllipseStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_LineToStmt }

  TProd_LineToStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_MoveToStmt }

  TProd_MoveToStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_altPixel }

  TProd_altPixel = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_TextOutStmt }

  TProd_TextOutStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_SetBrushColorStmt }

  TProd_SetBrushColorStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_SetPenColorStmt }

  TProd_SetPenColorStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_SetPenWidthStmt }

  TProd_SetPenWidthStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_TextHeight }

  TProd_TextHeight = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_TextWidth }

  TProd_TextWidth = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameTextHeight }

  TProd_FrameTextHeight = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameTextWidth }

  TProd_FrameTextWidth = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_WriterWriteChar }

  TProd_WriterWriteChar = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_caixa_marcada }

  TProd_caixa_marcada = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_ReaderHasChar }

  TProd_ReaderHasChar = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_ReaderNextChar }

  TProd_ReaderNextChar = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_SetFontColorStmt }

  TProd_SetFontColorStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_SetBrushStyleStmt }

  TProd_SetBrushStyleStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_SetCopyMode }

  TProd_SetCopyMode = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameSetCopyMode }

  TProd_FrameSetCopyMode = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_CopyMode }

  TProd_CopyMode = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameCopyMode - dsl_quadroModoDeCopiar }

  TProd_FrameCopyMode = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_SetPenMode }

  TProd_SetPenMode = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameSetPenMode }

  TProd_FrameSetPenMode = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_PenMode }

  TProd_PenMode = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FramePenMode }

  TProd_FramePenMode = class(TProduction)
  public
(*
    procedure Interpret; override;
*)
    procedure Parse; override;
  end;

  { TProd_SetPenStyle }

  TProd_SetPenStyle = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameSetPenStyle }

  TProd_FrameSetPenStyle = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_PenStyle }

  TProd_PenStyle = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FramePenStyle }

  TProd_FramePenStyle = class(TProduction)
  public
(*
    procedure Interpret; override;
*)
    procedure Parse; override;
  end;

  { TProd_Arc - dsl_arco }

  TProd_Arc = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameArc - dsl_quadroArco }

  TProd_FrameArc = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Chord - dsl_corte }

  TProd_Chord = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameChord - dsl_quadroCorte }

  TProd_FrameChord = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Pie - dsl_fatia }

  TProd_Pie = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FramePie - dsl_quadroFatia }

  TProd_FramePie = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Bezier - dsl_bezier }

  TProd_Bezier = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameBezier - dsl_quadroBezier }

  TProd_FrameBezier = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_BackgroundColor }

  TProd_BackgroundColor = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_BrushStyle }

  TProd_BrushStyle = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_SetFontSizeStmt }

  TProd_SetFontSizeStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_SetFontNameStmt }

  TProd_SetFontNameStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_SetFontStyleStmt }

  TProd_SetFontStyleStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_toqSom }

  TProd_toqSom = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_WaitForStmt }

  TProd_WaitForStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_BreakStmt }

  TProd_BreakStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_ContinueStmt }

  TProd_ContinueStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_ReturnStmt }

  TProd_ReturnStmt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_GetPenPosX }

  TProd_GetPenPosX = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_GetPenPosY }

  TProd_GetPenPosY = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Sqrt }

  TProd_Sqrt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Length }

  TProd_Length = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_obtPixel }

  TProd_obtPixel = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameSetBrushColor - dsl_quadroMudeCorDoPincel }

  TProd_FrameSetBrushColor = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameSetBrushStyle - dsl_quadroMudeEstiloDoPincel }

  TProd_FrameSetBrushStyle = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameSetPenColor - dsl_quadroMudeCorDaCaneta }

  TProd_FrameSetPenColor = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameSetPenWidth - dsl_quadroMudeLarguraDaCaneta }

  TProd_FrameSetPenWidth = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameSetFontColor - dsl_quadroMudeCorDaFonte }

  TProd_FrameSetFontColor = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameSetFontSize - dsl_quadroMudeTamanhoDaFonte }

  TProd_FrameSetFontSize = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameSetFontName - dsl_quadroMudeNomeDaFonte }

  TProd_FrameSetFontName = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameRectangle - dsl_quadroRetangulo }

  TProd_FrameRectangle = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameEllipse - dsl_quadroElipse }

  TProd_FrameEllipse = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameTriangle - dsl_quadroTriangulo }

  TProd_FrameTriangle = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_SetTimeEventInterval - dsl_mudeIntervaloEventoTempo }

  TProd_SetTimeEventInterval = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Sleep - dsl_durma }

  TProd_Sleep = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameHeight - dsl_quadroAltura }

  TProd_FrameHeight = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameWidth - dsl_quadroLargura }

  TProd_FrameWidth = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameSetWidth - dsl_quadroMudeLargura }

  TProd_FrameSetWidth = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameSetHeight - dsl_quadroMudeAltura }

  TProd_FrameSetHeight = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameLineTo - dsl_quadroLinha }

  TProd_FrameLineTo = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameMoveTo - dsl_quadroMudeXY }

  TProd_FrameMoveTo = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Color - dsl_cor }

  TProd_Color = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Now - tpoAgora }

  TProd_Now = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FileExists - dsl_arquivoExiste }

  TProd_FileExists = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FileNameComplete - dsl_arquivoNomeCompleto }

  TProd_FileNameComplete = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FileNew - dsl_arquivoNovo }

  TProd_FileNew = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FileDispose - dsl_arquivoLibere }

  TProd_FileDispose = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FileReader - dsl_arquivoLeitor }

  TProd_FileReader = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FileWriter - dsl_arquivoEscritor }

  TProd_FileWriter = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FramePenPosX - dsl_quadroX }

  TProd_FramePenPosX = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FramePenPosY - dsl_quadroY }

  TProd_FramePenPosY = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameBrushColor - dsl_quadroCorDoPincel }

  TProd_FrameBrushColor = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameBrushStyle - dsl_quadroEstiloDoPincel }

  TProd_FrameBrushStyle = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FramePenColor - dsl_quadroCorDaCaneta }

  TProd_FramePenColor = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FramePenWidth - dsl_quadroLarguraDaCaneta }

  TProd_FramePenWidth = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameFontColor - dsl_quadroCorDaFonte }

  TProd_FrameFontColor = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameFontSize - dsl_quadroTamanhoDaFonte }

  TProd_FrameFontSize = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameFontName }

  TProd_FrameFontName = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_TimeEventInterval - dsl_intervaloEventoTempo }

  TProd_TimeEventInterval = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_ScreenWidth - dsl_larguraDaTela }

  TProd_ScreenWidth = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_ScreenHeight - dsl_alturaDaTela }

  TProd_ScreenHeight = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_UpperCase }

  TProd_UpperCase = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_LowerCase }

  TProd_LowerCase = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Round }

  TProd_Round = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Sin }

  TProd_Sin = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Cos }

  TProd_Cos = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FunctionCall }

  TProd_FunctionCall = class(TProduction)
  private
    FFuncSymbol: TSymbolInfo;
    FFuncId: String;
  public
    procedure Parse; override;
    procedure Interpret; override;
    property FuncId: String read FFuncId;
  end;

  { TProd_Random }

  TProd_Random = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Potencia }

  TProd_Potencia = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Ord }

  TProd_Ord = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Chr }

  TProd_Chr = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_IntToStr }

  TProd_IntToStr = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FloatToStr }

  TProd_FloatToStr = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_StrToInt }

  TProd_StrToInt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_StrToFloat }

  TProd_StrToFloat = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_CharAt }

  TProd_CharAt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameReadFromFile }

  TProd_FrameReadFromFile = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameTextOut }

  TProd_FrameTextOut = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameCopyFromScreen }

  TProd_FrameCopyFromScreen = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FrameCopyFromFrame }

  TProd_FrameCopyFromFrame = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_MouseX }

  TProd_MouseX = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_MouseY }

  TProd_MouseY = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_MouseXY }

  TProd_MouseXY = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_BrushColor }

  TProd_BrushColor = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_PenColor }

  TProd_PenColor = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_PenWidth }

  TProd_PenWidth = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FontColor }

  TProd_FontColor = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FontSize }

  TProd_FontSize = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FontName }

  TProd_FontName = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_LastEvent }

  TProd_LastEvent = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_reg_evento }

  TProd_reg_evento = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_KeyPressed }

  TProd_KeyPressed = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_MouseState }

  TProd_MouseState = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_KeyboardState }

  TProd_KeyboardState = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_NewFrame (dsl_quadroNovo) }

  TProd_NewFrame = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_novaJanela }

  TProd_novaJanela = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_altVisJanela }

  TProd_altVisJanela = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_novoBotao }

  TProd_novoBotao = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_novoRotulo }

  TProd_novoRotulo = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_nova_imagem }

  TProd_nova_imagem = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_novoEdtLin }

  TProd_novoEdtLin = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_novaCxMarca }

  TProd_novaCxMarca = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_novaCxEscolha }

  TProd_novaCxEscolha = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_novaCxLst }

  TProd_novaCxLst = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_novaCxCmb }

  TProd_novaCxCmb = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_novaCxGrupo }

  TProd_novaCxGrupo = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_novoPainel }

  TProd_novoPainel = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_novaImagem }

  TProd_novaImagem = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_novaImagemCrg }

  TProd_novaImagemCrg = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_novo_som }

  TProd_novo_som = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_novoEdtLinhas }

  TProd_novoEdtLinhas = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_libJanela }

  TProd_libJanela = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_altPosJanela }

  TProd_altPosJanela = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_copJanela }

  TProd_copJanela = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_copJanelaRet }

  TProd_copJanelaRet = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_copJanelaDist }

  TProd_copJanelaDist = class(TProduction)
  public
(*
    procedure Interpret; override;
*)
    procedure Parse; override;
  end;

  { TProd_copJanelaDistRot }

  TProd_copJanelaDistRot = class(TProduction)
  public
(*
    procedure Interpret; override;
*)
    procedure Parse; override;
  end;

  { TProd_copJanelaRot }

  TProd_copJanelaRot = class(TProduction)
  public
//    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_crgImg }

  TProd_crgImg = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_crgJanela }

  TProd_crgJanela = class(TProduction)
  public
(*
    procedure Interpret; override;
*)
    procedure Parse; override;
  end;

  { TProd_obtPos }

  TProd_obtPos = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_altTamJanela }

  TProd_altTamJanela = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_obtTamJanela }

  TProd_obtTamJanela = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_altTxtJanela }

  TProd_altTxtJanela = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

(*
  { TProd_altFonte }

  TProd_altFonte = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;
*)

  { TProd_altCor }

  TProd_altCor = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_tstEvento }

  TProd_tstEvento = class(TProduction)
  public
(*
    procedure Interpret; override;
*)
    procedure Parse; override;
  end;

  { TProd_FrameDispose (dsl_quadroLibere) }

  TProd_FrameDispose = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_arqParaTxt }

  TProd_arqParaTxt = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_txtParaArq }

  TProd_txtParaArq = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_FunctionAssign }

  TProd_FunctionAssign = class(TProduction)
  public
    procedure Parse; override;
  end;

  { TProd_Inc }

  TProd_Inc = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_Dec }

  TProd_Dec = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_DecodificaData }

  TProd_DecodificaData = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_DecodificaHora }

  TProd_DecodificaHora = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_CodificaData }

  TProd_CodificaData = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_CodificaHora }

  TProd_CodificaHora = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;

  { TProd_obt_txt_janela }

  TProd_obt_txt_janela = class(TProduction)
  public
    procedure Interpret; override;
    procedure Parse; override;
  end;


const
  BUFSIZE = 16384;

  // minimum and maximum defaults for heap size
  Default_Heap_Min = 1024 * 1024;
  Default_Heap_Max = 16 * Default_Heap_Min;

const
  MAX_PROCS = 179;
  Procs: array [0..MAX_PROCS] of String = (
    sSetPenMode,
    sPenMode,
    sFrameSetPenMode,             // ok
    sFramePenMode,                // ok
    sSetPenStyle,
    sPenStyle,
    sFrameSetPenStyle,            // ok
    sFramePenStyle,               // ok
    sWriterWriteChar,
    sReaderNextChar,
    sReaderNextChar2,
    sReaderHasChar,
    sFileReader,
    sFileWriter,
    sFileDispose,
    sFileNew,
    sFileExists,
    sFileNameComplete,
    sNow,
    sFrameBezier,
    sFrameBezier,
    sFramePie,
    sFramePie,                          // ok
    sFrameChord,
    sFrameChord,                        // ok
    sArc,
    sFrameArc,
    sTextWidth,
    sTextHeight,
    sFrameTextWidth,
    sFrameTextHeight,
    sColor,
    sFrameSetCopyMode,
    sFrameCopyMode,
    sCopyMode,
    sSetCopyMode,
    sFrameBrushStyle,
    sFrameSetBrushStyle,
    sFrameFontName,
    sFrameSetFontName,
    sFrameFontSize,
    sFrameSetFontSize,
    sFrameFontColor,
    sFrameSetFontColor,
    sFramePenWidth,
    sFrameSetPenWidth,
    sFramePenColor,
    sFrameSetPenColor,
    sFrameBrushColor,
    sFrameSetBrushColor,
    sFrameTextOut,
    sFramePenPosX,
    sFramePenPosY,
    sFrameMoveTo,
    sFrameLineTo,
    sFrameTriangle,
    sFrameTriangle2,
    sFrameEllipse,
    sFrameRectangle,
    sFrameRectangle2,
    sFrameSetWidth,
    sFrameSetHeight,
    sFrameWidth,
    sFrameHeight,
    sAltPixel,
    sObtPixel,
    sFrameCopyFromScreenProc,
    sFrameCopyFromFrameProc,
    sFrameDisposeProc,
    sFrameReadFromFileProc,
    sNewFrameFunc,
    sKeyPressedFunc,
    sBackgroundColorFunc,
    sSetBrushStyleProc,
    sBrushStyleFunc,
    sFontNameFunc,
    sFontSizeFunc,
    sFontColorFunc,
    sPenWidthFunc,
    sPenColorFunc,
    sBrushColorFunc,
    sAltPixel,
    sObtPixel,
    sLastEventFunc,
    sLastEventFunc2,
    sMouseXFunc,
    sMouseYFunc,
    sMouseXY,
    sWaitForProc,
    sRectangleProc,
    sRectangleProc2,
    sTriangleProc,
    sTriangleProc2,
    sEllipseProc,
    sLineToProc,
    sMoveToProc,
    sTextOutProc,
    sSetBrushColorProc,
    sSetPenColorProc,
    sSetPenWidthProc,
    sSetFontColorProc,
    sSetFontSizeProc,
    sSetFontNameProc,
    sSetFontStyleProc,
    sBreakProc,
    sContinueProc,
    sTerminateProc,
    sCopyFrameProc,
    sSqrtFunc,
    sLengthFunc,
    sUpperCaseFunc,
    sUpperCaseFunc2,
    sLowerCaseFunc,
    sLowerCaseFunc2,
    sRoundFunc,
    sSinFunc,
    sCosFunc,
    sGetPenPosXFunc,
    sGetPenPosYFunc,
    sRandomFunc,
    sOrdFunc,
    sChrFunc,
    sIntToStrFunc,
    sStrToIntFunc,
    sCaracterEmFunc,
    sScreenWidth,
    sScreenHeight,
    sSetTimeEventInterval,
    sTimeEventInterval,
    sSleep,
    sInc,
    sDec,
    sMouseState,
    sKeyboardState,
    sDecodificaData,
    sDecodificaHora,
    sCodificaData,
    sCodificaHora,
    sStretch,
    sFrameStretch,
    sPotencia,
    sFloatToStr,
    sStrToFloat,
    sNovaJanela,
    sToqSom,
    sNovoBotao,
    sTstEvento,
    sNovoRotulo,
    sLibJanela,
    sAltPosJanela,
    sAltTamJanela,
    sAltTxtJanela,
//    sAltFonte,
    sAltCor,
    sNovoEdtLin,
    sNovoEdtLinhas,
    sNovaCxMarca,
    sNovaCxEscolha,
    sNovaCxLst,
    sNovaCxCmb,
    sNovaCxGrupo,
    sNovoPainel,
    sNovaImagem,
    sNovaImagemCrg,
    sNovoSom,
    sCopImagem,
    sCopJanelaDist,
    sCopJanelaDistRot,
    sAltVisJanela,
    sCrgImg,
    sCrgJanela,
    sObtTamJanela,
    sCopImagemRet,
    sArqParaTxt,
    sTxtParaArq,
    sFillRect,
    sDsnLinSel,
    sRegEvento,
    sObtTxtJanela,
    sCaixaMarcada,
    sDsnRetSel
    );

  Prods: array [0..MAX_PROCS] of TProductionClass = (
    TProd_FrameSetPenMode,
    TProd_FramePenMode,
    TProd_FrameSetPenMode,
    TProd_FramePenMode,
    TProd_FrameSetPenStyle,
    TProd_FramePenStyle,
    TProd_FrameSetPenStyle,
    TProd_FramePenStyle,
    TProd_WriterWriteChar,
    TProd_ReaderNextChar,
    TProd_ReaderNextChar,
    TProd_ReaderHasChar,
    TProd_FileReader,
    TProd_FileWriter,
    TProd_FileDispose,
    TProd_FileNew,
    TProd_FileExists,
    TProd_FileNameComplete,
    TProd_Now,
    TProd_FrameBezier,
    TProd_FrameBezier,
    TProd_FramePie,
    TProd_FramePie,
    TProd_FrameChord,
    TProd_FrameChord,
    TProd_FrameArc,
    TProd_FrameArc,
    TProd_TextWidth,
    TProd_TextHeight,
    TProd_FrameTextWidth,
    TProd_FrameTextHeight,
    TProd_Color,
    TProd_FrameSetCopyMode,
    TProd_FrameCopyMode,
    TProd_CopyMode,
    TProd_SetCopyMode,
    TProd_FrameBrushStyle,
    TProd_FrameSetBrushStyle,
    TProd_FrameFontName,
    TProd_FrameSetFontName,
    TProd_FrameFontSize,
    TProd_FrameSetFontSize,
    TProd_FrameFontColor,
    TProd_FrameSetFontColor,
    TProd_FramePenWidth,
    TProd_FrameSetPenWidth,
    TProd_FramePenColor,
    TProd_FrameSetPenColor,
    TProd_FrameBrushColor,
    TProd_FrameSetBrushColor,
    TProd_FrameTextOut,
    TProd_FramePenPosX,
    TProd_FramePenPosY,
    TProd_FrameMoveTo,
    TProd_FrameLineTo,
    TProd_FrameTriangle,
    TProd_FrameTriangle,
    TProd_FrameEllipse,
    TProd_FrameRectangle,
    TProd_FrameRectangle,
    TProd_FrameSetWidth,
    TProd_FrameSetHeight,
    TProd_FrameWidth,
    TProd_FrameHeight,
    TProd_AltPixel,
    TProd_ObtPixel,
    TProd_FrameCopyFromScreen,
    TProd_FrameCopyFromFrame,
    TProd_FrameDispose,
    TProd_FrameReadFromFile,
    TProd_NewFrame,
    TProd_KeyPressed,
    TProd_BackgroundColor,
    TProd_SetBrushStyleStmt,
    TProd_BrushStyle,
    TProd_FontName,
    TProd_FontSize,
    TProd_FontColor,
    TProd_PenWidth,
    TProd_PenColor,
    TProd_BrushColor,
    TProd_AltPixel,
    TProd_ObtPixel,
    TProd_LastEvent,
    TProd_LastEvent,
    TProd_MouseX,
    TProd_MouseY,
    TProd_MouseXY,
    TProd_WaitForStmt,
    TProd_RectangleStmt,
    TProd_RectangleStmt,
    TProd_TriangleStmt,
    TProd_TriangleStmt,
    TProd_EllipseStmt,
    TProd_LineToStmt,
    TProd_MoveToStmt,
    TProd_TextOutStmt,
    TProd_SetBrushColorStmt,
    TProd_SetPenColorStmt,
    TProd_SetPenWidthStmt,
    TProd_SetFontColorStmt,
    TProd_SetFontSizeStmt,
    TProd_SetFontNameStmt,
    TProd_SetFontStyleStmt,
    TProd_BreakStmt,
    TProd_ContinueStmt,
    TProd_TerminateStmt,
    TProd_CopyFrameStmt,
    TProd_Sqrt,
    TProd_Length,
    TProd_UpperCase,
    TProd_UpperCase,
    TProd_LowerCase,
    TProd_LowerCase,
    TProd_Round,
    TProd_Sin,
    TProd_Cos,
    TProd_GetPenPosX,
    TProd_GetPenPosY,
    TProd_Random,
    TProd_Ord,
    TProd_Chr,
    TProd_IntToStr,
    TProd_StrToInt,
    TProd_CharAt,
    TProd_ScreenWidth,
    TProd_ScreenHeight,
    TProd_SetTimeEventInterval,
    TProd_TimeEventInterval,
    TProd_Sleep,
    TProd_Inc,
    TProd_Dec,
    TProd_MouseState,
    TProd_KeyboardState,
    TProd_DecodificaData,
    TProd_DecodificaHora,
    TProd_CodificaData,
    TProd_CodificaHora,
    TProd_Stretch,
    TProd_FrameStretch,
    TProd_Potencia,
    TProd_FloatToStr,
    TProd_StrToFloat,
    TProd_novaJanela,
    TProd_toqSom,
    TProd_novoBotao,
    TProd_tstEvento,
    TProd_novoRotulo,
    TProd_libJanela,
    TProd_altPosJanela,
    TProd_altTamJanela,
    TProd_altTxtJanela,
//    TProd_altFonte,
    TProd_altCor,
    TProd_novoEdtLin,
    TProd_novoEdtLinhas,
    TProd_novaCxMarca,
    TProd_novaCxEscolha,
    TProd_novaCxLst,
    TProd_novaCxCmb,
    TProd_novaCxGrupo,
    TProd_novoPainel,
    TProd_novaImagem,
    TProd_novaImagemCrg,
    TProd_novo_som,
    TProd_copJanela,
    TProd_copJanelaDist,
    TProd_copJanelaDistRot,
    TProd_altVisJanela,
    TProd_crgImg,
    TProd_crgJanela,
    TProd_obtTamJanela,
    TProd_copJanelaRet,
    TProd_arqParaTxt,
    TProd_txtParaArq,
    TProd_FillRect,
    TProd_DsnLinSel,
    TProd_reg_evento,
    TProd_obt_txt_janela,
    TProd_caixa_marcada,
    TProd_DsnRetSel
    );

  Modls: array [0..MAX_PROCS] of String = (
    MODL_GRA, // sSetPenMode,
    MODL_GRA, // sPenMode,
    MODL_GRA, // sFrameSetPenMode,
    MODL_GRA, // sFramePenMode,
    MODL_GRA, // sSetPenStyle,
    MODL_GRA, // sPenStyle,
    MODL_GRA, // sFrameSetPenStyle,
    MODL_GRA, // sFramePenStyle,
    MODL_ARQ, // sWriterWriteChar,
    MODL_ARQ, // sReaderNextChar,
    MODL_ARQ, // sReaderNextChar2,
    MODL_ARQ, // sReaderHasChar,
    MODL_ARQ, // sFileReader,
    MODL_ARQ, // sFileWriter,
    MODL_ARQ, // sFileDispose,
    MODL_ARQ, // sFileNew,
    MODL_ARQ, // sFileExists,
    MODL_ARQ, // sFileNameComplete,
    MODL_PAC, // sNow,
    MODL_GRA, // sBezier,
    MODL_GRA, // sFrameBezier,
    MODL_GRA, // sPie,
    MODL_GRA, // sFramePie,
    MODL_GRA, // sChord,
    MODL_GRA, // sFrameChord,
    MODL_GRA, // sArc,
    MODL_GRA, // sFrameArc,
    MODL_GRA, // sTextWidth,
    MODL_GRA, // sTextHeight,
    MODL_GRA, // sFrameTextWidth,
    MODL_GRA, // sFrameTextHeight,
    MODL_GRA, // sColor,
    MODL_GRA, // sFrameSetCopyMode,
    MODL_GRA, // sFrameCopyMode,
    MODL_GRA, // sCopyMode,
    MODL_GRA, // sSetCopyMode,
    MODL_GRA, // sFrameBrushStyle,
    MODL_GRA, // sFrameSetBrushStyle,
    MODL_GRA, // sFrameFontName,
    MODL_GRA, // sFrameSetFontName,
    MODL_GRA, //     sFrameFontSize,
    MODL_GRA, //     sFrameSetFontSize,
    MODL_GRA, //     sFrameFontColor,
    MODL_GRA, //     sFrameSetFontColor,
    MODL_GRA, //     sFramePenWidth,
    MODL_GRA, //     sFrameSetPenWidth,
    MODL_GRA, //     sFramePenColor,
    MODL_GRA, //     sFrameSetPenColor,
    MODL_GRA, //     sFrameBrushColor,
    MODL_GRA, //     sFrameSetBrushColor,
    MODL_GRA, //     sFrameTextOut,
    MODL_GRA, //     sFramePenPosX,
    MODL_GRA, //     sFramePenPosY,
    MODL_GRA, //     sFrameMoveTo,
    MODL_GRA, //     sFrameLineTo,
    MODL_GRA, //     sFrameTriangle,
    MODL_GRA, //     sFrameTriangle2,
    MODL_GRA, //     sFrameEllipse,
    MODL_GRA, //     sFrameRectangle,
    MODL_GRA, //     sFrameRectangle2,
    MODL_GRA, //     sFrameSetWidth,
    MODL_GRA, //     sFrameSetHeight,
    MODL_GRA, //     sFrameWidth,
    MODL_GRA, //     sFrameHeight,
    MODL_GRA, //     sAltPixel,
    MODL_GRA, //     sObtPixel,
    MODL_GRA, //     sFrameCopyFromScreenProc,
    MODL_GRA, //     sFrameCopyFromFrameProc,
    MODL_GRA, //     sFrameDisposeProc,
    MODL_GRA, //     sFrameReadFromFileProc,
    MODL_GRA, //     sNewFrameFunc,
    MODL_EVNT, //     sKeyPressedFunc,
    MODL_GRA, // sBackgroundColorFunc,
    MODL_GRA, //     sSetBrushStyleProc,
    MODL_GRA, //     sBrushStyleFunc,
    MODL_GRA, //     sFontNameFunc,
    MODL_GRA, //     sFontSizeFunc,
    MODL_GRA, //     sFontColorFunc,
    MODL_GRA, //     sPenWidthFunc,
    MODL_GRA, //     sPenColorFunc,
    MODL_GRA, //     sBrushColorFunc,
    MODL_GRA, //     sAltPixel,
    MODL_GRA, //     sObtPixel,
    MODL_EVNT, //     sLastEventFunc,
    MODL_EVNT, //     sLastEventFunc2,
    MODL_EVNT, //     sMouseXFunc,
    MODL_EVNT, //     sMouseYFunc,
    MODL_EVNT, //     sMouseXY,
    MODL_EVNT, //     sWaitForProc,
    MODL_GRA, //     sRectangleProc,
    MODL_GRA, //     sRectangleProc2,
    MODL_GRA, //     sTriangleProc,
    MODL_GRA, //     sTriangleProc2,
    MODL_GRA, //     sEllipseProc,
    MODL_GRA, //     sLineToProc,
    MODL_GRA, //     sMoveToProc,
    MODL_GRA, //     sTextOutProc,
    MODL_GRA, //     sSetBrushColorProc,
    MODL_GRA, //     sSetPenColorProc,
    MODL_GRA, //     sSetPenWidthProc,
    MODL_GRA, //     sSetFontColorProc,
    MODL_GRA, //     sSetFontSizeProc,
    MODL_GRA, //     sSetFontNameProc,
    MODL_GRA, //     sSetFontStyleProc
    MODL_PAC, //     sBreakProc,
    MODL_PAC, //     sContinueProc,
    MODL_PAC, //     sTerminateProc,
    MODL_GRA, //     sCopyFrameProc,
    MODL_MAT, //     sSqrtFunc,
    MODL_PAC, //     sLengthFunc,
    MODL_PAC, //     sUpperCaseFunc,
    MODL_PAC, //     sUpperCaseFunc2,
    MODL_PAC, //     sLowerCaseFunc,
    MODL_PAC, //     sLowerCaseFunc2,
    MODL_MAT, //     sRoundFunc,
    MODL_MAT, //     sSinFunc,
    MODL_MAT, //     sCosFunc,
    MODL_GRA, //     sGetPenPosXFunc,
    MODL_GRA, //     sGetPenPosYFunc,
    MODL_MAT, //     sRandomFunc,
    MODL_PAC, //     sOrdFunc,
    MODL_PAC, //     sChrFunc,
    MODL_PAC, //     sIntToStrFunc,
    MODL_PAC, //     sStrToIntFunc,
    MODL_PAC, //     sCaracterEmFunc,
    MODL_GRA, //     sScreenWidth,
    MODL_GRA, //     sScreenHeight,
    MODL_EVNT, //    sSetTimeEventInterval,
    MODL_EVNT, //    sTimeEventInterval,
    MODL_EVNT, //    sSleep
    MODL_PAC, //     sInc
    MODL_PAC, //     sDec
    MODL_EVNT, //    sMouseState
    MODL_EVNT, //    sKeyboardState
    MODL_PAC, //    sDecodificaData
    MODL_PAC, //    sDecodificaHora
    MODL_PAC, //    sCodificaData
    MODL_PAC, //    sCodificaHora
    MODL_GRA, //     sStretch
    MODL_GRA, //     sFrameStretch
    MODL_MAT, //     sPotencia
    MODL_PAC, //     sFloatToStr
    MODL_PAC, //     sStroToFloat
    MODL_GRA, //     sNovaJanela
    MODL_MM,  //     sToqSom
    MODL_GRA, //     sNovoBotao
    MODL_EVNT,//     sTstEvento
    MODL_GRA, //     sNovoRotulo
    MODL_GRA, //     sLibJanela
    MODL_GRA, //     sAltPosJanela
    MODL_GRA, //     sAltTamJanela
    MODL_GRA, //     sAltTxtJanela
//    MODL_GRA, //     sAltFonte
    MODL_GRA, //     sAltCor
    MODL_GRA, //     sNovoEdtLin
    MODL_GRA, //     sNovoEdtLinhas
    MODL_GRA, //     sNovaCxMarca
    MODL_GRA, //     sNovaCxEscolha
    MODL_GRA, //     sNovaCxLst
    MODL_GRA, //     sNovaCxCmb
    MODL_GRA, //     sNovaCxGrupo
    MODL_GRA, //     sNovoPainel
    MODL_GRA, //     sNovaImagem
    MODL_GRA, //     sNovaImagemCrg
    MODL_MM,  //     sNovoSom
    MODL_GRA, //     sCopImagem
    MODL_GRA, //     sCopJanelaDist
    MODL_GRA, //     sCopJanelaDistRot
    MODL_GRA, //     sAltVisJanela
    MODL_GRA, //     sCrgImg
    MODL_GRA, //     sCrgJanela
    MODL_GRA, //     sObtTamJanela
    MODL_GRA, //     sCopImagemRet
    MODL_ARQ, //     sArqParaTxt
    MODL_ARQ, //     sTxtParaArq
    MODL_GRA, //     sFillRect
    MODL_GRA, //     sDsnLinSel
    MODL_EVNT, //    sRegEvento
    MODL_GRA, //     sObtTxtJanela
    MODL_GRA, //     sCaixaMarcada
    MODL_GRA  //     sDsnRetSel
    );


{ TSymbolType }

constructor TSymbolType.Create(SymbolTable: TSymbolTable);
begin
  FSymbolTable := SymbolTable;
end;

{ TIntegerType }

constructor TIntegerType.Create(SymbolTable: TSymbolTable);
begin
  inherited Create(SymbolTable);
  FTypeClass := tcInteger;
end;

function TIntegerType.GetSize: Integer;
begin
  Result := SizeOf(Integer);
end;

function TIntegerType.GetAsString: String;
begin
  Result := 'inteiro';
end;

function TIntegerType.ValueAsString(V: TSymbolInfo): String;
begin
  Result := IntToStr(PInteger(V.Address)^);
end;

function TIntegerType.ValueThroughAddress(Address: Pointer): String;
begin
  Result := IntToStr(PInteger(Address)^);
end;

function TIntegerType.GetRange: Integer;
begin
  Result := 0;
end;

function TIntegerType.GetMinValue: Integer;
begin
  Result := -MaxInt;
end;

function TIntegerType.GetMaxValue: Integer;
begin
  Result := MaxInt;
end;

{ S1 := S2 op S3 }
procedure TIntegerType.Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction);
begin
  case Op of
    // binary ops
    tkTimes:
      PInteger(Result)^ := PInteger(Op1)^ * PInteger(Op2)^;
    tkRWdiv:
      PInteger(Result)^ := PInteger(Op1)^ div PInteger(Op2)^;
    tkRWmod:
      PInteger(Result)^ := PInteger(Op1)^ mod PInteger(Op2)^;
    tkRWand:
      PInteger(Result)^ := PInteger(Op1)^ and PInteger(Op2)^;
    tkPlus:
      PInteger(Result)^ := PInteger(Op1)^ + PInteger(Op2)^;
    tkMinus:
      PInteger(Result)^ := PInteger(Op1)^ - PInteger(Op2)^;
    tkRWor:
      PInteger(Result)^ := PInteger(Op1)^ or PInteger(Op2)^;
    tkRWxor:
      PInteger(Result)^ := PInteger(Op1)^ xor PInteger(Op2)^;
    // rel ops
    tkLT:
      PBoolean(Result)^ := PInteger(Op1)^ < PInteger(Op2)^;
    tkLE:
      PBoolean(Result)^ := PInteger(Op1)^ <= PInteger(Op2)^;
    tkGT:
      PBoolean(Result)^ := PInteger(Op1)^ > PInteger(Op2)^;
    tkGE:
      PBoolean(Result)^ := PInteger(Op1)^ >= PInteger(Op2)^;
    tkEqual:
      PBoolean(Result)^ := PInteger(Op1)^ = PInteger(Op2)^;
    tkNE:
      PBoolean(Result)^ := PInteger(Op1)^ <> PInteger(Op2)^;
    tkRWin:
      PBoolean(Result)^ := PInteger(Op1)^ in PSetInteger(Op2)^;
    // unary ops: Result := op Op1 (Op2 not used)
    tkRWnot:
      PInteger(Result)^ := not PInteger(Op1)^;
    tkUnaryMinus:
      PInteger(Result)^ := -PInteger(Op1)^;
    // assign op
    tkAssign:
      PInteger(Result)^ := PInteger(Op1)^;
    else
      raise EInterpreterException.Create(sInvalidOperation, Prod.ProductionLine,
                                         Prod.ProductionCol, Prod.Parser);
  end;
end;

function TIntegerType.OrdinalValue(V: TSymbolInfo): Integer;
begin
  Result := Ord(PInteger(V.Address)^);
end;

{ TExtendedType }

constructor TExtendedType.Create(SymbolTable: TSymbolTable);
begin
  inherited Create(SymbolTable);
  FTypeClass := tcExtended;
end;

function TExtendedType.GetSize: Integer;
begin
  Result := SizeOf(Extended);
end;

function TExtendedType.GetAsString: String;
begin
  Result := 'real';
end;

function TExtendedType.ValueAsString(V: TSymbolInfo): String;
begin
  Result := FormatFloat(
    SymbolTable.Compiler.FloatFormat, PExtended(V.Address)^);
end;

function TExtendedType.ValueThroughAddress(Address: Pointer): String;
begin
  Result := FormatFloat(
    SymbolTable.Compiler.FloatFormat, PExtended(Address)^);
end;

{ S1 := S2 op S3 }
procedure TExtendedType.Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction);
begin
  case Op of
    // binary ops
    tkTimes:
      PExtended(Result)^ := PExtended(Op1)^ * PExtended(Op2)^;
    tkSlash:
      PExtended(Result)^ := PExtended(Op1)^ / PExtended(Op2)^;
    tkPlus:
      PExtended(Result)^ := PExtended(Op1)^ + PExtended(Op2)^;
    tkMinus:
      PExtended(Result)^ := PExtended(Op1)^ - PExtended(Op2)^;
    // rel ops
    tkLT:
      PBoolean(Result)^ := PExtended(Op1)^ < PExtended(Op2)^;
    tkLE:
      PBoolean(Result)^ := PExtended(Op1)^ <= PExtended(Op2)^;
    tkGT:
      PBoolean(Result)^ := PExtended(Op1)^ > PExtended(Op2)^;
    tkGE:
      PBoolean(Result)^ := PExtended(Op1)^ >= PExtended(Op2)^;
    tkEqual:
      PBoolean(Result)^ := PExtended(Op1)^ = PExtended(Op2)^;
    tkNE:
      PBoolean(Result)^ := PExtended(Op1)^ <> PExtended(Op2)^;
    // unary ops: Result := op Op1 (Op2 not used)
    tkUnaryMinus:
      PExtended(Result)^ := -PExtended(Op1)^;
    // assign op
    tkAssign:
      PExtended(Result)^ := PExtended(Op1)^;
    else
      raise EInterpreterException.Create(sInvalidOperation, Prod.ProductionLine,
                                         Prod.ProductionCol, Prod.Parser);
  end;
end;

{ TBooleanType }

constructor TBooleanType.Create(SymbolTable: TSymbolTable);
begin
  inherited Create(SymbolTable);
  FTypeClass := tcBoolean;
end;

function TBooleanType.GetSize: Integer;
begin
  Result := SizeOf(Boolean);
end;

function TBooleanType.GetAsString: String;
begin
  Result := 'lógico';
end;

function TBooleanType.ValueAsString(V: TSymbolInfo): String;
begin
  if PBoolean(V.Address)^ then
    Result := 'sim'
  else
    Result := 'não';
end;

function TBooleanType.ValueThroughAddress(Address: Pointer): String;
begin
  if PBoolean(Address)^ then
    Result := 'sim'
  else
    Result := 'não';
end;

function TBooleanType.GetRange: Integer;
begin
  Result := 2;
end;

function TBooleanType.GetMinValue: Integer;
begin
  Result := 0;
end;

function TBooleanType.GetMaxValue: Integer;
begin
  Result := 1;
end;

{ S1 := S2 op S3 }
procedure TBooleanType.Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction);
begin
  case Op of
    // binary ops
    tkRWand:
      PBoolean(Result)^ := PBoolean(Op1)^ and PBoolean(Op2)^;
    tkRWor:
      PBoolean(Result)^ := PBoolean(Op1)^ or PBoolean(Op2)^;
    tkRWxor:
      PBoolean(Result)^ := PBoolean(Op1)^ xor PBoolean(Op2)^;
    // rel ops
    tkLT:
      PBoolean(Result)^ := PBoolean(Op1)^ < PBoolean(Op2)^;
    tkLE:
      PBoolean(Result)^ := PBoolean(Op1)^ <= PBoolean(Op2)^;
    tkGT:
      PBoolean(Result)^ := PBoolean(Op1)^ > PBoolean(Op2)^;
    tkGE:
      PBoolean(Result)^ := PBoolean(Op1)^ >= PBoolean(Op2)^;
    tkEqual:
      PBoolean(Result)^ := PBoolean(Op1)^ = PBoolean(Op2)^;
    tkNE:
      PBoolean(Result)^ := PBoolean(Op1)^ <> PBoolean(Op2)^;
    // unary ops: Result := op Op1 (Op2 not used)
    tkRWnot:
      PBoolean(Result)^ := not PBoolean(Op1)^;
    // assign op
    tkAssign:
      PBoolean(Result)^ := PBoolean(Op1)^;
    else
      raise EInterpreterException.Create(sInvalidOperation, Prod.ProductionLine,
                                         Prod.ProductionCol, Prod.Parser);
  end;
end;

function TBooleanType.OrdinalValue(V: TSymbolInfo): Integer;
begin
  Result := Ord(PBoolean(V.Address)^);
end;

{ TStringType }

constructor TStringType.Create(SymbolTable: TSymbolTable);
begin
  inherited Create(SymbolTable);
  FTypeClass := tcString;
end;

function TStringType.GetSize: Integer;
begin
  Result := SizeOf(PString);
end;

function TStringType.GetAsString: String;
begin
  Result := 'texto';
end;

function TStringType.ValueAsString(V: TSymbolInfo): String;
begin
//  Result := PAnsiString(V.Address)^;
  Result := PString(V.Address)^;
end;

function TStringType.ValueThroughAddress(Address: Pointer): String;
begin
  Result := PString(Address)^;
end;

{ S1 := S2 op S3 }
procedure TStringType.Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction);
begin
  case Op of
    // binary ops
    tkPlus:
      PString(Result)^ := PString(Op1)^ + PString(Op2)^;
    // rel ops
    tkLT:
      PBoolean(Result)^ := PString(Op1)^ < PString(Op2)^;
    tkLE:
      PBoolean(Result)^ := PString(Op1)^ <= PString(Op2)^;
    tkGT:
      PBoolean(Result)^ := PString(Op1)^ > PString(Op2)^;
    tkGE:
      PBoolean(Result)^ := PString(Op1)^ >= PString(Op2)^;
    tkEqual:
      PBoolean(Result)^ := PString(Op1)^ = PString(Op2)^;
    tkNE:
      PBoolean(Result)^ := PString(Op1)^ <> PString(Op2)^;
    // assign op
    tkAssign:
      PString(Result)^ := PString(Op1)^;
    else
      raise EInterpreterException.Create(sInvalidOperation, Prod.ProductionLine,
                                         Prod.ProductionCol, Prod.Parser);
  end;
end;

{ TCharType }

constructor TCharType.Create(SymbolTable: TSymbolTable);
begin
  inherited Create(SymbolTable);
  FTypeClass := tcChar;
end;

function TCharType.GetSize: Integer;
begin
  Result := SizeOf(Char);
end;

function TCharType.GetAsString: String;
begin
  Result := 'caractere';
end;

function TCharType.ValueAsString(V: TSymbolInfo): String;
begin
  Result := PChar(V.Address)^;
end;

function TCharType.ValueThroughAddress(Address: Pointer): String;
begin
  Result := PChar(Address)^;
end;

function TCharType.GetRange: Integer;
begin
  Result := 256;
end;

function TCharType.GetMinValue: Integer;
begin
  Result := 0;
end;

function TCharType.GetMaxValue: Integer;
begin
  Result := 255;
end;

{ S1 := S2 op S3 }
procedure TCharType.Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction);
begin
  case Op of
    // rel ops
    tkLT:
      PBoolean(Result)^ := PChar(Op1)^ < PChar(Op2)^;
    tkLE:
      PBoolean(Result)^ := PChar(Op1)^ <= PChar(Op2)^;
    tkGT:
      PBoolean(Result)^ := PChar(Op1)^ > PChar(Op2)^;
    tkGE:
      PBoolean(Result)^ := PChar(Op1)^ >= PChar(Op2)^;
    tkEqual:
      PBoolean(Result)^ := PChar(Op1)^ = PChar(Op2)^;
    tkNE:
      PBoolean(Result)^ := PChar(Op1)^ <> PChar(Op2)^;
//    tkRWin:
//      PBoolean(Result)^ := PChar(Op1)^ in PSetChar(Op2)^;
    // assign op
    tkAssign:
      PChar(Result)^ := PChar(Op1)^;
    else
      raise EInterpreterException.Create(sInvalidOperation, Prod.ProductionLine,
                                         Prod.ProductionCol, Prod.Parser);
  end;
end;

function TCharType.OrdinalValue(V: TSymbolInfo): Integer;
begin
  Result := Ord(PChar(V.Address)^);
end;

{ TEnumType }

constructor TEnumType.Create(SymbolTable: TSymbolTable);
begin
  inherited Create(SymbolTable);
  FEnums := TList.Create;
  FTypeClass := tcEnum;
end;

destructor TEnumType.Destroy;
begin
  FEnums.Free;
  inherited Destroy;
end;

function TEnumType.GetSize: Integer;
begin
  Result := SizeOf(Integer);
end;

function TEnumType.GetAsString: String;
begin
  Result := 'enum';
end;

function TEnumType.ValueAsString(V: TSymbolInfo): String;
begin
  Result := IntToStr(PInteger(V.Address)^);
end;

function TEnumType.ValueThroughAddress(Address: Pointer): String;
begin
  Result := IntToStr(PInteger(Address)^);
end;

function TEnumType.GetRange: Integer;
begin
  Result :=FEnums.Count;
end;

function TEnumType.GetMinValue: Integer;
begin
  Result := 0;
end;

function TEnumType.GetMaxValue: Integer;
begin
  Result := FEnums.Count - 1;
end;

{ S1 := S2 op S3 }
procedure TEnumType.Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction);
begin
  case Op of
    // rel ops
    tkLT:
      PBoolean(Result)^ := PInteger(Op1)^ < PInteger(Op2)^;
    tkLE:
      PBoolean(Result)^ := PInteger(Op1)^ <= PInteger(Op2)^;
    tkGT:
      PBoolean(Result)^ := PInteger(Op1)^ > PInteger(Op2)^;
    tkGE:
      PBoolean(Result)^ := PInteger(Op1)^ >= PInteger(Op2)^;
    tkEqual:
      PBoolean(Result)^ := PInteger(Op1)^ = PInteger(Op2)^;
    tkNE:
      PBoolean(Result)^ := PInteger(Op1)^ <> PInteger(Op2)^;
    tkRWin:
      PBoolean(Result)^ := PInteger(Op1)^ in PSetInteger(Op2)^;
    // assign op
    tkAssign:
      PInteger(Result)^ := PInteger(Op1)^;
    else
      raise EInterpreterException.Create(sInvalidOperation, Prod.ProductionLine,
                                         Prod.ProductionCol, Prod.Parser);
  end;
end;

function TEnumType.OrdinalValue(V: TSymbolInfo): Integer;
begin
  Result := Ord(PInteger(V.Address)^);
end;

{ TSubrangeType }

constructor TSubrangeType.Create(SymbolTable: TSymbolTable);
begin
  inherited Create(SymbolTable);
  FTypeClass := tcSubrange;
end;

function TSubrangeType.GetSize: Integer;
begin
  Result := FBaseType.GetSize;
end;

function TSubrangeType.GetAsString: String;
begin
  Result := 'subRange(' + FBaseType.GetAsString + ')';
end;

function TSubrangeType.ValueAsString(V: TSymbolInfo): String;
begin
  Result := FBaseType.ValueAsString(V);
end;

function TSubrangeType.ValueThroughAddress(Address: Pointer): String;
begin
  Result := FBaseType.ValueThroughAddress(Address);
end;

function TSubrangeType.GetRange: Integer;
begin
  if FBaseType is TCharType then
    Result := Ord(PChar(FSup.Address)^) - Ord(PChar(FInf.Address)^) + 1
  else
    Result := PInteger(FSup.Address)^ - PInteger(FInf.Address)^; // + 1;
end;

function TSubrangeType.GetMinValue: Integer;
begin
  if FBaseType is TCharType then
    Result := Ord(PChar(FInf.Address)^)
  else
    Result := PInteger(FInf.Address)^;
end;

function TSubrangeType.GetMaxValue: Integer;
begin
  if FBaseType is TCharType then
    Result := Ord(PChar(FSup.Address)^)
  else
    Result := PInteger(FSup.Address)^ - 1;
end;

procedure TSubrangeType.Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction);
begin
  FBaseType.Oper(Result, Op1, Op2, Op, Prod);
end;

function TSubrangeType.OrdinalValue(V: TSymbolInfo): Integer;
begin
  Result := Ord(PInteger(V.Address)^);
end;

{ TSetType }

constructor TSetType.Create(SymbolTable: TSymbolTable);
begin
  inherited Create(SymbolTable);
  FTypeClass := tcSet;
end;

function TSetType.GetSize: Integer;
begin
  Result := 32; // greatest size (provisory)
end;

function TSetType.GetAsString: String;
begin
  Result := 'conjunto(' + FBaseType.GetAsString + ')';
end;

function TSetType.ValueAsString(V: TSymbolInfo): String;
var
  P: PSetInteger;
  I: Integer;
begin
  Result := '[';
  P := PSetInteger(V.Address);
  for I := 0 to 255 do
    if I in P^ then
      Result := Result + IntToStr(I) + ',';
  if Result[Length(Result)] = ',' then
    Delete(Result, Length(Result), 1);
  Result := Result + ']';
end;

function TSetType.ValueThroughAddress(Address: Pointer): String;
var
  P: PSetInteger;
  I: Integer;
begin
  Result := '[';
  P := PSetInteger(Address);
  for I := 0 to 255 do
    if I in P^ then
      Result := Result + IntToStr(I) + ',';
  if Result[Length(Result)] = ',' then
    Delete(Result, Length(Result), 1);
  Result := Result + ']';
end;

procedure TSetType.Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction);
begin
  case Op of
    // binary ops
    tkTimes:
      PSetInteger(Result)^ := PSetInteger(Op1)^ * PSetInteger(Op2)^;
    tkPlus:
      PSetInteger(Result)^ := PSetInteger(Op1)^ + PSetInteger(Op2)^;
    tkMinus:
      PSetInteger(Result)^ := PSetInteger(Op1)^ - PSetInteger(Op2)^;
    // rel ops
    tkLE:
      PBoolean(Result)^ := PSetInteger(Op1)^ <= PSetInteger(Op2)^;
    tkGE:
      PBoolean(Result)^ := PSetInteger(Op1)^ >= PSetInteger(Op2)^;
    tkEqual:
      PBoolean(Result)^ := PSetInteger(Op1)^ = PSetInteger(Op2)^;
    tkNE:
      PBoolean(Result)^ := PSetInteger(Op1)^ <> PSetInteger(Op2)^;
    // assign op
    tkAssign:
      PSetInteger(Result)^ := PSetInteger(Op1)^;
    else
      raise EInterpreterException.Create(sInvalidOperation, Prod.ProductionLine,
                                         Prod.ProductionCol, Prod.Parser);
  end;
end;

{ TArrayType }

constructor TArrayType.Create(SymbolTable: TSymbolTable);
begin
  inherited Create(SymbolTable);
  FTypeClass := tcArray;
end;

function TArrayType.GetSize: Integer;
begin
  Result := FElemSymbol.SymbolType.Size *
    TOrdinalType(FIndexSymbol.SymbolType).Range;

  { acrescenta a área que guarda o tamanho do array }
//  Result := Result + TSymbolTable.SizeOfArraySize();
end;

function TArrayType.GetAsString: String;
begin
  Result := 'arranjo [' + FIndexSymbol.SymbolType.AsString + '] de ' +
    FElemSymbol.SymbolType.AsString;
end;

function TArrayType.ValueAsString(V: TSymbolInfo): String;
begin
  Result := '... (ainda não implementado)';
end;

function TArrayType.ValueThroughAddress(Address: Pointer): String;
begin
  Result := '... (ainda não implementado)';
end;

procedure TArrayType.Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction);
begin
  case Op of
    // assign op
    tkAssign:
      Move(PByte(Op1)^, PByte(Result)^, Size);
    else
      raise EInterpreterException.Create(sInvalidOperation, Prod.ProductionLine,
                                         Prod.ProductionCol, Prod.Parser);
  end;
end;

{ TRecordType }

constructor TRecordType.Create(SymbolTable: TSymbolTable);
begin
  inherited Create(SymbolTable);
  FTypeClass := tcRecord;
end;

destructor TRecordType.Destroy;
begin
  FFieldList.Free;
  inherited Destroy;
end;

function TRecordType.GetSize: Integer;
begin
  Result := FSize;
end;

function TRecordType.GetAsString: String;
var
  I: Integer;
begin
  Result := 'registro (';
  for I := 0 to FFieldList.Count - 1 do
    Result := Result + TSymbolInfo(FFieldList[I]).SymbolType.AsString + ',';
  Delete(Result, Length(Result), 1);
  Result := Result + ')';
end;

function TRecordType.ValueAsString(V: TSymbolInfo): String;
begin
  Result := '... (ainda não implementado)';
end;

function TRecordType.ValueThroughAddress(Address: Pointer): String;
begin
  Result := '... (ainda não implementado)';
end;

procedure TRecordType.Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction);
begin
  case Op of
    // assign op
    tkAssign:
      Move(PByte(Op1)^, PByte(Result)^, Size);
    else
      raise EInterpreterException.Create(sInvalidOperation, Prod.ProductionLine,
                                         Prod.ProductionCol, Prod.Parser);
  end;
end;

{ TPointerType }

constructor TPointerType.Create(SymbolTable: TSymbolTable);
begin
  inherited Create(SymbolTable);
  FTypeClass := tcPointer;
end;

function TPointerType.GetSize: Integer;
begin
  Result := SizeOf(Pointer);
end;

function TPointerType.GetAsString: String;
begin
  if FBaseType <> nil then
    Result := 'ponteiro (' + FBaseType.AsString + ')'
  else
    Result := 'ponteiro';
end;

function TPointerType.ValueAsString(V: TSymbolInfo): String;
var
  P: Integer;
begin
  P := Integer(V.Address^);
  Result := IntToStr(P);
end;

function TPointerType.ValueThroughAddress(Address: Pointer): String;
var
  P: Integer;
begin
  P := Integer(Address^);
  Result := IntToStr(P);
end;

procedure TPointerType.Oper(Result, Op1, Op2: Pointer; Op: TToken; Prod: TProduction);
begin
  case Op of
    // rel ops
    tkEqual:
      PBoolean(Result)^ := PPointer(Op1)^ = PPointer(Op2)^;
    tkNE:
      PBoolean(Result)^ := PPointer(Op1)^ <> PPointer(Op2)^;
    // assign op
    tkAssign:
      PInteger(Result)^ := PInteger(Op1)^;
    else
      raise EInterpreterException.Create(sInvalidOperation, Prod.ProductionLine,
                                         Prod.ProductionCol, Prod.Parser);
  end;
end;

{ TProcedureType }

constructor TProcedureType.Create(SymbolTable: TSymbolTable);
begin
  inherited Create(SymbolTable);
  FTypeClass := tcProcedure;
end;

function TProcedureType.GetSize: Integer;
begin
  Result := 0;
end;

function TProcedureType.GetAsString: String;
begin
  Result := 'procedimento';
end;

function TProcedureType.ValueAsString(V: TSymbolInfo): String;
begin
  Result := '';
end;

function TProcedureType.ValueThroughAddress(Address: Pointer): String;
begin
  Result := '';
end;

{ TFunctionType }

constructor TFunctionType.Create(SymbolTable: TSymbolTable);
begin
  inherited Create(SymbolTable);
  FTypeClass := tcFunction;
end;

function TFunctionType.GetSize: Integer;
begin
  Result := 0;
end;

function TFunctionType.GetAsString: String;
begin
  Result := 'função';
end;

function TFunctionType.ValueAsString(V: TSymbolInfo): String;
begin
  Result := '';
end;

function TFunctionType.ValueThroughAddress(Address: Pointer): String;
begin
  Result := '';
end;

{ TSymbolInfo }

constructor TSymbolInfo.Create(SymbolTable: TSymbolTable;
  SymbolClass: TSymbolClass; SymbolType: TSymbolType);
begin
  inherited Create;
  FSymbolTable := SymbolTable;
  FSymbolClass := SymbolClass;
  FSymbolType := SymbolType;
//  FNameIndex := -1;
  FName := '';
end;

procedure TSymbolInfo.Assign(Value: TSymbolInfo);
begin
  FSymbolClass := Value.SymbolClass;
  FSymbolTable := Value.SymbolTable;
  FSymbolType := Value.SymbolType;
  FOffset := Value.FOffset;
  FName := Value.Name;
  FRecordType := Value.RecordType;
end;

function TSymbolInfo.GetAddress: Pointer;
begin
  case SymbolClass of
    scConst:
      Result := PByte(SymbolTable.FConstArea) + FOffset;
    scVar:
      Result := PByte(SymbolTable.FVarArea.Last) + FOffset;
    scPointer:
      Result := Pointer(FOffset);
    scVarParam:
    begin
      Result := PByte(SymbolTable.FVarArea.Last) + FOffset;
      Result := PByte(Result^);
    end;
    else
      raise EInterpreterException.Create(sGetAddress, 1, 1, nil);
  end;
end;

function TSymbolInfo.GetVarParamAddress: Pointer;
begin
  // retorna o endereço, sem derreferenciar o ponteiro
  Result := PByte(SymbolTable.FVarArea.Last) + FOffset;
end;

function TSymbolInfo.GetAsString: String;
begin
  Result := '';
  case SymbolClass of
    scConst: Result   :=   'const       ';
    scVar: Result     :=   'var         ';
    scType: Result    :=   'tipo        ';
    scField: Result :=     'campo       ';
    scProcedure: Result := 'procedimento';
    scFunction: Result :=  'função      ';
    scVarParam: Result :=  'var param   ';
  else
    Result := 'desconhecido!!!';
  end;
  if SymbolType <> nil then
    Result := Result + SymbolType.AsString;
  if SymbolClass in [scVar, scConst] then
    Result := Result + ' ' + SymbolType.ValueAsString(Self);
end;

{ TSymbolTable }

constructor TSymbolTable.Create(Compiler: TCompiler);
begin
  inherited Create;
  FCompiler := Compiler;

  FTable := TStringList.Create;
  FTable.CaseSensitive := True;

//  FTable.Sorted := True;
  FTable.CaseSensitive := True;

  FNewTables := TList.Create;
  FInfos := TList.Create;
  FTypes := TList.Create;
  FScope := TList.Create;
  FVarArea := TList.Create;
  FPendentPointer := TList.Create;
  FForwards := TList.Create;
  FScope.Add(Self);
end;

destructor TSymbolTable.Destroy;
var
  I: Integer;
begin
  for I := 0 to FNewTables.Count - 1 do
    TSymbolTable(FNewTables[I]).Free;
  FNewTables.Free;

  for I := 0 to FInfos.Count - 1 do
    TSymbolInfo(FInfos[I]).Free;
  FInfos.Free;

  for I := 0 to FTypes.Count - 1 do
    TSymbolType(FTypes[I]).Free;
  FTypes.Free;

  FScope.Free;

  if FConstArea <> nil then
    Compiler.Heap.FreeMem(FConstArea);
//    FreeMem(FConstArea);

  for I := 0 to FVarArea.Count - 1 do
    Compiler.Heap.FreeMem(FVarArea[I]);
//    FreeMem(FVarArea[I]);
  FVarArea.Free;

  FPendentPointer.Free;
  FForwards.Free;

  FTable.Free;

  inherited Destroy;
end;

{ Returns pointer to Name's info or nil if Name not in table }
function TSymbolTable.FindSymbol(Name: String): TSymbolInfo;
var
  I, Ind: Integer;
  T: TSymbolTable;
begin
  // special case when evaluating
  if csEvaluating in Compiler.State then
  begin
    Result := Compiler.FindSymbol(Name);
    Exit;
  end;

  Result := nil;
  for I := FScope.Count - 1 downto 0 do
  begin
    T := TSymbolTable(FScope[I]);
    Ind := T.FTable.IndexOf(Name);
    if Ind >= 0 then
    begin
      Result := TSymbolInfo(T.FTable.Objects[Ind]);

      // verifica se o módulo associado foi previamente incluído
      // obs: se a símbolo é associado a MODL_PAC, considera ok,
      //      pois é como se fosse da linguagem
      if (Result <> nil) {teste de segurança, pois nunca deveria ser!} and
         (Result.StandardModule <> MODL_PAC) and
         (Compiler.FModlList.IndexOf(Result.StandardModule) < 0) then
        Result := nil;
      Exit;
    end;
    // Search for redeclaration must stop when compiling record fields or
    // subroutine params and local variables
    if csFindInScope in Compiler.State then
      Break;
  end;
end;

{ Returns pointer to new info structure for Name }
function TSymbolTable.Enter(Name: String; SymbolClass: TSymbolClass;
      SymbolType: TSymbolType; StdModule: String): TSymbolInfo;
begin
  Result := AllocSymbolInfo(SymbolClass, SymbolType);
  Result.SymbolTable.FTable.AddObject(Name, Result);
  Result.FName := Name;
  Result.StandardModule := StdModule;
end;

{ Returns a new symbol info structure }
function TSymbolTable.AllocSymbolInfo(SymbolClass: TSymbolClass;
  SymbolType: TSymbolType): TSymbolInfo;
var
  T: TSymbolTable;
  I: Integer;
begin
  T := FScope.Last;
  if SymbolClass <> scField then
  begin
    // look for last natural (not record) scope
    for I := FScope.Count - 1 downto 0 do
      if not TSymbolTable(FScope[I]).IsRecordScope then
        Break;
    T := FScope[I];
  end;

  Result := TSymbolInfo.Create(T, SymbolClass, SymbolType);
  T.FInfos.Add(Result);

  case SymbolClass of
    scConst:
    begin
      Result.FOffset := T.FConstOffset;
      Inc(T.FConstOffset, SymbolType.Size);
      if T.FConstArea = nil then
        T.FConstArea := Compiler.Heap.AllocMem(T.FConstOffset)
      else
        T.FConstArea := Compiler.Heap.ReallocMem(T.FConstArea, T.FConstOffset);
      if T.FConstArea = nil then
        Compiler.Error(sOutOfMemory);
//      ReallocMem(T.FConstArea, T.FConstOffset);
    end;

    scVar, scField:
    begin
      Result.FOffset := T.FVarOffset;
      Inc(T.FVarOffset, SymbolType.Size);
    end;

    scVarParam:
    begin
      Result.FOffset := T.FVarOffset;
      Inc(T.FVarOffset, SizeOf(Pointer));
    end;

  end;
end;

function TSymbolTable.AllocType(TypeClass: TSymbolTypeClass): TSymbolType;
begin
  Result := TypeClass.Create(Self);
  FTypes.Add(Result);
end;

function TSymbolTable.NewSymbolTable: TSymbolTable;
begin
  Result := TSymbolTable.Create(Compiler);
  FNewTables.Add(Result);
end;

procedure TSymbolTable.AddScope(SymbolTable: TSymbolTable);
begin
  FScope.Add(SymbolTable);
end;

procedure TSymbolTable.RemoveScope;
begin
  FScope.Delete(FScope.Count - 1);
end;

procedure TSymbolTable.ShowMemArray(VName: String; VType: TSymbolType;
    VAddr: Integer; Global: Boolean);
var
  Ref: String;
  I, Ind1, Ind2, ElemSize: Integer;
begin
  Ind1 := TOrdinalType(TArrayType(VType).FIndexSymbol.SymbolType).MinValue;
  Ind2 := TOrdinalType(TArrayType(VType).FIndexSymbol.SymbolType).MaxValue;
  ElemSize := TArrayType(VType).FElemSymbol.SymbolType.Size;

  { acrescenta área para o tamanho do array }
//  VAddr := VAddr + SizeOfArraySize();

  for I := Ind1 to Ind2 do
  begin
    Ref := VName + '[' + IntToStr(I) + ']';
    ShowMem(Ref, TArrayType(VType).FElemSymbol.SymbolType, VAddr, Global);
    VAddr := VAddr + ElemSize;
  end;
end;

procedure TSymbolTable.ShowMemRecord(VName: String; VType: TSymbolType;
    VAddr: Integer; Global: Boolean);
var
  Ref: String;
  I: Integer;
  Si: TSymbolInfo;
begin
  for I := 0 to TRecordType(VType).FFieldList.Count - 1 do
  begin
    Si := TSymbolInfo(TRecordType(VType).FFieldList[I]);
    Ref := VName + '.' + Si.Name;
    ShowMem(Ref, Si.SymbolType, VAddr, Global);
    VAddr := VAddr + Si.SymbolType.Size;
  end;
end;

procedure TSymbolTable.ShowMem(VName: String; VType: TSymbolType;
    VAddr: Integer; Global: Boolean);
begin
  if not FrmDSL.PnlMemoria.Visible then
    Exit;
  if VType.TypeClass = tcArray then
    ShowMemArray(VName, VType, VAddr, Global)
  else if VType.TypeClass = tcRecord then
    ShowMemRecord(VName, VType, VAddr, Global)
  else begin
    FrmMemoria.IncluiVar(VName, VAddr, Global);
    if VType is TPointerType then
      MarkAsPointer(VAddr);
  end;
end;

procedure TSymbolTable.DisposeArray(VType: TSymbolType; VAddr: Integer);
var
  I, Ind1, Ind2, ElemSize: Integer;
begin
  Ind1 := TOrdinalType(TArrayType(VType).FIndexSymbol.SymbolType).MinValue;
  Ind2 := TOrdinalType(TArrayType(VType).FIndexSymbol.SymbolType).MaxValue;
  ElemSize := TArrayType(VType).FElemSymbol.SymbolType.Size;

  { acrescenta área para o tamanho do array }
//  VAddr := VAddr + SizeOfArraySize();

  for I := Ind1 to Ind2 do
  begin
    DisposeHeap(TArrayType(VType).FElemSymbol.SymbolType, VAddr);
    VAddr := VAddr + ElemSize;
  end;
end;

procedure TSymbolTable.DisposeRecord(VType: TSymbolType; VAddr: Integer);
var
  I: Integer;
  Si: TSymbolInfo;
begin
  for I := 0 to TRecordType(VType).FFieldList.Count - 1 do
  begin
    Si := TSymbolInfo(TRecordType(VType).FFieldList[I]);
    DisposeHeap(Si.SymbolType, VAddr);
    VAddr := VAddr + Si.SymbolType.Size;
  end;
end;

procedure TSymbolTable.DisposeHeap(VType: TSymbolType; VAddr: Integer);
begin
  if not FrmDSL.PnlMemoria.Visible then
    Exit;
  if VType.TypeClass = tcArray then
    DisposeArray(VType, VAddr)
  else if VType.TypeClass = tcRecord then
    DisposeRecord(VType, VAddr)
  else
    FrmMemoria.ExcluiVar(VAddr);
end;

procedure TSymbolTable.UpdateMem(VType: TSymbolType; VAddr: Integer);
begin
  if not FrmDSL.PnlMemoria.Visible then
    Exit;
  if VType.TypeClass = tcArray then
    UpdateMemArray(VType, VAddr)
  else if VType.TypeClass = tcRecord then
    UpdateMemRecord(VType, VAddr)
  else
    FrmMemoria.AtualizaVar(VAddr, VType.ValueThroughAddress(Pointer(VAddr)));
end;

procedure TSymbolTable.UpdateMemArray(VType: TSymbolType; VAddr: Integer);
var
  I, Ind1, Ind2, ElemSize: Integer;
begin
  Ind1 := TOrdinalType(TArrayType(VType).FIndexSymbol.SymbolType).MinValue;
  Ind2 := TOrdinalType(TArrayType(VType).FIndexSymbol.SymbolType).MaxValue;
  ElemSize := TArrayType(VType).FElemSymbol.SymbolType.Size;

  { acrescenta área para o tamanho do array }
//  VAddr := VAddr + SizeOfArraySize();

  for I := Ind1 to Ind2 do
  begin
    UpdateMem(TArrayType(VType).FElemSymbol.SymbolType, VAddr);
    VAddr := VAddr + ElemSize;
  end;
end;

procedure TSymbolTable.UpdateMemRecord(VType: TSymbolType; VAddr: Integer);
var
  I: Integer;
  Si: TSymbolInfo;
begin
  for I := 0 to TRecordType(VType).FFieldList.Count - 1 do
  begin
    Si := TSymbolInfo(TRecordType(VType).FFieldList[I]);
    UpdateMem(Si.SymbolType, VAddr);
    VAddr := VAddr + Si.SymbolType.Size;
  end;
end;

procedure TSymbolTable.ShowMemCleared;
begin
  if not FrmDSL.PnlMemoria.Visible then
    Exit;
  FrmMemoria.Limpa;
end;

procedure TSymbolTable.MarkAsPointer(VAddr: Integer);
begin
  if not FrmDSL.PnlMemoria.Visible then
    Exit;
  FrmMemoria.MarcaComoPonteiro(VAddr);
end;

procedure TSymbolTable.ChangeAddress(OldAddr, NewAddr: Integer);
begin
  if not FrmDSL.PnlMemoria.Visible then
    Exit;
  FrmMemoria.MudaEnder(OldAddr, NewAddr);
end;

procedure TSymbolTable.UpdateVarParam(VAddr: Integer; Value: String);
begin
  if not FrmDSL.PnlMemoria.Visible then
    Exit;
  FrmMemoria.AtualizaVar(VAddr, Value);
end;

procedure TSymbolTable.ShowMemActivation;
var
  I: Integer;
  Si: TSymbolInfo;
begin
  if not FrmDSL.PnlMemoria.Visible then
    Exit;

  // nada a fazer quando estiver avaliando expressão monitorada
  if csEvaluating in Compiler.State then
    Exit;

  for I := 0 to FTable.Count - 1 do
  begin
    Si := TSymbolInfo(FTable.Objects[I]);
    if Si.SymbolClass in [scVar, scPointer] then
      ShowMem(FTable[I], Si.SymbolType, Integer(Si.Address), True)
    else if Si.SymbolClass = scVarParam then
      FrmMemoria.IncluiVar(FTable[I], Integer(Si.VarParamAddress), True);
  end;
end;

{ Inicializa o tamanho das áreas com array }
procedure TSymbolTable.InitArraySize(Mem: Pointer);
var
  I: Integer;
  Si: TSymbolInfo;
begin
  for I := 0 to FTable.Count - 1 do
  begin
    Si := TSymbolInfo(FTable.Objects[I]);
    if (Si.FSymbolType is TArrayType) then
    begin
      Mem := Pointer(Integer(Mem) + Si.FOffset);
      PInteger(Mem)^ := TArrayType(Si.FSymbolType).Size;
    end;
  end;
end;

class function TSymbolTable.SizeOfArraySize: Integer;
begin
  Result := SizeOf(Integer);
end;

procedure TSymbolTable.ShowSubroutineCall(Name: String);
begin
  if not FrmDSL.PnlMemoria.Visible then
    Exit;
  FrmMemoria.IncluiSubrotina(Name);
end;

procedure TSymbolTable.ShowSubroutineReturn;
begin
  if not FrmDSL.PnlMemoria.Visible then
    Exit;
  FrmMemoria.LiberaUltimoEscopo;
end;

procedure TSymbolTable.SetActivation;
var
  P1, P2: Pointer;
begin
  P1 := Compiler.Heap.AllocMem(FVarOffset);
  if P1 = nil then
    Compiler.Error(sOutOfMemory);
  FVarArea.Add(P1);
  if FVarArea.Count > 1 then
  begin // copy old area (for solving 'var parameters as arguments' problem)
    P2 := FVarArea[FVarArea.Count - 2];
    Move(PByte(P2)^, PByte(P1)^, FVarOffset);
  end;
end;

procedure TSymbolTable.LibActivation;
begin
  Compiler.Heap.FreeMem(FVarArea.Last);
  FVarArea.Delete(FVarArea.Count - 1);
end;

function TSymbolTable.DuplicateSymbolInfo(Symbol: TSymbolInfo): TSymbolInfo;
begin
  Result := TSymbolInfo.Create(Symbol.SymbolTable, Symbol.SymbolClass,
    Symbol.SymbolType);
  Result.Assign(Symbol);
//  Move(PChar(Symbol)^, PChar(Result)^, TSymbolInfo.InstanceSize);
  FInfos.Add(Result);
end;

procedure TSymbolTable.CheckPendentPointers;
var
  T: TSymbolTable;
  I: Integer;
  P: TProd_TypeDecl;
  SiType: TSymbolInfo;
  SiBaseType: TSymbolInfo;
begin
  T := TSymbolTable(FScope.Last);
  for I := 0 to T.FPendentPointer.Count - 1 do
  begin
    P := T.FPendentPointer[I];
    SiType := FindSymbol(P.FTypeId);
    if SiType = nil then
      P.Error(sCheckPendentPointersError, 0, 0);
    SiBaseType := FindSymbol(P.FBaseTypeId);
    if SiBaseType = nil then
      P.Error(Format(sUndeclaredIdentifier, [P.FBaseTypeId]),
        P.ProductionLine, P.ProductionCol);
    TPointerType(SiType.SymbolType).FBaseType := SiBaseType.SymbolType;
  end;
  T.FPendentPointer.Clear;
end;

procedure TSymbolTable.AddPendentPointer(P: TProduction);
var
  T: TSymbolTable;
begin
  T := TSymbolTable(FScope.Last);
  T.FPendentPointer.Add(P);
end;

function TSymbolTable.LookForForward(Id: String): TProduction;
var
  I: Integer;
  S: String;
begin
  Result := nil;
  for I := 0 to FForwards.Count - 1 do
  begin
    Result := FForwards[I];
    if Result is TProd_Procedure then
      S := TProd_Procedure(Result).FProcId
    else
      S := TProd_Function(Result).FFuncId;

//    if AnsiUpperCase(Id) = AnsiUpperCase(S) then
    if Id = S then
      Exit;
  end;
end;

//procedure TSymbolTable.CheckForwards;
//var
//  I: Integer;
//  P: TProduction;
//  Nok: Boolean;
//begin
//  Nok := False;
//  for I := 0 to FForwards.Count - 1 do
//  begin
//    P := FForwards[I];
//    if P is TProd_Procedure then
//    begin
//      if TProd_Procedure(P).FBlock = nil then
//        Nok := True;
//    end
//    else
//      if TProd_Function(P).FBlock = nil then
//        Nok := True;
//    if Nok then
//      P.Error(sUnsatisfiedForward, P.ProductionLine, P.ProductionCol);
//  end;
//  FForwards.Clear;
//end;

procedure TSymbolTable.AddForward(P: TProduction);
begin
  FForwards.Add(P);
end;

procedure TSymbolTable.ShowTable(S: TStrings);
var
  I: Integer;
  Str: String;
begin
  for I := 0 to FTable.Count - 1 do
  begin
    Str := FTable[I] + ' ' + TSymbolInfo(FTable.Objects[I]).AsString;
    S.Add(Str);
  end;
end;

{ TCompiler }

function TCompiler.Compile(Source: String;
  ProductionClass: TProductionClass): TProduction;
begin
  // libera o anterior e cria novo parser
  if FParser <> nil then
    FParser.Free;
  FParser := TPascalTokenizer.Create(Source, ProgramName);

  // limpa a lista de arquivos incluídos
  FIncludeList.Clear;
  FModlList.Clear;

  // compila
  FProduction := ProductionClass.Create(Self);
  FProduction.FProductionLine := Parser.TokenLine;
  FProduction.FProductionCol := Parser.TokenCol;
  FProduction.Parse;
  FProduction.FProductionEndLine := Parser.TokenLine;
  FProduction.FProductionEndCol := Parser.TokenCol;
  Result := FProduction;
end;

constructor TCompiler.Create;
begin
  inherited Create;
  FFloatFormat := '0.0#########';
  FHeap := THeap.Create(Default_Heap_Min, Default_Heap_Max);
  if FHeap.Handle = 0 then
    Error(sHeapError);
  FSymbolTable := TSymbolTable.Create(Self);
  FParserStack := TList.Create;
  FIncludeList := TStringList.Create;
  FIncludeList.CaseSensitive := True;
  FModlList := TStringList.Create;
  FModlList.CaseSensitive := True;

  // lista de bitmaps (dsl_quadroXXX) usados no programa
  FBitmapList := TList.Create;
  FBitmapList.Capacity := 1000;

  // lista de streams (leitores ou escritores)
  FStreamList := TList.Create;

  // lista de TQuadro
  FTQuadroList := TList.Create;

  // lista de TMediaPlayers
  FTMediaPlayerList := TList.Create;

  // lista de componentes
//  FCompList := TList.Create;

  InitializeSymbolTable;
end;

destructor TCompiler.Destroy;
begin
  FParser.Free;
  FProduction.Free;
  FSymbolTable.Free;
  FHeap.Free;
  FParserStack.Free;
  FIncludeList.Free;
  FModlList.Free;

  DestroyBitmaps;
  FBitmapList.Free;

  // destrói CompList ANTES de TQuadroList
//  DestroyCompList;
//  FCompList.Free;

  DestroyTQuadroList;
  FTQuadroList.Free;

  DestroyTMediaPlayerList;
  FTMediaPlayerList.Free;

  DestroyStreams;
  FStreamList.Free;

  FTela.Free;
  inherited Destroy;
end;

function TCompiler.Compile(Source: TStream;
  ProductionClass: TProductionClass): TProduction;
begin
  // registra o stream principal
  FSource := Source;

  // libera o anterior e cria novo parser
  if FParser <> nil then
    FParser.Free;
  FParser := TPascalTokenizer.Create(Source, ProgramName);

  // limpa a lista de arquivos incluídos
  FIncludeList.Clear;
  FModlList.Clear;

  // compila
  FProduction := ProductionClass.Create(Self);
  FProduction.FProductionLine := Parser.TokenLine;
  FProduction.FProductionCol := Parser.TokenCol;
  FProduction.Parse;
  FProduction.FProductionEndLine := Parser.TokenLine;
  FProduction.FProductionEndCol := Parser.TokenCol;
  Result := FProduction;
end;

procedure TCompiler.Interpret;
begin
  SymbolTable.ShowMemCleared;
  SymbolTable.SetActivation;
  SetProgramSymbolTable(SymbolTable);
  SymbolTable.ShowMemActivation;
  FProduction.Interpret;
end;

procedure TCompiler.Stop;
begin
  FTerminate := True;
end;

procedure TCompiler.ShowSyntaxTree(S: TStrings);
begin
  S.Clear;
  FProduction.ShowSyntaxTree(S);
end;

procedure TCompiler.ShowSymbolTable(S: TStrings);
begin
  S.Clear;
  if FProgramSymbolTable <> nil then
    FProgramSymbolTable.ShowTable(S);
  if FSubroutineSymbolTable <> nil then
  begin
    S.Add('---');
    FProgramSymbolTable.ShowTable(S);
  end;
end;

procedure TCompiler.InitializeSymbolTable;
var
  Symbol: TSymbolInfo;
begin
  // Integer
  FDeclTypeInteger := SymbolTable.AllocType(TIntegerType);
  SymbolTable.Enter('inteiro', scType, FDeclTypeInteger, MODL_PAC);

  // Extended
  FDeclTypeExtended := SymbolTable.AllocType(TExtendedType);
  SymbolTable.Enter('real', scType, FDeclTypeExtended, MODL_PAC);

  // Boolean
  FDeclTypeBoolean := SymbolTable.AllocType(TBooleanType);
  SymbolTable.Enter('lógico', scType, FDeclTypeBoolean, MODL_PAC);

  // String
  FDeclTypeString := SymbolTable.AllocType(TStringType);
  SymbolTable.Enter('texto', scType, FDeclTypeString, MODL_PAC);

  // Char
  FDeclTypeChar := SymbolTable.AllocType(TCharType);
  SymbolTable.Enter('caractere', scType, FDeclTypeChar, MODL_PAC);

  // Pointer
  FDeclTypePointer := SymbolTable.AllocType(TPointerType);
  SymbolTable.Enter('ponteiro', scType, FDeclTypePointer, MODL_PAC);

  // nil
  Symbol := SymbolTable.Enter('nulo', scConst, FDeclTypePointer, MODL_PAC);
  PPointer(Symbol.Address)^ := nil;

  // True
  Symbol := SymbolTable.Enter('verdadeiro', scConst, FDeclTypeBoolean, MODL_PAC);
  PBoolean(Symbol.Address)^ := True;

  // False
  Symbol := SymbolTable.Enter('falso', scConst, FDeclTypeBoolean, MODL_PAC);
  PBoolean(Symbol.Address)^ := False;

  // Sim
  Symbol := SymbolTable.Enter('sim', scConst, FDeclTypeBoolean, MODL_PAC);
  PBoolean(Symbol.Address)^ := True;

  // Não
  Symbol := SymbolTable.Enter('não', scConst, FDeclTypeBoolean, MODL_PAC);
  PBoolean(Symbol.Address)^ := False;

  // Pi
  Symbol := SymbolTable.Enter('PI', scConst, FDeclTypeExtended, MODL_MAT);
  PExtended(Symbol.Address)^ := PI;

  // Janela e demais componentes
  SymbolTable.Enter('janela',          scType, FDeclTypeInteger, MODL_GRA);
  SymbolTable.Enter('botão',           scType, FDeclTypeInteger, MODL_GRA);
  SymbolTable.Enter('rótulo',          scType, FDeclTypeInteger, MODL_GRA);
  SymbolTable.Enter('editor_lin',      scType, FDeclTypeInteger, MODL_GRA);
  SymbolTable.Enter('editor_txt',      scType, FDeclTypeInteger, MODL_GRA);
  SymbolTable.Enter('caixa_marca',     scType, FDeclTypeInteger, MODL_GRA);
  SymbolTable.Enter('caixa_escolha',   scType, FDeclTypeInteger, MODL_GRA);
  SymbolTable.Enter('caixa_lista',     scType, FDeclTypeInteger, MODL_GRA);
  SymbolTable.Enter('caixa_comb',      scType, FDeclTypeInteger, MODL_GRA);
  SymbolTable.Enter('caixa_grupo',     scType, FDeclTypeInteger, MODL_GRA);
  SymbolTable.Enter('quadro',          scType, FDeclTypeInteger, MODL_GRA);
  SymbolTable.Enter('imagem',          scType, FDeclTypeInteger, MODL_GRA);
  SymbolTable.Enter('som',             scType, FDeclTypeInteger, MODL_MM);

  // dsl_TipoQuadro
//  SymbolTable.Enter('gra_TipoQuadro', scType, FDeclTypeInteger, MODL_GRA);

  // dsl_TipoArquivo
//  SymbolTable.Enter('dsl_TipoArquivo', scType, FDeclTypeInteger, MODL_ARQ);

  // dsl_TipoLeitor
//  SymbolTable.Enter('dsl_TipoLeitor', scType, FDeclTypeInteger, MODL_ARQ);

  // dsl_TipoEscritor
//  SymbolTable.Enter('dsl_TipoEscritor', scType, FDeclTypeInteger, MODL_ARQ);

  // clAqua
  Symbol := SymbolTable.Enter('COR_AZUL_CLARO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clAqua;

  // clBlack
  Symbol := SymbolTable.Enter('COR_PRETO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clBlack;
  Symbol := SymbolTable.Enter('COR_PRETA', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clBlack;

  // clBlue
  Symbol := SymbolTable.Enter('COR_AZUL', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clBlue;

  // clDkGray
  Symbol := SymbolTable.Enter('COR_CINZA_ESCURO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clDkGray;

  // cl Fuchsia
  Symbol := SymbolTable.Enter('COR_FUCHSIA', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clFuchsia;

  // clGray
  Symbol := SymbolTable.Enter('COR_CINZA', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clGray;

  // clGreen
  Symbol := SymbolTable.Enter('COR_VERDE', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clGreen;

  // clLime
  Symbol := SymbolTable.Enter('COR_VERDE_CLARO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clLime;

  // clLtGray
  Symbol := SymbolTable.Enter('COR_CINZA_CLARO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clLtGray;

  // clMaroon
  Symbol := SymbolTable.Enter('COR_MARROM', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clMaroon;

  // clNavy
  Symbol := SymbolTable.Enter('COR_AZUL_MARINHO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clNavy;

  // clOlive
  Symbol := SymbolTable.Enter('COR_OLIVA', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clOlive;

  // clPurple
  Symbol := SymbolTable.Enter('COR_VIOLETA', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clPurple;

  // clRed
  Symbol := SymbolTable.Enter('COR_VERMELHO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clRed;
  Symbol := SymbolTable.Enter('COR_VERMELHA', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clRed;

  // clSilver
  Symbol := SymbolTable.Enter('COR_PRATA', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clSilver;

  // clTeal
  Symbol := SymbolTable.Enter('COR_TEAL', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clTeal;

  // clWhite
  Symbol := SymbolTable.Enter('COR_BRANCO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clWhite;
  Symbol := SymbolTable.Enter('COR_BRANCA', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clWhite;

  // clYellow
  Symbol := SymbolTable.Enter('COR_AMARELO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clYellow;
  Symbol := SymbolTable.Enter('COR_AMARELA', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := clYellow;

  // evento EV_MOUSE_CLICK
  Symbol := SymbolTable.Enter('EV_CLIQUE', scConst, FDeclTypeInteger, MODL_EVNT);
  PInteger(Symbol.Address)^ := EV_MOUSE_CLICK;

  // evento EV_MOUSE_MOVE
  Symbol := SymbolTable.Enter('EV_MOV_MOUSE', scConst, FDeclTypeInteger, MODL_EVNT);
  PInteger(Symbol.Address)^ := EV_MOUSE_MOVE;

  // evento EV_MOUSE_DOWN
  Symbol := SymbolTable.Enter('EV_MOUSE_BAIXO', scConst, FDeclTypeInteger, MODL_EVNT);
  PInteger(Symbol.Address)^ := EV_MOUSE_DOWN;

  // evento EV_MOUSE_UP
  Symbol := SymbolTable.Enter('EV_MOUSE_CIMA', scConst, FDeclTypeInteger, MODL_EVNT);
  PInteger(Symbol.Address)^ := EV_MOUSE_UP;

  // botão do mouse (BM_DIREITO)
  Symbol := SymbolTable.Enter('BM_DIREITO', scConst, FDeclTypeInteger, MODL_EVNT);
  PInteger(Symbol.Address)^ := EV_DIR;

  // botão do mouse (BM_ESQUERDO)
  Symbol := SymbolTable.Enter('BM_ESQUERDO', scConst, FDeclTypeInteger, MODL_EVNT);
  PInteger(Symbol.Address)^ := EV_ESQ;

  // evento EV_SHIFT
  Symbol := SymbolTable.Enter('EV_SHIFT', scConst, FDeclTypeInteger, MODL_EVNT);
  PInteger(Symbol.Address)^ := EV_SHIFT;

  // evento EV_ALT
  Symbol := SymbolTable.Enter('EV_ALT', scConst, FDeclTypeInteger, MODL_EVNT);
  PInteger(Symbol.Address)^ := EV_ALT;

  // evento EV_CTRL
  Symbol := SymbolTable.Enter('EV_CTRL', scConst, FDeclTypeInteger, MODL_EVNT);
  PInteger(Symbol.Address)^ := EV_CTRL;

  // evento EV_KEYBOARD
  Symbol := SymbolTable.Enter('EV_TECLADO', scConst, FDeclTypeInteger, MODL_EVNT);
  PInteger(Symbol.Address)^ := EV_KEYBOARD;

  // evento EV_TIME
  Symbol := SymbolTable.Enter('EV_TEMPO', scConst, FDeclTypeInteger, MODL_EVNT);
  PInteger(Symbol.Address)^ := EV_TIME;

  // evento EV_RESIZE
  Symbol := SymbolTable.Enter('EV_TAMANHO_DA_TELA', scConst, FDeclTypeInteger, MODL_EVNT);
  PInteger(Symbol.Address)^ := EV_RESIZE;

  // estilo do pincel: EP_SOLIDO
  Symbol := SymbolTable.Enter('EP_SOLIDO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := Ord(bsSolid);

  // estilo do pincel: EP_VAZIO
  Symbol := SymbolTable.Enter('EP_VAZIO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := Ord(bsClear);

  // estilo do pincel: EP_DIAG_CIMA
  Symbol := SymbolTable.Enter('EP_DIAG_CIMA', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := Ord(bsBDiagonal);

  // estilo do pincel: EP_DIAG_BAIXO
  Symbol := SymbolTable.Enter('EP_DIAG_BAIXO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := Ord(bsFDiagonal);

  // estilo do pincel: EP_CRUZADO
  Symbol := SymbolTable.Enter('EP_CRUZADO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := Ord(bsCross);

  // estilo do pincel: EP_DIAG_CRUZ
  Symbol := SymbolTable.Enter('EP_DIAG_CRUZ', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := Ord(bsDiagCross);

  // estilo do pincel: EP_HORIZONTAL
  Symbol := SymbolTable.Enter('EP_HORIZONTAL', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := Ord(bsHorizontal);

  // estilo do pincel: EP_VERTICAL
  Symbol := SymbolTable.Enter('EP_VERTICAL', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := Ord(bsVertical);

  // teclado (teclas especiais): TECLA_ENTER
  Symbol := SymbolTable.Enter('TECLA_ENTER', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := Chr(13);

  // teclado (teclas especiais): TECLA_ESC
  Symbol := SymbolTable.Enter('TECLA_ESC', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := Chr(27);

  // teclado (teclas especiais): TECLA_BACKSPACE
  Symbol := SymbolTable.Enter('TECLA_BACKSPACE', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := Chr(8);

  // teclado (teclas especiais): TECLA_TAB
  Symbol := SymbolTable.Enter('TECLA_TAB', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := Chr(9);

  // teclado (teclas especiais): TECLA_INS
  Symbol := SymbolTable.Enter('TECLA_INS', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_INS;

  // teclado (teclas especiais): TECLA_DEL
  Symbol := SymbolTable.Enter('TECLA_DEL', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_DEL;

  // teclado (teclas especiais): TECLA_HOME
  Symbol := SymbolTable.Enter('TECLA_HOME', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_HOME;

  // teclado (teclas especiais): TECLA_END
  Symbol := SymbolTable.Enter('TECLA_END', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_END;

  // teclado (teclas especiais): TECLA_ESQUERDA
  Symbol := SymbolTable.Enter('TECLA_ESQUERDA', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_ESQUERDA;

  // teclado (teclas especiais): TECLA_CIMA
  Symbol := SymbolTable.Enter('TECLA_CIMA', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_CIMA;

  // teclado (teclas especiais): TECLA_DIREITA
  Symbol := SymbolTable.Enter('TECLA_DIREITA', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_DIREITA;

  // teclado (teclas especiais): TECLA_BAIXO
  Symbol := SymbolTable.Enter('TECLA_BAIXO', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_BAIXO;

  // teclado (teclas especiais): TECLA_PGUP
  Symbol := SymbolTable.Enter('TECLA_PGUP', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_PGUP;

  // teclado (teclas especiais): TECLA_PGDN
  Symbol := SymbolTable.Enter('TECLA_PGDN', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_PGDN;

  // teclado (teclas especiais): TECLA_F1
  Symbol := SymbolTable.Enter('TECLA_F1', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_F1;

  // teclado (teclas especiais): TECLA_F2
  Symbol := SymbolTable.Enter('TECLA_F2', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_F2;

  // teclado (teclas especiais): TECLA_F3
  Symbol := SymbolTable.Enter('TECLA_F3', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_F3;

  // teclado (teclas especiais): TECLA_F4
  Symbol := SymbolTable.Enter('TECLA_F4', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_F4;

  // teclado (teclas especiais): TECLA_F5
  Symbol := SymbolTable.Enter('TECLA_F5', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_F5;

  // teclado (teclas especiais): TECLA_F6
  Symbol := SymbolTable.Enter('TECLA_F6', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_F6;

  // teclado (teclas especiais): TECLA_F7
  Symbol := SymbolTable.Enter('TECLA_F7', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_F7;

  // teclado (teclas especiais): TECLA_F8
  Symbol := SymbolTable.Enter('TECLA_F8', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_F8;

  // teclado (teclas especiais): TECLA_F9
  Symbol := SymbolTable.Enter('TECLA_F9', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_F9;

  // teclado (teclas especiais): TECLA_F10
  Symbol := SymbolTable.Enter('TECLA_F10', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_F10;

  // teclado (teclas especiais): TECLA_F11
  Symbol := SymbolTable.Enter('TECLA_F11', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_F11;

  // teclado (teclas especiais): TECLA_F12
  Symbol := SymbolTable.Enter('TECLA_F12', scConst, FDeclTypeChar, MODL_EVNT);
  PChar(Symbol.Address)^ := TECLA_F12;

  // estilo da caneta EC_SOLIDO
  Symbol := SymbolTable.Enter('EC_SÓLIDO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := Integer(psSolid);

  // estilo da caneta EC_TRACO
  Symbol := SymbolTable.Enter('EC_TRAÇO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := Integer(psDash);

  // estilo da caneta EC_PONTO
  Symbol := SymbolTable.Enter('EC_PONTO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := Integer(psDot);

  // estilo da caneta EC_TRACO_PONTO
  Symbol := SymbolTable.Enter('EC_TRAÇO_PONTO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := Integer(psDashDot);

  // estilo da caneta EC_TRACO_PONTO_PONTO
  Symbol := SymbolTable.Enter('EC_TRAÇO_PONTO_PONTO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := Integer(psDashDotDot);

  // estilo da caneta EC_NULO
  Symbol := SymbolTable.Enter('EC_NULO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := Integer(psClear);

  // estilo da caneta EC_INTERNO
  Symbol := SymbolTable.Enter('EC_INTERNO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := Integer(psInsideFrame);

  // estilos fonte
  Symbol := SymbolTable.Enter('EF_NEGRITO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := 1;
  Symbol := SymbolTable.Enter('EF_ITÁLICO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := 2;
  Symbol := SymbolTable.Enter('EF_SUBLINHADO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := 4;
  Symbol := SymbolTable.Enter('EF_RISCADO', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := 8;

  // Tela
  FTela := TQuadroTela.Cria;
  FrmDsl.PaintBox.Tag := Integer(FTela);
  Symbol := SymbolTable.Enter('tela', scConst, FDeclTypeInteger, MODL_GRA);
  PInteger(Symbol.Address)^ := Integer(FTela);
end;

procedure TCompiler.DestroyBitmaps;
var
  I: Integer;
  Bmp: Graphics.TBitmap;
begin
  for I := 0 to FBitmapList.Count - 1 do
  begin
    Bmp := Graphics.TBitmap(FBitmapList[I]);
    Bmp.Free;
  end;
end;

procedure TCompiler.DestroyStreams;
var
  I: Integer;
  RWStrm: TRWStream;
begin
  for I := 0 to FStreamList.Count - 1 do
  begin
    RWStrm := TRWStream(FStreamList[I]);
    RWStrm.Free;
  end;
end;

{ A implementação desta rotina destrói, num primeiro passo, os
  componentes que não contém visualmente outros (ou seja, os que
  não são 'parent'); depois, os possíveis contenedores são destruídos
  num segundo passo.
  Fiz isso (e funcionou) como solução para um problema que ainda não
  entendi. Parece que relação 'parent' está também influenciando a
  ordem em que os objetos estão sendo destruídos.
}
procedure TCompiler.DestroyTQuadroList;
var
  I: Integer;
  LstAux: TList;
  Q: TQuadro;
begin
  LstAux := TList.Create;
  for I := 0 to FTQuadroList.Count - 1 do
  begin
    Q := TQuadro(FTQuadroList[I]);
    // deixa pro final os componentes que podem ser 'parent'
    if (Q.obt_win_control() <> nil) then
      LstAux.Add(Q)
    else
      Q.Free;
  end;

  // destrói os que podem ser 'parent' de outros
  for I := 0 to LstAux.Count - 1 do
    TQuadro(LstAux[I]).Free;
  LstAux.Free;
end;

{ Destrói a lista de TMediaPlayers }
procedure TCompiler.DestroyTMediaPlayerList;
var
  I: Integer;
begin
  for I := 0 to FTMediaPlayerList.Count - 1 do
    TMediaPlayer(FTMediaPlayerList[I]).Free;
end;

{ A implementação desta rotina destrói, num primeiro passo, os
  componentes que não contém visualmente outros (ou seja, os que
  não são 'parent'); depois, os possíveis contenedores são destruídos
  num segundo passo.
  Fiz isso (e funcionou) como solução para um problema que ainda não
  entendi. Parece que relação 'parent' está também influenciando a
  ordem em que os objetos estão sendo destruídos.
}
(*
procedure TCompiler.DestroyCompList;
var
  I: Integer;
  LstAux: TList;
  C: TComponent;
begin
  LstAux := TList.Create;
  for I := 0 to FCompList.Count - 1 do
  begin
    C := TComponent(FCompList[I]);
    // deixa pro final os componentes que podem ser 'parent'
    if (C is TGroupBox) or (C is TPanel) then
      LstAux.Add(C)
    else
      C.Free;
  end;

  // destrói os componentes que podem ser 'parent' de outros
  for I := 0 to LstAux.Count - 1 do
    TComponent(LstAux[I]).Free;
  LstAux.Free;
end;
*)

procedure TCompiler.Error(S: String);
begin
  raise EInterpreterException.Create(S, 1, 1, nil);
end;

(*
  PROBLEMA: Interpretacao de Expression está provocando excecao;
    Tudo indica que tem a ver com a criacao dos symbol infos
    durante a "compilação" da expressao.
    Acho que devo simular a coisa como se tivesse havido,
    no código do usuario, um procedimento Evaluate, previamente
    declarado. A expressao teria sido compilada dentro desse
    "procedimento".

*)
function TCompiler.Evaluate(Expression: String): String;
var
  Source: TStream;
  Si: TSymbolInfo;
  Prod: TProduction;
  SymTbl: TSymbolTable;
begin
  Result := '';

  // stream creation
  Source := TStringStream.Create(Expression);

  // special symbol table for temporary symbol infos
  SymTbl := TSymbolTable.Create(Self);
  SymbolTable.AddScope(SymTbl);

  // evaluate
  State := State + [csEvaluating];
  try
    Prod := Compile(Source, TProd_Expression);
    SymTbl.SetActivation;
    Prod.Interpret;
    Si := Prod.SymbolInfo;
    Result := Si.SymbolType.ValueAsString(Si);
  finally
    Source.Free;
    State := State - [csEvaluating];
    SymbolTable.RemoveScope;
    SymTbl.Free;
  end;
end;

procedure TCompiler.SetProgramSymbolTable(T: TSymbolTable);
begin
  FProgramSymbolTable := T;
end;

function TCompiler.SetSubroutineSymbolTable(T: TSymbolTable): TSymbolTable;
begin
  Result := FSubroutineSymbolTable;
  FSubroutineSymbolTable := T;
end;

{ This function is used only when csEvaluating in state }
function TCompiler.FindSymbol(Symbol: String): TSymbolInfo;

  function Find(T: TSymbolTable; Symbol: String): TSymbolInfo;
  var
    Ind: Integer;
  begin
    Result := nil;
    Ind := T.FTable.IndexOf(Symbol);
    if Ind >= 0 then
      Result := TSymbolInfo(T.FTable.Objects[Ind]);
  end;

begin
  Result := nil;
  if FSubroutineSymbolTable <> nil then
    Result := Find(FSubroutineSymbolTable, Symbol);
  if (Result = nil) and (FProgramSymbolTable <> nil) then
    Result := Find(FProgramSymbolTable, Symbol);
end;

procedure TCompiler.SetBreakpoint(FileName: String; LineNumber: Integer);
begin
  FBreakpointFileName := FileName;
  FBreakpointLine := LineNumber;
end;

procedure TCompiler.BreakOnNextStatement;
begin
  State := State + [csBreakOnNextStmt];
end;

procedure TCompiler.RegisterMouseXY(X, Y: Integer);
begin
  FMouseX := X;
  FMouseY := Y;
end;

procedure TCompiler.RegisterLastEvent(Event: Integer; Sender: TObject);
begin
  FLastEvent := Event;
  FLastEventSender := Sender;
end;

procedure TCompiler.RegisterShiftState(Shift: TShiftState);
begin
  FShiftState := Shift;
end;

procedure TCompiler.RegisterKeyPressed(Key: Char);
begin
  FKeyPressed := Key;
end;

procedure TCompiler.RegisterKeyDown(Key: Word);
begin
  FKeyDown := Key;
end;

procedure TCompiler.RegisterKeyUp(Key: Word);
begin
  FKeyUp := Key;
end;

procedure TCompiler.PushStream(FileName: String);
var
  Strm: TStringList;
  Toks: TPascalTokenizer;
begin
  // cria um stream na memória
  Strm := TStringList.Create;

  // lê do arquivo
  try
    Strm.LoadFromFile(FileName);
  except
    Error(Format(sFileNotFound, [FileName]));
  end;

  // cria um novo parser
//  Strm.Position := 0;
  Toks := TPascalTokenizer.Create(Strm.Text, FileName);
  FParserStack.Add(FParser);
  FIncludeList.Add(FileName);
  FParser := Toks;
end;

procedure TCompiler.PushStringStream(S: String);
var
  Strm: TStringStream;
  Toks: TPascalTokenizer;
begin
  // cria um stream na memória
  Strm := TStringStream.Create(S);

  // cria um novo parser
  Strm.Position := 0;
  Toks := TPascalTokenizer.Create(Strm);
  FParserStack.Add(FParser);
//  FIncludeList.Add(FileName); no caso de inserção de string,
//                              Add(FileName) não é necessário
  FParser := Toks;
end;

procedure TCompiler.PopStream;
begin
  // libera o parser corrente
//  FParser.Stream.Free;
//  FParser.Free;

  // retoma o parser anterior
  FParser := TPascalTokenizer(FParserStack.Last);
  FParserStack.Delete(FParserStack.Count - 1);
end;

procedure TCompiler.TrataOnPaint(Sender: TObject);
var
  Q: TQuadro;
  Canvas: TCanvas;
begin
  if (Sender = FrmDSL.PaintBox) then
  begin
    Q := FTela;
    Canvas := FrmDSL.PaintBox.Canvas;
  end
  else
  begin
    Q := TQuadro((Sender as TForm).Tag);
    Canvas := (Sender as TForm).Canvas;
  end;
  Canvas.CopyRect(Canvas.ClipRect, Q.Bmp.Canvas, Canvas.ClipRect);
end;

procedure TCompiler.TrataOnClickBotao(Sender: TObject);
begin
  if FrmDSL.FWaitingFor and ((EV_MOUSE_CLICK and FrmDSL.FEvents) <> 0) then
  begin
    FrmDSL.FWaitingFor := False;
    RegisterLastEvent(EV_MOUSE_CLICK, Sender);
  end;
end;

procedure TCompiler.TrataOnMouseDownBotao(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FrmDSL.FWaitingFor then
    if (EV_MOUSE_DOWN and FrmDSL.FEvents) <> 0 then
    begin
      RegisterMouseXY(X, Y);
      RegisterShiftState(Shift);
      FrmDSL.FWaitingFor := False; // libera a espera por evento
      RegisterLastEvent(EV_MOUSE_DOWN, Sender);
    end;
end;

procedure TCompiler.TrataOnMouseUpBotao(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FrmDSL.FWaitingFor then
    if (EV_MOUSE_UP and FrmDSL.FEvents) <> 0 then
    begin
      RegisterMouseXY(X, Y);
      RegisterShiftState(Shift);
      FrmDSL.FWaitingFor := False; // libera a espera por evento
      RegisterLastEvent(EV_MOUSE_UP, Sender);
    end;

end;

{ TProduction }

const
  Set_FirstFactor = [tkId, tkIntNumber, tkFloatNumber, tkString, tkChar,
    tkLParen, tkRWnot, tkPlus, tkMinus, tkLBracket, tkRWnil, tkRWfalse,
    tkRWtrue, tkRWyes];
  Set_FirstStmt = [tkId, tkRWbegin, tkRWif, tkRWwhile, tkRWrepeat, tkRWfor,
    tkRWwrite, tkRWwriteln, tkRWwith, tkRWnew, tkRWdispose, tkRWchoose, tkRWread,
    tkRWreturn, tkSemiColon, tkIncrement, tkDecrement];
  Set_FirstDecl = [tkRWconst, tkRWtype, tkRWvar, tkRWprocedure,
                   tkRWfunction, tkRWinclude];
  Set_MulOp = [tkTimes, tkSlash, tkRWdiv, tkRWmod, tkRWand];
  Set_AddOp = [tkPlus, tkMinus, tkRWor, tkRWxor];
  Set_RelOp = [tkLT, tkLE, tkGT, tkGE, tkEqual, tkNE, tkRWin];

constructor TProduction.Create(Compiler: TCompiler);
begin
  inherited Create;
  FCompiler := Compiler;
  FParser := FCompiler.Parser;
  FSymbolTable := FCompiler.SymbolTable;
  FProdLst := TList.Create;
end;

destructor TProduction.Destroy;
var
  I: Integer;
begin
  for I := 0 to FProdLst.Count - 1 do
    TProduction(FProdLst[I]).Free;
  FProdLst.Free;
  inherited Destroy;
end;

procedure TProduction.Error(S: String; Line, Col: Integer);
begin
  raise EInterpreterException.Create(S, Line, Col, Parser);
end;

procedure TProduction.Check(Tokens: TTokens; ErrMsg: String);
begin
  if not (Parser.CurrentToken in Tokens) then
    Error(ErrMsg, Parser.TokenLine, Parser.TokenCol);
end;

procedure TProduction.GetTerminal(Token: TToken);
begin
  if Parser.CurrentToken <> Token then
    Error(Format(sTerminalExpected, [Parser.GetTokenName(Token)]),
      Parser.TokenLine, Parser.TokenCol);
  Parser.GetNextToken;
end;

procedure TProduction.CheckTerminal(Token: TToken);
begin
  if Parser.CurrentToken <> Token then
    Error(Format(sTerminalExpected, [Parser.GetTokenName(Token)]),
      Parser.TokenLine, Parser.TokenCol);
end;

function TProduction.GetProductions(Ind: Integer): TProduction;
begin
  Result := FProdLst[Ind];
end;

function TProduction.GetProductionCount: Integer;
begin
  Result := FProdLst.Count;
end;

function TProduction.GetIdentifier: String;
begin
  Check([tkId, tkRWstring], sIdentifierExpected);
  Result := Parser.TokenString;
  Parser.GetNextToken;
end;

function TProduction.GetNewIdentifier: String;
begin
  Check([tkId], sIdentifierExpected);
  Result := Parser.TokenString;
  if SymbolTable.FindSymbol(Result) <> nil then
    Error(Format(sIdentifierRedeclared, [Parser.TokenString]),
      Parser.TokenLine, Parser.TokenCol);
  Parser.GetNextToken;
end;

procedure TProduction.GetNewIdentifierList(Lst: TStringList);
begin
  repeat
    if Lst.IndexOf(Parser.TokenString) <> -1 then
      Error(Format(sIdentifierRedeclared, [Parser.TokenString]),
        Parser.TokenLine, Parser.TokenCol);
    Lst.Add(GetNewIdentifier);
    if Parser.CurrentToken <> tkComma then
      Break;
    Parser.GetNextToken;
  until False;
end;

//function TProduction.GetIntNumber: Integer;
//begin
//  Check([tkIntNumber], sIntegerNumberExpected);
//  Result := StrToInt(Parser.TokenString);
//  Parser.GetNextToken;
//end;

procedure TProduction.SkipTo(Tokens: TTokens);
begin
  while not (Parser.CurrentToken in Tokens + [tkEndOfSource]) do
    Parser.GetNextToken;
end;

function TProduction.SolveWithStmt(P: TProduction; Symbol: TSymbolInfo)
  : TSymbolInfo;

  function FindRecord(Prod: TProd_WithStmt; Symbol: TSymbolInfo): TSymbolInfo;
  var
    I: Integer;
  begin
    Result := nil;
    for I := Prod.FRecordLst.Count - 1 downto 0 do
      if TProduction(Prod.FRecordLst[I]).SymbolInfo.SymbolType = Symbol.RecordType
      then begin
        Result := TProduction(Prod.FRecordLst[I]).SymbolInfo;
        Exit;
      end;
  end;

begin
  while True do
  begin
    repeat
      P := P.Parent;
    until (P = nil) or (P is TProd_WithStmt);
    if P = nil then
      Error(sSolveWith, ProductionLine, ProductionCol);
    Result := FindRecord(TProd_WithStmt(P), Symbol);
    Exit;
  end;
end;

function TProduction.Compile(ProductionClass: TProductionClass): TProduction;
var
  P: TProduction;
begin
  P := ProductionClass.Create(Compiler);
  P.FParent := Self;
  P.FLevel := Level + 1;
  P.FPosition := Parser.TokenPosition;
  P.FProductionLine := Parser.TokenLine;
  P.FProductionCol := Parser.TokenCol;
  FProdLst.Add(P);
  P.Parse;
  P.FProductionEndLine := Parser.TokenLine;
  P.FProductionEndCol := Parser.TokenCol;
  Result := P;
end;

procedure TProduction.Interpret;
var
  I: Integer;
begin
  for I := 0 to ProductionCount - 1 do
    Productions[I].Interpret;
end;

function TProduction.CheckTypes(T1, T2: TSymbolType; Op: TToken): TSymbolType;

  procedure Error;
  begin
    Self.Error(sIncompatibleTypes, ProductionLine, ProductionCol);
  end;

  procedure OpeError;
  begin
    Self.Error(sOperatorNotApplicable, ProductionLine, ProductionCol);
  end;

  function CheckCompatibility(T1, T2: TSymbolType): TSymbolType;
  begin
    Result := T1;

    // one is subrange of the other
    if (T1.TypeClass = tcSubrange) and (TSubrangeType(T1).FBaseType = T2) then
    begin
      Result := T2;
      Exit;
    end;
    if (T2.TypeClass = tcSubrange) and (TSubrangeType(T2).FBaseType = T1) then
      Exit;

    // both are subranges of the same host type
    if (T1.TypeClass = tcSubrange) and (T2.TypeClass = tcSubrange) and
       (TSubrangeType(T1).FBaseType = TSubrangeType(T2).FBaseType) then
    begin
      Result := TSubrangeType(T1).FBaseType;
      Exit;
    end;

    // both types are set types, and ...
    if (T1.TypeClass = tcSet) and (T2.TypeClass = tcSet) then
    begin
      // one is the empty set
      if (TSetType(T1).FBaseType = nil) or (TSetType(T2).FBaseType = nil) then
        Exit;
      // base types are compatible
      CheckCompatibility(TSetType(T1).FBaseType, TSetType(T2).FBaseType);
      Exit;
    end;

    // one is string and the other is char
    if (T1.TypeClass = tcString) and (T2.TypeClass = tcChar) then
      Exit;
    if (T2.TypeClass = tcString) and (T1.TypeClass = tcChar) then
    begin
      Result := T2;
      Exit;
    end;
    if (T1.TypeClass = tcChar) and (T2.TypeClass = tcChar) and (Op = tkPlus) then
    begin
      Result := Compiler.DeclTypeString;
      Exit;
    end;

    // both are pointers, and ...
    if (T1.TypeClass = tcPointer) and (T2.TypeClass = tcPointer) then
    begin
      // one is nil
      if (T1 = Compiler.DeclTypePointer) or (T2 = Compiler.DeclTypePointer) then
        Exit;
      // base types are the same
      if TPointerType(T1).FBaseType = TPointerType(T2).FBaseType then
        Exit;
    end;

    // promotions
    if (T1.TypeClass = tcInteger) and (T2.TypeClass = tcExtended) then
    begin
      Result := T2;
      Exit;
    end;
    if (T1.TypeClass = tcExtended) and (T2.TypeClass = tcInteger) then
      Exit;
    if (T1.TypeClass = tcSubrange) and
       (TSubrangeType(T1).FBaseType.TypeClass = tcInteger) and
       (T2.TypeClass = tcExtended) then
    begin
      Result := T2;
      Exit;
    end;
    if (T2.TypeClass = tcSubrange) and
       (TSubrangeType(T2).FBaseType.TypeClass = tcInteger) and
       (T1.TypeClass = tcExtended) then
      Exit;

    // both types are the same
    if T1 = T2 then
      Exit;

    Error;
    Result := nil;
  end;

begin
  Result := T1;
  case Op of
    tkTimes, tkPlus, tkMinus:
      begin
        Result := CheckCompatibility(T1, T2);
        if not (Result.TypeClass in
            [tcInteger, tcExtended, tcString, tcSet]) then
          OpeError;
      end;

    tkSlash:
      begin
        CheckCompatibility(T1, T2);
        if not (Result.TypeClass in [tcExtended, tcInteger]) then
          OpeError;
        Result := Compiler.DeclTypeExtended;
      end;

    tkRWdiv, tkRWmod:
      begin
        Result := CheckCompatibility(T1, T2);
        if not (Result.TypeClass in [tcInteger]) then
          OpeError;
      end;

    tkRWand, tkRWor, tkRWxor, tkRWnot:
      begin
        Result := CheckCompatibility(T1, T2);
        if not (Result.TypeClass in [tcInteger, tcBoolean]) then
          OpeError;
      end;

    tkLT, tkGT:
      begin
        Result := CheckCompatibility(T1, T2);
        if not (Result.TypeClass in [tcInteger, tcExtended, tcBoolean,
           tcChar, tcEnum, tcString]) then
          OpeError;
      end;

    tkLE, tkGE, tkEqual, tkNE:
      begin
        Result := CheckCompatibility(T1, T2);
        if not (Result.TypeClass in [tcInteger, tcExtended, tcBoolean, tcChar,
            tcEnum, tcString, tcSet, tcPointer]) then
          OpeError;
      end;

    tkRWin:
      begin
        if T2.TypeClass <> tcSet then
          OpeError;
        CheckCompatibility(T1, TSetType(T2).FBaseType);
        Result := Compiler.DeclTypeBoolean;
      end;

    tkAssign:
      begin
        CheckCompatibility(T1, T2);
        Result := T1;
        if T1.TypeClass = tcSubrange then T1 := TSubrangeType(T1).FBaseType;
        if T2.TypeClass = tcSubrange then T2 := TSubrangeType(T2).FBaseType;
        if (T1.TypeClass = tcChar) and (T2.TypeClass = tcString) then
          Error;
        if (T1.TypeClass = tcInteger) and (T2.TypeClass = tcExtended) then
          Error;
      end;

    else
      raise EInterpreterException.Create(sInvalidOperation, 1, 1, Parser);
  end;
end;

{ Result := S1 op S2 }
procedure TProduction.Operate(Result, S1, S2: TSymbolInfo; Op: TToken);
begin
  try
    case Op of
      // binary ops
      tkTimes, tkSlash, tkRWdiv, tkRWmod, tkRWand, tkPlus, tkMinus, tkRWor,
      tkLT, tkLE, tkGT, tkGE, tkEqual, tkNE, tkRWin:
        S1.SymbolType.Oper(Result.Address, S1.Address, S2.Address, Op, Self);

      // unary ops
      tkRWnot, tkUnaryMinus, tkAssign:
        S1.SymbolType.Oper(Result.Address, S1.Address, nil, Op, Self);
    end;
  except
    on E: Exception do
      Error(sExecutionError + ': ' + E.Message, ProductionLine, ProductionCol);
  end;
end;

function TProduction.FormalParamsOk(PFirst, PSecond: TProd_FormalParamList): Boolean;
var
  I: Integer;
  Si1, Si2: TSymbolInfo;
begin
  Result := False;
  if PSecond.FParamLst.Count > 0 then
  begin
    if PFirst.FParamLst.Count <> PSecond.FParamLst.Count then
      Exit;
    for I := 0 to PFirst.FParamLst.Count - 1 do
    begin
      Si1 := TSymbolInfo(PFirst.FParamLst[I]);
      Si2 := TSymbolInfo(PSecond.FParamLst[I]);
      if Si1.Name <> Si2.Name then
        Exit;
      if Si1.SymbolClass <> Si2.SymbolClass then
        Exit;
      if Si1.SymbolType <> Si2.SymbolType then
        Exit;
    end;
  end;
  Result := True;
end;

procedure TProduction.ShowSyntaxTree(S: TStrings);
var
  Str: String;
  I: Integer;
begin
  Str := '';
  for I := 1 to Level do
    Str := Str + ' ';
  Str := Str + ClassName + ' [' + IntToStr(ProductionLine) + ',' +
    IntToStr(ProductionCol) + ']';
  S.Add(Str);
  for I := 0 to ProductionCount - 1 do
    Productions[I].ShowSyntaxTree(S);
end;

function TProduction.GetSymbolInfo: TSymbolInfo;
begin
  Result := FSymbolInfo;
end;

function TProduction.PromoteTo(T: TSymbolType): Boolean;
var
  St: TSymbolType;
begin
  Result := False;
  if FSymbolInfo = nil then
    Error(sPromoteTo, ProductionLine, ProductionCol);
  if FPromoted <> nil then
    Error(sPromoteTo, ProductionLine, ProductionCol);
  St := FSymbolInfo.SymbolType;
  // promotion from char to string
  if (St.TypeClass = tcChar) and (T.TypeClass = tcString) then
  begin
    FPromoted := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeString);
    Result := True;
  end
  // promotion from integer to extended
  else if (St.TypeClass = tcInteger) and (T.TypeClass = tcExtended) then
  begin
    FPromoted := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeExtended);
    Result := True;
  end
  else if (St.TypeClass = tcSubrange) and
          (TSubrangeType(St).FBaseType.TypeClass = tcInteger) and
          (T.TypeClass = tcExtended) then
  begin
    FPromoted := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeExtended);
    Result := True;
  end;
end;

function TProduction.ExecPromotion: Boolean;
begin
  if FPromoted = nil then
  begin
    Result := False;
    Exit; // nothing to do
  end;
  Result := True;
  if FPromoted.SymbolType.TypeClass = tcString then
    PString(FPromoted.Address)^ := PChar(FSymbolInfo.Address)^
  else // FPromoted.SymbolType.TypeClass = tcExtended
    PExtended(FPromoted.Address)^ := PInteger(FSymbolInfo.Address)^;
end;

procedure TProduction.VerifyDebug(Lin, Col: Integer; Parser: TPascalTokenizer);
begin
  if (Assigned(Compiler.FOnDebug)) then
  begin
    if csBreakOnNextStmt in Compiler.State then
    begin
      Compiler.State := Compiler.State - [csBreakOnNextStmt];
      Compiler.FOnDebug(Self, Lin, Col, Parser);
      if Compiler.FTerminate then
        Error(sUserBreak, Lin, Col);
    end
//    else if (ProductionLine = Compiler.FBreakPointLine) and
//            (Parser.Name = Compiler.FBreakpointFileName) then
    else if (Lin = Compiler.FBreakPointLine) and
            (Parser.Name = Compiler.FBreakpointFileName) then
    begin
      Compiler.FBreakPointLine := 0;
      Compiler.FBreakpointFileName := '';
      Compiler.FOnDebug(Self, Lin, Col, Parser);
      if Compiler.FTerminate then
        Error(sUserBreak, Lin, Col);
    end;
  end;
end;

function TProduction.IsStandardModule(FileName: String): Boolean;
begin
  Result := False; // presume que não é um módulo padrão

  if FileName = MODL_GRA then
    Result := True
  else if FileName = MODL_ARQ then
    Result := True
  else if FileName = MODL_EVNT then
    Result := True
  else if FileName = MODL_MAT then
    Result := True
  else if FileName = MODL_MM then
    Result := True;

  // OBS: MODL_PAC é tratado de forma especial: ele é um "módulo" que
  //      representa coisas da linguagem, de modo que não é necessário
  //      (nem permitido) incluí-lo.
end;

//procedure TProduction.CheckMemory;
//var
//  MemStatus: TMemoryStatus;
//begin
//  MemStatus.dwLength := sizeof(TMemoryStatus);
//  GlobalMemoryStatus(MemStatus);
//  if MemStatus.dwMemoryLoad >= 75 then
//    Error(sOutOfMemory80, 1, 1);
//end;

procedure TProduction.ReplaceSymbolInfo(SiOld, SiNew: TSymbolInfo);
var
  I: Integer;
begin
  if FSymbolInfo = SiOld then
    FSymbolInfo := SiNew;
  if Self is TProd_VarReference then
    with Self as TProd_VarReference do
    begin
      if FVarRef = SiOld then
        FVarRef := SiNew;
    end;
  for I := 0 to ProductionCount - 1 do
    Productions[I].ReplaceSymbolInfo(SiOld, SiNew);
end;

function TProduction.StandardProcedure(ProcName: String): Boolean;
var
  Prod: TProductionClass;
  Modl: String;

  function FindProc(Name: String; var Modl: String): TProductionClass;
  var I: Integer;
  begin
    Result := nil;
    Modl := '';
//    Name := AnsiUpperCase(Name);
    for I := 0 to MAX_PROCS do
//      if Name = AnsiUpperCase(Procs[I]) then
      if Name = Procs[I] then
      begin
        Result := Prods[I];

        // verifica se o módulo associado foi previamente incluído
        // obs: se a rotina é associada a MODL_PAC, considera ok,
        //      pois é como se fosse da linguagem
        if (Modls[I] <> MODL_PAC) and
           (Compiler.FModlList.IndexOf(Modls[I]) < 0) then
          Result := nil;

        Exit;
      end;
  end;

begin
  Prod := FindProc(Parser.TokenString, Modl);
  Result := Prod <> nil;
  if Result then
    Compile(Prod);
end;

function TProduction.EstiloFonteParaInt(Fs: TFontStyles): Integer;
begin
  Result := 0;
  if fsBold in Fs then
    Result := Result + EF_NEGRITO;
  if fsItalic in Fs then
    Result := Result + EF_ITALICO;
  if fsUnderline in Fs then
    Result := Result + EF_SUBLINHADO;
  if fsStrikeOut in Fs then
    Result := Result + EF_RISCADO;
end;

function TProduction.IntParaEstiloFonte(V: Integer): TFontStyles;
begin
  Result := [];
  if (V and EF_NEGRITO) <> 0 then
    Result := Result + [fsBold];
  if (V and EF_ITALICO) <> 0 then
    Result := Result + [fsItalic];
  if (V and EF_SUBLINHADO) <> 0 then
    Result := Result + [fsUnderline];
  if (V and EF_RISCADO) <> 0 then
    Result := Result + [fsStrikeOut];
end;

function TProduction.CarregaImg(Img: TImage; Nome: String): Boolean;
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

(*
procedure TProduction.PreparaTransfDistRot(Canvas: TCanvas; Rot: Extended;
  x, y: Integer);
var
  xf: TXForm;
begin
  // transforma Rot em radianos
  Rot := Rot * PI / 180.0;

  // salva o modo atual
//  GetWorldTransform(Canvas.Handle, FXFormSalvo);
//  FGraphicsModeSalvo := GetGraphicsMode(Canvas.Handle);

  // altera
  if SetGraphicsMode(Canvas.Handle, GM_ADVANCED) = 0 then
    Error('Falha em SetGraphicsMode', ProductionLine, ProductionCol);
  xf.eM11 := cos(Rot);
  xf.eM12 := sin(Rot);
  xf.eM21 := -xf.eM12;  // -sen
  xf.eM22 := xf.eM11;   // cos
  xf.eDx  := x;
  xf.eDy  := y;
  if not SetWorldTransform(Canvas.Handle, xf) then
    Error('Falha em SetWorldTransform', ProductionLine, ProductionCol);
end;
*)

(*
procedure TProduction.RestauraTransfDistRot(Canvas: TCanvas);
begin
//  SetGraphicsMode(Canvas.Handle, FGraphicsModeSalvo);
//  SetWorldTransform(Canvas.Handle, FXFormSalvo);
end;
*)

{ Retorna o nome "completo" do arquivo, considerando a
  restrição de todos os arquivos ficarem direta ou
  indiretamente no diretório "BASE\arqs", onde BASE
  é o diretório onde está o executável. Se nome='abc.txt',
  o resultado será 'BASE\arqs\abc.txt' }
function TProduction.ExpandeNomeArq(Nome: String): String;
const
  DIR_ARQS = 'arqs';
begin
  Result := ExtractFilePath(Application.ExeName);
  Result := IncludeTrailingPathDelimiter(Result) + DIR_ARQS;
  if not IsPathDelimiter(Nome, 1) then
    Result := IncludeTrailingPathDelimiter(Result);
  Result := Result + Nome;
end;

function TProduction.FileStreamToString(Fs: TFileStream): String;
var
  Ss: TStringStream;
begin
  // cria o TStringStream
  try
    Ss := TStringStream.Create('');
  except
    Ss := nil;
  end;
  if Ss = nil then // erro interno, não esperado
    Error(sArquivoNaoEncontrado, ProductionLine, ProductionCol);

  // copia para o arquivo para TStringStream
  try
    Ss.CopyFrom(Fs, Fs.Size);
  except
    Ss.Free;
    Ss := nil;
  end;
  if Ss = nil then
    Error(sArquivoNaoEncontrado, ProductionLine, ProductionCol);

  // retorna como String e libera o TStringStream
  Result := Ss.DataString;
  Ss.Free;
end;

function TProduction.GetParser: TPascalTokenizer;
begin
  Result := FParser;
end;

function TProduction.CarregaBmp(Bmp: Graphics.TBitmap; Nome: String): Boolean;
begin
  Result := True;
  try
    Bmp.LoadFromResourceName(HInstance, Nome);
  except
    Result := False;
  end;
end;

{ TProd_Program }

procedure TProd_Program.Parse;
begin
  if Parser.CurrentToken = tkRWprogram then
  begin
    Parser.GetNextToken;
    GetIdentifier; // nome do programa
    if Parser.CurrentToken = tkLParen then
    begin
      SkipTo([tkRParen]);
      Parser.GetNextToken;
    end;
    GetTerminal(tkSemiColon);
  end;
  Compile(TProd_Block);
  GetTerminal(tkPeriod);
end;

{ TProd_Block }

procedure TProd_Block.Parse;
begin
  Compile(TProd_DeclPart);
  FCompoundStmt := Compile(TProd_CompoundStmt);
end;

procedure TProd_Block.Interpret;
begin
  FCompoundStmt.Interpret;
end;

{ TProd_DeclPart }

procedure TProd_DeclPart.Parse;
begin
  repeat
    if Parser.CurrentToken = tkRWconst then
      Compile(TProd_ConstDeclPart);

    if Parser.CurrentToken = tkRWtype then
      Compile(TProd_TypeDeclPart);

    if Parser.CurrentToken = tkRWvar then
      Compile(TProd_VarDeclPart);

    if Parser.CurrentToken = tkRWinclude then
      Compile(TProd_IncludeDecl);

    if Parser.CurrentToken = tkRWprocedure then
      Compile(TProd_Procedure);

    if Parser.CurrentToken = tkRWfunction then
      Compile(TProd_Function);
(*
    if (csInSubRoutine in Compiler.State) and
       (Parser.CurrentToken in [tkRWprocedure, tkRWfunction]) then
      Error(sSubroutineLevel, ProductionLine, ProductionCol);

    if not (csInSubRoutine in Compiler.State) then
      while Parser.CurrentToken in [tkRWprocedure, tkRWfunction] do
        if Parser.CurrentToken = tkRWprocedure then
          Compile(TProd_Procedure)
        else
          Compile(TProd_Function);
*)

  until not (Parser.CurrentToken in Set_FirstDecl);
end;

{ TProd_ConstDeclPart }

procedure TProd_ConstDeclPart.Parse;
begin
  Parser.GetNextToken; // const
  repeat
    Compile(TProd_ConstDecl);
  until Parser.CurrentToken <> tkId;
end;

{ TProd_ConstDecl }

procedure TProd_ConstDecl.Parse;
var
  Expr: TProduction;
  Id: String;
begin
  Compiler.State := Compiler.State + [csFindInScope];
  Id := GetNewIdentifier;
  Compiler.State := Compiler.State - [csFindInScope];
  GetTerminal(tkEqual);
  Expr := Compile(TProd_ConstExpression);
  FSymbolInfo := SymbolTable.Enter(Id, scConst, Expr.SymbolInfo.SymbolType, MODL_PAC);
  Expr.Interpret;
  Operate(FSymbolInfo, Expr.SymbolInfo, nil, tkAssign);
  GetTerminal(tkSemiColon);
end;

{ TProd_TypeDeclPart }

procedure TProd_TypeDeclPart.Parse;
begin
  Parser.GetNextToken; // type
  Compiler.State := Compiler.State + [csInTypeDecl];
  repeat
    Compile(TProd_TypeDecl);
  until Parser.CurrentToken <> tkId;
  Compiler.State := Compiler.State - [csInTypeDecl];
  // solve pendent pointers
  SymbolTable.CheckPendentPointers;
end;

{ TProd_TypeDecl }

procedure TProd_TypeDecl.Parse;
var
  TypeDecl: TProduction;
begin
  Compiler.State := Compiler.State + [csFindInScope];
  FTypeId := GetNewIdentifier;
  Compiler.State := Compiler.State - [csFindInScope];
  GetTerminal(tkEqual);
  TypeDecl := Compile(TProd_Type);
  SymbolTable.Enter(FTypeId, scType, TypeDecl.SymbolInfo.SymbolType, MODL_PAC);
  GetTerminal(tkSemiColon);
  // take care of pending base pointer type
  if (TypeDecl.SymbolInfo.SymbolType is TPointerType) then
    with TypeDecl.SymbolInfo.SymbolType as TPointerType do
      if FBaseType = nil then
      begin
        FBaseTypeId := FBaseId;
        SymbolTable.AddPendentPointer(Self);
      end;
end;

{ TProd_Type }

procedure TProd_Type.Parse;
begin
  // trata caso especial de declaração de índice de arranjo
  if (csInArrayDecl in Compiler.State) then
  begin
    FSymbolInfo := Compile(TProd_SubrangeType).SymbolInfo;
    Exit;
  end;

  case Parser.CurrentToken of
    tkId:
    begin
      FSymbolInfo := SymbolTable.FindSymbol(Parser.TokenString);
      if FSymbolInfo = nil then
        Error(Format(sUndeclaredIdentifier, [Parser.TokenString]),
          ProductionLine, ProductionCol);

      if FSymbolInfo.SymbolClass = scType then
      begin
        Parser.GetNextToken; // type identifier
        Exit;
      end;

      // subrange type
      FSymbolInfo := Compile(TProd_SubrangeType).SymbolInfo
    end;

    tkRWstring, tkRWinteger, tkRWreal, tkRWboolean, tkRWchar, tkRWyesOrNo:
    begin
      FSymbolInfo := SymbolTable.FindSymbol(
        Parser.GetTokenName(Parser.CurrentToken));
      Parser.GetNextToken;
    end;

    tkIntNumber, tkChar, tkMinus, tkPlus:
      FSymbolInfo := Compile(TProd_SubrangeType).SymbolInfo;

    tkLParen:
      FSymbolInfo := Compile(TProd_EnumType).SymbolInfo;

    tkRWset:
      FSymbolInfo := Compile(TProd_SetType).SymbolInfo;

    tkRWarray:
      FSymbolInfo := Compile(TProd_ArrayType).SymbolInfo;

    tkRWrecord:
      FSymbolInfo := Compile(TProd_RecordType).SymbolInfo;

    tkRWpointer: //tkCaret:
      FSymbolInfo := Compile(TProd_PointerType).SymbolInfo;

(*
    tkRWprocedure:
      FSymbolInfo := Compile(TProd_ProcProceduralType).SymbolInfo;

    tkRWfunction:
      FSymbolInfo := Compile(TProd_FuncProceduralType).SymbolInfo;
*)

    else
      Error(sTypeExpected, ProductionLine, ProductionCol);
  end;
end;

{ TProd_EnumType }

procedure TProd_EnumType.Parse;
var
  Lst: TStringList;
  T: TSymbolType;
  I: Integer;
begin
  Lst := TStringList.Create;
  Lst.CaseSensitive := True;
  try
    Parser.GetNextToken; // (
    GetNewIdentifierList(Lst);
    GetTerminal(tkRParen);
    T := SymbolTable.AllocType(TEnumType);
    for I := 0 to Lst.Count - 1 do
    begin
      FSymbolInfo := SymbolTable.Enter(Lst[I], scConst, T, MODL_PAC);
      PInteger(FSymbolInfo.Address)^ := I;
      TEnumType(T).FEnums.Add(FSymbolInfo);
    end;
  finally
    Lst.Free;
  end;
end;

{ TProd_SubrangeType }

procedure TProd_SubrangeType.Parse;
var
  Inf, Sup: TSymbolInfo;
  T: TSymbolType;
  Expr: TProduction;
begin
  if (csInArrayDecl in Compiler.State) then
  begin
    Parser.GetNextToken; // abre colchete ou vírgula
    Compiler.Parser.Inject('0..');
    Parser.GetNextToken; // 0
  end;
  Expr := Compile(TProd_ConstExpression);
  Expr.Interpret;
  Inf := Expr.SymbolInfo;

  if (csInArrayDecl in Compiler.State) then
  begin
    CheckTerminal(tkDotDot);
    Compiler.Parser.InjectOff;
  end
  else
    GetTerminal(tkDotDot);

  Expr := Compile(TProd_ConstExpression);
  Expr.Interpret;
  Sup := Expr.SymbolInfo;

  if Inf.SymbolType <> Sup.SymbolType then
    Error(sIncompatibleTypes, ProductionLine, ProductionCol);
  if Inf.SymbolType is TCharType then
  begin
    if PChar(Inf.Address)^ > PChar(Sup.Address)^ then
      Error(sLowGTHigh, ProductionLine, ProductionCol);
  end
  else if PInteger(Inf.Address)^ > PInteger(Sup.Address)^ then
    Error(sLowGTHigh, ProductionLine, ProductionCol)
  else if PInteger(Sup.Address)^ <= 0 then
    Error(sIndiceInvalido, ProductionLine, ProductionCol);

  T := SymbolTable.AllocType(TSubrangeType);
  with T as TSubrangeType do
  begin
    FInf := Inf;
    FSup := Sup;
    FBaseType := Inf.SymbolType;
  end;
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scType, T);
end;

{ TProd_SetType }

procedure TProd_SetType.Parse;
var
  TBase, TSet: TSymbolType;
begin
  Parser.GetNextToken; // consume set
  GetTerminal(tkRWof);
  TBase := Compile(TProd_Type).SymbolInfo.SymbolType;
  if not (TBase is TOrdinalType) then
    Error(sOrdinalTypeRequired, ProductionLine, ProductionCol);
  if (TOrdinalType(TBase).MinValue < 0) or
     (TOrdinalType(TBase).MaxValue > 255) then
    Error(sSetsMayHave256, ProductionLine, ProductionCol);
  TSet := SymbolTable.AllocType(TSetType);
  TSetType(TSet).FBaseType := TBase;
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scType, TSet);
end;

{ TProd_ArrayType }

procedure TProd_ArrayType.Parse;
var
  I: Integer;
  T: TSymbolType;
  ElemType: TSymbolInfo;
begin
  Parser.GetNextToken; // array
  CheckTerminal(tkLBracket); // verifica '[' sem obter o próximo token;
                             // isso é para o uso da inserção '0..'
  while True do
  begin
    Compiler.State := Compiler.State + [csInArrayDecl];
    Compile(TProd_IndexType);
    Compiler.State := Compiler.State - [csInArrayDecl];
    if Parser.CurrentToken <> tkComma then
      Break;
//    Parser.GetNextToken; // comma; despreza a vírgula, da mesma forma que o
                           // colchete inicial
  end;
  GetTerminal(tkRBracket);
  GetTerminal(tkRWof);
  ElemType := Compile(TProd_Type).SymbolInfo;

  for I := ProductionCount - 2 downto 0 do
  begin
    T := SymbolTable.AllocType(TArrayType);
    TArrayType(T).FElemSymbol := ElemType;
    TArrayType(T).FIndexSymbol := Productions[I].SymbolInfo;
    FSymbolInfo := SymbolTable.AllocSymbolInfo(scType, T);
    ElemType := FSymbolInfo;
  end;

end;

{ TProd_IndexType }

procedure TProd_IndexType.Parse;
begin
  FSymbolInfo := Compile(TProd_Type).SymbolInfo;
  if not (FSymbolInfo.SymbolType is TOrdinalType) then
    Error(sOrdinalTypeRequired, ProductionLine, ProductionCol);
  if TOrdinalType(FSymbolInfo.SymbolType).Range = 0 then // 'integer' not allowed
    Error(sInvalidIndexType, ProductionLine, ProductionCol);
  if TOrdinalType(FSymbolInfo.SymbolType).Range > MAX_RANGE then
    Error(sInvalidRange, ProductionLine, ProductionCol);
end;

{ TProd_RecordType }

procedure TProd_RecordType.Parse;
var
  T: TRecordType;
  Lst: TStringList;
  I: Integer;
begin
  Parser.GetNextToken; // record

  // new scope
  TSymbolType(T) := SymbolTable.AllocType(TRecordType);
  T.FScope := SymbolTable.NewSymbolTable;
  T.FScope.IsRecordScope := True;
  T.FFieldList := TList.Create;
  SymbolTable.AddScope(T.FScope);

  // parse field list
  Lst := TStringList.Create;
  Lst.CaseSensitive := True;
  while True do
  begin
    // id list
    Lst.Clear;
    Compiler.State := Compiler.State + [csFindInScope];
    GetNewIdentifierList(Lst);
    Compiler.State := Compiler.State - [csFindInScope];
    GetTerminal(tkColon);
    FSymbolInfo := Compile(TProd_Type).SymbolInfo;

    // enter fields
    for I := 0 to Lst.Count - 1 do
    begin
      T.FFieldList.Add(
        SymbolTable.Enter(Lst[I], scField, FSymbolInfo.SymbolType, MODL_PAC));
      T.FSize := T.FSize + FSymbolInfo.SymbolType.Size;
    end;

    if Parser.CurrentToken = tkRWend then
      Break;

    GetTerminal(tkSemiColon);
    if Parser.CurrentToken = tkRWend then
      Break;
  end;
  Parser.GetNextToken; // end
  SymbolTable.RemoveScope;
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scType, T);
  // associate record type with all fields
  for I := 0 to T.FFieldList.Count - 1 do
    TSymbolInfo(T.FFieldList[I]).RecordType := T;
  Lst.Free;
end;

{ TProd_PointerType }

procedure TProd_PointerType.Parse;
var
  Id: String;
  T: TPointerType;
  BaseT: TSymbolType;
begin
  Parser.GetNextToken; // ^ (ponteiro)
  GetTerminal(tkRWfor); // para

  // verifica se é um identificador
  Check([tkId, tkRWstring, tkRWinteger, tkRWreal, tkRWboolean,
         tkRWyesOrNo, tkRWchar], sIdentifierExpected);

  // guarda o string e consome
  Id := Parser.TokenString;
  Parser.GetNextToken;

  // pesquisa
  FSymbolInfo := SymbolTable.FindSymbol(Id);
  if (FSymbolInfo <> nil) then
  begin
    if FSymbolInfo.SymbolClass <> scType then
      Error(sTypeIdentExpected, ProductionLine, ProductionCol);
    BaseT := FSymbolInfo.SymbolType;
  end
  else
  begin
    if not (csInTypeDecl in Compiler.State) then
      Error(sTypeIdentExpected, ProductionLine, ProductionCol);
    BaseT := nil; // will be solved later (see TProd_TypeDecl.Parse)
  end;
  TSymbolType(T) := SymbolTable.AllocType(TPointerType);
  T.FBaseType := BaseT;
  T.FBaseId := Id;
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scType, T);
end;

{ TProd_ParamType }

procedure TProd_ParamType.Parse;
var
  Id: String;
begin
  // verifica se é um identificador de tipo
  Check([tkId, tkRWstring, tkRWinteger, tkRWreal, tkRWboolean,
         tkRWyesOrNo, tkRWchar], sIdentifierExpected);

  // guarda o string e consome
  Id := Parser.TokenString;
  Parser.GetNextToken;

  // procura na tabela, verificando se é um tipo
  FSymbolInfo := SymbolTable.FindSymbol(Id);
  if FSymbolInfo = nil then
    Error(Format(sUndeclaredIdentifier, [Id]), ProductionLine, ProductionCol)
  else if FSymbolInfo.SymbolClass <> scType then
    Error(sTypeIdentExpected, ProductionLine, ProductionCol);
end;

{ TProd_VarDeclPart }

procedure TProd_VarDeclPart.Parse;
begin
  Parser.GetNextToken; // var
  repeat
    Compile(TProd_VarDecl);
  until Parser.CurrentToken <> tkId;
end;

{ TProd_VarDecl }

procedure TProd_VarDecl.Parse;
var
  I: Integer;
  Lst: TStringList;
  ProdType: TProd_Type;
begin
  Lst := TStringList.Create;
  Lst.CaseSensitive := True;
  try
    Compiler.State := Compiler.State + [csFindInScope];
    GetNewIdentifierList(Lst);
    Compiler.State := Compiler.State - [csFindInScope];
    GetTerminal(tkColon);
    ProdType := TProd_Type(Compile(TProd_Type));
    GetTerminal(tkSemiColon);
    for I := 0 to Lst.Count - 1 do
      SymbolTable.Enter(Lst[I], scVar, ProdType.SymbolInfo.SymbolType, MODL_PAC);
  finally
    Lst.Free;
  end;
end;

{ TProd_IncludeDecl }

procedure TProd_IncludeDecl.Parse;
var
  FileName: String;
  StdModl: Boolean;
begin
  Parser.GetNextToken; // inclui

  // obtém o nome do arquivo a ser incluído
  if Parser.CurrentToken <> tkString then
    Error(sFileNameExpected, ProductionLine, ProductionCol);
  FileName := Parser.TokenValue.AsString;

  StdModl := IsStandardModule(FileName);
  if not StdModl then
    FileName := FrmConfig.NomeModuloCompleto(FileName);
  Parser.GetNextToken; // consome o nome do arquivo

  // consome ponto e vírgula obrigatório
  GetTerminal(tkSemiColon);

  // resolve o caso de módulo padrão
  if StdModl then
  begin
    // inclui na lista (caso já não esteja)
    if Compiler.FModlList.IndexOf(FileName) < 0 then
      Compiler.FModlList.Add(FileName);
    Exit;
  end;

  // nada a fazer caso o arquivo já tenha sido incluído
  if (Compiler.FIncludeList.IndexOf(FileName) >= 0) or
     (FileName = Parser.Name) then
    Exit;

  // verifica se o arquivo existe
  if not FileExists(FileName) then
    Error(Format(sFileNotFound, [FileName]), ProductionLine, ProductionCol);

  // empilha novo parser e compila o arquivo incluído
  Compiler.PushStream(FileName);
  try
    Compile(TProd_DeclPart);
  finally
    Compiler.PopStream;
  end;
end;

{ TProd_CompoundStmt }

procedure TProd_CompoundStmt.Parse;
begin
  GetTerminal(tkRWbegin);
  repeat
    if Parser.CurrentToken = tkRWend then
      Break;
    Compile(TProd_Stmt);
    if Parser.CurrentToken <> tkSemiColon then
      Break;
    Parser.GetNextToken; // semicolon
  until Parser.CurrentToken in [tkRWend, tkEndOfSource];
  GetTerminal(tkRWend);
end;

{ TProd_Stmt }

procedure TProd_Stmt.Parse;
begin
  Check(Set_FirstStmt, sStmtExpected);
  case Parser.CurrentToken of
    tkSemiColon:
      Parser.GetNextToken; // ;

    tkRWbegin:
      Compile(TProd_CompoundStmt);

    tkId:
      begin
        // test for some standard procedures
        if StandardProcedure(Parser.TokenString) then
          Exit;
        // user procedure or error
        FSymbolInfo := SymbolTable.FindSymbol(Parser.TokenString);
        if FSymbolInfo = nil then
          Error(Format(sUndeclaredIdentifier, [Parser.TokenString]),
            ProductionLine, ProductionCol)
        else if FSymbolInfo.SymbolClass = scProcedure then
          Compile(TProd_ProcedureCall)
//        else if FSymbolInfo.SymbolClass = scFunction then
//          Compile(TProd_FunctionCall)
        else
          Compile(TProd_AssignStmt);
      end;

    tkRWif:
      Compile(TProd_IfStmt);

    tkRWwhile:
      Compile(TProd_WhileStmt);

    tkRWrepeat:
      Compile(TProd_RepeatStmt);

    tkRWfor:
//      Compile(TProd_ForStmt);
      Compile(TProd_ForStmt_2);

    tkRWwrite:
      Compile(TProd_WriteStmt);

    tkRWwriteln:
      Compile(TProd_WritelnStmt);

    tkRWread:
      Compile(TProd_ReadStmt);

    tkRWwith:
      Compile(TProd_WithStmt);

    tkRWnew:
      Compile(TProd_NewStmt);

    tkRWdispose:
      Compile(TProd_DisposeStmt);

    tkRWchoose:
      Compile(TProd_CaseStmt);

    tkRWreturn:
      Compile(TProd_ReturnStmt);

    tkIncrement, tkDecrement:
      Compile(TProd_PreAssignStmt);
  end;
end;

procedure TProd_Stmt.Interpret;
begin
  Application.ProcessMessages;
  if Compiler.FTerminate then
    Error(sUserBreak, ProductionLine, ProductionCol);
  VerifyDebug(ProductionLine, ProductionCol, Parser);
  inherited Interpret;
end;


{ TProd_AssignStmt }

procedure TProd_AssignStmt.Parse;
var
  T: TSymbolType;
begin
  FSymbolInfo := SymbolTable.FindSymbol(Parser.TokenString);
  if FSymbolInfo = nil then
    Error(Format(sUndeclaredIdentifier, [Parser.TokenString]), ProductionLine,
      ProductionCol);
  if not (FSymbolInfo.SymbolClass in [scVar, scField, scVarParam,
      scFunction]) then
    Error(sLeftSide, ProductionLine, ProductionCol);

//  if FSymbolInfo.SymbolClass = scFunction then
//    Compile(TProd_FunctionAssign)
//  else

  Compile(TProd_VarReference);

  if Parser.CurrentToken = tkAssign then
  begin
    FIsAssignment := True;
    GetTerminal(tkAssign);
    Compile(TProd_Expression);
    T := CheckTypes(Productions[0].SymbolInfo.SymbolType,
      Productions[1].SymbolInfo.SymbolType, tkAssign);
    Productions[1].PromoteTo(T);
  end
  else if (Parser.CurrentToken = tkIncrement) or
          (Parser.CurrentToken = tkDecrement) then
  begin
    FIsIncrDecr := True;
    FTokIncrDecr := Parser.CurrentToken;
    if not (Productions[0].SymbolInfo.SymbolType.TypeClass in [tcInteger]) then
      Error(sIntExprExpected, ProductionLine, ProductionCol);
    Parser.GetNextToken; // ++ ou --
  end;
end;

procedure TProd_AssignStmt.Interpret;
var
  Si: TSymbolInfo;
  T: TOrdinalType;
  OrdValue: Integer;
begin
  Si := nil; // evita um warning do compilador
  if FIsAssignment then
  begin
    Productions[1].Interpret; // expression
    Si := Productions[1].SymbolInfo;

    // test promotion
    if Productions[1].ExecPromotion then
      Si := Productions[1].Promoted;
  end;

  Productions[0].Interpret; // var reference

  if FIsAssignment then
  begin
    // check range
    if Productions[0].SymbolInfo.SymbolType is TOrdinalType then
    begin
      T := TOrdinalType(Si.SymbolType); // expression must be ordinal
      OrdValue := T.OrdinalValue(Si);
      T := TOrdinalType(Productions[0].SymbolInfo.SymbolType);
      if (OrdValue < T.MinValue) or (OrdValue > T.MaxValue) then
        Error(sAssignmentOutOfRange, ProductionLine, ProductionCol);
    end;

    Operate(Productions[0].SymbolInfo, Si, nil, tkAssign);

    // atualiza na memoria
    SymbolTable.UpdateMem(Productions[0].SymbolInfo.SymbolType,
        Integer(Productions[0].SymbolInfo.Address));
  end
  else if FIsIncrDecr then
  begin
    if FTokIncrDecr = tkIncrement then
      Inc(PInteger(Productions[0].SymbolInfo.Address)^)
    else
      Dec(PInteger(Productions[0].SymbolInfo.Address)^);

    // atualiza na memoria
    SymbolTable.UpdateMem(Productions[0].SymbolInfo.SymbolType,
        Integer(Productions[0].SymbolInfo.Address));
  end;
end;

{ TProd_PreAssignStmt }

procedure TProd_PreAssignStmt.Parse;
begin
  FTokIncrDecr := Parser.CurrentToken;
  Parser.GetNextToken; // ++ ou --

  FSymbolInfo := SymbolTable.FindSymbol(Parser.TokenString);
  if FSymbolInfo = nil then
    Error(Format(sUndeclaredIdentifier, [Parser.TokenString]), ProductionLine,
      ProductionCol);
  if not (FSymbolInfo.SymbolClass in [scVar, scField, scVarParam,
      scFunction]) then
    Error(sLeftSide, ProductionLine, ProductionCol);

  Compile(TProd_VarReference);
  if not (Productions[0].SymbolInfo.SymbolType.TypeClass in [tcInteger]) then
    Error(sIntExprExpected, ProductionLine, ProductionCol);
end;

procedure TProd_PreAssignStmt.Interpret;
begin
  Productions[0].Interpret; // var reference
  if FTokIncrDecr = tkIncrement then
    Inc(PInteger(Productions[0].SymbolInfo.Address)^)
  else
    Dec(PInteger(Productions[0].SymbolInfo.Address)^);

  // atualiza na memoria
  SymbolTable.UpdateMem(Productions[0].SymbolInfo.SymbolType,
      Integer(Productions[0].SymbolInfo.Address));
end;

{ TProd_GetPenPosX }

procedure TProd_GetPenPosX.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // obtX
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (TQuadro)

  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_GetPenPosX.Interpret;
var
  Si: TSymbolInfo;
  Q: TQuadro;
  V: Integer;
begin
  Productions[0].Interpret; // Tela (TQuadro)
  Si := Productions[0].SymbolInfo;
  V := PInteger(Si.Address)^;

  { obtém o quadro }
  Q := TQuadro(V);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  { obtém a posição }
  PInteger(FSymbolInfo.Address)^ := Q.obt_caneta_x();
end;

{ TProd_GetPenPosY }

procedure TProd_GetPenPosY.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // obtY
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (TQuadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_GetPenPosY.Interpret;
var
  Si: TSymbolInfo;
  Q: TQuadro;
  V: Integer;
begin
  Productions[0].Interpret; // Tela (TQuadro)
  Si := Productions[0].SymbolInfo;
  V := PInteger(Si.Address)^;

  { obtém o quadro }
  Q := TQuadro(V);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  { obtém a posição }
  PInteger(FSymbolInfo.Address)^ := Q.obt_caneta_y();
end;

{ TProd_BackgroundColor }

procedure TProd_BackgroundColor.Parse;
begin
  Parser.GetNextToken; // BackgroundColor
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_BackgroundColor.Interpret;
begin
  PInteger(FSymbolInfo.Address)^ := FrmDSL.PaintBox.Color;
end;

{ TProd_KeyPressed }

procedure TProd_KeyPressed.Parse;
begin
  Parser.GetNextToken; // KeyPressed
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeChar);
end;

procedure TProd_KeyPressed.Interpret;
begin
  PChar(FSymbolInfo.Address)^ := Compiler.FKeyPressed;
end;

{ TProd_MouseState }

procedure TProd_MouseState.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // EstadoMouse
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression); // estado
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeBoolean);
end;

procedure TProd_MouseState.Interpret;
var
  Si: TSymbolInfo;
  Estado: Integer;
  Shift: TShiftState;
begin
  Productions[0].Interpret; // estado
  Si := Productions[0].SymbolInfo;
  Estado := PInteger(Si.Address)^;
  Shift := [];
  if ((EV_DIR and Estado) <> 0) then
    Shift := Shift + [ssRight];
  if ((EV_ESQ and Estado) <> 0) then
    Shift := Shift + [ssLeft];

  { Resultado da função é: conjunto interseção entre Shift e
    Compiler.FShiftState é igual a Shift }
  PBoolean(FSymbolInfo.Address)^ := (Shift * Compiler.FShiftState) >= Shift;
end;

{ TProd_KeyboardState }

procedure TProd_KeyboardState.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // EstadoTeclado
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression); // estado
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeBoolean);
end;

procedure TProd_KeyboardState.Interpret;
var
  Si: TSymbolInfo;
  Estado: Integer;
  Shift: TShiftState;
begin
  Productions[0].Interpret; // estado
  Si := Productions[0].SymbolInfo;
  Estado := PInteger(Si.Address)^;
  Shift := [];
  if ((EV_SHIFT and Estado) <> 0) then
    Shift := Shift + [ssShift];
  if ((EV_ALT and Estado) <> 0) then
    Shift := Shift + [ssAlt];
  if ((EV_CTRL and Estado) <> 0) then
    Shift := Shift + [ssCtrl];

  { Resultado da função é: conjunto interseção entre Shift e
    Compiler.FShiftState contém a Shift }
  PBoolean(FSymbolInfo.Address)^ := (Shift * Compiler.FShiftState) >= Shift;
end;

{ TProd_NewFrame }

procedure TProd_NewFrame.Parse;
begin
  Parser.GetNextToken; // dsl_quadroNovo()
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_NewFrame.Interpret;
var
  Bmp: Graphics.TBitmap;
begin
  Bmp := Graphics.TBitmap.Create;
  Bmp.Canvas.Brush.Color := clBtnFace; // ATENÇÃO - Mesma cor da propriedade
                                       // Color do componente PaintBox
  Bmp.Transparent := True;
  Bmp.TransparentMode := tmFixed;
  Bmp.TransparentColor := clBtnFace; // ATENÇÃO - Ver comentário acima
  PInteger(FSymbolInfo.Address)^ := Integer(Bmp);
  Compiler.FBitmapList.Add(Bmp);
end;

{ TProd_novaJanela }

procedure TProd_novaJanela.Parse;
begin
  Parser.GetNextToken; // novaJanela
  GetTerminal(tkLParen);

(*
  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // largura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // altura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // texto
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

*)

  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_novaJanela.Interpret;
var
  Q: TQuadroForm;
begin
  // verifica se ultrapassa limite de janelas
  if Compiler.FTQuadroList.Count >= MAX_JANELAS then
    Error(sLimiteJanelasAtingido, ProductionLine, ProductionCol);

  // cria o form
  Application.CreateForm(TFrmJanela, FrmJanela);

  // cria o TQuadro
  Q := TQuadroForm.Cria(FrmJanela);
  FrmJanela.Tag := Integer(Q);
  Compiler.FTQuadroList.Add(Q);

  PInteger(FSymbolInfo.Address)^ := Integer(Q);
end;

{ TProd_altVisJanela }

procedure TProd_altVisJanela.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // altVisJanela
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // vis (visibilidade)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeBoolean then
    Error(sBoolExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_altVisJanela.Interpret;
var
  Si: TSymbolInfo;
  Jan: Integer; // Janela
  Vis: Boolean;
begin
  Productions[0].Interpret; // janela
  Si := Productions[0].SymbolInfo;
  Jan := PInteger(Si.Address)^;

  Productions[1].Interpret; // vis
  Si := Productions[1].SymbolInfo;
  Vis := PBoolean(Si.Address)^;

  // verifica se a janela é válida
  if not (TObject(Jan) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  // altera a visibilidade
  TQuadro(Jan).alt_vis_janela(Vis);
end;

{ TProd_novoBotao }

procedure TProd_novoBotao.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // novoBotão
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // largura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // altura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // texto
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_novoBotao.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..4] of Integer;
  Ps: PString;
  Btn: TMeuSpeedButton;
  JanelaMaeOk: Boolean;
  Q: TQuadro;
  Botao: TQuadroBotao;
  JanelaMae: TWinControl;
begin
  for I := 0 to 4 do
  begin
    Productions[I].Interpret; // janela, x, y, largura, altura
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;
  Productions[5].Interpret; // texto
  Si := Productions[5].SymbolInfo;
  if Productions[5].ExecPromotion then
    Si := Productions[5].Promoted;
  Ps := PString(Si.Address);

  // verifica se a janela é válida
  Q := TQuadro(V[0]);
  JanelaMaeOk := (Q is TQuadro);
  if not JanelaMaeOk then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  // obtém a janela mãe
  JanelaMae := Q.obt_win_control();
  if (JanelaMae = nil) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  // verifica se ultrapassa limite de janelas
  if Compiler.FTQuadroList.Count >= MAX_COMPONENTES then
    Error(sLimiteComponentesAtingido, ProductionLine, ProductionCol);

  // cria o botão
  Btn := TMeuSpeedButton.Create(nil);
  Btn.Parent := JanelaMae;
  Btn.SetBounds(V[1], V[2], V[3], V[4]);
  Btn.Caption := Ps^; // texto

  // eventos
  Btn.OnClick := Compiler.TrataOnClickBotao;
  Btn.OnMouseDown := Compiler.TrataOnMouseDownBotao;
  Btn.OnMouseUp := Compiler.TrataOnMouseUpBotao;

  // cria o TQuadro
  Botao := TQuadroBotao.Cria(Btn);
  Btn.Tag := Integer(Botao);

  // inclui na lista de componentes
  Compiler.FTQuadroList.Add(Botao);

  // salva o valor de retorno
  PInteger(FSymbolInfo.Address)^ := Integer(Botao);
end;

{ TProd_novoRotulo }

procedure TProd_novoRotulo.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // novoRótulo
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // largura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // altura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // texto
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_novoRotulo.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..4] of Integer;
  Ps: PString;
  Lbl: TLabel;
  JanelaMaeOk: Boolean;
  JanelaMae: TWinControl;
  Q: TQuadro;
  Rotulo: TQuadroRotulo;
begin
  for I := 0 to 4 do
  begin
    Productions[I].Interpret; // janela, x, y, largura, altura
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;
  Productions[5].Interpret; // texto
  Si := Productions[5].SymbolInfo;
  if Productions[5].ExecPromotion then
    Si := Productions[5].Promoted;
  Ps := PString(Si.Address);

  // verifica se a janela é válida
  JanelaMaeOk := (TObject(V[0]) is TQuadro);
  if not JanelaMaeOk then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Q := TQuadro(V[0]);
  JanelaMae := Q.obt_win_control();
  if Q = nil then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  // verifica se ultrapassa limite de janelas
  if Compiler.FTQuadroList.Count >= MAX_COMPONENTES then
    Error(sLimiteComponentesAtingido, ProductionLine, ProductionCol);

  // cria o label (rótulo)
  Lbl := TLabel.Create(nil);
  Lbl.Parent := JanelaMae;
  Lbl.AutoSize := True;
  Lbl.SetBounds(V[1], V[2], V[3], V[4]);
  Lbl.Caption := Ps^; // texto

  // eventos
  Lbl.OnClick := Compiler.TrataOnClickBotao;
  Lbl.OnMouseDown := Compiler.TrataOnMouseDownBotao;
  Lbl.OnMouseUp := Compiler.TrataOnMouseUpBotao;

  // cria o TQuadro
  Rotulo := TQuadroRotulo.Cria(Lbl);
  Lbl.Tag := Integer(Rotulo);

  // inclui na lista de componentes
  Compiler.FTQuadroList.Add(Rotulo);

  // salva o valor de retorno
  PInteger(FSymbolInfo.Address)^ := Integer(Rotulo);
end;

{ TProd_novoEdtLin }

procedure TProd_novoEdtLin.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // novoEdtLin
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // largura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // altura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // texto
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_novoEdtLin.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..4] of Integer;
  Ps: PString;
  Edt: TEdit;
  JanelaMaeOk: Boolean;
  Q: TQuadro;
  JanelaMae: TWinControl;
  EditorLin: TQuadroEditorLin;
begin
  for I := 0 to 4 do
  begin
    Productions[I].Interpret; // janela, x, y, largura, altura
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;
  Productions[5].Interpret; // texto
  Si := Productions[5].SymbolInfo;
  if Productions[5].ExecPromotion then
    Si := Productions[5].Promoted;
  Ps := PString(Si.Address);

  // verifica se a janela é válida
  JanelaMaeOk := (TObject(V[0]) is TQuadro);
  if not JanelaMaeOk then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Q := TQuadro(V[0]);
  JanelaMae := Q.obt_win_control();
  if JanelaMae = nil then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  // verifica se ultrapassa limite de janelas
  if Compiler.FTQuadroList.Count >= MAX_COMPONENTES then
    Error(sLimiteComponentesAtingido, ProductionLine, ProductionCol);

  // cria o TEdit (EdtLin)
  Edt := TEdit.Create(nil);
  Edt.Parent := JanelaMae;
  Edt.AutoSize := False;
  Edt.SetBounds(V[1], V[2], V[3], V[4]);
  Edt.Text := Ps^; // texto

  // eventos
  Edt.OnClick := Compiler.TrataOnClickBotao;
  Edt.OnMouseDown := Compiler.TrataOnMouseDownBotao;
  Edt.OnMouseUp := Compiler.TrataOnMouseUpBotao;

  // cria o TQuadroEditorLin
  EditorLin := TQuadroEditorLin.Cria(Edt);
  Edt.Tag := Integer(EditorLin);

  // inclui na lista de componentes
  Compiler.FTQuadroList.Add(EditorLin);

  // salva o valor de retorno
  PInteger(FSymbolInfo.Address)^ := Integer(EditorLin);
end;

{ TProd_novaCxMarca }

procedure TProd_novaCxMarca.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // novaCxMarca
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // largura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // altura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // texto
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_novaCxMarca.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..4] of Integer;
  Ps: PString;
  Cx: TCheckBox;
  JanelaMaeOk: Boolean;
  Q: TQuadro;
  CaixaMarca: TQuadroCaixaMarca;
  JanelaMae: TWinControl;
begin
  for I := 0 to 4 do
  begin
    Productions[I].Interpret; // janela, x, y, largura, altura
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;
  Productions[5].Interpret; // texto
  Si := Productions[5].SymbolInfo;
  if Productions[5].ExecPromotion then
    Si := Productions[5].Promoted;
  Ps := PString(Si.Address);

  // verifica se a janela é válida
  JanelaMaeOk := (TObject(V[0]) is TQuadro);
  if not JanelaMaeOk then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Q := TQuadro(V[0]);
  JanelaMae := Q.obt_win_control();
  if JanelaMae = nil then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  // verifica se ultrapassa limite de componentes
  if Compiler.FTQuadroList.Count >= MAX_COMPONENTES then
    Error(sLimiteComponentesAtingido, ProductionLine, ProductionCol);

  // cria o TCheckBox (CxMarca)
  Cx := TCheckBox.Create(nil);
  Cx.Parent := JanelaMae;
  Cx.SetBounds(V[1], V[2], V[3], V[4]);
  Cx.Caption := Ps^; // texto

  // eventos
  Cx.OnClick := Compiler.TrataOnClickBotao;
  Cx.OnMouseDown := Compiler.TrataOnMouseDownBotao;
  Cx.OnMouseUp := Compiler.TrataOnMouseUpBotao;

  // cria o TQuadroCaixaMarca
  CaixaMarca := TQuadroCaixaMarca.Cria(Cx);
  Cx.Tag := Integer(CaixaMarca);

  // inclui na lista de componentes
  Compiler.FTQuadroList.Add(CaixaMarca);

  // salva o valor de retorno
  PInteger(FSymbolInfo.Address)^ := Integer(CaixaMarca);
end;

{ TProd_novaCxEscolha }

procedure TProd_novaCxEscolha.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // novaCxEscolha
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // largura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // altura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // texto
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_novaCxEscolha.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..4] of Integer;
  Ps: PString;
  Cx: TRadioButton;
  JanelaMaeOk: Boolean;
  JanelaMae: TWinControl;
  CaixaEscolha: TQuadroCaixaEscolha;
  Q: TQuadro;
begin
  for I := 0 to 4 do
  begin
    Productions[I].Interpret; // janela, x, y, largura, altura
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;
  Productions[5].Interpret; // texto
  Si := Productions[5].SymbolInfo;
  if Productions[5].ExecPromotion then
    Si := Productions[5].Promoted;
  Ps := PString(Si.Address);

  // verifica se a janela é válida
  JanelaMaeOk := (TObject(V[0]) is TQuadro);
  if not JanelaMaeOk then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Q := TQuadro(V[0]);
  JanelaMae := Q.obt_win_control();
  if JanelaMae = nil then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  // verifica se ultrapassa limite de componentes
  if Compiler.FTQuadroList.Count >= MAX_COMPONENTES then
    Error(sLimiteComponentesAtingido, ProductionLine, ProductionCol);

  // cria o TRadioButton (CxEscolha)
  Cx := TRadioButton.Create(nil);
  Cx.Parent := JanelaMae;
  Cx.SetBounds(V[1], V[2], V[3], V[4]);
  Cx.Caption := Ps^; // texto

  // eventos
  Cx.OnClick := Compiler.TrataOnClickBotao;
  Cx.OnMouseDown := Compiler.TrataOnMouseDownBotao;
  Cx.OnMouseUp := Compiler.TrataOnMouseUpBotao;

  // cria o TQuadroCaixaEscolha
  CaixaEscolha := TQuadroCaixaEscolha.Cria(Cx);
  Cx.Tag := Integer(CaixaEscolha);

  // inclui na lista de componentes
  Compiler.FTQuadroList.Add(CaixaEscolha);

  // salva o valor de retorno
  PInteger(FSymbolInfo.Address)^ := Integer(CaixaEscolha);
end;

{ TProd_novaCxLst }

procedure TProd_novaCxLst.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // novaCxLst
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // largura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // altura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // texto
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_novaCxLst.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..4] of Integer;
  Ps: PString;
  Cx: TListBox;
  JanelaMaeOk: Boolean;
  JanelaMae: TWinControl;
  Q: TQuadro;
  CaixaLista: TQuadroCaixaLista;
begin
  for I := 0 to 4 do
  begin
    Productions[I].Interpret; // janela, x, y, largura, altura
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;
  Productions[5].Interpret; // texto
  Si := Productions[5].SymbolInfo;
  if Productions[5].ExecPromotion then
    Si := Productions[5].Promoted;
  Ps := PString(Si.Address);

  // verifica se a janela é válida
  JanelaMaeOk := (TObject(V[0]) is TQuadro);
  if not JanelaMaeOk then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Q := TQuadro(V[0]);
  JanelaMae := Q.obt_win_control();
  if JanelaMae = nil then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  // verifica se ultrapassa limite de componentes
  if Compiler.FTQuadroList.Count >= MAX_COMPONENTES then
    Error(sLimiteComponentesAtingido, ProductionLine, ProductionCol);

  // cria o TListBox (CxLst)
  Cx := TListBox.Create(nil);
  Cx.Parent := JanelaMae;
  Cx.SetBounds(V[1], V[2], V[3], V[4]);
  Cx.Items.Text := Ps^; // texto

  // eventos
  Cx.OnClick := Compiler.TrataOnClickBotao;
  Cx.OnMouseDown := Compiler.TrataOnMouseDownBotao;
  Cx.OnMouseUp := Compiler.TrataOnMouseUpBotao;

  // cria a CaixaLista
  CaixaLista := TQuadroCaixaLista.Cria(Cx);
  Cx.Tag := Integer(CaixaLista);

  // inclui na lista de componentes
  Compiler.FTQuadroList.Add(CaixaLista);

  // salva o valor de retorno
  PInteger(FSymbolInfo.Address)^ := Integer(CaixaLista);
end;

{ TProd_novaCxCmb }

procedure TProd_novaCxCmb.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // novaCxCmb
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // largura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // altura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // texto
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_novaCxCmb.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..4] of Integer;
  Ps: PString;
  Cx: TComboBox;
  JanelaMaeOk: Boolean;
  JanelaMae: TWinControl;
  Q: TQuadro;
  CaixaComb: TQuadroCaixaComb;
begin
  for I := 0 to 4 do
  begin
    Productions[I].Interpret; // janela, x, y, largura, altura
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;
  Productions[5].Interpret; // texto
  Si := Productions[5].SymbolInfo;
  if Productions[5].ExecPromotion then
    Si := Productions[5].Promoted;
  Ps := PString(Si.Address);

  // verifica se a janela é válida
  JanelaMaeOk := (TObject(V[0]) is TQuadro);
  if not JanelaMaeOk then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Q := TQuadro(V[0]);
  JanelaMae := Q.obt_win_control();
  if JanelaMae = nil then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  // verifica se ultrapassa limite de componentes
  if Compiler.FTQuadroList.Count >= MAX_COMPONENTES then
    Error(sLimiteComponentesAtingido, ProductionLine, ProductionCol);

  // cria o TComboBox (CxCmb)
  Cx := TComboBox.Create(nil);
  Cx.Parent := JanelaMae;
  Cx.SetBounds(V[1], V[2], V[3], V[4]);
  Cx.Items.Text := Ps^; // texto

  // eventos
  Cx.OnClick := Compiler.TrataOnClickBotao;

  // cria o TQuadroCaixaComb
  CaixaComb := TQuadroCaixaComb.Cria(Cx);
  Cx.Tag := Integer(CaixaComb);

  // inclui na lista de componentes
  Compiler.FTQuadroList.Add(CaixaComb);

  // salva o valor de retorno
  PInteger(FSymbolInfo.Address)^ := Integer(CaixaComb);
end;

{ TProd_novaCxGrupo }

procedure TProd_novaCxGrupo.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // novaCxGrupo
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // largura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // altura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // texto
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_novaCxGrupo.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..4] of Integer;
  Ps: PString;
  Cx: TMeuGroupBox;
  JanelaMaeOk: Boolean;
  JanelaMae: TWinControl;
  Q: TQuadro;
  CaixaGrupo: TQuadroGroupBox;
begin
  for I := 0 to 4 do
  begin
    Productions[I].Interpret; // janela, x, y, largura, altura
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;
  Productions[5].Interpret; // texto
  Si := Productions[5].SymbolInfo;
  if Productions[5].ExecPromotion then
    Si := Productions[5].Promoted;
  Ps := PString(Si.Address);

  // verifica se a janela é válida
  JanelaMaeOk := (TObject(V[0]) is TQuadro);
  if not JanelaMaeOk then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Q := TQuadro(V[0]);
  JanelaMae := Q.obt_win_control();
  if JanelaMae = nil then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  // verifica se ultrapassa limite de componentes
  if Compiler.FTQuadroList.Count >= MAX_COMPONENTES then
    Error(sLimiteComponentesAtingido, ProductionLine, ProductionCol);

  // cria o TGroupBox (CxGrupo)
  Cx := TMeuGroupBox.Create(nil);
  Cx.Parent := JanelaMae;
  Cx.SetBounds(V[1], V[2], V[3], V[4]);
  Cx.Caption := Ps^; // texto

  // eventos
  Cx.OnClick := Compiler.TrataOnClickBotao;
  Cx.OnMouseDown := Compiler.TrataOnMouseDownBotao;
  Cx.OnMouseUp := Compiler.TrataOnMouseUpBotao;

  // cria o TQuadroGroupBox
  CaixaGrupo := TQuadroGroupBox.Cria(Cx);
  Cx.Tag := Integer(CaixaGrupo);

  // inclui na lista de componentes
  Compiler.FTQuadroList.Add(CaixaGrupo);

  // salva o valor de retorno
  PInteger(FSymbolInfo.Address)^ := Integer(CaixaGrupo);
end;

{ TProd_novoPainel }

procedure TProd_novoPainel.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // novoPainel
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // largura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // altura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // texto
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_novoPainel.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..4] of Integer;
  Ps: PString;
  Cx: TMeuPanel;
  JanelaMaeOk: Boolean;
  JanelaMae: TWinControl;
  Q: TQuadro;
  Panel: TQuadroPanel;
begin
  for I := 0 to 4 do
  begin
    Productions[I].Interpret; // janela, x, y, largura, altura
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;
  Productions[5].Interpret; // texto
  Si := Productions[5].SymbolInfo;
  if Productions[5].ExecPromotion then
    Si := Productions[5].Promoted;
  Ps := PString(Si.Address);

  // verifica se a janela é válida
  JanelaMaeOk := (TObject(V[0]) is TQuadro);
  if not JanelaMaeOk then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Q := TQuadro(V[0]);
  JanelaMae := Q.obt_win_control();
  if JanelaMae = nil then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  // verifica se ultrapassa limite de componentes
  if Compiler.FTQuadroList.Count >= MAX_COMPONENTES then
    Error(sLimiteComponentesAtingido, ProductionLine, ProductionCol);

  // cria o TPanel (Painel)
  Cx := TMeuPanel.Create(nil);
  Cx.Parent := JanelaMae;
  Cx.SetBounds(V[1], V[2], V[3], V[4]);
  Cx.Caption := Ps^; // texto

  // eventos
  Cx.OnClick := Compiler.TrataOnClickBotao;
  Cx.OnMouseDown := Compiler.TrataOnMouseDownBotao;
  Cx.OnMouseUp := Compiler.TrataOnMouseUpBotao;

  // cria o TQuadroPanel
  Panel := TQuadroPanel.Cria(Cx);
  Cx.Tag := Integer(Panel);

  // inclui na lista de componentes
  Compiler.FTQuadroList.Add(Panel);

  // salva o valor de retorno
  PInteger(FSymbolInfo.Address)^ := Integer(Panel);
end;

{ TProd_novaImagem }

procedure TProd_novaImagem.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // novaImagem
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // largura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // altura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // nome imagem
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_novaImagem.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..4] of Integer;
  Ps: PString;
  Img: TImage;
  JanelaMaeOk: Boolean;
  JanelaMae: TWinControl;
  Q: TQuadro;
  Imagem: TQuadroImagem;
begin
  for I := 0 to 4 do
  begin
    Productions[I].Interpret; // janela, x, y, largura, altura
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;
  Productions[5].Interpret; // nome
  Si := Productions[5].SymbolInfo;
  if Productions[5].ExecPromotion then
    Si := Productions[5].Promoted;
  Ps := PString(Si.Address);

  // verifica se a janela é válida
  JanelaMaeOk := (TObject(V[0]) is TQuadro);
  if not JanelaMaeOk then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Q := TQuadro(V[0]);
  JanelaMae := Q.obt_win_control();
  if JanelaMae = nil then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  // verifica se ultrapassa limite de componentes
  if Compiler.FTQuadroList.Count >= MAX_COMPONENTES then
    Error(sLimiteComponentesAtingido, ProductionLine, ProductionCol);

  // cria o TImage (Imagem)
  Img := TImage.Create(nil);
  Img.Parent := JanelaMae;
  Img.SetBounds(V[1], V[2], V[3], V[4]);
  Img.AutoSize := False;
  Img.Stretch := True;
  if not CarregaImg(Img, Ps^) then
    Error(sImagem + ' "' + Ps^ + '" ' + sNaoEncontrada, ProductionLine, ProductionCol);

  // eventos
  Img.OnClick := Compiler.TrataOnClickBotao;
  Img.OnMouseDown := Compiler.TrataOnMouseDownBotao;
  Img.OnMouseUp := Compiler.TrataOnMouseUpBotao;

  // cria o TQuadroImagem
  Imagem := TQuadroImagem.Cria(Img);
  Img.Tag := Integer(Imagem);

  // inclui na lista de componentes
  Compiler.FTQuadroList.Add(Imagem);

  // salva o valor de retorno
  PInteger(FSymbolInfo.Address)^ := Integer(Imagem);
end;

{ TProd_novaImagemCrg }

procedure TProd_novaImagemCrg.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // nova_imagem_crg
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // nome imagem
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_novaImagemCrg.Interpret;
var
  Si: TSymbolInfo;
  Ps: PString;
  Bmp: Graphics.TBitmap;
  Imagem: TQuadroBitmap;
begin
  Productions[0].Interpret; // nome
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  Ps := PString(Si.Address);

  // verifica se ultrapassa limite de componentes
  if Compiler.FTQuadroList.Count >= MAX_COMPONENTES then
    Error(sLimiteComponentesAtingido, ProductionLine, ProductionCol);

  // cria o TBitmap
  Bmp := Graphics.TBitmap.Create;
  if not CarregaBmp(Bmp, Ps^) then
    Error(sImagem + ' "' + Ps^ + '" ' + sNaoEncontrada, ProductionLine, ProductionCol);

  // eventos
     // sem eventos

  // cria o TQuadroBitmap
  Imagem := TQuadroBitmap.Cria(Bmp);
  // Img.Tag := Integer(Imagem);

  // inclui na lista de componentes
  Compiler.FTQuadroList.Add(Imagem);

  // salva o valor de retorno
  PInteger(FSymbolInfo.Address)^ := Integer(Imagem);
end;

{ TProd_novoEdtLinhas }

procedure TProd_novoEdtLinhas.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // novoEdtLinhas
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // largura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // altura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // texto
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_novoEdtLinhas.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..4] of Integer;
  Ps: PString;
  Edt: TMemo;
  JanelaMaeOk: Boolean;
  JanelaMae: TWinControl;
  Q: TQuadro;
  EditorTxt: TQuadroEditorTxt;
begin
  for I := 0 to 4 do
  begin
    Productions[I].Interpret; // janela, x, y, largura, altura
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;
  Productions[5].Interpret; // texto
  Si := Productions[5].SymbolInfo;
  if Productions[5].ExecPromotion then
    Si := Productions[5].Promoted;
  Ps := PString(Si.Address);

  // verifica se a janela é válida
  JanelaMaeOk := (TObject(V[0]) is TQuadro);
  if not JanelaMaeOk then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Q := TQuadro(V[0]);
  JanelaMae := Q.obt_win_control();
  if JanelaMae = nil then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  // verifica se ultrapassa limite de janelas
  if Compiler.FTQuadroList.Count >= MAX_COMPONENTES then
    Error(sLimiteComponentesAtingido, ProductionLine, ProductionCol);

  // cria o TMemo (EdtLinhas)
  Edt := TMemo.Create(nil);
  Edt.Parent := JanelaMae;
  Edt.SetBounds(V[1], V[2], V[3], V[4]);
  Edt.ScrollBars := ssBoth;
  Edt.Text := Ps^; // texto

  // eventos
  Edt.OnClick := Compiler.TrataOnClickBotao;
  Edt.OnMouseDown := Compiler.TrataOnMouseDownBotao;
  Edt.OnMouseUp := Compiler.TrataOnMouseUpBotao;

  // cria o TQuadroEditorTxt
  EditorTxt := TQuadroEditorTxt.Cria(Edt);
  Edt.Tag := Integer(EditorTxt);

  // inclui na lista de componentes
  Compiler.FTQuadroList.Add(EditorTxt);

  // salva o valor de retorno
  PInteger(FSymbolInfo.Address)^ := Integer(EditorTxt);
end;

{ TProd_libJanela }

procedure TProd_libJanela.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // libJanela
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_libJanela.Interpret;
var
  Si: TSymbolInfo;
  V: Integer;
begin
  Productions[0].Interpret; // janela
  Si := Productions[0].SymbolInfo;
  V := PInteger(Si.Address)^;

  // verifica se a janela é válida
  if not (TObject(V) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  // remove da lista
  Compiler.FTQuadroList.Remove(Pointer(V));

  // libera o TQuadro
  TQuadro(V).Free;
end;

{ TProd_altPosJanela }

procedure TProd_altPosJanela.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // altPosJanela
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_altPosJanela.Interpret;
var
  Si: TSymbolInfo;
  V: array [0..2] of Integer;
  I: Integer;
begin
  for I := 0 to 2 do
  begin
    Productions[I].Interpret; // janela, x, y
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  // verifica se o componente é valido
  if not (TObject(V[0]) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  // altera a posição
  TQuadro(V[0]).alt_pos_janela(V[1], V[2]);
end;

{ TProd_copJanela }

procedure TProd_copJanela.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // copJanela
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // jan
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // janOrig
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_copJanela.Interpret;
var
  Si: TSymbolInfo;
  V: array [0..3] of Integer;
  Jan, JanOrig: TQuadro;
  I: Integer;
begin
  for I := 0 to 3 do
  begin
    Productions[I].Interpret; // jan, x, y, janOrig
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  // verifica se as janelas são válidas
  if not (TObject(V[0]) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  if not (TObject(V[3]) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Jan := TQuadro(V[0]);
  JanOrig := TQuadro(V[3]);

  Jan.cop_janela(V[1], V[2], JanOrig);
end;


{ TProd_copJanelaDist }

procedure TProd_copJanelaDist.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // copJanela
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // jan
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // janOrig
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

(*
procedure TProd_copJanelaDist.Interpret;
var
  Si: TSymbolInfo;
  V: array [0..5] of Integer;
  Jan, JanOrig: TQuadro;
  I: Integer;
begin
  for I := 0 to 5 do
  begin
    Productions[I].Interpret; // jan, x1, y1, x2, y2, janOrig
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  // verifica se as janelas são válidas
  if not (TObject(V[0]) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  if not (TObject(V[5]) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Jan := TQuadro(V[0]);
  JanOrig := TQuadro(V[5]);

  // copia JanOrig para o retângulo (x1, y1, x2, y2) de Jan
  // copia na "tela" só se visível
  if Jan.Form.Visible then
    Jan.CanvasForm.StretchDraw(Rect(V[1], V[2], V[3], V[4]), JanOrig.Bmp);
  // sempre copia no bitmap
  Jan.Bmp.Canvas.StretchDraw(Rect(V[1], V[2], V[3], V[4]), JanOrig.Bmp);
end;
*)

{ TProd_copJanelaDistRot }
(*
procedimento copJanelaDistRot(jan: Janela;
                              x1, y1, x2, y2: inteiro;
                              rot: real;
                              xr, yr: inteiro;
                              janOrig: Janela);
*)
procedure TProd_copJanelaDistRot.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // copJanelaDistRot
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // jan
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // rot
  T := CheckTypes(Compiler.DeclTypeExtended, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // xr
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // yr
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // janOrig
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

(*
procedure TProd_copJanelaDistRot.Interpret;
var
  Si: TSymbolInfo;
  X1, Y1, X2, Y2, Xrot, Yrot, V: Integer;
  Rot: Extended;
  Jan, JanOrig: TQuadro;
begin
  Productions[0].Interpret; // jan
  Si := Productions[0].SymbolInfo;
  V := PInteger(Si.Address)^;
  if not (TObject(V) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Jan := TQuadro(V);

  Productions[1].Interpret; // x1
  Si := Productions[1].SymbolInfo;
  X1 := PInteger(Si.Address)^;

  Productions[2].Interpret; // y1
  Si := Productions[2].SymbolInfo;
  Y1 := PInteger(Si.Address)^;

  Productions[3].Interpret; // x2
  Si := Productions[3].SymbolInfo;
  X2 := PInteger(Si.Address)^;

  Productions[4].Interpret; // y2
  Si := Productions[4].SymbolInfo;
  Y2 := PInteger(Si.Address)^;

  Productions[5].Interpret; // rot
  Si := Productions[5].SymbolInfo;
  if Productions[5].ExecPromotion then
    Si := Productions[5].Promoted;
  Rot := PExtended(Si.Address)^;

  Productions[6].Interpret; // xr
  Si := Productions[6].SymbolInfo;
  Xrot := PInteger(Si.Address)^;

  Productions[7].Interpret; // yr
  Si := Productions[7].SymbolInfo;
  Yrot := PInteger(Si.Address)^;

  Productions[8].Interpret; // janOrig
  Si := Productions[8].SymbolInfo;
  V := PInteger(Si.Address)^;
  if not (TObject(V) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  JanOrig := TQuadro(V);

  // faz a cópia de acordo com o uso de rotação
  if Rot = 0.0 then
  begin
    // copia JanOrig para o retângulo (x1, y1, x2, y2) de Jan
    // copia na "tela" só se visível
    if Jan.Form.Visible then
      Jan.CanvasForm.StretchDraw(Rect(X1, Y1, X2, Y2), JanOrig.Bmp);
    // sempre copia no bitmap
    Jan.Bmp.Canvas.StretchDraw(Rect(X1, Y1, X2, Y2), JanOrig.Bmp);
  end
  else
  begin
    // faz a cópia com rotação no bitmap
    PreparaTransfDistRot(Jan.Bmp.Canvas, -Rot, Xrot, Yrot);
    Jan.Bmp.Canvas.StretchDraw(Rect(Round(X1 - Xrot), Round(Y1 - Yrot),
                                    Round(X2 - Xrot), Round(Y2 - Yrot)),
                               JanOrig.Bmp);
    RestauraTransfDistRot(Jan.Bmp.Canvas);

    // se visível, faz a cópia no form
    if Jan.Form.Visible then
    begin
      PreparaTransfDistRot(Jan.CanvasForm, -Rot, Xrot, Yrot);
      Jan.CanvasForm.StretchDraw(Rect(Round(X1 - Xrot), Round(Y1 - Yrot),
                                    Round(X2 - Xrot), Round(Y2 - Yrot)),
                                 JanOrig.Bmp);
      RestauraTransfDistRot(Jan.CanvasForm);
    end;
  end;
end;
*)

{ TProd_copJanelaRot }
(*
procedimento copJanelaRot(jan: Janela;
                          x, y: inteiro;
                          rot: real;
                          janOrig: Janela);
*)
procedure TProd_copJanelaRot.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // copJanelaRot
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // jan
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // rot
  T := CheckTypes(Compiler.DeclTypeExtended, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // janOrig
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

(*
procedure TProd_copJanelaRot.Interpret;
var
  Si: TSymbolInfo;
  x, y, xDraw, yDraw, V: Integer;
  Rot: Extended;
  Jan, JanOrig: TQuadro;
begin
  Productions[0].Interpret; // jan
  Si := Productions[0].SymbolInfo;
  V := PInteger(Si.Address)^;
  if not (TObject(V) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Jan := TQuadro(V);

  Productions[1].Interpret; // x
  Si := Productions[1].SymbolInfo;
  x := PInteger(Si.Address)^;

  Productions[2].Interpret; // y
  Si := Productions[2].SymbolInfo;
  y := PInteger(Si.Address)^;

  Productions[3].Interpret; // rot
  Si := Productions[3].SymbolInfo;
  if Productions[3].ExecPromotion then
    Si := Productions[3].Promoted;
  Rot := PExtended(Si.Address)^;

  Productions[4].Interpret; // janOrig
  Si := Productions[4].SymbolInfo;
  V := PInteger(Si.Address)^;
  if not (TObject(V) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  JanOrig := TQuadro(V);

  // determina (xDraw, yDraw) tendo em conta que (x, y) é o centro
  xDraw := x - (JanOrig.Bmp.Width div 2);
  yDraw := y - (JanOrig.Bmp.Height div 2);

  // faz a cópia com rotação no bitmap
  PreparaTransfDistRot(Jan.Bmp.Canvas, -Rot, x, y);
  Jan.Bmp.Canvas.Draw(xDraw - x, yDraw - y, JanOrig.Bmp);

  // se visível, faz a cópia no form
// if Jan.Form.Visible then
//  begin
//
//    PreparaTransfDistRot(Jan.CanvasForm, -Rot, x, y);
//    Jan.CanvasForm.Draw(xDraw - x, yDraw - y, JanOrig.Bmp);
//
    if Jan.Form = FrmDSL then
      FrmDSL.PaintBox.Repaint
    else
      Jan.Form.Repaint;
//  end;
end;
*)


{ TProd_obtPos }

procedure TProd_obtPos.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // obtPos
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // componente
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_VarReference); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  if (E.SymbolInfo.SymbolClass <> scVar) and
     (E.SymbolInfo.SymbolClass <> scField) and
     (E.SymbolInfo.SymbolClass <> scVarParam) then
    Error(sWrongActual2, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_VarReference); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  if (E.SymbolInfo.SymbolClass <> scVar) and
     (E.SymbolInfo.SymbolClass <> scField) and
     (E.SymbolInfo.SymbolClass <> scVarParam) then
    Error(sWrongActual2, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_obtPos.Interpret;
(*
var
  Si: TSymbolInfo;
  V: array [0..2] of Integer;
  I, X, Y: Integer;
  ehQuadro, ehComp: Boolean;
  Ctrl: TControl;
*)
begin
(*
  Productions[0].Interpret; // Componente
  Si := Productions[0].SymbolInfo;
  V[0] := PInteger(Si.Address)^;

  // verifica se o componente é valido
  ehQuadro := TObject(V[0]) is TQuadro;
  ehComp := TObject(V[0]) is TComponent;
  if not (ehQuadro or ehComp) then
    Error(sComponentTypeExpected, ProductionLine, ProductionCol);

  // obtém a posição do componente
//  obtPosComp(TObject(V[0]), X, Y);
{ OBS: A rotina obtPosComp está comentada porque resolvi não
       implementá-la por enquanto. Na verdade, hoje, 23/07/2008,
       resolvi não incluir no SW-Tutor as coisas referentes ao
       uso de componentes. Está me parecendo uma complicação
       incluir não
}

  // atualiza os argumentos var
  Productions[1].Interpret; // x
  Si := Productions[1].SymbolInfo;
  PInteger(Si.Address)^ := X;
  Productions[2].Interpret; // y
  Si := Productions[2].SymbolInfo;
  PInteger(Si.Address)^ := Y;

  // atualiza na memoria
  SymbolTable.UpdateMem(Productions[1].SymbolInfo.SymbolType,
        Integer(Productions[1].SymbolInfo.Address));
  SymbolTable.UpdateMem(Productions[2].SymbolInfo.SymbolType,
        Integer(Productions[2].SymbolInfo.Address));
*)
end;

{ TProd_altTamJanela }

procedure TProd_altTamJanela.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // altTam
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // largura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // altura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_altTamJanela.Interpret;
var
  Si: TSymbolInfo;
  V: array [0..2] of Integer;
  I: Integer;
  Q: TQuadro;
begin
  for I := 0 to 2 do
  begin
    Productions[I].Interpret; // janela, largura, altura
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  // verifica se o componente é valido
  if not (TObject(V[0]) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Q := TQuadro(V[0]);

  // verifica largura e altura
  if ((V[1] < 0) or (V[1] > MAX_TAM_JANELA) or
      (V[2] < 0) or (V[2] > MAX_TAM_JANELA)) then
    Error(sTamanhoJanelaMax, ProductionLine, ProductionCol);

  // altera o tamanho
  Q.alt_tam_janela(V[1], V[2]);
end;

{ TProd_obtTamJanela }

procedure TProd_obtTamJanela.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // obtTamJanela
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // var largura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  if (E.SymbolInfo.SymbolClass <> scVar) and
     (E.SymbolInfo.SymbolClass <> scField) and
     (E.SymbolInfo.SymbolClass <> scVarParam) then
    Error(sWrongActual2, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // var altura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  if (E.SymbolInfo.SymbolClass <> scVar) and
     (E.SymbolInfo.SymbolClass <> scField) and
     (E.SymbolInfo.SymbolClass <> scVarParam) then
    Error(sWrongActual2, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_obtTamJanela.Interpret;
var
  SiJanela, SiLargura, SiAltura: TSymbolInfo;
  V: Integer;
  Q: TQuadro;
  Larg, Altu: Integer;
begin
  Productions[0].Interpret; // janela
  SiJanela := Productions[0].SymbolInfo;
  V := PInteger(SiJanela.Address)^;

  Productions[1].Interpret; // largura
  SiLargura := Productions[1].SymbolInfo;

  Productions[2].Interpret; // altura
  SiAltura := Productions[2].SymbolInfo;

  // verifica se o componente é valido
  if not (TObject(V) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Q := TQuadro(V);

  // obtém tamanho
  Q.obt_tam_janela(Larg, Altu);
  PInteger(SiLargura.Address)^ := Larg;
  PInteger(SiAltura.Address)^ := Altu;

  // atualiza na memoria
  SymbolTable.UpdateMem(SiLargura.SymbolType,
        Integer(SiLargura.Address));
  SymbolTable.UpdateMem(SiAltura.SymbolType,
        Integer(SiAltura.Address));
end;

{ TProd_altCor }

procedure TProd_altCor.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // altCor
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // componente
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // cor
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_altCor.Interpret;
var
  Si: TSymbolInfo;
  V: array [0..1] of Integer;
  I: Integer;
begin
  for I := 0 to 1 do
  begin
    Productions[I].Interpret; // componente, cor
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  // verifica se o componente é valido
  if not (TObject(V[0]) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  TQuadro(V[0]).alt_cor_janela(V[1]);
end;

{ TProd_altTxtJanela }

procedure TProd_altTxtJanela.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // altTxt
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // txt
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
end;

procedure TProd_altTxtJanela.Interpret;
var
  Si: TSymbolInfo;
  V: Integer;
  Txt: String;
begin
  Productions[0].Interpret; // janela
  Si := Productions[0].SymbolInfo;
  V := PInteger(Si.Address)^;

  Productions[1].Interpret; // texto
  Si := Productions[1].SymbolInfo;
  if Productions[1].ExecPromotion then
    Si := Productions[1].Promoted;
  Txt := PString(Si.Address)^;

  // verifica se o componente é valido
  if not (TObject(V) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  TQuadro(V).alt_txt_janela(Txt);
end;

{ TProd_crgImg }

procedure TProd_crgImg.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // crgImg
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // nomeImg
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
end;

procedure TProd_crgImg.Interpret;
var
  Si: TSymbolInfo;
  V: Integer;
  Txt: String;
  Q: TQuadro;
begin
  Productions[0].Interpret; // janela
  Si := Productions[0].SymbolInfo;
  V := PInteger(Si.Address)^;

  Productions[1].Interpret; // nomeImg
  Si := Productions[1].SymbolInfo;
  if Productions[1].ExecPromotion then
    Si := Productions[1].Promoted;
  Txt := PString(Si.Address)^;

  // verifica se o componente é valido
  if not (TObject(V) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Q := TQuadro(V);

  Q.crg_img(Txt);
end;

{ TProd_crgJanela }

procedure TProd_crgJanela.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // crgJanela
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // jan
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // janOrig
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

(*
procedure TProd_crgJanela.Interpret;
var
  Si: TSymbolInfo;
  V: array [0..5] of Integer;
  I, Width, Height: Integer;
  Jan, JanOrig: TQuadro;
begin
  for I := 0 to 5 do
  begin
    Productions[I].Interpret; // jan, janOrig, x1, y1, x2, y2
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  // verifica as janelas jan e janOrig
  if not (TObject(V[0]) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Jan := TQuadro(V[0]);
  if not (TObject(V[1]) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  JanOrig := TQuadro(V[1]);

  Width :=  Abs(V[4] - V[2]); // Abs(X2 - X1);
  Height := Abs(V[5] - V[3]); // Abs(Y2 - Y1);
  Jan.Bmp.Width := Width;
  Jan.Bmp.Height := Height;
  Jan.Bmp.Canvas.CopyRect(Rect(0, 0, Width, Height),
                          JanOrig.Bmp.Canvas,
                          Rect(V[2], V[3], V[4], V[5]));

  // exibe, se for o caso
  if Jan.Form.Visible then
    if Jan = Compiler.FTela then
      FrmDSL.PaintBox.Repaint
    else
      Jan.Form.Repaint;
end;
*)

(*
{ TProd_altFonte }

procedure TProd_altFonte.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // altFonte
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // componente
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // nome fonte
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // tam
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // estilo
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // cor
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_altFonte.Interpret;
var
  Si: TSymbolInfo;
  Comp, Tam, Estilo, Cor: Integer;
  Nome: String;
  ehQuadro, ehComp: Boolean;
  Fonte: TFont;
begin
  Productions[0].Interpret; // componente
  Si := Productions[0].SymbolInfo;
  Comp := PInteger(Si.Address)^;

  Productions[1].Interpret; // nome
  Si := Productions[1].SymbolInfo;
  if Productions[1].ExecPromotion then
    Si := Productions[1].Promoted;
  Nome := PString(Si.Address)^;

  Productions[2].Interpret; // tam
  Si := Productions[2].SymbolInfo;
  Tam := PInteger(Si.Address)^;

  Productions[3].Interpret; // estilo
  Si := Productions[3].SymbolInfo;
  Estilo := PInteger(Si.Address)^;

  Productions[4].Interpret; // cor
  Si := Productions[4].SymbolInfo;
  Cor := PInteger(Si.Address)^;

  // verifica se o componente é valido
  if not (TObject(Comp) is TQuadro) then
    Error(sComponentTypeExpected, ProductionLine, ProductionCol);

  // cria a fonte
  Fonte := TFont.Create;
  Fonte.Name := Nome;
  Fonte.Size := Tam;
  Fonte.Color := Cor;
  Fonte.Style := IntParaEstiloFonte(Estilo);

  // altera a fonte e libera
  TQuadro(Comp).alt_fonte(Fonte);
  Fonte.Free;
end;
*)

{ TProd_tstEvento }

procedure TProd_tstEvento.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // tstEvento
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Componente
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // evento
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeBoolean);
end;

(*
procedure TProd_tstEvento.Interpret;
var
  Si: TSymbolInfo;
  V: array [0..1] of Integer;
  ehQuadro, ehComp: Boolean;
begin
  Productions[0].Interpret; // componente
  Si := Productions[0].SymbolInfo;
  V[0] := PInteger(Si.Address)^;

  Productions[1].Interpret; // evento
  Si := Productions[1].SymbolInfo;
  V[1] := PInteger(Si.Address)^;

  // verifica se o componente é valido
  ehQuadro := TObject(V[0]) is TQuadro;
  ehComp := TObject(V[0]) is TComponent;
  if not (ehQuadro or ehComp) then
    Error(sComponentTypeExpected, ProductionLine, ProductionCol);

  // verifica o evento
  if Compiler.FLastEvent <> V[1] then
  begin
    PBoolean(FSymbolInfo.Address)^ := False;
    Exit;
  end;

  // verifica se está testando a Tela principal
  if V[0] = Integer(Compiler.FTela) then
  begin
    PBoolean(FSymbolInfo.Address)^ :=
        Compiler.FLastEventSender = TObject(FrmDSL.PaintBox);
    Exit;
  end;

  // verifica se está testando uma janela separada
  if ehQuadro then
  begin
    PBoolean(FSymbolInfo.Address)^ :=
        Compiler.FLastEventSender = TQuadro(V[0]).Form;
    Exit;
  end;

  // evento só pode ter vindo de um componente
  PBoolean(FSymbolInfo.Address)^ :=
      Compiler.FLastEventSender = TObject(V[0]);
end;
*)

{ TProd_FrameDispose }

procedure TProd_FrameDispose.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroLibere
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);

  GetTerminal(tkRParen);
end;

procedure TProd_FrameDispose.Interpret;
var
  Si: TSymbolInfo;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  // libere o bitmap
  Compiler.FBitmapList.Remove(Bmp);
  Bmp.Free;

  // atualize o visual
  PInteger(Si.Address)^ := 0;
  SymbolTable.UpdateMem(Si.SymbolType, Integer(Si.Address));
end;

{ TProd_FileDispose }

procedure TProd_FileDispose.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_arquivoLibere
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // arquivo (TStream)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFileTypeExpected, E.ProductionLine, E.ProductionCol);

  GetTerminal(tkRParen);
end;

procedure TProd_FileDispose.Interpret;
var
  Si: TSymbolInfo;
  Strm: TRWStream;
begin
  Productions[0].Interpret; // arquivo
  Si := Productions[0].SymbolInfo;
  Strm := TRWStream(PInteger(Si.Address)^);
  if not (Strm is TRWStream) then
    Error(sFileTypeExpected, ProductionLine, ProductionCol);

  // libere o arquivo
  Compiler.FStreamList.Remove(Strm);
  Strm.Free;

  // atualize o visual
  PInteger(Si.Address)^ := 0;
  SymbolTable.UpdateMem(Si.SymbolType, Integer(Si.Address));
end;

{ TProd_FrameReadFromFile }

procedure TProd_FrameReadFromFile.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroLeiaDeArquivo
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // nome do arquivo
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameReadFromFile.Interpret;
var
  Si: TSymbolInfo;
  FileName: String;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // nome do arquivo
  Si := Productions[1].SymbolInfo;
  if Productions[1].ExecPromotion then
    Si := Productions[1].Promoted;
  FileName := PString(Si.Address)^;

  try
    Bmp.LoadFromFile(FileName);
  except
    Error(Format(sFileNotFound, [FileName]), ProductionLine, ProductionCol);
  end;
end;

{ TProd_FrameSetFontName }

procedure TProd_FrameSetFontName.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroMudeNomeDaFonte
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // nome da fonte
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameSetFontName.Interpret;
var
  Si: TSymbolInfo;
  FontName: String;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // nome da fonte
  Si := Productions[1].SymbolInfo;
  if Productions[1].ExecPromotion then
    Si := Productions[1].Promoted;
  FontName := PString(Si.Address)^;

  Bmp.Canvas.Font.Name := FontName;
end;

{ TProd_FrameTextOut }

procedure TProd_FrameTextOut.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroTexto
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // texto
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameTextOut.Interpret;
var
  Si: TSymbolInfo;
  X, Y: Integer;
  Txt: String;
  Bmp: Graphics.TBitmap;
  BrushStyle: TBrushStyle;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // X
  Si := Productions[1].SymbolInfo;
  X := PInteger(Si.Address)^;

  Productions[2].Interpret; // Y
  Si := Productions[2].SymbolInfo;
  Y := PInteger(Si.Address)^;

  Productions[3].Interpret; // texto
  Si := Productions[3].SymbolInfo;
  if Productions[3].ExecPromotion then
    Si := Productions[3].Promoted;
  Txt := PString(Si.Address)^;

//  Bmp.Canvas.TextFlags := Bmp.Canvas.TextFlags or ETO_OPAQUE;
  BrushStyle := Bmp.Canvas.Brush.Style;
  Bmp.Canvas.Brush.Style := bsClear;
  Bmp.Canvas.TextOut(X, Y, Txt);
  Bmp.Canvas.Brush.Style := BrushStyle;
end;

{ TProd_FrameTextHeight }

procedure TProd_FrameTextHeight.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroAlturaDoTexto
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // texto
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_FrameTextHeight.Interpret;
var
  Si: TSymbolInfo;
  Txt: String;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // texto
  Si := Productions[1].SymbolInfo;
  if Productions[1].ExecPromotion then
    Si := Productions[1].Promoted;
  Txt := PString(Si.Address)^;

  PInteger(FSymbolInfo.Address)^ := Bmp.Canvas.TextHeight(Txt);
end;

{ TProd_FileReader }

procedure TProd_FileReader.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_arquivoLeitor
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // arquivo
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_FileReader.Interpret;
var
  Si: TSymbolInfo;
  RWStream: TRWStream;
begin
  Productions[0].Interpret; // arquivo
  Si := Productions[0].SymbolInfo;
  RWStream := TRWStream(PInteger(Si.Address)^);
  if not (RWStream is TRWStream) then
    Error(sFileTypeExpected, ProductionLine, ProductionCol);

  PInteger(FSymbolInfo.Address)^ := Integer(RWStream);
end;

{ TProd_FileWriter }

procedure TProd_FileWriter.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_arquivoEscritor
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // arquivo
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_FileWriter.Interpret;
var
  Si: TSymbolInfo;
  RWStream: TRWStream;
begin
  Productions[0].Interpret; // arquivo
  Si := Productions[0].SymbolInfo;
  RWStream := TRWStream(PInteger(Si.Address)^);
  if not (RWStream is TRWStream) then
    Error(sFileTypeExpected, ProductionLine, ProductionCol);

  PInteger(FSymbolInfo.Address)^ := Integer(RWStream);
end;

{ TProd_TextHeight }

procedure TProd_TextHeight.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_alturaDoTexto
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // texto
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_TextHeight.Interpret;
var
  Si: TSymbolInfo;
  Txt: String;
begin
  Productions[0].Interpret; // texto
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  Txt := PString(Si.Address)^;

  if Compiler.Canvas <> nil then
    PInteger(FSymbolInfo.Address)^ := Compiler.Canvas.TextHeight(Txt);
end;

{ TProd_TextWidth }

procedure TProd_TextWidth.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_larguraDoTexto
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // texto
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_TextWidth.Interpret;
var
  Si: TSymbolInfo;
  Txt: String;
begin
  Productions[0].Interpret; // texto
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  Txt := PString(Si.Address)^;

  if Compiler.Canvas <> nil then
    PInteger(FSymbolInfo.Address)^ := Compiler.Canvas.TextWidth(Txt);
end;

{ TProd_FrameTextWidth }

procedure TProd_FrameTextWidth.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroAlturaDoTexto
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // texto
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_FrameTextWidth.Interpret;
var
  Si: TSymbolInfo;
  Txt: String;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // texto
  Si := Productions[1].SymbolInfo;
  if Productions[1].ExecPromotion then
    Si := Productions[1].Promoted;
  Txt := PString(Si.Address)^;

  PInteger(FSymbolInfo.Address)^ := Bmp.Canvas.TextWidth(Txt);
end;

{ TProd_caixa_marcada }

procedure TProd_caixa_marcada.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // caixa_marcada
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // caixa
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sReaderTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeBoolean);
end;

procedure TProd_caixa_marcada.Interpret;
var
  Si: TSymbolInfo;
  Q: TQuadro;
  V: Integer;
begin
  Productions[0].Interpret;
  Si := Productions[0].SymbolInfo;
  V := PInteger(Si.Address)^;

  { obtém o quadro }
  Q := TQuadro(V);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  PBoolean(FSymbolInfo.Address)^ := Q.caixa_marcada();
end;

{ TProd_ReaderHasChar }

procedure TProd_ReaderHasChar.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_leitorTemCaractere
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // leitor
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sReaderTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeBoolean);
end;

procedure TProd_ReaderHasChar.Interpret;
var
  Si: TSymbolInfo;
  RWStream: TRWStream;
  Has: Boolean;
begin
  Productions[0].Interpret; // leitor
  Si := Productions[0].SymbolInfo;
  RWStream := TRWStream(PInteger(Si.Address)^);
  if not (RWStream is TRWStream) then
    Error(sReaderTypeExpected, ProductionLine, ProductionCol);

  // execute o comando no leitor
  Has := False;
  try
    Has := RWStream.ReaderHasChar();
  except
    Error(sReaderHasCharFailed, ProductionLine, ProductionCol);
  end;

  PBoolean(FSymbolInfo.Address)^ := Has;
end;

{ TProd_ReaderNextChar }

procedure TProd_ReaderNextChar.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_leitorProximoCaractere
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // leitor
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sReaderTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeChar);
end;

procedure TProd_ReaderNextChar.Interpret;
var
  Si: TSymbolInfo;
  RWStream: TRWStream;
  Ch: Char;
begin
  Productions[0].Interpret; // leitor
  Si := Productions[0].SymbolInfo;
  RWStream := TRWStream(PInteger(Si.Address)^);
  if not (RWStream is TRWStream) then
    Error(sReaderTypeExpected, ProductionLine, ProductionCol);

  // execute o comando no leitor
  Ch := ' '; // só pra tirar um warning
  try
    Ch := RWStream.ReaderNextChar();
  except
    Error(sReaderNextCharFailed, ProductionLine, ProductionCol);
  end;

  PChar(FSymbolInfo.Address)^ := Ch;
end;

{ TProd_WriterWriteChar }

procedure TProd_WriterWriteChar.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_escritorEscrevaCaractere
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // escritor
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sWriterTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // caractere
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeChar then
    Error(sCharTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_WriterWriteChar.Interpret;
var
  Si: TSymbolInfo;
  RWStream: TRWStream;
  Ch: Char;
begin
  Productions[0].Interpret; // escritor
  Si := Productions[0].SymbolInfo;
  RWStream := TRWStream(PInteger(Si.Address)^);
  if not (RWStream is TRWStream) then
    Error(sWriterTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // caractere
  Si := Productions[1].SymbolInfo;
  Ch := PChar(Si.Address)^;

  // execute o comando no escritor
  try
     RWStream.WriterWriteChar(Ch);
  except
    Error(sWriterWriteCharFailed, ProductionLine, ProductionCol);
  end;
end;

{ TProd_FrameCopyFromScreen }

procedure TProd_FrameCopyFromScreen.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroCopieDaTela
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameCopyFromScreen.Interpret;
var
  Si: TSymbolInfo;
  X1, Y1, X2, Y2: Integer;
  Width, Height: Integer;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // X1
  Si := Productions[1].SymbolInfo;
  X1 := PInteger(Si.Address)^;

  Productions[2].Interpret; // Y1
  Si := Productions[2].SymbolInfo;
  Y1 := PInteger(Si.Address)^;

  Productions[3].Interpret; // X2
  Si := Productions[3].SymbolInfo;
  X2 := PInteger(Si.Address)^;

  Productions[4].Interpret; // Y2
  Si := Productions[4].SymbolInfo;
  Y2 := PInteger(Si.Address)^;

//  Width := Abs(X2 - X1) + 1;
//  Height := Abs(Y2 - Y1) + 1;
  Width := Abs(X2 - X1);
  Height := Abs(Y2 - Y1);

  if Compiler.Canvas <> nil then
  begin
    Bmp.Width := Width;
    Bmp.Height := Height;
    Bmp.Canvas.CopyRect(
//          Rect(0, 0, Width - 1, Height - 1),
          Rect(0, 0, Width, Height),
          Compiler.Canvas,
          Rect(X1, Y1, X2, Y2));
  end;
end;

{ TProd_FrameCopyFromFrame }

procedure TProd_FrameCopyFromFrame.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroCopieDeQuadro
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // quadroOrigem
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameCopyFromFrame.Interpret;
var
  Si: TSymbolInfo;
  X1, Y1, X2, Y2: Integer;
  Width, Height: Integer;
  Bmp, BmpOrig: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // quadroOrigem
  Si := Productions[1].SymbolInfo;
  BmpOrig := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (BmpOrig is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[2].Interpret; // X1
  Si := Productions[2].SymbolInfo;
  X1 := PInteger(Si.Address)^;

  Productions[3].Interpret; // Y1
  Si := Productions[3].SymbolInfo;
  Y1 := PInteger(Si.Address)^;

  Productions[4].Interpret; // X2
  Si := Productions[4].SymbolInfo;
  X2 := PInteger(Si.Address)^;

  Productions[5].Interpret; // Y2
  Si := Productions[5].SymbolInfo;
  Y2 := PInteger(Si.Address)^;

//  Width := Abs(X2 - X1) + 1;
//  Height := Abs(Y2 - Y1) + 1;
  Width := Abs(X2 - X1);
  Height := Abs(Y2 - Y1);

  Bmp.Width := Width;
  Bmp.Height := Height;
  Bmp.Canvas.CopyRect(
//          Rect(0, 0, Width - 1, Height - 1),
          Rect(0, 0, Width, Height),
          BmpOrig.Canvas,
          Rect(X1, Y1, X2, Y2));
end;

{ TProd_BrushStyle }

procedure TProd_BrushStyle.Parse;
begin
  Parser.GetNextToken; // BrushStyle
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_BrushStyle.Interpret;
begin
  PInteger(FSymbolInfo.Address)^ := Ord(Compiler.Canvas.Brush.Style);
end;

{ TProd_Sqrt }

procedure TProd_Sqrt.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // Sqrt
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression);
  T := CheckTypes(Compiler.DeclTypeExtended, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, T); // extended expression
end;

procedure TProd_Sqrt.Interpret;
var
  Si: TSymbolInfo;
  V: Extended;
begin
  Productions[0].Interpret; // expression
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  V := PExtended(Si.Address)^;
  PExtended(FSymbolInfo.Address)^ := Sqrt(V);
end;

{ TProd_Length }

procedure TProd_Length.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // Length
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression); // string or char expression
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_Length.Interpret;
var
  Si: TSymbolInfo;
  Ps: PString;
begin
  Productions[0].Interpret; // expression
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  Ps := PString(Si.Address);
  PInteger(FSymbolInfo.Address)^ := Length(Ps^);
end;

{ TProd_UpperCase }

procedure TProd_UpperCase.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // UpperCase
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression); // string or char expression
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, T); // string expression
end;

procedure TProd_UpperCase.Interpret;
var
  Si: TSymbolInfo;
  Ps: PString;
begin
  Productions[0].Interpret; // expression
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  Ps := PString(Si.Address);
  PString(FSymbolInfo.Address)^ := AnsiUpperCase(Ps^);
end;

{ TProd_LowerCase }

procedure TProd_LowerCase.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // LowerCase
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression); // string or char expression
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, T); // string expression
end;

procedure TProd_LowerCase.Interpret;
var
  Si: TSymbolInfo;
  Ps: PString;
begin
  Productions[0].Interpret; // expression
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  Ps := PString(Si.Address);
  PString(FSymbolInfo.Address)^ := LowerCase(Ps^);
end;

{ TProd_Round }

procedure TProd_Round.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // Round
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression);
  T := CheckTypes(Compiler.DeclTypeExtended, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_Round.Interpret;
var
  Si: TSymbolInfo;
  V: Extended;
begin
  Productions[0].Interpret; // expression
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  V := PExtended(Si.Address)^;
  PInteger(FSymbolInfo.Address)^ := Round(V);
end;

{ TProd_Sin }

procedure TProd_Sin.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // Sin
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression);
  T := CheckTypes(Compiler.DeclTypeExtended, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, T); // extended expression
end;

procedure TProd_Sin.Interpret;
var
  Si: TSymbolInfo;
  V: Extended;
begin
  Productions[0].Interpret; // expression
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  V := PExtended(Si.Address)^;
  PExtended(FSymbolInfo.Address)^ := Sin(V);
end;

{ TProd_Cos }

procedure TProd_Cos.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // Cos
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression);
  T := CheckTypes(Compiler.DeclTypeExtended, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, T); // extended expression
end;

procedure TProd_Cos.Interpret;
var
  Si: TSymbolInfo;
  V: Extended;
begin
  Productions[0].Interpret; // expression
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  V := PExtended(Si.Address)^;
  PExtended(FSymbolInfo.Address)^ := Cos(V);
end;

{ TProd_Random }

procedure TProd_Random.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // Random
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression);
  T := CheckTypes(Compiler.DeclTypeInteger, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, T); // integer expression
end;

procedure TProd_Random.Interpret;
var
  Si: TSymbolInfo;
  V: Integer;
begin
  Productions[0].Interpret; // expression
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  V := PInteger(Si.Address)^;
  PInteger(FSymbolInfo.Address)^ := Random(V);
end;

{ TProd_Potencia }

procedure TProd_Potencia.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // Potência
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression);
  T := CheckTypes(Compiler.DeclTypeExtended, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkComma);
  E := Compile(TProd_Expression);
  T := CheckTypes(Compiler.DeclTypeExtended, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, T); // expressão real
end;

procedure TProd_Potencia.Interpret;
var
  Si: TSymbolInfo;
  Base, Exp: Extended;
begin
  Productions[0].Interpret; // base
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  Base := PExtended(Si.Address)^;
  Productions[1].Interpret; // expoente
  Si := Productions[1].SymbolInfo;
  if Productions[1].ExecPromotion then
    Si := Productions[1].Promoted;
  Exp := PExtended(Si.Address)^;
  try
    PExtended(FSymbolInfo.Address)^ := Power(Base, Exp);
  except
    Error(sInvalidOperation, ProductionLine, ProductionCol);
  end;
end;

{ TProd_Ord }

procedure TProd_Ord.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // crtParaInt - antiga ord
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression);
  if not (E.SymbolInfo.SymbolType is TOrdinalType) then
    Error(sOrdinalTypeRequired, ProductionLine, ProductionCol);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_Ord.Interpret;
var
  Si: TSymbolInfo;
  T: TOrdinalType;
begin
  Productions[0].Interpret; // expression
  Si := Productions[0].SymbolInfo;
  T := TOrdinalType(Si.SymbolType);
  PInteger(FSymbolInfo.Address)^ := T.OrdinalValue(Si);
end;

{ TProd_Chr }

procedure TProd_Chr.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // intParaCrt - antiga chr
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression);
  CheckTypes(Compiler.DeclTypeInteger, E.SymbolInfo.SymbolType, tkAssign);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeChar);
end;

procedure TProd_Chr.Interpret;
var
  Si: TSymbolInfo;
  V: Integer;
begin
  Productions[0].Interpret; // expression
  Si := Productions[0].SymbolInfo;
  V := PInteger(Si.Address)^;
  PChar(FSymbolInfo.Address)^ := Chr(V);
end;

{ TProd_ObtPixel }

procedure TProd_ObtPixel.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // obtPixel
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (TQuadro)
  CheckTypes(Compiler.DeclTypeInteger, E.SymbolInfo.SymbolType, tkAssign);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  CheckTypes(Compiler.DeclTypeInteger, E.SymbolInfo.SymbolType, tkAssign);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  CheckTypes(Compiler.DeclTypeInteger, E.SymbolInfo.SymbolType, tkAssign);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_ObtPixel.Interpret;
var
  Si: TSymbolInfo;
  Q: TQuadro;
  I: Integer;
  V: array [0..2] of Integer;
begin
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret; // quadro, x, y
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  { obtém o quadro }
  Q := TQuadro(V[0]);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  { obtém pixel }
  { obs: escolhi pegar do bmp; tinha de ser dele ou do form }
  PInteger(FSymbolInfo.Address)^ := Q.Bmp.Canvas.Pixels[V[1], V[2]];
end;

{ TProd_FrameSetBrushColor }

procedure TProd_FrameSetBrushColor.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroMudeCorDoPincel
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // cor
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameSetBrushColor.Interpret;
var
  Si: TSymbolInfo;
  Color: Integer;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // Color
  Si := Productions[1].SymbolInfo;
  Color := PInteger(Si.Address)^;

  Bmp.Canvas.Brush.Color := Color;
end;

{ TProd_FrameSetCopyMode }

procedure TProd_FrameSetCopyMode.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroMudeModoDeCopiar
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // modo
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameSetCopyMode.Interpret;
var
  Si: TSymbolInfo;
  IndMode: Integer;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // modo
  Si := Productions[1].SymbolInfo;
  IndMode := PInteger(Si.Address)^;

  // verifica IndMode
  if (IndMode < 0) or (IndMode > 14) then
    Error(sValueNotAllowed, ProductionLine, ProductionCol);

  Bmp.Canvas.CopyMode := CpModes[IndMode];
end;

{ TProd_FrameSetPenMode }

procedure TProd_FrameSetPenMode.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroMudeModoDaCaneta
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // modo
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameSetPenMode.Interpret;
var
  Si: TSymbolInfo;
  IndMode: Integer;
  Q: TQuadro;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Q := TQuadro(PInteger(Si.Address)^);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // modo
  Si := Productions[1].SymbolInfo;
  IndMode := PInteger(Si.Address)^;

  // verifica IndMode
  if (IndMode < 0) or (IndMode > 15) then
    Error(sValueNotAllowed, ProductionLine, ProductionCol);

  Q.alt_modo_caneta(PenModes[IndMode]);
end;

{ TProd_FrameSetPenStyle }

procedure TProd_FrameSetPenStyle.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroMudeEstiloDaCaneta
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // estilo
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameSetPenStyle.Interpret;
var
  Si: TSymbolInfo;
  Style: Integer;
  Q: TQuadro;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Q := TQuadro(PInteger(Si.Address)^);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // estilo
  Si := Productions[1].SymbolInfo;
  Style := PInteger(Si.Address)^;

  Q.alt_estilo_caneta(TPenStyle(Style));
end;

{ TProd_SetCopyMode }

procedure TProd_SetCopyMode.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_mudeModoDeCopiar
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // modo
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_SetCopyMode.Interpret;
var
  Si: TSymbolInfo;
  IndMode: Integer;
begin
  Productions[0].Interpret; // modo
  Si := Productions[0].SymbolInfo;
  IndMode := PInteger(Si.Address)^;

  // verifica valor do índice (0 <= IndMode <= 14)
  if (IndMode < 0) or (IndMode > 14) then
    Error(sValueNotAllowed, ProductionLine, ProductionCol);

  if Compiler.Canvas <> nil then
    Compiler.Canvas.CopyMode := CpModes[IndMode];
end;

{ TProd_CopyMode }

procedure TProd_CopyMode.Parse;
begin
  Parser.GetNextToken; // dsl_modoDeCopiar()
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_CopyMode.Interpret;
var
  I: Integer;
begin
  PInteger(FSymbolInfo.Address)^ := 10; // um valor default
  if Compiler.Canvas <> nil then
    for I := 0 to 14 do
      if CpModes[I] = Compiler.Canvas.CopyMode then
      begin
        PInteger(FSymbolInfo.Address)^ := I;
        Exit;
      end;
end;

{ TProd_SetPenMode }

procedure TProd_SetPenMode.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_mudeModoDaCaneta
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // modo
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_SetPenMode.Interpret;
var
  Si: TSymbolInfo;
  IndMode: Integer;
begin
  Productions[0].Interpret; // modo
  Si := Productions[0].SymbolInfo;
  IndMode := PInteger(Si.Address)^;

  // verifica valor do índice (0 <= IndMode <= 15)
  if (IndMode < 0) or (IndMode > 15) then
    Error(sValueNotAllowed, ProductionLine, ProductionCol);

  if Compiler.Canvas <> nil then
    Compiler.Canvas.Pen.Mode := PenModes[IndMode];
end;

{ TProd_SetPenStyle }

procedure TProd_SetPenStyle.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_mudeEstiloDaCaneta
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // estilo
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_SetPenStyle.Interpret;
var
  Si: TSymbolInfo;
  Style: Integer;
begin
  Productions[0].Interpret; // estilo
  Si := Productions[0].SymbolInfo;
  Style := PInteger(Si.Address)^;

  if Compiler.Canvas <> nil then
    Compiler.Canvas.Pen.Style := TPenStyle(Style);
end;

{ TProd_PenStyle }

procedure TProd_PenStyle.Parse;
begin
  Parser.GetNextToken; // dsl_estiloDaCaneta()
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_PenStyle.Interpret;
begin
  PInteger(FSymbolInfo.Address)^ := 0; // um valor default
  if Compiler.Canvas <> nil then
    PInteger(FSymbolInfo.Address)^ := Integer(Compiler.Canvas.Pen.Style);
end;

{ TProd_PenMode }

procedure TProd_PenMode.Parse;
begin
  Parser.GetNextToken; // dsl_modoDaCaneta()
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_PenMode.Interpret;
var
  I: Integer;
begin
  PInteger(FSymbolInfo.Address)^ := 0; // um valor default
  if Compiler.Canvas <> nil then
    for I := 0 to 15 do
      if PenModes[I] = Compiler.Canvas.Pen.Mode then
      begin
        PInteger(FSymbolInfo.Address)^ := I;
        Exit;
      end;
end;

{ TProd_FrameSetBrushStyle }

procedure TProd_FrameSetBrushStyle.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroMudeEstiloDoPincel
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // estilo
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameSetBrushStyle.Interpret;
var
  Si: TSymbolInfo;
  Style: TBrushStyle;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // estilo
  Si := Productions[1].SymbolInfo;
  Style := TBrushStyle(PInteger(Si.Address)^);

  Bmp.Canvas.Brush.Style := Style;
end;

{ TProd_FrameSetPenColor }

procedure TProd_FrameSetPenColor.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroMudeCorDaCaneta
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // cor
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameSetPenColor.Interpret;
var
  Si: TSymbolInfo;
  Color: Integer;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // Color
  Si := Productions[1].SymbolInfo;
  Color := PInteger(Si.Address)^;

  Bmp.Canvas.Pen.Color := Color;
end;

{ TProd_FrameSetPenWidth }

procedure TProd_FrameSetPenWidth.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroMudeLarguraDaCaneta
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // cor
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameSetPenWidth.Interpret;
var
  Si: TSymbolInfo;
  Width: Integer;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // Color
  Si := Productions[1].SymbolInfo;
  Width := PInteger(Si.Address)^;

  Bmp.Canvas.Pen.Width := Width;
end;

{ TProd_FrameSetFontColor }

procedure TProd_FrameSetFontColor.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroMudeCorDaFonte
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // cor
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameSetFontColor.Interpret;
var
  Si: TSymbolInfo;
  Color: Integer;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // Color
  Si := Productions[1].SymbolInfo;
  Color := PInteger(Si.Address)^;

  Bmp.Canvas.Font.Color := Color;
end;

{ TProd_FrameSetFontSize }

procedure TProd_FrameSetFontSize.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroMudeTamanhoDaFonte
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // tamanho
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameSetFontSize.Interpret;
var
  Si: TSymbolInfo;
  Size: Integer;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // tamanho
  Si := Productions[1].SymbolInfo;
  Size := PInteger(Si.Address)^;

  Bmp.Canvas.Font.Size := Size;
end;

{ TProd_SetTimeEventInterval }

procedure TProd_SetTimeEventInterval.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_mudeIntervaloEventoTempo
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // intervalo
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_SetTimeEventInterval.Interpret;
var
  Si: TSymbolInfo;
begin
  Productions[0].Interpret; // intervalo
  Si := Productions[0].SymbolInfo;
  FrmDsl.TimerEvent.Interval := PInteger(Si.Address)^;
end;

{ TProd_Sleep }

procedure TProd_Sleep.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_durma
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // intervalo
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_Sleep.Interpret;
var
  Si: TSymbolInfo;
begin
  Productions[0].Interpret; // intervalo
  Si := Productions[0].SymbolInfo;
  Sleep(PInteger(Si.Address)^);
end;

{ TProd_FrameRectangle }

procedure TProd_FrameRectangle.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroRetangulo
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameRectangle.Interpret;
var
  Si: TSymbolInfo;
  X1, Y1, X2, Y2: Integer;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // x1
  Si := Productions[1].SymbolInfo;
  X1 := PInteger(Si.Address)^;

  Productions[2].Interpret; // y1
  Si := Productions[2].SymbolInfo;
  Y1 := PInteger(Si.Address)^;

  Productions[3].Interpret; // x2
  Si := Productions[3].SymbolInfo;
  X2 := PInteger(Si.Address)^;

  Productions[4].Interpret; // y2
  Si := Productions[4].SymbolInfo;
  Y2 := PInteger(Si.Address)^;

  Bmp.Canvas.Rectangle(X1, Y1, X2, Y2);
end;

{ TProd_FrameTriangle }

procedure TProd_FrameTriangle.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroTriangulo
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameTriangle.Interpret;
var
  Si: TSymbolInfo;
  X1, Y1, X2, Y2, Px: Integer;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // x1
  Si := Productions[1].SymbolInfo;
  X1 := PInteger(Si.Address)^;

  Productions[2].Interpret; // y1
  Si := Productions[2].SymbolInfo;
  Y1 := PInteger(Si.Address)^;

  Productions[3].Interpret; // x2
  Si := Productions[3].SymbolInfo;
  X2 := PInteger(Si.Address)^;

  Productions[4].Interpret; // y2
  Si := Productions[4].SymbolInfo;
  Y2 := PInteger(Si.Address)^;

  Px := (X2 - X1) div 2 + X1;
  Bmp.Canvas.Polygon([Point(X1, Y2), Point(Px, Y1), Point(X2, Y2)]);
end;

{ TProd_FrameEllipse }

procedure TProd_FrameEllipse.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroElipse
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameEllipse.Interpret;
var
  Si: TSymbolInfo;
  X1, Y1, X2, Y2: Integer;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // x1
  Si := Productions[1].SymbolInfo;
  X1 := PInteger(Si.Address)^;

  Productions[2].Interpret; // y1
  Si := Productions[2].SymbolInfo;
  Y1 := PInteger(Si.Address)^;

  Productions[3].Interpret; // x2
  Si := Productions[3].SymbolInfo;
  X2 := PInteger(Si.Address)^;

  Productions[4].Interpret; // y2
  Si := Productions[4].SymbolInfo;
  Y2 := PInteger(Si.Address)^;

  Bmp.Canvas.Ellipse(X1, Y1, X2, Y2);
end;

{ TProd_FrameHeight }

procedure TProd_FrameHeight.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroAltura
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_FrameHeight.Interpret;
var
  Si: TSymbolInfo;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  PInteger(FSymbolInfo.Address)^ := Bmp.Height;
end;

{ TProd_FrameWidth }

procedure TProd_FrameWidth.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroLargura
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_FrameWidth.Interpret;
var
  Si: TSymbolInfo;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  PInteger(FSymbolInfo.Address)^ := Bmp.Width;
end;

{ TProd_FrameFontSize }

procedure TProd_FrameFontSize.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroTamanhoDaFonte
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_FrameFontSize.Interpret;
var
  Si: TSymbolInfo;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  PInteger(FSymbolInfo.Address)^ := Bmp.Canvas.Font.Size;
end;

{ TProd_FrameFontColor }

procedure TProd_FrameFontColor.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroCorDaFonte
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_FrameFontColor.Interpret;
var
  Si: TSymbolInfo;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  PInteger(FSymbolInfo.Address)^ := Bmp.Canvas.Font.Color;
end;

{ TProd_FrameFontName }

procedure TProd_FrameFontName.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroNomeDaFonte
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeString);
end;

procedure TProd_FrameFontName.Interpret;
var
  Si: TSymbolInfo;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  PString(FSymbolInfo.Address)^ := Bmp.Canvas.Font.Name;
end;

{ TProd_TimeEventInterval }

procedure TProd_TimeEventInterval.Parse;
begin
  Parser.GetNextToken; // dsl_intervaloEventoTempo()
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_TimeEventInterval.Interpret;
begin
  PInteger(FSymbolInfo.Address)^ := FrmDSL.TimerEvent.Interval;
end;

{ TProd_ScreenWidth }

procedure TProd_ScreenWidth.Parse;
begin
  Parser.GetNextToken; // dsl_larguraDaTela()
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_ScreenWidth.Interpret;
begin
  PInteger(FSymbolInfo.Address)^ := FrmDSL.PnlGraf.Width;
end;

{ TProd_ScreenHeight }

procedure TProd_ScreenHeight.Parse;
begin
  Parser.GetNextToken; // dsl_alturaDaTela()
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_ScreenHeight.Interpret;
begin
  PInteger(FSymbolInfo.Address)^ := FrmDSL.PnlGraf.Height;
end;

{ TProd_FramePenColor }

procedure TProd_FramePenColor.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroCorDaCaneta
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_FramePenColor.Interpret;
var
  Si: TSymbolInfo;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  PInteger(FSymbolInfo.Address)^ := Bmp.Canvas.Pen.Color;
end;

{ TProd_FramePenWidth }

procedure TProd_FramePenWidth.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroLarguraDaCaneta
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_FramePenWidth.Interpret;
var
  Si: TSymbolInfo;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  PInteger(FSymbolInfo.Address)^ := Bmp.Canvas.Pen.Width;
end;

{ TProd_FrameBrushColor }

procedure TProd_FrameBrushColor.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroCorDoPincel
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_FrameBrushColor.Interpret;
var
  Si: TSymbolInfo;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  PInteger(FSymbolInfo.Address)^ := Bmp.Canvas.Brush.Color;
end;

{ TProd_FrameBrushStyle }

procedure TProd_FrameBrushStyle.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroEstiloDoPincel
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_FrameBrushStyle.Interpret;
var
  Si: TSymbolInfo;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  PInteger(FSymbolInfo.Address)^ := Integer(Bmp.Canvas.Brush.Style);
end;

{ TProd_FramePenPosX }

procedure TProd_FramePenPosX.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroX
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_FramePenPosX.Interpret;
var
  Si: TSymbolInfo;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  PInteger(FSymbolInfo.Address)^ := Bmp.Canvas.PenPos.X;
end;

{ TProd_Color }

procedure TProd_Color.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_cor
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // vermelho
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // verde
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // azul
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_Color.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..2] of Integer;
begin
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret; // vermelho, verde e azul (RGB)
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  PInteger(FSymbolInfo.Address)^ := RGB(V[0], V[1], V[2]);
end;

{ TProd_Now }

procedure TProd_Now.Parse;
begin
  Parser.GetNextToken; // dsl_agora()
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeExtended);
end;

procedure TProd_Now.Interpret;
begin
  PExtended(FSymbolInfo.Address)^ := Now();
end;

{ TProd_FileExists }

procedure TProd_FileExists.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // existeArq
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression);
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeBoolean);
end;

procedure TProd_FileExists.Interpret;
var
  Si: TSymbolInfo;
  NomeArq, NomeArqRestrito: String;
begin
  Productions[0].Interpret; // nome do arquivo
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  NomeArq := PString(Si.Address)^;
  NomeArqRestrito := ExpandeNomeArq(NomeArq);
  PBoolean(FSymbolInfo.Address)^ := FileExists(NomeArqRestrito);
end;

{ TProd_FileNew }

procedure TProd_FileNew.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_arquivoNovo
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression); // nome
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // modo
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_FileNew.Interpret;
var
  Si: TSymbolInfo;
  FileName: String;
  ModeStr: String;
  RWStrm: TRWStream;
  Strm: TStream;
  Mode: Word;
begin
  // só pra evitar dois warnings chatos
  Strm := nil;
  Mode := 0;

  Productions[0].Interpret; // nome do arquivo
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  FileName := PString(Si.Address)^;

  Productions[1].Interpret; // modo
  Si := Productions[1].SymbolInfo;
  if Productions[1].ExecPromotion then
    Si := Productions[1].Promoted;
  ModeStr := PString(Si.Address)^;

  // determine o modo de abrir o arquivo
  if (ModeStr = 'l') or (ModeStr = 'L') then
    Mode := fmOpenRead
  else if (ModeStr = 'e') or (ModeStr = 'E') then
    Mode := fmCreate
  else if (ModeStr = 'a') or (ModeStr = 'A') then
    Mode := fmOpenReadWrite
  else
    Error(sBadFileMode, ProductionLine, ProductionCol);

  // crie um FileStream
  try
    Strm := TFileStream.Create(FileName, Mode OR fmShareDenyWrite);
  except
    Error(sFileNewFailed, ProductionLine, ProductionCol);
  end;

  // crie um RWStream
  RWStrm := TRWStream.Create(Strm);
  Compiler.FStreamList.Add(RWStrm);

  PInteger(FSymbolInfo.Address)^ := Integer(RWStrm);
end;

{ TProd_FileNameComplete }

procedure TProd_FileNameComplete.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_arquivoNomeCompleto
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression);
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeString);
end;

procedure TProd_FileNameComplete.Interpret;
var
  Si: TSymbolInfo;
  FileName: String;
begin
  Productions[0].Interpret; // nome do arquivo
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  FileName := PString(Si.Address)^;
  PString(FSymbolInfo.Address)^ := ExpandFileName(FileName);
end;

{ TProd_FrameCopyMode }

procedure TProd_FrameCopyMode.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroModoDeCopiar
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_FrameCopyMode.Interpret;
var
  Si: TSymbolInfo;
  Bmp: Graphics.TBitmap;
  I: Integer;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  PInteger(FSymbolInfo.Address)^ := 10; // default
  for I := 0 to 14 do
    if CpModes[I] = Bmp.Canvas.CopyMode then
    begin
      PInteger(FSymbolInfo.Address)^ := I;
      Exit;
    end;
end;

{ TProd_FramePenMode }

procedure TProd_FramePenMode.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroModoDaCaneta
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

(*
procedure TProd_FramePenMode.Interpret;
var
  Si: TSymbolInfo;
  Q: TQuadro;
  I: Integer;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Q := TQuadro(PInteger(Si.Address)^);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  PInteger(FSymbolInfo.Address)^ := 0; // default
  for I := 0 to 15 do
    if PenModes[I] = Q.CanvasForm.Pen.Mode then
    begin
      PInteger(FSymbolInfo.Address)^ := I;
      Exit;
    end;
end;
*)

{ TProd_FramePenStyle }

procedure TProd_FramePenStyle.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroEstiloDaCaneta
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

(*
procedure TProd_FramePenStyle.Interpret;
var
  Si: TSymbolInfo;
  Q: TQuadro;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Q := TQuadro(PInteger(Si.Address)^);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  PInteger(FSymbolInfo.Address)^ := Integer(Q.CanvasForm.Pen.Mode);
end;
*)

{ TProd_FramePenPosY }

procedure TProd_FramePenPosY.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroY
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_FramePenPosY.Interpret;
var
  Si: TSymbolInfo;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  PInteger(FSymbolInfo.Address)^ := Bmp.Canvas.PenPos.Y;
end;

{ TProd_FrameSetWidth }

procedure TProd_FrameSetWidth.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroMudeLargura
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // width
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameSetWidth.Interpret;
var
  Si: TSymbolInfo;
  Width: Integer;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // width
  Si := Productions[1].SymbolInfo;
  Width := PInteger(Si.Address)^;

  Bmp.Width := Width;
end;

{ TProd_FrameSetHeight }

procedure TProd_FrameSetHeight.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroMudeAltura
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // height
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameSetHeight.Interpret;
var
  Si: TSymbolInfo;
  Height: Integer;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // height
  Si := Productions[1].SymbolInfo;
  Height := PInteger(Si.Address)^;

  Bmp.Height := Height;
end;

{ TProd_FrameLineTo }

procedure TProd_FrameLineTo.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroLinha
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameLineTo.Interpret;
var
  Si: TSymbolInfo;
  X, Y: Integer;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // x
  Si := Productions[1].SymbolInfo;
  X := PInteger(Si.Address)^;

  Productions[2].Interpret; // y
  Si := Productions[2].SymbolInfo;
  Y := PInteger(Si.Address)^;

  Bmp.Canvas.LineTo(X, Y);
end;

{ TProd_FrameMoveTo }

procedure TProd_FrameMoveTo.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroMudeXY
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameMoveTo.Interpret;
var
  Si: TSymbolInfo;
  X, Y: Integer;
  Bmp: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // x
  Si := Productions[1].SymbolInfo;
  X := PInteger(Si.Address)^;

  Productions[2].Interpret; // y
  Si := Productions[2].SymbolInfo;
  Y := PInteger(Si.Address)^;

  Bmp.Canvas.MoveTo(X, Y);
end;

{ TProd_IntToStr }

procedure TProd_IntToStr.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // IntToStr
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression);
  T := CheckTypes(Compiler.DeclTypeInteger, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeString);
end;

procedure TProd_IntToStr.Interpret;
var
  Si: TSymbolInfo;
  V: Integer;
begin
  Productions[0].Interpret; // expression
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  V := PInteger(Si.Address)^;
  PString(FSymbolInfo.Address)^ := IntToStr(V);
end;

{ TProd_StrToInt }

procedure TProd_StrToInt.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // StrToInt
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression);
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_StrToInt.Interpret;
var
  Si: TSymbolInfo;
  S: String;
begin
  Productions[0].Interpret; // expression
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  S := PString(Si.Address)^;
  try
    PInteger(FSymbolInfo.Address)^ := StrToInt(S);
  except
    Error('"' + S + '" ' + sInvalidInteger, ProductionLine, ProductionCol);
  end;
end;

{ TProd_FloatToStr }

procedure TProd_FloatToStr.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // FloatToStr
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression);
  T := CheckTypes(Compiler.DeclTypeExtended, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeString);
end;

procedure TProd_FloatToStr.Interpret;
var
  Si: TSymbolInfo;
  V: Extended;
  DecSep: Char;
begin
  Productions[0].Interpret; // expression
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  V := PExtended(Si.Address)^;
  DecSep := SysUtils.FormatSettings.DecimalSeparator;
  SysUtils.FormatSettings.DecimalSeparator := '.';
  try
    PString(FSymbolInfo.Address)^ := FloatToStr(V);
  except
    PString(FSymbolInfo.Address)^ := 'Erro';
  end;
  SysUtils.FormatSettings.DecimalSeparator := DecSep;
end;

{ TProd_StrToFloat }

procedure TProd_StrToFloat.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // StrToFloat
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression);
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeExtended);
end;

procedure TProd_StrToFloat.Interpret;
var
  Si: TSymbolInfo;
  S: String;
  SaveDecSep: Char;
begin
  Productions[0].Interpret; // expression
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  SaveDecSep := SysUtils.FormatSettings.DecimalSeparator;
  SysUtils.FormatSettings.DecimalSeparator := '.';
  S := PString(Si.Address)^;
  try
    PExtended(FSymbolInfo.Address)^ := StrToFloat(S);
  except
    Error('"' + S + '" ' + sInvalidFloat, ProductionLine, ProductionCol);
  end;
  SysUtils.FormatSettings.DecimalSeparator := SaveDecSep;
end;

{ TProd_CharAt }

procedure TProd_CharAt.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // CharAt
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // string
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // int (char position, >= 0)
  T := CheckTypes(Compiler.DeclTypeInteger, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeChar);
end;

procedure TProd_CharAt.Interpret;
var
  Si: TSymbolInfo;
  S: String;
  N: Integer;
begin
  Productions[0].Interpret; // string expression
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  S := PString(Si.Address)^;

  Productions[1].Interpret; // integer expression
  Si := Productions[1].SymbolInfo;
  if Productions[1].ExecPromotion then
    Si := Productions[1].Promoted;
  N := PInteger(Si.Address)^;
  if (N < 0) or (N >= Length(S)) then
    Error(sIndexOutOfRange, ProductionLine, ProductionCol);

  PChar(FSymbolInfo.Address)^ := S[N + 1];
end;

{ TProd_MouseXY }

procedure TProd_MouseXY.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // gra_mouseXY
  GetTerminal(tkLParen);
  E := Compile(TProd_VarReference); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  if (E.SymbolInfo.SymbolClass <> scVar) and
     (E.SymbolInfo.SymbolClass <> scField) and
     (E.SymbolInfo.SymbolClass <> scVarParam) then
    Error(sWrongActual2, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_VarReference); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  if (E.SymbolInfo.SymbolClass <> scVar) and
     (E.SymbolInfo.SymbolClass <> scField) and
     (E.SymbolInfo.SymbolClass <> scVarParam) then
    Error(sWrongActual2, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_MouseXY.Interpret;
var
  Si: TSymbolInfo;
begin
  Productions[0].Interpret; // x
  Si := Productions[0].SymbolInfo;
  PInteger(Si.Address)^ := Compiler.FMouseX;

  Productions[1].Interpret; // y
  Si := Productions[1].SymbolInfo;
  PInteger(Si.Address)^ := Compiler.FMouseY;

  // atualiza na memoria
  SymbolTable.UpdateMem(Productions[0].SymbolInfo.SymbolType,
        Integer(Productions[0].SymbolInfo.Address));
  SymbolTable.UpdateMem(Productions[1].SymbolInfo.SymbolType,
        Integer(Productions[1].SymbolInfo.Address));
end;



{ TProd_MouseX }

procedure TProd_MouseX.Parse;
begin
  Parser.GetNextToken; // MouseX
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_MouseX.Interpret;
begin
  PInteger(FSymbolInfo.Address)^ := Compiler.FMouseX;
end;

{ TProd_MouseY }

procedure TProd_MouseY.Parse;
begin
  Parser.GetNextToken; // MouseY
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_MouseY.Interpret;
begin
  PInteger(FSymbolInfo.Address)^ := Compiler.FMouseY;
end;

{ TProd_LastEvent }

procedure TProd_LastEvent.Parse;
begin
  Parser.GetNextToken; // g_LastEvent
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_LastEvent.Interpret;
var
  Q: TQuadro;
  Subst: Integer;
begin
  Q := TQuadro(TComponent(Compiler.FLastEventSender).Tag);
  if not (Q is TQuadro) then // não deve acontecer
  begin
//    Error(sFalhaInternaUltimoEvento, ProductionLine, ProductionCol);
    PInteger(FSymbolInfo.Address)^ := Compiler.FLastEvent;
    Exit;
  end;

  if Q.tem_evento_subst(Compiler.FLastEvent, Subst) then
    PInteger(FSymbolInfo.Address)^ := Subst
  else
    PInteger(FSymbolInfo.Address)^ := Compiler.FLastEvent;
end;

{ TProd_BrushColor }

procedure TProd_BrushColor.Parse;
begin
  Parser.GetNextToken; // BrushColor
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_BrushColor.Interpret;
begin
  if Compiler.Canvas <> nil then
    PInteger(FSymbolInfo.Address)^ := Compiler.Canvas.Brush.Color;
end;

{ TProd_PenColor }

procedure TProd_PenColor.Parse;
begin
  Parser.GetNextToken; // PenColor
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_PenColor.Interpret;
begin
  if Compiler.Canvas <> nil then
    PInteger(FSymbolInfo.Address)^ := Compiler.Canvas.Pen.Color;
end;

{ TProd_PenWidth }

procedure TProd_PenWidth.Parse;
begin
  Parser.GetNextToken; // PenWidth
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_PenWidth.Interpret;
begin
  if Compiler.Canvas <> nil then
    PInteger(FSymbolInfo.Address)^ := Compiler.Canvas.Pen.Width;
end;

{ TProd_FontColor }

procedure TProd_FontColor.Parse;
begin
  Parser.GetNextToken; // FontColor
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_FontColor.Interpret;
begin
  if Compiler.Canvas <> nil then
    PInteger(FSymbolInfo.Address)^ := Compiler.Canvas.Font.Color;
end;

{ TProd_FontSize }

procedure TProd_FontSize.Parse;
begin
  Parser.GetNextToken; // FontSize
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

procedure TProd_FontSize.Interpret;
begin
  if Compiler.Canvas <> nil then
    PInteger(FSymbolInfo.Address)^ := Compiler.Canvas.Font.Size;
end;

{ TProd_FontName }

procedure TProd_FontName.Parse;
begin
  Parser.GetNextToken; // FontName
  GetTerminal(tkLParen);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeString);
end;

procedure TProd_FontName.Interpret;
begin
  if Compiler.Canvas <> nil then
    PString(FSymbolInfo.Address)^ := Compiler.Canvas.Font.Name;
end;

{ TProd_ForStmt }

procedure TProd_ForStmt.Parse;
var
  Id: String;
begin
  Parser.GetNextToken; // consume for
  Id := GetIdentifier;
  FSymbolInfo := SymbolTable.FindSymbol(Id);
  if FSymbolInfo = nil then
    Error(Format(sUndeclaredIdentifier, [Id]), ProductionLine, ProductionCol);
  if not (FSymbolInfo.SymbolType is TOrdinalType) then
    Error(sOrdinalTypeRequired, ProductionLine, ProductionCol);
  GetTerminal(tkAssign);

  FExpr1 := Compile(TProd_Expression);
  CheckTypes(FSymbolInfo.SymbolType, FExpr1.SymbolInfo.SymbolType, tkAssign);

//  if not (Parser.CurrentToken in [tkRWto, tkRWdownto]) then
  if not (Parser.CurrentToken in [tkRWuntil, tkRWdownto]) then
    Error(sToOrDownToExpected, Parser.TokenLine, Parser.TokenCol);
  if Parser.CurrentToken = tkRWdownto then
    FDownTo := True;
  Parser.GetNextToken; // to or downto

  FExpr2 := Compile(TProd_Expression);
  CheckTypes(FSymbolInfo.SymbolType, FExpr2.SymbolInfo.SymbolType, tkAssign);

  GetTerminal(tkRWdo);
  Compiler.State := Compiler.State + [csInRepetitiveStmt];
  FStmt := Compile(TProd_Stmt);
  Compiler.State := Compiler.State - [csInRepetitiveStmt];
end;

procedure TProd_ForStmt.Interpret;
var
  Incr: Integer;
  PInfo, P1, P2: PInteger;
  IsChar: Boolean;
begin
  if FDownTo then
    Incr := -1
  else
    Incr := 1;

  FExpr1.Interpret;
  FExpr2.Interpret;

  PInfo := FSymbolInfo.Address;
  P1 := FExpr1.SymbolInfo.Address;
  P2 := FExpr2.SymbolInfo.Address;

//  IsChar := FSymbolInfo.SymbolType.Size = SizeOf(Char);
  IsChar := FSymbolInfo.FSymbolType.FTypeClass = tcChar;

  // atribuição inicial
  if IsChar then
    PChar(PInfo)^ := PChar(P1)^
  else
    PInfo^ := P1^;

  // atualiza na memoria
  SymbolTable.UpdateMem(FSymbolInfo.SymbolType, Integer(PInfo));

  while True do
  begin
    // testa variável de controle
    if FDownTo then
    begin
      if IsChar then
      begin
        if PChar(PInfo)^ < PChar(P2)^ then
          Break;
      end
      else
        if PInfo^ < P2^ then
          Break;
    end
    else
    begin
      if IsChar then
      begin
        if PChar(PInfo)^ > PChar(P2)^ then
          Break;
      end
      else
      begin
        if PInfo^ > P2^ then
          Break;
      end;
    end;

    // executa o comando
    try
      FStmt.Interpret;
    except
      on EBreakException do
        Break;
      on EContinueException do
        ;
    end;

    // incrementa a variável de controle
    if IsChar then
      PChar(PInfo)^ := Chr(Ord(PChar(PInfo)^) + Incr)
    else
      PInfo^ := PInfo^ + Incr;

    // atualiza na memoria
    SymbolTable.UpdateMem(FSymbolInfo.SymbolType, Integer(PInfo));
  end;
end;

{ TProd_ForStmt_2 }

procedure TProd_ForStmt_2.Parse;
begin
  Parser.GetNextToken; // for
  GetTerminal(tkLParen); // (
  if (Parser.CurrentToken <> tkSemiColon) then
    FStmt1 := Compile(TProd_AssignStmt);
  GetTerminal(tkSemiColon);

  if (Parser.CurrentToken <> tkSemiColon) then
  begin
    FExpr := Compile(TProd_Expression);
    if FExpr.SymbolInfo.SymbolType <> Compiler.DeclTypeBoolean then
      Error(sBoolExprExpected, FExpr.ProductionLine, FExpr.ProductionCol);
  end;
  GetTerminal(tkSemiColon);

  if (Parser.CurrentToken <> tkRParen) then
    FStmt2 := Compile(TProd_Stmt);
  GetTerminal(tkRParen);
//  GetTerminal(tkRWdo);

  Compiler.State := Compiler.State + [csInRepetitiveStmt];
  FStmt := Compile(TProd_Stmt);
  Compiler.State := Compiler.State - [csInRepetitiveStmt];
end;

procedure TProd_ForStmt_2.Interpret;
var
  P: PBoolean;
  SemTeste: Boolean;
begin
  SemTeste := True; // para permitir comando na forma: para (;;)
  if FStmt1 <> nil then
  begin
    FStmt1.Interpret;
    if FrmDSL.PnlMemoria.Visible then
      FrmDSL.ListViewMem.Refresh;
  end;

  if FExpr <> nil then
  begin
    FExpr.Interpret; // expressão boolean
    P := FExpr.SymbolInfo.Address;
  end
  else
    P := @SemTeste;
  while P^ do
  begin
    try
      FStmt.Interpret; // comando do "para"
    except
      on EBreakException do
        Break;
      on EContinueException do
        ;
    end;
    if FStmt2 <> nil then
      FStmt2.Interpret; // inc ou dec (tipicamente)
    if FExpr <> nil then
      FExpr.Interpret; // re-interpreta a expressão boolean
  end;
end;

{ TProd_IfStmt }

procedure TProd_IfStmt.Parse;
var
  Expr: TProduction;
begin
  GetTerminal(tkRWif);
  GetTerminal(tkLParen);
  Expr := Compile(TProd_Expression);
  if Expr.SymbolInfo.SymbolType <> Compiler.DeclTypeBoolean then
    Error(sBoolExprExpected, Expr.ProductionLine, Expr.ProductionCol);
  GetTerminal(tkRParen);
//  GetTerminal(tkRWthen);
  Compile(TProd_Stmt);
//  if Parser.CurrentToken = tkSemiColon then
//    Parser.GetNextToken; // ;
  if Parser.CurrentToken = tkRWelse then
  begin
    Parser.GetNextToken; // else
    Compile(TProd_Stmt);
  end;
end;

procedure TProd_IfStmt.Interpret;
begin
  Productions[0].Interpret;  // expression
  if PBoolean(Productions[0].SymbolInfo.Address)^ then
    Productions[1].Interpret // then stmt
  else if ProductionCount > 2 then
    Productions[2].Interpret; // else stmt
end;

{ TProd_CaseStmt }

procedure TProd_CaseStmt.Parse;
begin
  GetTerminal(tkRWchoose); // escolha
  GetTerminal(tkLParen);
  FSymbolInfo := Compile(TProd_Expression).SymbolInfo;
  GetTerminal(tkRParen);

  // create case selector; it will be filled during entry's compilation
  FCaseSel := TCaseSelector.Create;

  while True do
  begin
    Compile(TProd_CaseEntry);
    if Parser.CurrentToken = tkSemiColon then
      Parser.GetNextToken;
    if Parser.CurrentToken = tkRWend then
      Break;
    if Parser.CurrentToken = tkRWelse then
    begin
      Parser.GetNextToken; // else
      TProduction(FElseStmt) := Compile(TProd_Stmt);
      if Parser.CurrentToken = tkSemiColon then
        Parser.GetNextToken;
      Break;
    end;
  end;
  GetTerminal(tkRWend);
end;

procedure TProd_CaseStmt.Interpret;
begin
  Productions[0].Interpret; // expression
  if not FCaseSel.TestCase(Productions[0].SymbolInfo) then
    if FElseStmt <> nil then
      FElseStmt.Interpret;
end;

destructor TProd_CaseStmt.Destroy;
begin
  FCaseSel.Free;
  inherited Destroy;
end;

{ TProd_CaseEntry }

procedure TProd_CaseEntry.Parse;
var
  P: TProduction;
  Member: TProd_MemberGroup;
begin
  GetTerminal(tkRWcase);
  while True do
  begin
    TProduction(Member) := Compile(TProd_MemberGroup);
    if not Member.IsConst then
      Error(sConstExpected, ProductionLine, ProductionCol);
    CheckTypes(Member.SymbolInfo.SymbolType, Parent.SymbolInfo.SymbolType,
      tkAssign);
    try
      TProd_CaseStmt(Parent).FCaseSel.AddEntry(Member);
    except
      Error(sDuplicateCase, ProductionLine, ProductionCol);
    end;
    if Parser.CurrentToken = tkColon then
      Break;
    GetTerminal(tkComma);
  end;
  GetTerminal(tkColon);
  P := Compile(TProd_Stmt);
  with Parent as TProd_CaseStmt do
    FCaseSel.SetStmt(P as TProd_Stmt);
end;

{ TProd_WhileStmt }

procedure TProd_WhileStmt.Parse;
var
  Expr: TProduction;
begin
  GetTerminal(tkRWwhile);
  GetTerminal(tkLParen);
  Expr := Compile(TProd_Expression);
  if Expr.SymbolInfo.SymbolType <> Compiler.DeclTypeBoolean then
    Error(sBoolExprExpected, Expr.ProductionLine, Expr.ProductionCol);
  GetTerminal(tkRParen);
//  GetTerminal(tkRWdo);
  Compiler.State := Compiler.State + [csInRepetitiveStmt];
  Compile(TProd_Stmt);
  Compiler.State := Compiler.State - [csInRepetitiveStmt];
end;

procedure TProd_WhileStmt.Interpret;
var
  P: PBoolean;
begin
  Productions[0].Interpret;  // expression
  P := Productions[0].SymbolInfo.Address;
  while P^ do
  begin
    try
      Productions[1].Interpret; // statement
    except
      on EBreakException do
        Break;
      on EContinueException do
        ;
    end;
    Productions[0].Interpret; // re-evaluate expression
  end;
end;

{ TProd_RepeatStmt }

procedure TProd_RepeatStmt.Parse;
var
  Expr: TProduction;
begin
  GetTerminal(tkRWrepeat);
  Compiler.State := Compiler.State + [csInRepetitiveStmt];
  repeat
    Compile(TProd_Stmt);
    GetTerminal(tkSemiColon);
  until Parser.CurrentToken in [tkRWuntil, tkEndOfSource];
  Compiler.State := Compiler.State - [csInRepetitiveStmt];
  GetTerminal(tkRWuntil);
  GetTerminal(tkLParen);
  Expr := Compile(TProd_Expression);
  if Expr.SymbolInfo.SymbolType <> Compiler.DeclTypeBoolean then
    Error(sBoolExprExpected, Expr.ProductionLine, Expr.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_RepeatStmt.Interpret;
var
  I: Integer;
  P: PBoolean;
begin
  P := Productions[ProductionCount - 1].SymbolInfo.Address;
  repeat
    try
      for I := 0 to ProductionCount - 2 do
        Productions[I].Interpret; // statements
    except
      on EBreakException do
        Break;
      on EContinueException do
        ;
    end;
    Productions[ProductionCount - 1].Interpret; // expression
  until P^;
end;

{ TProd_WriteStmt }

procedure TProd_WriteStmt.Parse;
begin
  Parser.GetNextToken; // write
  GetTerminal(tkLParen);
  while True do
  begin
    Compile(TProd_Expression);
    if Parser.CurrentToken <> tkComma then
      Break;
    Parser.GetNextToken; // comma
  end;
  GetTerminal(tkRParen);
end;

procedure TProd_WriteStmt.Interpret;
var
  I: Integer;
  S: String;
  Si: TSymbolInfo;
begin
  S := '';
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret;
    Si := Productions[I].SymbolInfo;
    S := S + Si.SymbolType.ValueAsString(Si);
  end;
  if Assigned(Compiler.FOnWrite) then
    Compiler.OnWrite(Compiler, S);
end;

{ TProd_WritelnStmt }

procedure TProd_WritelnStmt.Parse;
begin
  Parser.GetNextToken; // writeln
  GetTerminal(tkLParen);
  while True do
  begin
    Compile(TProd_Expression);
    if Parser.CurrentToken <> tkComma then
      Break;
    Parser.GetNextToken; // comma
  end;
  GetTerminal(tkRParen);
end;

procedure TProd_WritelnStmt.Interpret;
var
  I: Integer;
  S: String;
  Si: TSymbolInfo;
begin
  S := '';
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret;
    Si := Productions[I].SymbolInfo;
    S := S + Si.SymbolType.ValueAsString(Si);
  end;
  S := S + #13#10;
  if Assigned(Compiler.FOnWrite) then
    Compiler.OnWrite(Compiler, S);
end;

{ TProd_ReadStmt }

procedure TProd_ReadStmt.Parse;
var
  P: TProduction;
begin
  Parser.GetNextToken; // read
  GetTerminal(tkLParen);
  while True do
  begin
    P := Compile(TProd_Expression);
    if not (P.SymbolInfo.SymbolClass in [scVar, scVarParam]) then
      Error(sVarIdentExpected, P.ProductionLine, P.ProductionCol);
    if Parser.CurrentToken <> tkComma then
      Break;
    Parser.GetNextToken; // comma
  end;
  GetTerminal(tkRParen);
end;

procedure TProd_ReadStmt.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  VInteger: Integer;
  VChar: Char;
  VString: String;
  VExtended: Extended;
begin
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret;
    Si := Productions[I].SymbolInfo;
    case Si.SymbolType.TypeClass of
      tcInteger:
        if Assigned(Compiler.FOnReadInteger) then
        begin
          Compiler.FOnReadInteger(Compiler, VInteger);
          Si.SymbolType.Oper(Si.Address, @VInteger, nil, tkAssign, Self);
        end;

      tcChar:
        if Assigned(Compiler.FOnReadChar) then
        begin
          Compiler.FOnReadChar(Compiler, VChar);
          Si.SymbolType.Oper(Si.Address, @VChar, nil, tkAssign, Self);
        end;

      tcExtended:
        if Assigned(Compiler.FOnReadReal) then
        begin
          Compiler.FOnReadReal(Compiler, VExtended);
          Si.SymbolType.Oper(Si.Address, @VExtended, nil, tkAssign, Self);
        end;

      tcString:
        if Assigned(Compiler.FOnReadString) then
        begin
          Compiler.FOnReadString(Compiler, VString);
          Si.SymbolType.Oper(Si.Address, @VString, nil, tkAssign, Self);
        end;
    end;

    // atualiza na memoria
    SymbolTable.UpdateMem(Si.SymbolType, Integer(Si.Address));
  end;
end;

{ TProd_WithStmt }

destructor TProd_WithStmt.Destroy;
begin
  FRecordLst.Free;
  inherited Destroy;
end;

procedure TProd_WithStmt.Parse;
var
  P: TProduction;
  T: TRecordType;
  I: Integer;
begin
  Parser.GetNextToken; // with
  FRecordLst := TList.Create;
  while True do
  begin
    P := Compile(TProd_VarReference);
    if not (P.SymbolInfo.SymbolClass in [scVar, scField, scVarParam, scPointer])
    then Error(sRecordTypeRequired, ProductionLine, ProductionCol);
    if not (P.SymbolInfo.SymbolType is TRecordType) then
      Error(sRecordTypeRequired, ProductionLine, ProductionCol);
    FRecordLst.Add(P);
    if Parser.CurrentToken <> tkComma then
      Break;
    Parser.GetNextToken; // comma
  end;
  GetTerminal(tkRWdo);
  // add scope for all record references
  for I := 0 to FRecordLst.Count - 1 do
  begin
    TSymbolType(T) := TProduction(FRecordLst[I]).SymbolInfo.SymbolType;
    SymbolTable.AddScope(T.FScope);
  end;
  // compile stmt
  FStmt := Compile(TProd_Stmt);
  // remove scopes
  for I := 0 to FRecordLst.Count - 1 do
    SymbolTable.RemoveScope;
end;

procedure TProd_WithStmt.Interpret;
var
  I: Integer;
begin
  for I := 0 to FRecordLst.Count - 1 do
    TProduction(FRecordLst[I]).Interpret;
  FStmt.Interpret;
end;

{ TProd_NewStmt }

procedure TProd_NewStmt.Parse;
begin
  Parser.GetNextToken; // new
  GetTerminal(tkLParen);
  FSymbolInfo := Compile(TProd_VarReference).SymbolInfo;
  if not (FSymbolInfo.SymbolType is TPointerType) then
    Error(sPointerTypeRequired, ProductionLine, ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_NewStmt.Interpret;
var
  P: Pointer;
begin
  Productions[0].Interpret; // pointer var reference
  FSymbolInfo := Productions[0].SymbolInfo;
  P := Compiler.Heap.AllocMem(TPointerType(FSymbolInfo.SymbolType).FBaseType.Size);
  if P = nil then
    Error(sOutOfMemory, ProductionLine, ProductionCol);
  PByte(FSymbolInfo.Address^) := P;

  // exibe na heap
  SymbolTable.ShowMem('',
          TPointerType(FSymbolInfo.SymbolType).FBaseType,
          Integer(P), False);

  // atualiza visualmente o ponteiro
  SymbolTable.UpdateMem(FSymbolInfo.SymbolType, Integer(FSymbolInfo.Address));
end;

{ TProd_DisposeStmt }

procedure TProd_DisposeStmt.Parse;
begin
  Parser.GetNextToken; // dispose
  GetTerminal(tkLParen);
  FSymbolInfo := Compile(TProd_VarReference).SymbolInfo;
  if not (FSymbolInfo.SymbolType is TPointerType) then
    Error(sPointerTypeRequired, ProductionLine, ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_DisposeStmt.Interpret;
begin
  Productions[0].Interpret; // pointer var reference
  FSymbolInfo := Productions[0].SymbolInfo;
  Compiler.Heap.FreeMem(PByte(FSymbolInfo.Address^));

  // atualiza o visual
  SymbolTable.DisposeHeap(TPointerType(FSymbolInfo.SymbolType).FBaseType,
      Integer(FSymbolInfo.Address^));
end;

{ TProd_Expression }

procedure TProd_Expression.Parse;
var
  SymCla: TSymbolClass;
  T: TSymbolType;
begin
  FSimpleExpr1 := Compile(TProd_SimpleExpression);
  FSymbolInfo := FSimpleExpr1.SymbolInfo;
  if Parser.CurrentToken in Set_RelOp then
  begin
    FRelOp := Parser.CurrentToken;
    Parser.GetNextToken;
    FSimpleExpr2 := Compile(TProd_SimpleExpression);
    T := CheckTypes(FSimpleExpr1.SymbolInfo.SymbolType,
      FSimpleExpr2.SymbolInfo.SymbolType, FRelOp);
    FSimpleExpr1.PromoteTo(T);
    FSimpleExpr2.PromoteTo(T);
    SymCla := scConst;
    if (FSimpleExpr1.SymbolInfo.SymbolClass <> scConst) or
       (FSimpleExpr2.SymbolInfo.SymbolClass <> scConst) then
      SymCla := scVar;
    FSymbolInfo := SymbolTable.AllocSymbolInfo(SymCla, Compiler.DeclTypeBoolean);
  end;
end;

procedure TProd_Expression.Interpret;
var
  Si1, Si2: TSymbolInfo;
begin
  FSimpleExpr1.Interpret;
  Si1 := FSimpleExpr1.SymbolInfo;
  if ProductionCount > 1 then
  begin
    if FSimpleExpr1.ExecPromotion then
      Si1 := FSimpleExpr1.Promoted;

    FSimpleExpr2.Interpret;
    Si2 := FSimpleExpr2.SymbolInfo;
    if FSimpleExpr2.ExecPromotion then
      Si2 := FSimpleExpr2.Promoted;

    Operate(FSymbolInfo, Si1, Si2, FRelOp);
//    Operate(FSymbolInfo, FSimpleExpr1.SymbolInfo, FSimpleExpr2.SymbolInfo,
//      FRelOp);
  end;
end;

{ TProd_SimpleExpression }

constructor TProd_SimpleExpression.Create(Compiler: TCompiler);
begin
  inherited Create(Compiler);
  FLstAddOp := TList.Create;
end;

destructor TProd_SimpleExpression.Destroy;
begin
  FLstAddOp.Free;
  inherited Destroy;
end;

procedure TProd_SimpleExpression.Parse;
var
  T: TSymbolType;
  I: Integer;
  SymCla: TSymbolClass;
begin
  FSymbolInfo := Compile(TProd_Term).SymbolInfo;
  if Parser.CurrentToken in Set_AddOp then
  begin
    repeat
      FLstAddOp.Add(Pointer(Parser.CurrentToken));
      Parser.GetNextToken;
      Compile(TProd_Term);
    until not (Parser.CurrentToken in Set_AddOp);
    // check types
    T := Productions[0].SymbolInfo.SymbolType;
    for I := 1 to ProductionCount - 1 do
      T := CheckTypes(T, Productions[I].SymbolInfo.SymbolType,
          TToken(FLstAddOp[I - 1]));
    // T is the result's type: promote; check symbol class
    SymCla := scConst;
    for I := 0 to ProductionCount - 1 do
    begin
      Productions[I].PromoteTo(T);
      if Productions[I].SymbolInfo.SymbolClass <> scConst then
        SymCla := scVar;
    end;
    FSymbolInfo := SymbolTable.AllocSymbolInfo(SymCla, T);
  end;
end;

procedure TProd_SimpleExpression.Interpret;
var
  I: Integer;
  Si1, Si2: TSymbolInfo;
begin
  Productions[0].Interpret;
  Si1 := Productions[0].SymbolInfo;
  if ProductionCount > 1 then
  begin
    if Productions[0].ExecPromotion then
      Si1 := Productions[0].Promoted;

    { trata o "curto circuito" de expressões lógicas }
    if (Si1.FSymbolType.TypeClass = tcBoolean) and
       (TToken(FLstAddOp[0]) = tkRWor) and
       (PBoolean(Si1.Address)^ = True) then
    begin
      PBoolean(FSymbolInfo.Address)^ := True;
      Exit;
    end;

    Productions[1].Interpret;
    Si2 := Productions[1].SymbolInfo;
    if Productions[1].ExecPromotion then
      Si2 := Productions[1].Promoted;

    Operate(FSymbolInfo, Si1, Si2, TToken(FLstAddOp[0]));
    for I := 2 to ProductionCount - 1 do
    begin
      { trata o "curto circuito" de expressões lógicas }
      if (FSymbolInfo.FSymbolType.TypeClass = tcBoolean) and
         (TToken(FLstAddOp[I - 1]) = tkRWor) and
         (PBoolean(FSymbolInfo.Address)^ = True) then
        Exit;

      Productions[I].Interpret;
      Si1 := Productions[I].SymbolInfo;
      if Productions[I].ExecPromotion then
        Si1 := Productions[I].Promoted;

      Operate(FSymbolInfo, FSymbolInfo, Si1, TToken(FLstAddOp[I - 1]));
    end;
  end;
end;

{ TProd_Term }

constructor TProd_Term.Create(Compiler: TCompiler);
begin
  inherited Create(Compiler);
  FLstMulOp := TList.Create;
end;

destructor TProd_Term.Destroy;
begin
  FLstMulOp.Free;
  inherited Destroy;
end;

procedure TProd_Term.Parse;
var
  T: TSymbolType;
  I: Integer;
  SymCla: TSymbolClass;
begin
  FSymbolInfo := Compile(TProd_Factor).SymbolInfo;
  if Parser.CurrentToken in Set_MulOp then
  begin
    repeat
      FLstMulOp.Add(Pointer(Parser.CurrentToken));
      Parser.GetNextToken;
      Compile(TProd_Factor);
    until not (Parser.CurrentToken in Set_MulOp);
    // check types
    T := Productions[0].SymbolInfo.SymbolType;
    for I := 1 to ProductionCount - 1 do
      T := CheckTypes(T, Productions[I].SymbolInfo.SymbolType,
          TToken(FLstMulOp[I - 1]));
    // T is the result's type: promote; check symbol class
    SymCla := scConst;
    for I := 0 to ProductionCount - 1 do
    begin
      Productions[I].PromoteTo(T);
      if Productions[I].SymbolInfo.SymbolClass <> scConst then
        SymCla := scVar;
    end;
    FSymbolInfo := SymbolTable.AllocSymbolInfo(SymCla, T);
  end;
end;

procedure TProd_Term.Interpret;
var
  I: Integer;
  Si1, Si2: TSymbolInfo;
begin
  Productions[0].Interpret;
  Si1 := Productions[0].SymbolInfo;

  if ProductionCount > 1 then
  begin
    if Productions[0].ExecPromotion then
      Si1 := Productions[0].Promoted;

    { trata o "curto circuito" de expressões lógicas }
    if (Si1.FSymbolType.TypeClass = tcBoolean) and
       (TToken(FLstMulOp[0]) = tkRWand) and
       (PBoolean(Si1.Address)^ = False) then
    begin
      PBoolean(FSymbolInfo.Address)^ := False;
      Exit;
    end;

    Productions[1].Interpret;
    Si2 := Productions[1].SymbolInfo;
    if Productions[1].ExecPromotion then
      Si2 := Productions[1].Promoted;

    Operate(FSymbolInfo, Si1, Si2, TToken(FLstMulOp[0]));
    for I := 2 to ProductionCount - 1 do
    begin
      { trata o "curto circuito" de expressões lógicas }
      if (FSymbolInfo.FSymbolType.TypeClass = tcBoolean) and
         (TToken(FLstMulOp[I - 1]) = tkRWand) and
         (PBoolean(FSymbolInfo.Address)^ = False) then
        Exit;

      Productions[I].Interpret;
      Si1 := Productions[I].SymbolInfo;
      if Productions[I].ExecPromotion then
        Si1 := Productions[I].Promoted;

      Operate(FSymbolInfo, FSymbolInfo, Si1, TToken(FLstMulOp[I - 1]));
    end;
  end;
end;

{ TProd_Factor }

procedure TProd_Factor.Parse;
begin
  if Parser.CurrentToken = tkPlus then
    Parser.GetNextToken; // throw out unary +
  Check(Set_FirstFactor, sExpressionExpected);
  case Parser.CurrentToken of
    tkLParen:
    begin
      Parser.GetNextToken; // '('
      FExpr := Compile(TProd_Expression);
      FSymbolInfo := FExpr.SymbolInfo;
      GetTerminal(tkRParen);
    end;
(*
    tkLBracket:
    begin
      FSetExpr := Compile(TProd_SetConstructor);
      FSymbolInfo := FSetExpr.SymbolInfo;
    end;
*)
    tkRWnot:
    begin
      FSymbolInfo := SymbolTable.FindSymbol('não');
      Parser.GetNextToken;
      if Parser.CurrentToken in Set_FirstFactor then
      begin
        FNegate := True;
        FFact := Compile(TProd_Factor);
        if FFact.SymbolInfo.SymbolType <> Compiler.DeclTypeBoolean then
          Error(sIncompatibleTypes, ProductionLine, ProductionCol);
//        FSymbolInfo := SymbolTable.AllocSymbolInfo(FFact.SymbolInfo.SymbolClass,
//          Compiler.DeclTypeBoolean);

//        FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar,
//          Compiler.DeclTypeBoolean);

        FSymbolInfo := SymbolTable.AllocSymbolInfo(scConst,
          Compiler.DeclTypeBoolean);
      end;
    end;

    tkMinus:
    begin
      Parser.GetNextToken; // -
      FFact := Compile(TProd_Factor);
      if (FFact.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger) and
         (FFact.SymbolInfo.SymbolType <> Compiler.DeclTypeExtended) then
        Error(sIncompatibleTypes, ProductionLine, ProductionCol);
//      FSymbolInfo := SymbolTable.AllocSymbolInfo(FFact.SymbolInfo.SymbolClass,
//        FFact.SymbolInfo.SymbolType);


(*
      FSymbolInfo := SymbolTable.AllocSymbolInfo(FFact.SymbolInfo.SymbolClass,
        FFact.SymbolInfo.SymbolType);
*)

      FSymbolInfo := SymbolTable.AllocSymbolInfo(scConst, FFact.SymbolInfo.SymbolType);
//      FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, FFact.SymbolInfo.SymbolType);

    end;

    tkIntNumber:
    begin
      FSymbolInfo := SymbolTable.AllocSymbolInfo(scConst,
        Compiler.DeclTypeInteger);
      PInteger(FSymbolInfo.Address)^ := Parser.TokenValue.AsInteger;
      Parser.GetNextToken;
    end;

    tkFloatNumber:
    begin
      FSymbolInfo := SymbolTable.AllocSymbolInfo(scConst,
        Compiler.DeclTypeExtended);
      PExtended(FSymbolInfo.Address)^ := Parser.TokenValue.AsExtended;
      Parser.GetNextToken;
    end;

    tkString:
    begin
      FSymbolInfo := SymbolTable.AllocSymbolInfo(scConst,
        Compiler.DeclTypeString);
      PString(FSymbolInfo.Address)^ := Parser.TokenValue.AsString;
      Parser.GetNextToken;
    end;

    tkChar:
    begin
      FSymbolInfo := SymbolTable.AllocSymbolInfo(scConst,
        Compiler.DeclTypeChar);
      PChar(FSymbolInfo.Address)^ := Parser.TokenValue.AsChar;
      Parser.GetNextToken;
    end;

    tkRWnil:
    begin
      FSymbolInfo := SymbolTable.FindSymbol('nulo');
      Parser.GetNextToken;
    end;

    tkRWfalse:
    begin
      FSymbolInfo := SymbolTable.FindSymbol('falso');
      Parser.GetNextToken;
    end;

    tkRWtrue, tkRWyes:
    begin
      FSymbolInfo := SymbolTable.FindSymbol('verdadeiro');
      Parser.GetNextToken;
    end;

    tkId:
    begin
      // test for some standard functions
      if StandardProcedure(Parser.TokenString) then
      begin
        FExpr := Productions[0]; // according to the implementation
                                 // of StandardProcedure, the first
                                 // production (Productions[0]) is
                                 //  the function
        FSymbolInfo := Productions[0].SymbolInfo;
        Exit;
      end;

      FSymbolInfo := SymbolTable.FindSymbol(Parser.TokenString);
      if FSymbolInfo = nil then
        Error(Format(sUndeclaredIdentifier, [Parser.TokenString]),
          Parser.TokenLine, Parser.TokenCol);

      if FSymbolInfo.SymbolClass in [scVar, scField, scVarParam,
                                     scFunction] then
      begin
        FVarRef := Compile(TProd_VarReference);
        FSymbolInfo := FVarRef.SymbolInfo;
        Exit;
      end;

      if FSymbolInfo.SymbolClass <> scConst then
        Error(sVarIdentExpected, Parser.TokenLine, Parser.TokenCol);
      Parser.GetNextToken;
    end;
  end;
end;

procedure TProd_Factor.Interpret;
begin
  if FExpr <> nil then
    FExpr.Interpret
  else if FSetExpr <> nil then
    FSetExpr.Interpret
  else if FVarRef <> nil then
    FVarRef.Interpret
  else if FFuncCall <> nil then
    FFuncCall.Interpret
  else if FFact <> nil then
  begin
    FFact.Interpret;
    if FNegate then
      Operate(FSymbolInfo, FFact.SymbolInfo, nil, tkRWnot)
    else
      Operate(FSymbolInfo, FFact.SymbolInfo, nil, tkUnaryMinus);
  end;
end;

{ TProd_ConstExpression }

procedure TProd_ConstExpression.Parse;
begin
  FSymbolInfo := Compile(TProd_Expression).SymbolInfo;
  if FSymbolInfo.SymbolClass <> scConst then
    Error(sConstExpected, ProductionLine, ProductionCol);
end;

{ TProd_SetConstructor }
(*
procedure TProd_SetConstructor.Parse;
var
  TSet, TBase: TSymbolType;
  P1, P2: TProd_MemberGroup;
  SymClass: TSymbolClass;
  I: Integer;
begin
  Parser.GetNextToken; // '['
  TBase := nil;
  if Parser.CurrentToken = tkRBracket then
    Parser.GetNextToken // []: empty set
  else
  begin
    TProduction(P1) := Compile(TProd_MemberGroup);
    while True do
    begin
      if Parser.CurrentToken <> tkComma then
        Break;
      Parser.GetNextToken;
      TProduction(P2) := Compile(TProd_MemberGroup);
      CheckTypes(P1.SymbolInfo.SymbolType, P2.SymbolInfo.SymbolType, tkAssign);
    end;
    if Parser.CurrentToken <> tkRBracket then
      Error(sInvalidSetConstructor, ProductionLine, ProductionCol);
    Parser.GetNextToken;
    TBase := P1.SymbolInfo.SymbolType;
  end;
  TSet := SymbolTable.AllocType(TSetType);
  TSetType(TSet).FBaseType := TBase;
  //
  SymClass := scConst;
  for I := 0 to ProductionCount - 1 do
    if not TProd_MemberGroup(Productions[I]).IsConst then
      SymClass := scVar;
  FSymbolInfo := SymbolTable.AllocSymbolInfo(SymClass, TSet);
  if SymClass = scConst then
    Self.Interpret;
end;

procedure TProd_SetConstructor.Interpret;
var
  I, J, Inf, Sup: Integer;
  Si1, Si2: TSymbolInfo;
  Member: TProd_MemberGroup;
begin
  PSetInteger(FSymbolInfo.Address)^ := [];
  for I := 0 to ProductionCount - 1 do
  begin
    TProduction(Member) := Productions[I];
    Member.Interpret;
    Si1 := Member.FExprInf.SymbolInfo;
    if Member.FExprSup = nil then
    begin // only one expression
      if Si1.SymbolType is TCharType then
        PSetChar(FSymbolInfo.Address)^ := PSetChar(FSymbolInfo.Address)^ +
          [PChar(Si1.Address)^]
      else
        PSetInteger(FSymbolInfo.Address)^ := PSetInteger(FSymbolInfo.Address)^ +
          [PInteger(Si1.Address)^];
    end else
    begin // range expression
      Si2 := Member.FExprSup.SymbolInfo;
      if Si2.SymbolType is TCharType then
      begin
        Inf := Ord(PChar(Si1.Address)^);
        Sup := Ord(PChar(Si2.Address)^);
      end else
      begin
        Inf := PInteger(Si1.Address)^;
        Sup := PInteger(Si2.Address)^;
      end;
      for J := Inf to Sup do
        PSetInteger(FSymbolInfo.Address)^ :=
          PSetInteger(FSymbolInfo.Address)^ + [J];
    end;
  end;
end;
*)
{ TProd_MemberGroup }

procedure TProd_MemberGroup.Parse;
begin
  TProduction(FExprInf) := Compile(TProd_ConstExpression);
  FExprInf.Interpret;
  FSymbolInfo := FExprInf.SymbolInfo;
  if not (FExprInf.SymbolInfo.SymbolType is TOrdinalType) then
    Error(sOrdinalTypeRequired, ProductionLine, ProductionCol);
  if Parser.CurrentToken = tkDotDot then
  begin
    Parser.GetNextToken; // dotdot
    TProduction(FExprSup) := Compile(TProd_ConstExpression);
    FExprSup.Interpret;
    if not (FExprSup.SymbolInfo.SymbolType is TOrdinalType) then
      Error(sOrdinalTypeRequired, ProductionLine, ProductionCol);
    if FExprInf.SymbolInfo.SymbolType <> FExprSup.SymbolInfo.SymbolType then
      Error(sIncompatibleTypes, ProductionLine, ProductionCol);
  end;
end;

(*
procedure TProd_MemberGroup.Interpret;
begin
  ShowMessage('member group. interpret');
  FExprInf.Interpret;
  if FExprSup <> nil then
    FExprSup.Interpret;
end;
*)

function TProd_MemberGroup.IsConst: Boolean;
begin
  Result := FExprInf.SymbolInfo.SymbolClass = scConst;
  if FExprSup <> nil then
    Result := Result and (FExprSup.SymbolInfo.SymbolClass = scConst);
end;

function TProd_MemberGroup.InRange(Si: TSymbolInfo): Boolean;
begin // test if value of Si is in member's range
  if FExprSup = nil then // Si = Inf
    Si.SymbolType.Oper(@Result, Si.Address, FExprInf.SymbolInfo.Address,
      tkEqual, Self)
  else
  begin
    // Si >= Inf and Si <= Sup
    Si.SymbolType.Oper(@Result, Si.Address, FExprInf.SymbolInfo.Address, tkGE, Self);
    if Result then
      Si.SymbolType.Oper(@Result, Si.Address, FExprSup.SymbolInfo.Address, tkLE, Self);
  end;
end;

function TProd_MemberGroup.InfSymbol: TSymbolInfo;
begin
  Result := FExprInf.SymbolInfo;
end;

function TProd_MemberGroup.SupSymbol: TSymbolInfo;
begin
  if FExprSup = nil then
    Result := FExprInf.SymbolInfo
  else
    Result := FExprSup.SymbolInfo;
end;

{ TProd_Procedure }

procedure TProd_Procedure.Parse;
var
  T: TProcedureType;
  P: TProd_Procedure;
  Col, Line: Integer;
begin
  Parser.GetNextToken; // procedure
  if Parser.CurrentToken <> tkId then
    Error(sIdentifierExpected, Parser.TokenLine, Parser.TokenCol);
  FProcId := Parser.TokenString;
  Col := Parser.TokenCol;
  Line := Parser.TokenLine;
  Parser.GetNextToken; // id

  Compiler.State := Compiler.State + [csFindInScope];
  FSymbolInfo := SymbolTable.FindSymbol(FProcId);
  Compiler.State := Compiler.State - [csFindInScope];

  if FSymbolInfo <> nil then
  begin // must be previous forward declaration
    TProduction(P) := SymbolTable.LookForForward(FProcId);
    if not (P is TProd_Procedure) or (P = nil) then
      Error(Format(sIdentifierRedeclared, [FProcId]), Line, Col);

    // this symboltable will be discarded
    // it is used only for checking the forward declaration
    FSymbolTable := SymbolTable.NewSymbolTable;
    SymbolTable.AddScope(FSymbolTable);

    TProduction(FParams) := Compile(TProd_FormalParamList);

    if not FormalParamsOk(P.FParams, FParams) then
      Error(Format(sDeclDiffers, [FProcId]), ProductionLine, ProductionCol);
    GetTerminal(tkSemiColon);
    SymbolTable.RemoveScope;

    SymbolTable.AddScope(P.FSymbolTable);
    Compiler.State := Compiler.State + [csInProcedure];

    // the block that will be interpreted will be conected to the
    // first declaration
    P.FBlock := Compile(TProd_Block);

    Compiler.State := Compiler.State - [csInProcedure];
    GetTerminal(tkSemiColon);
    SymbolTable.RemoveScope;
  end
  else
  begin // first declaration
    TSymbolType(T) := SymbolTable.AllocType(TProcedureType);
    T.FProduction := Self;
    SymbolTable.Enter(FProcId, scProcedure, T, MODL_PAC);
    FSymbolTable := SymbolTable.NewSymbolTable;
    SymbolTable.AddScope(FSymbolTable);
    TProduction(FParams) := Compile(TProd_FormalParamList);
    GetTerminal(tkSemiColon);
    if Parser.CurrentToken = tkRWforward then
    begin // forward declaration
      Parser.GetNextToken; // forward
      SymbolTable.AddForward(Self);
    end
    else
    begin // first declaration: compile block
      Compiler.State := Compiler.State + [csInProcedure];
      FBlock := Compile(TProd_Block);
      Compiler.State := Compiler.State - [csInProcedure];
    end;
    GetTerminal(tkSemiColon);
    SymbolTable.RemoveScope;
  end;
end;

{ TProd_Function }

procedure TProd_Function.Parse;
var
  T: TFunctionType;
  P: TProd_Function;
  Line, Col: Integer;
begin
  Parser.GetNextToken; // function
  if Parser.CurrentToken <> tkId then
    Error(sIdentifierExpected, Parser.TokenLine, Parser.TokenCol);
  FFuncId := Parser.TokenString;
  Line := Parser.TokenLine;
  Col := Parser.TokenCol;
  Parser.GetNextToken; // id

  Compiler.State := Compiler.State + [csFindInScope];
  FSymbolInfo := SymbolTable.FindSymbol(FFuncId);
  Compiler.State := Compiler.State - [csFindInScope];

  if FSymbolInfo <> nil then
  begin // must be previous forward declaration
    TProduction(P) := SymbolTable.LookForForward(FFuncId);
    if not (P is TProd_Function) or (P = nil) then
      Error(Format(sIdentifierRedeclared, [FFuncId]), Line, Col);

    FSymbolTable := SymbolTable.NewSymbolTable;
    SymbolTable.AddScope(FSymbolTable);

    // Enter Result as scVarParam; type will be filled later
    FSiResult := SymbolTable.Enter(RESULT_NAME, scVarParam, nil, MODL_PAC);

    TProduction(FParams) := Compile(TProd_FormalParamList);

    if not FormalParamsOk(P.FParams, FParams) then
      Error(Format(sDeclDiffers, [FFuncId]), ProductionLine, ProductionCol);

    GetTerminal(tkColon);
    if Compile(TProd_ParamType).SymbolInfo.SymbolType <> P.FReturnType then
      Error(Format(sDeclDiffers, [FFuncId]), ProductionLine, ProductionCol);

    GetTerminal(tkSemiColon);
    SymbolTable.RemoveScope;

    FSiResult.FSymbolType := P.FReturnType;

    SymbolTable.AddScope(P.FSymbolTable);
    Compiler.State := Compiler.State + [csInFunction];
    P.FBlock := Compile(TProd_Block);
    Compiler.State := Compiler.State - [csInFunction];
    GetTerminal(tkSemiColon);
    SymbolTable.RemoveScope;
  end
  else
  begin // first declaration
    TSymbolType(T) := SymbolTable.AllocType(TFunctionType);
    T.FProduction := Self;
    SymbolTable.Enter(FFuncId, scFunction, T, MODL_PAC);
    FSymbolTable := SymbolTable.NewSymbolTable;
    SymbolTable.AddScope(FSymbolTable);

    // Enter Result (scVarParam, so that no space is alocated)
    // Type will be filled later
    FSiResult := SymbolTable.Enter(RESULT_NAME, scVarParam, nil, MODL_PAC);

    TProduction(FParams) := Compile(TProd_FormalParamList);
    GetTerminal(tkColon);

    // compile result type and fill FSiResult.SymbolType
    FSiResult.FSymbolType := Compile(TProd_ParamType).SymbolInfo.SymbolType;

    FReturnType := FSiResult.FSymbolType;
    GetTerminal(tkSemiColon);
    if Parser.CurrentToken = tkRWforward then
    begin // forward declaration
      Parser.GetNextToken; // forward
      SymbolTable.AddForward(Self);
    end
    else
    begin // first declaration: compile block
      Compiler.State := Compiler.State + [csInFunction];
      FBlock := Compile(TProd_Block);
      Compiler.State := Compiler.State - [csInFunction];
    end;
    GetTerminal(tkSemiColon);
    SymbolTable.RemoveScope;
  end;
end;

{ TProd_FormalParamList }

procedure TProd_FormalParamList.Parse;
begin
  FParamLst := TList.Create;
  if Parser.CurrentToken <> tkLParen then
    Exit; // no parameters
  Parser.GetNextToken; // (
  while True do
  begin
    if Parser.CurrentToken = tkRParen then
      Break;
    Compile(TProd_ParamDecl);
    if Parser.CurrentToken = tkSemiColon then
    begin
      Parser.GetNextToken;
      Continue;
    end
    else
      Break;
  end;
  GetTerminal(tkRParen);
end;

destructor TProd_FormalParamList.Destroy;
begin
  FParamLst.Free;
  inherited Destroy;
end;

{ TProd_ParamDecl }

procedure TProd_ParamDecl.Parse;
var
  I: Integer;
  Lst: TStringList;
  ProdType: TProduction;
  P: TSymbolInfo;
  SymbolClass: TSymbolClass;
begin
  Lst := TStringList.Create;
  Lst.CaseSensitive := True;
  try
    if Parser.CurrentToken = tkRWvar then
    begin
      Parser.GetNextToken; // var
      SymbolClass := scVarParam;
    end
    else
      SymbolClass := scVar;
    Compiler.State := Compiler.State + [csFindInScope];
    GetNewIdentifierList(Lst);
    Compiler.State := Compiler.State - [csFindInScope];
    GetTerminal(tkColon);
    ProdType := Compile(TProd_ParamType);
    for I := 0 to Lst.Count - 1 do
    begin
      P := SymbolTable.Enter(Lst[I], SymbolClass, ProdType.SymbolInfo.SymbolType, MODL_PAC);
      TProd_FormalParamList(Parent).FParamLst.Add(P);
    end;
  finally
    Lst.Free;
  end;
end;

{ TProd_ProcedureCall }

procedure TProd_ProcedureCall.Parse;
var
  I: Integer;
  P: TProd_Procedure;
  E: TProduction;
  Si: TSymbolInfo;
  T: TSymbolType;

  procedure GetActuals;
  begin
    GetTerminal(tkLParen);
    while True do
    begin
      Compile(TProd_Expression);
      if Parser.CurrentToken <> tkComma then
        Break;
      Parser.GetNextToken; // comma
    end;
    GetTerminal(tkRParen);
  end;

  procedure GetParenthesis;
  begin
    GetTerminal(tkLParen);
    GetTerminal(tkRParen);
  end;

begin
  FSymbolInfo := SymbolTable.FindSymbol(Parser.TokenString); // again
  Parser.GetNextToken; // id
  P := TProcedureType(FSymbolInfo.SymbolType).FProduction;
  FProcId := P.ProcId;
  if P.FParams.FParamLst.Count > 0 then
  begin // get actual parameters
    GetActuals;
    // after GetActuals, ProductionCount = number of actual parameters
    if ProductionCount < P.FParams.FParamLst.Count then
      Error(sNotEnoughActuals, ProductionLine, ProductionCol);
    if ProductionCount > P.FParams.FParamLst.Count then
      Error(sTooManyActuals, ProductionLine, ProductionCol);
    // check actual parameter types
    for I := 0 to ProductionCount - 1 do
    begin
      Si := P.FParams.FParamLst[I];
      E := Productions[I];
      if Si.SymbolClass = scVarParam then
      begin
        if not (E.SymbolInfo.SymbolClass in [scVar, scVarParam, scPointer]) then
          Error(sWrongActual2, ProductionLine, ProductionCol);
        if Si.SymbolType <> E.SymbolInfo.SymbolType then
          Error(sWrongActual, ProductionLine, ProductionCol);
      end
      else
      begin
        T := CheckTypes(Si.SymbolType, E.SymbolInfo.SymbolType, tkAssign);
        E.PromoteTo(T);
      end;
    end;
  end
  else
    GetParenthesis;
end;

procedure TProd_ProcedureCall.Interpret;
var
  I: Integer;
  P: TProd_Procedure;
  Sia, Sip: TSymbolInfo;
  LstSi: TList;
  Addr: Pointer;
  LstAddr: TList;
  LstType: TList;
  SaveSymTbl: TSymbolTable;
begin
  // verifica consumo de memória
//  CheckMemory;

  // interpret arguments and get their addresses
  LstAddr := TList.Create;
  LstType := TList.Create; // LstType remembers arguments' type, in order
                           // to transfer them to the area occupied by
                           // the parameters inside the new scope
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret;
    Sia := Productions[I].SymbolInfo;
    if Productions[I].ExecPromotion then
      Sia := Productions[I].Promoted;
    LstAddr.Add(Sia.Address);
    LstType.Add(Sia.SymbolType);
  end;

  // prepare activation
  P := TProcedureType(FSymbolInfo.SymbolType).FProduction;

  P.FSymbolTable.SetActivation;
  SaveSymTbl := Compiler.SetSubroutineSymbolTable(P.FSymbolTable);
  LstSi := P.FParams.FParamLst;

  // exibe símbolos desta ativação
  P.FSymbolTable.ShowSubroutineCall(ProcId);
  P.FSymbolTable.ShowMemActivation;

  // copy arguments
  for I := 0 to ProductionCount - 1 do
  begin
    Sip := TSymbolInfo(LstSi[I]);
    if Sip.SymbolClass = scVarParam then
    begin // solve var parameter
      Addr := PByte(Sip.SymbolTable.FVarArea.Last) + Sip.FOffset;
      PByte(Addr^) := LstAddr[I];

      // associa o var param ao argumento
      P.FSymbolTable.MarkAsPointer(Integer(Addr));
      P.FSymbolTable.UpdateVarParam(Integer(Addr), IntToStr(Integer(LstAddr[I])));
    end
    else begin
      // copia argumento por valor
      TSymbolType(LstType[I]).Oper(Sip.Address, LstAddr[I], nil, tkAssign, Self);

      // atualiza a parte visual
      P.FSymbolTable.UpdateMem(LstType[I], Integer(Sip.Address));
    end;
  end;

  LstAddr.Free;
  LstType.Free;

  // interpret procedure block
  try
    P.FBlock.Interpret;
  except
    on EExitException do // catch Exit
      ;
  end;

  // verifica depuração, dando chance à execução passo a passo de
  // parar no 'fim' da rotina
  VerifyDebug(P.FBlock.FProductionEndLine, P.FBlock.FProductionEndCol, P.Parser);

  // apaga símbolos desta ativação
  P.FSymbolTable.ShowSubroutineReturn;

  P.FSymbolTable.LibActivation;
  Compiler.SetSubroutineSymbolTable(SaveSymTbl);
end;

{ TProd_FunctionCall }

procedure TProd_FunctionCall.Parse;
var
  I: Integer;
  P: TProd_Function;
  E: TProduction;
  Si: TSymbolInfo;
  T: TSymbolType;

  procedure GetActuals;
  begin
    GetTerminal(tkLParen);
    while True do
    begin
      Compile(TProd_Expression);
      if Parser.CurrentToken <> tkComma then
        Break;
      Parser.GetNextToken; // comma
    end;
    GetTerminal(tkRParen);
  end;

  procedure GetParenthesis;
  begin
    GetTerminal(tkLParen);
    GetTerminal(tkRParen);
  end;

begin
  FFuncSymbol := SymbolTable.FindSymbol(Parser.TokenString); // again
  Parser.GetNextToken; // function name
  P := TFunctionType(FFuncSymbol.SymbolType).FProduction;
  FFuncId := P.FuncId;
  if P.FParams.FParamLst.Count > 0 then
  begin // get actual parameters
    GetActuals;
    // after GetActuals, ProductionCount = number of actual parameters
    if ProductionCount < P.FParams.FParamLst.Count then
      Error(sNotEnoughActuals, ProductionLine, ProductionCol);
    if ProductionCount > P.FParams.FParamLst.Count then
      Error(sTooManyActuals, ProductionLine, ProductionCol);
    // check actual parameter types
    for I := 0 to ProductionCount - 1 do
    begin
      Si := P.FParams.FParamLst[I];
      E := Productions[I];
      if Si.SymbolClass = scVarParam then
      begin
        if not (E.SymbolInfo.SymbolClass in [scVar, scVarParam, scPointer]) then
          Error(sWrongActual2, ProductionLine, ProductionCol);
        if Si.SymbolType <> E.SymbolInfo.SymbolType then
          Error(sWrongActual, ProductionLine, ProductionCol);
      end
      else
      begin
        T := CheckTypes(Si.SymbolType, E.SymbolInfo.SymbolType, tkAssign);
        E.PromoteTo(T);
      end;
    end;
  end
  else
    GetParenthesis;
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, P.FReturnType);
end;

procedure TProd_FunctionCall.Interpret;
var
  I: Integer;
  P: TProd_Function;
  Sia, Sip: TSymbolInfo;
  LstSi: TList;
  Addr, ResultAddr: Pointer;
  LstAddr: TList;
  LstType: TList;
  SaveSymTbl: TSymbolTable;
  ReturnExecuted: Boolean;
begin
  // verifica consumo de memória
//  CheckMemory;

  // get FSymbolInfo.Address before activation
  ResultAddr := FSymbolInfo.Address;

  // interpret arguments and get their addresses
  LstAddr := TList.Create;
  LstType := TList.Create; // LstType remembers arguments' type, in order
                           // to transfer them to the area occupied by
                           // the parameters inside the new scope
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret;
    Sia := Productions[I].SymbolInfo;
    if Productions[I].ExecPromotion then
      Sia := Productions[I].Promoted;
    LstAddr.Add(Sia.Address);
    LstType.Add(Sia.SymbolType);
  end;

  // prepare activation
  P := TFunctionType(FFuncSymbol.SymbolType).FProduction;

  P.FSymbolTable.SetActivation;
  SaveSymTbl := Compiler.SetSubroutineSymbolTable(P.FSymbolTable);
  LstSi := P.FParams.FParamLst;

  // exibe símbolos desta ativação
  P.FSymbolTable.ShowSubroutineCall(FuncId);
  P.FSymbolTable.ShowMemActivation;

  // copy arguments
  for I := 0 to ProductionCount - 1 do
  begin
    Sip := TSymbolInfo(LstSi[I]);
    if Sip.SymbolClass = scVarParam then
    begin // solve var parameter
      Addr := PByte(Sip.SymbolTable.FVarArea.Last) + Sip.FOffset;
      PByte(Addr^) := LstAddr[I];

      // associa o var param ao argumento
      P.FSymbolTable.MarkAsPointer(Integer(Addr));
      P.FSymbolTable.UpdateVarParam(Integer(Addr), IntToStr(Integer(LstAddr[I])));
    end
    else begin
      // copia argumento por valor
      TSymbolType(LstType[I]).Oper(Sip.Address, LstAddr[I], nil, tkAssign, Self);

      // atualiza a parte visual
      P.FSymbolTable.UpdateMem(LstType[I], Integer(Sip.Address));
    end;
  end;
  LstAddr.Free;
  LstType.Free;

  // replace references to Result and to the function name
  Addr := PByte(P.FSiResult.SymbolTable.FVarArea.Last) +
    P.FSiResult.FOffset;
  PByte(Addr^) := ResultAddr;

  // trata caso especial de result ser ponteiro
(*
  if P.FSiResult.SymbolType is TPointerType then
  begin
    P.FSymbolTable.ChangeAddress(Integer(Addr), Integer(ResultAddr));
    P.FSymbolTable.MarkAsPointer(Integer(ResultAddr));
  end;
*)

  P.FSymbolTable.ChangeAddress(Integer(Addr), Integer(ResultAddr));
  if P.FSiResult.SymbolType is TPointerType then
    P.FSymbolTable.MarkAsPointer(Integer(ResultAddr));

  // interpret function block
  ReturnExecuted := False;
  try
    P.FBlock.Interpret;
  except
    on EExitException do // catch Exit
      ReturnExecuted := True;
  end;

  if not ReturnExecuted then
    Error(sNoReturnExecutedInFunction, ProductionLine, ProductionCol);

  // verifica depuração, dando chance à execução passo a passo de
  // parar no 'fim' da rotina
  VerifyDebug(P.FBlock.FProductionEndLine, P.FBlock.FProductionEndCol, P.Parser);

  // apaga símbolos desta ativação
  P.FSymbolTable.ShowSubroutineReturn;

  P.FSymbolTable.LibActivation;
  Compiler.SetSubroutineSymbolTable(SaveSymTbl);
end;

{ TProd_RectangleStmt }

procedure TProd_RectangleStmt.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // rectangle
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (Quadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_RectangleStmt.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..4] of Integer;
  Q: TQuadro;
begin
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret; // todas as expressões inteiras
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  { obtém o quadro }
  Q := TQuadro(V[0]);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  { desenha no quadro e no bmp }
  Q.dsn_ret(V[1], V[2], V[3], V[4]);
end;

{ TProd_FillRect }

procedure TProd_FillRect.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsnRetCh
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (Quadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FillRect.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..4] of Integer;
  Q: TQuadro;
begin
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret; // todas as expressões inteiras
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  { obtém o quadro }
  Q := TQuadro(V[0]);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  { desenha no quadro e no bmp }
  Q.dsn_ret_cheio(V[1], V[2], V[3], V[4]);
end;

{ TProd_dsnLinSel }

procedure TProd_dsnLinSel.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsnLinSel
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (Quadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_dsnLinSel.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..2] of Integer;
  Q: TQuadro;
begin
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret; // todas as expressões inteiras
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  { obtém o quadro }
  Q := TQuadro(V[0]);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  { desenha no quadro e no bmp }
  Q.dsn_lin_sel(V[1], V[2]);
end;

{ TProd_TriangleStmt }

procedure TProd_TriangleStmt.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // triangle
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (Quadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_TriangleStmt.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..4] of Integer;
  Q: TQuadro;
begin
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret; // todas as expressões inteiras
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  { obtém o quadro }
  Q := TQuadro(V[0]);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  { desenha no quadro e no bmp }
  Q.dsn_tri(V[1], V[2], V[3], V[4]);
end;

{ TProd_EllipseStmt }

procedure TProd_EllipseStmt.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // ellipse
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (TQuadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_EllipseStmt.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..4] of Integer;
  Q: TQuadro;
begin
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret; // the four integer expressions
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  { obtém o quadro }
  Q := TQuadro(V[0]);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  { desenha no quadro e no bmp }
  Q.dsn_cir(V[1], V[2], V[3], V[4]);
end;

{ TProd_TerminateStmt }

procedure TProd_TerminateStmt.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // dsl_termine
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression); // mensagem
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
end;

procedure TProd_TerminateStmt.Interpret;
var
  Si: TSymbolInfo;
  S: String;
begin
  Productions[0].Interpret; // expression
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  S := PString(Si.Address)^;

  // o comando dsl_termine está sendo implementado como um erro
  // de execução, através de uma exceção
  Error(S, Productions[0].ProductionLine, Productions[0].ProductionCol);
end;

{ TProd_Arc }

procedure TProd_Arc.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_arco
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x3
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y3
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x4
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y4
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_Arc.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..7] of Integer;
begin
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret; // oito expressões inteiras
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;
  if Compiler.Canvas <> nil then
    Compiler.Canvas.Arc(V[0], V[1], V[2], V[3], V[4], V[5], V[6], V[7]);
end;

{ TProd_FrameArc }

procedure TProd_FrameArc.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroArco
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x3
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y3
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x4
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y4
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameArc.Interpret;
var
  Si: TSymbolInfo;
  X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer;
  Q: TQuadro;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Q := TQuadro(PInteger(Si.Address)^);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // x1
  Si := Productions[1].SymbolInfo;
  X1 := PInteger(Si.Address)^;

  Productions[2].Interpret; // y1
  Si := Productions[2].SymbolInfo;
  Y1 := PInteger(Si.Address)^;

  Productions[3].Interpret; // x2
  Si := Productions[3].SymbolInfo;
  X2 := PInteger(Si.Address)^;

  Productions[4].Interpret; // y2
  Si := Productions[4].SymbolInfo;
  Y2 := PInteger(Si.Address)^;

  Productions[5].Interpret; // x3
  Si := Productions[5].SymbolInfo;
  X3 := PInteger(Si.Address)^;

  Productions[6].Interpret; // y3
  Si := Productions[6].SymbolInfo;
  Y3 := PInteger(Si.Address)^;

  Productions[7].Interpret; // x4
  Si := Productions[7].SymbolInfo;
  X4 := PInteger(Si.Address)^;

  Productions[8].Interpret; // y4
  Si := Productions[8].SymbolInfo;
  Y4 := PInteger(Si.Address)^;

  Q.dsn_arco(X1, Y1, X2, Y2, X3, Y3, X4, Y4);
end;

{ TProd_Bezier }

procedure TProd_Bezier.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_bezier
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // cx1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // cy1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // cx2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // cy2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_Bezier.Interpret;
var
  Si: TSymbolInfo;
  V: array [0..2] of TPoint;
begin
  if Compiler.Canvas = nil then
    Exit; // nada a fazer

  // obs: a curva começa na posição corrente do cursor

  // primeiro ponto de controle
  Productions[0].Interpret;
  Si := Productions[0].SymbolInfo;
  V[0].X := PInteger(Si.Address)^;

  Productions[1].Interpret;
  Si := Productions[1].SymbolInfo;
  V[0].Y := PInteger(Si.Address)^;

  // segundo ponto de controle
  Productions[2].Interpret;
  Si := Productions[2].SymbolInfo;
  V[1].X := PInteger(Si.Address)^;

  Productions[3].Interpret;
  Si := Productions[3].SymbolInfo;
  V[1].Y := PInteger(Si.Address)^;

  // ponto final
  Productions[4].Interpret;
  Si := Productions[4].SymbolInfo;
  V[2].X := PInteger(Si.Address)^;

  Productions[5].Interpret;
  Si := Productions[5].SymbolInfo;
  V[2].Y := PInteger(Si.Address)^;

  Compiler.Canvas.PolyBezierTo(V);
end;

{ TProd_FrameBezier }

procedure TProd_FrameBezier.Parse;
  var
  E: TProduction;
begin
  Parser.GetNextToken; // dsnBezier
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // cx1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // cy1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // cx2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // cy2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameBezier.Interpret;
var
  Si: TSymbolInfo;
  V: array [0..5] of Integer;
  Q: TQuadro;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Q := TQuadro(PInteger(Si.Address)^);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  // obs: a curva começa com a posição corrente do cursor

  // primeiro ponto de controle
  Productions[1].Interpret;
  Si := Productions[1].SymbolInfo;
  V[0] := PInteger(Si.Address)^;

  Productions[2].Interpret;
  Si := Productions[2].SymbolInfo;
  V[1] := PInteger(Si.Address)^;

  // segundo ponto de controle
  Productions[3].Interpret;
  Si := Productions[3].SymbolInfo;
  V[2] := PInteger(Si.Address)^;

  Productions[4].Interpret;
  Si := Productions[4].SymbolInfo;
  V[3] := PInteger(Si.Address)^;

  // ponto final
  Productions[5].Interpret;
  Si := Productions[5].SymbolInfo;
  V[4] := PInteger(Si.Address)^;

  Productions[6].Interpret;
  Si := Productions[6].SymbolInfo;
  V[5] := PInteger(Si.Address)^;

  Q.dsn_bezier(V[0], V[1], V[2], V[3], V[4], V[5]);
end;

{ TProd_Chord }

procedure TProd_Chord.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_corte
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x3
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y3
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x4
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y4
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_Chord.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..7] of Integer;
begin
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret; // oito expressões inteiras
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;
  if Compiler.Canvas <> nil then
    Compiler.Canvas.Chord(V[0], V[1], V[2], V[3], V[4], V[5], V[6], V[7]);
end;

{ TProd_FrameChord }

procedure TProd_FrameChord.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroCorte
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x3
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y3
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x4
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y4
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameChord.Interpret;
var
  Si: TSymbolInfo;
  X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer;
  Q: TQuadro;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Q := TQuadro(PInteger(Si.Address)^);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // x1
  Si := Productions[1].SymbolInfo;
  X1 := PInteger(Si.Address)^;

  Productions[2].Interpret; // y1
  Si := Productions[2].SymbolInfo;
  Y1 := PInteger(Si.Address)^;

  Productions[3].Interpret; // x2
  Si := Productions[3].SymbolInfo;
  X2 := PInteger(Si.Address)^;

  Productions[4].Interpret; // y2
  Si := Productions[4].SymbolInfo;
  Y2 := PInteger(Si.Address)^;

  Productions[5].Interpret; // x3
  Si := Productions[5].SymbolInfo;
  X3 := PInteger(Si.Address)^;

  Productions[6].Interpret; // y3
  Si := Productions[6].SymbolInfo;
  Y3 := PInteger(Si.Address)^;

  Productions[7].Interpret; // x4
  Si := Productions[7].SymbolInfo;
  X4 := PInteger(Si.Address)^;

  Productions[8].Interpret; // y4
  Si := Productions[8].SymbolInfo;
  Y4 := PInteger(Si.Address)^;

  Q.dsn_corte(X1, Y1, X2, Y2, X3, Y3, X4, Y4);
end;

{ TProd_Pie }

procedure TProd_Pie.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_fatia
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x3
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y3
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x4
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y4
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_Pie.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..7] of Integer;
begin
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret; // oito expressões inteiras
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;
  if Compiler.Canvas <> nil then
    Compiler.Canvas.Pie(V[0], V[1], V[2], V[3], V[4], V[5], V[6], V[7]);
end;

{ TProd_FramePie }

procedure TProd_FramePie.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroFatia
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x3
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y3
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x4
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y4
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FramePie.Interpret;
var
  Si: TSymbolInfo;
  X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer;
  Q: TQuadro;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Q := TQuadro(PInteger(Si.Address)^);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // x1
  Si := Productions[1].SymbolInfo;
  X1 := PInteger(Si.Address)^;

  Productions[2].Interpret; // y1
  Si := Productions[2].SymbolInfo;
  Y1 := PInteger(Si.Address)^;

  Productions[3].Interpret; // x2
  Si := Productions[3].SymbolInfo;
  X2 := PInteger(Si.Address)^;

  Productions[4].Interpret; // y2
  Si := Productions[4].SymbolInfo;
  Y2 := PInteger(Si.Address)^;

  Productions[5].Interpret; // x3
  Si := Productions[5].SymbolInfo;
  X3 := PInteger(Si.Address)^;

  Productions[6].Interpret; // y3
  Si := Productions[6].SymbolInfo;
  Y3 := PInteger(Si.Address)^;

  Productions[7].Interpret; // x4
  Si := Productions[7].SymbolInfo;
  X4 := PInteger(Si.Address)^;

  Productions[8].Interpret; // y4
  Si := Productions[8].SymbolInfo;
  Y4 := PInteger(Si.Address)^;

  Q.dsn_fatia(X1, Y1, X2, Y2, X3, Y3, X4, Y4);
end;

{ TProd_CopyFrameStmt }

procedure TProd_CopyFrameStmt.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_copieQuadro
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_CopyFrameStmt.Interpret;
var
  Si: TSymbolInfo;
  Bmp: Graphics.TBitmap;
  X, Y: Integer;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Integer(Bmp) := PInteger(Si.Address)^;

  Productions[1].Interpret; // x
  Si := Productions[1].SymbolInfo;
  X := PInteger(Si.Address)^;

  Productions[2].Interpret; // y
  Si := Productions[2].SymbolInfo;
  Y := PInteger(Si.Address)^;

  if Compiler.Canvas <> nil then
    Compiler.Canvas.Draw(X, Y, Bmp);
end;

{ TProd_Stretch }

procedure TProd_Stretch.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // gra_estiqueQuadro
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_Stretch.Interpret;
var
  Si: TSymbolInfo;
  Bmp: Graphics.TBitmap;
  X1, Y1, X2, Y2: Integer;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Integer(Bmp) := PInteger(Si.Address)^;

  Productions[1].Interpret; // x1
  Si := Productions[1].SymbolInfo;
  X1 := PInteger(Si.Address)^;

  Productions[2].Interpret; // y1
  Si := Productions[2].SymbolInfo;
  Y1 := PInteger(Si.Address)^;

  Productions[3].Interpret; // x2
  Si := Productions[3].SymbolInfo;
  X2 := PInteger(Si.Address)^;

  Productions[4].Interpret; // y2
  Si := Productions[4].SymbolInfo;
  Y2 := PInteger(Si.Address)^;

  if Compiler.Canvas <> nil then
    Compiler.Canvas.StretchDraw(Rect(X1, Y1, X2, Y2), Bmp);
end;

{ TProd_FrameStretch }

procedure TProd_FrameStretch.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsl_quadroEstiqueQuadro
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // quadro
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // quadroOrigem
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sFrameTypeExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_FrameStretch.Interpret;
var
  Si: TSymbolInfo;
  X1, Y1, X2, Y2: Integer;
  Bmp, BmpOrig: Graphics.TBitmap;
begin
  Productions[0].Interpret; // quadro
  Si := Productions[0].SymbolInfo;
  Bmp := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (Bmp is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // quadroOrigem
  Si := Productions[1].SymbolInfo;
  BmpOrig := Graphics.TBitmap(PInteger(Si.Address)^);
  if not (BmpOrig is Graphics.TBitmap) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[2].Interpret; // X1
  Si := Productions[2].SymbolInfo;
  X1 := PInteger(Si.Address)^;

  Productions[3].Interpret; // Y1
  Si := Productions[3].SymbolInfo;
  Y1 := PInteger(Si.Address)^;

  Productions[4].Interpret; // X2
  Si := Productions[4].SymbolInfo;
  X2 := PInteger(Si.Address)^;

  Productions[5].Interpret; // Y2
  Si := Productions[5].SymbolInfo;
  Y2 := PInteger(Si.Address)^;

  Bmp.Canvas.StretchDraw(Rect(X1, Y1, X2, Y2), BmpOrig);
end;

{ TProd_LineToStmt }

procedure TProd_LineToStmt.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // LineTo
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (TQuadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_LineToStmt.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..2] of Integer;
  Q: TQuadro;
begin
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret; // três expressões inteiras
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  { obtém o quadro }
  Q := TQuadro(V[0]);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  { desenha no quadro e no bmp }
  Q.dsn_lin(V[1], V[2]);
end;

{ TProd_WaitForStmt }

procedure TProd_WaitForStmt.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // waitFor
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // events
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);

  GetTerminal(tkRParen);
end;

procedure TProd_WaitForStmt.Interpret;
var
  Si: TSymbolInfo;
  Events: Integer;
begin
  Productions[0].Interpret;
  Si := Productions[0].SymbolInfo;
  Events := PInteger(Si.Address)^;

  if Assigned(Compiler.FOnWaitFor) then
    Compiler.FOnWaitFor(Compiler, Events);
end;

{ TProd_MoveToStmt }

procedure TProd_MoveToStmt.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // MoveTo
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (TQuadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_MoveToStmt.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..2] of Integer;
  Q: TQuadro;
begin
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret; // quadro, x, y
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  { obtém o quadro }
  Q := TQuadro(V[0]);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  { desenha no quadro e no bmp }
  Q.alt_pos_caneta(V[1], V[2]);
end;

{ TProd_altPixel }

procedure TProd_altPixel.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // SetPixel
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (TQuadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // color
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_altPixel.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..3] of Integer;
  Q: TQuadro;
begin
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret; // quadro, x, y, cor
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  { obtém o quadro }
  Q := TQuadro(V[0]);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  { desenha no quadro e no bmp }
  Q.alt_pixel(V[1], V[2], V[3]);
end;

{ TProd_TextOutStmt }

procedure TProd_TextOutStmt.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // TextOut
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (TQuadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // the text
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
end;

procedure TProd_TextOutStmt.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..2] of Integer;
  Ps: PString;
  Q: TQuadro;
begin
  for I := 0 to 2 do
  begin
    Productions[I].Interpret; // quadro, x, y
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;
  Productions[3].Interpret; // string expression
  Si := Productions[3].SymbolInfo;
  if Productions[3].ExecPromotion then
    Si := Productions[3].Promoted;
  Ps := PString(Si.Address);

  { obtém o quadro }
  Q := TQuadro(V[0]);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  { desenha no quadro e no bmp }
  Q.dsn_txt(V[1], V[2], Ps^);
end;

{ TProd_SetBrushColorStmt }

procedure TProd_SetBrushColorStmt.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // SetBrushColor
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (TQuadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // color
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_SetBrushColorStmt.Interpret;
var
  Si: TSymbolInfo;
  Color: Integer;
  Q: TQuadro;
begin
  { obtém o quadro }
  Productions[0].Interpret;
  Si := Productions[0].SymbolInfo;
  Q := TQuadro(PInteger(Si.Address)^);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret;
  Si := Productions[1].SymbolInfo;
  Color := PInteger(Si.Address)^;

  { desenha no quadro e no bmp }
  Q.alt_cor_pincel(TColor(Color));
end;

{ TProd_SetPenColorStmt }

procedure TProd_SetPenColorStmt.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // SetPenColor
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (TQuadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // color
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_SetPenColorStmt.Interpret;
var
  Si: TSymbolInfo;
  Color: Integer;
  Q: TQuadro;
begin
  { obtém o quadro }
  Productions[0].Interpret;
  Si := Productions[0].SymbolInfo;
  Q := TQuadro(PInteger(Si.Address)^);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret;
  Si := Productions[1].SymbolInfo;
  Color := PInteger(Si.Address)^;

  { desenha no quadro e no bmp }
  Q.alt_cor_caneta(TColor(Color));
end;

{ TProd_SetPenWidthStmt }

procedure TProd_SetPenWidthStmt.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // SetPenWidth
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (TQuadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // width
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_SetPenWidthStmt.Interpret;
var
  Si: TSymbolInfo;
  Width: Integer;
  Q: TQuadro;
begin
  { obtém o quadro }
  Productions[0].Interpret;
  Si := Productions[0].SymbolInfo;
  Q := TQuadro(PInteger(Si.Address)^);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret;
  Si := Productions[1].SymbolInfo;
  Width := PInteger(Si.Address)^;

  { desenha no quadro e no bmp }
  Q.alt_tam_caneta(Width);
end;

{ TProd_SetFontColorStmt }

procedure TProd_SetFontColorStmt.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // SetFontColor
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (TQuadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // color
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_SetFontColorStmt.Interpret;
var
  Si: TSymbolInfo;
  Color: Integer;
  Q: TQuadro;
begin
  { obtém o quadro }
  Productions[0].Interpret;
  Si := Productions[0].SymbolInfo;
  Q := TQuadro(PInteger(Si.Address)^);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret;
  Si := Productions[1].SymbolInfo;
  Color := PInteger(Si.Address)^;

  { desenha no quadro e no bmp }
  Q.alt_cor_fonte(TColor(Color));
end;

{ TProd_SetFontSizeStmt }

procedure TProd_SetFontSizeStmt.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // SetFontSize
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (TQuadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // size
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_SetFontSizeStmt.Interpret;
var
  Si: TSymbolInfo;
  Size: Integer;
  Q: TQuadro;
begin
  { obtém o quadro }
  Productions[0].Interpret;
  Si := Productions[0].SymbolInfo;
  Q := TQuadro(PInteger(Si.Address)^);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret;
  Si := Productions[1].SymbolInfo;
  Size := PInteger(Si.Address)^;

  { desenha no quadro e no bmp }
  Q.alt_tam_fonte(Size);
end;

{ TProd_SetFontNameStmt }

procedure TProd_SetFontNameStmt.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // SetFontName
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (TQuadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // nome
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
end;

procedure TProd_SetFontNameStmt.Interpret;
var
  Si: TSymbolInfo;
  Ps: PString;
  Q: TQuadro;
begin
  { obtém o quadro }
  Productions[0].Interpret;
  Si := Productions[0].SymbolInfo;
  Q := TQuadro(PInteger(Si.Address)^);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret; // nome
  Si := Productions[1].SymbolInfo;
  if Productions[1].ExecPromotion then
    Si := Productions[1].Promoted;
  Ps := PString(Si.Address);

  { desenha no quadro e no bmp }
  Q.alt_nome_fonte(Ps^);
end;

{ TProd_toqSom }

procedure TProd_toqSom.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // toq_som
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // som
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_toqSom.Interpret;
var
  Si: TSymbolInfo;
  Som: Integer; // som
begin
  Productions[0].Interpret; // som
  Si := Productions[0].SymbolInfo;
  Som := PInteger(Si.Address)^;

  // verifica se o som é válido
  if not (TObject(Som) is TCtrlMediaPlayer) then
    Error(sFalhaToqSomExec, ProductionLine, ProductionCol);

  // toca
  TCtrlMediaPlayer(Som).Toque;
end;

{ TProd_SetBrushStyleStmt }

procedure TProd_SetBrushStyleStmt.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // SetBrushStyle
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (TQuadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // brush style
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_SetBrushStyleStmt.Interpret;
var
  Si: TSymbolInfo;
  Style: TBrushStyle;
  Q: TQuadro;
begin
  { obtém o quadro }
  Productions[0].Interpret;
  Si := Productions[0].SymbolInfo;
  Q := TQuadro(PInteger(Si.Address)^);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret;
  Si := Productions[1].SymbolInfo;
  Style := TBrushStyle(PInteger(Si.Address)^);

  { desenha no quadro e no bmp }
  Q.alt_estilo_pincel(Style);
end;

{ TProd_Inc }

procedure TProd_Inc.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // inc
  GetTerminal(tkLParen);
  E := Compile(TProd_VarReference);
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  if (E.SymbolInfo.SymbolClass <> scVar) and
     (E.SymbolInfo.SymbolClass <> scField) and
     (E.SymbolInfo.SymbolClass <> scVarParam) then
    Error(sWrongActual2, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_Inc.Interpret;
var
  Si: TSymbolInfo;
begin
  Productions[0].Interpret;
  Si := Productions[0].SymbolInfo;
  PInteger(Si.Address)^ := PInteger(Si.Address)^ + 1;

  // atualiza na memoria
  SymbolTable.UpdateMem(Productions[0].SymbolInfo.SymbolType,
        Integer(Productions[0].SymbolInfo.Address));
end;

{ TProd_Dec }

procedure TProd_Dec.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dec
  GetTerminal(tkLParen);
  E := Compile(TProd_VarReference);
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  if (E.SymbolInfo.SymbolClass <> scVar) and
     (E.SymbolInfo.SymbolClass <> scField) and
     (E.SymbolInfo.SymbolClass <> scVarParam) then
    Error(sWrongActual2, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_Dec.Interpret;
var
  Si: TSymbolInfo;
begin
  Productions[0].Interpret;
  Si := Productions[0].SymbolInfo;
  PInteger(Si.Address)^ := PInteger(Si.Address)^ - 1;

  // atualiza na memoria
  SymbolTable.UpdateMem(Productions[0].SymbolInfo.SymbolType,
        Integer(Productions[0].SymbolInfo.Address));
end;

{ TProd_DecodificaData }

procedure TProd_DecodificaData.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // evnt_decodificaData
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression); // TDateTime (tipicamente, evnt_agora())
  T := CheckTypes(Compiler.DeclTypeExtended, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkComma);

  E := Compile(TProd_VarReference); // dia
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  if (E.SymbolInfo.SymbolClass <> scVar) and
     (E.SymbolInfo.SymbolClass <> scField) and
     (E.SymbolInfo.SymbolClass <> scVarParam) then
    Error(sWrongActual2, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_VarReference); // mês
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  if (E.SymbolInfo.SymbolClass <> scVar) and
     (E.SymbolInfo.SymbolClass <> scField) and
     (E.SymbolInfo.SymbolClass <> scVarParam) then
    Error(sWrongActual2, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_VarReference); // ano
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  if (E.SymbolInfo.SymbolClass <> scVar) and
     (E.SymbolInfo.SymbolClass <> scField) and
     (E.SymbolInfo.SymbolClass <> scVarParam) then
    Error(sWrongActual2, E.ProductionLine, E.ProductionCol);

  GetTerminal(tkRParen);
end;

procedure TProd_DecodificaData.Interpret;
var
  Si: TSymbolInfo;
  Data: Extended;
  Ano, Mes, Dia: word;
begin
  Productions[0].Interpret; // TDateTime
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  Data := PExtended(Si.Address)^;

  DecodeDate(Data, Ano, Mes, Dia);

  Productions[1].Interpret; // Dia
  Si := Productions[1].SymbolInfo;
  PInteger(Si.Address)^ := Dia;
  SymbolTable.UpdateMem(Si.SymbolType, Integer(Si.Address));

  Productions[2].Interpret; // Mês
  Si := Productions[2].SymbolInfo;
  PInteger(Si.Address)^ := Mes;
  SymbolTable.UpdateMem(Si.SymbolType, Integer(Si.Address));

  Productions[3].Interpret; // Ano
  Si := Productions[3].SymbolInfo;
  PInteger(Si.Address)^ := Ano;
  SymbolTable.UpdateMem(Si.SymbolType, Integer(Si.Address));
end;

{ TProd_DecodificaHora }

procedure TProd_DecodificaHora.Parse;
var
  T: TSymbolType;
  E: TProduction;
begin
  Parser.GetNextToken; // evnt_decodificaHora
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression); // TDateTime (tipicamente, evnt_agora())
  T := CheckTypes(Compiler.DeclTypeExtended, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkComma);

  E := Compile(TProd_VarReference); // hora
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  if (E.SymbolInfo.SymbolClass <> scVar) and
     (E.SymbolInfo.SymbolClass <> scField) and
     (E.SymbolInfo.SymbolClass <> scVarParam) then
    Error(sWrongActual2, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_VarReference); // minuto
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  if (E.SymbolInfo.SymbolClass <> scVar) and
     (E.SymbolInfo.SymbolClass <> scField) and
     (E.SymbolInfo.SymbolClass <> scVarParam) then
    Error(sWrongActual2, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_VarReference); // segundo
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  if (E.SymbolInfo.SymbolClass <> scVar) and
     (E.SymbolInfo.SymbolClass <> scField) and
     (E.SymbolInfo.SymbolClass <> scVarParam) then
    Error(sWrongActual2, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_VarReference); // milissegundo
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  if (E.SymbolInfo.SymbolClass <> scVar) and
     (E.SymbolInfo.SymbolClass <> scField) and
     (E.SymbolInfo.SymbolClass <> scVarParam) then
    Error(sWrongActual2, E.ProductionLine, E.ProductionCol);

  GetTerminal(tkRParen);
end;

procedure TProd_DecodificaHora.Interpret;
var
  Si: TSymbolInfo;
  Data: Extended;
  Hora, Minuto, Segundo, Mili: word;
begin
  Productions[0].Interpret; // TDateTime
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  Data := PExtended(Si.Address)^;

  DecodeTime(Data, Hora, Minuto, Segundo, Mili);

  Productions[1].Interpret; // Hora
  Si := Productions[1].SymbolInfo;
  PInteger(Si.Address)^ := Hora;
  SymbolTable.UpdateMem(Si.SymbolType, Integer(Si.Address));

  Productions[2].Interpret; // Minuto
  Si := Productions[2].SymbolInfo;
  PInteger(Si.Address)^ := Minuto;
  SymbolTable.UpdateMem(Si.SymbolType, Integer(Si.Address));

  Productions[3].Interpret; // Segundo
  Si := Productions[3].SymbolInfo;
  PInteger(Si.Address)^ := Segundo;
  SymbolTable.UpdateMem(Si.SymbolType, Integer(Si.Address));

  Productions[4].Interpret; // milissegundo
  Si := Productions[4].SymbolInfo;
  PInteger(Si.Address)^ := Mili;
  SymbolTable.UpdateMem(Si.SymbolType, Integer(Si.Address));
end;

{ TProd_CodificaData }

procedure TProd_CodificaData.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // evnt_codificaData
  GetTerminal(tkLParen);

  E := Compile(TProd_VarReference); // data
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeExtended then
    Error(sRealVarExpected, E.ProductionLine, E.ProductionCol);
  if (E.SymbolInfo.SymbolClass <> scVar) and
     (E.SymbolInfo.SymbolClass <> scField) and
     (E.SymbolInfo.SymbolClass <> scVarParam) then
    Error(sWrongActual2, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // Dia
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // Mês
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // Ano
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_CodificaData.Interpret;
var
  Si: TSymbolInfo;
  Data: TDateTime;
  Ano, Mes, Dia: word;
begin
  Productions[1].Interpret; // Dia
  Si := Productions[1].SymbolInfo;
  Dia := PInteger(Si.Address)^;

  Productions[2].Interpret; // Mês
  Si := Productions[2].SymbolInfo;
  Mes := PInteger(Si.Address)^;

  Productions[3].Interpret; // Ano
  Si := Productions[3].SymbolInfo;
  Ano := PInteger(Si.Address)^;

  Data := EncodeDate(Ano, Mes, Dia);

  Productions[0].Interpret; // (var) data
  Si := Productions[0].SymbolInfo;
  PExtended(Si.Address)^ := Data;
  SymbolTable.UpdateMem(Si.SymbolType, Integer(Si.Address));
end;

{ TProd_CodificaHora }

procedure TProd_CodificaHora.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // evnt_codifiqueHora
  GetTerminal(tkLParen);

  E := Compile(TProd_VarReference); // hora
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeExtended then
    Error(sRealVarExpected, E.ProductionLine, E.ProductionCol);
  if (E.SymbolInfo.SymbolClass <> scVar) and
     (E.SymbolInfo.SymbolClass <> scField) and
     (E.SymbolInfo.SymbolClass <> scVarParam) then
    Error(sWrongActual2, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // Hora
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // Minuto
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // Segundo
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // Mili
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_CodificaHora.Interpret;
var
  Si: TSymbolInfo;
  Data: TDateTime;
  Hora, Minuto, Segundo, Mili: word;
begin
  Productions[1].Interpret; // Hora
  Si := Productions[1].SymbolInfo;
  Hora := PInteger(Si.Address)^;

  Productions[2].Interpret; // Minuto
  Si := Productions[2].SymbolInfo;
  Minuto := PInteger(Si.Address)^;

  Productions[3].Interpret; // Segundo
  Si := Productions[3].SymbolInfo;
  Segundo := PInteger(Si.Address)^;

  Productions[4].Interpret; // Mili
  Si := Productions[4].SymbolInfo;
  Mili := PInteger(Si.Address)^;

  Data := EncodeTime(Hora, Minuto, Segundo, Mili);

  Productions[0].Interpret; // (var) data
  Si := Productions[0].SymbolInfo;
  PExtended(Si.Address)^ := Data;
  SymbolTable.UpdateMem(Si.SymbolType, Integer(Si.Address));
end;

{ TProd_BreakStmt }

procedure TProd_BreakStmt.Parse;
begin
  if not (csInRepetitiveStmt in Compiler.State) then
    Error(sBreakOutsideLoop, ProductionLine, ProductionCol);
  Parser.GetNextToken; // Break
end;

procedure TProd_BreakStmt.Interpret;
begin
  raise EBreakException.Create('', 0, 0, Parser);
end;

{ TProd_ContinueStmt }

procedure TProd_ContinueStmt.Parse;
begin
  if not (csInRepetitiveStmt in Compiler.State) then
    Error(sContinueOutsideLoop, ProductionLine, ProductionCol);
  Parser.GetNextToken; // Continue
end;

procedure TProd_ContinueStmt.Interpret;
begin
  raise EContinueException.Create('', 0, 0, Parser);
end;

{ TProd_ReturnStmt }

procedure TProd_ReturnStmt.Parse;
var
  T: TSymbolType;
begin
  Parser.GetNextToken; // Retorne
  if (csInProcedure in Compiler.State) then
  begin
    // dentro de procedimento, RETORNE tem de ser seguido de ponto e vírgula
    if Parser.CurrentToken <> tkSemiColon then
      Error(Format(sTerminalExpected, [Parser.GetTokenName(tkSemiColon)]),
        Parser.TokenLine, Parser.TokenCol);
  end
  else if (csInFunction in Compiler.State) then
  begin
    // simule um comando de atribuição 'result := expression'
    FSymbolInfo := SymbolTable.FindSymbol(RESULT_NAME);
    Compile(TProd_Expression);
    T := CheckTypes(FSymbolInfo.SymbolType, Productions[0].SymbolInfo.SymbolType,
      tkAssign);
    Productions[0].PromoteTo(T);
  end
  else
    Error(sExitOutsideSubroutine, ProductionLine, ProductionCol);
end;

procedure TProd_ReturnStmt.Interpret;
var
  Si: TSymbolInfo;
  T: TOrdinalType;
  OrdValue: Integer;
begin
  // caso tenha havido uma expressão, avalie-a
  if ProductionCount > 0 then
  begin
    Productions[0].Interpret; // expression
    Si := Productions[0].SymbolInfo;

    // test promotion
    if Productions[0].ExecPromotion then
      Si := Productions[0].Promoted;

    // FSymbolInfo é uma referência a result; verifique o range
    if FSymbolInfo.SymbolType is TOrdinalType then
    begin
      T := TOrdinalType(Si.SymbolType); // expression must be ordinal
      OrdValue := T.OrdinalValue(Si);
      T := TOrdinalType(FSymbolInfo.SymbolType);
      if (OrdValue < T.MinValue) or (OrdValue > T.MaxValue) then
        Error(sAssignmentOutOfRange, ProductionLine, ProductionCol);
    end;

    Operate(FSymbolInfo, Si, nil, tkAssign);

    // atualiza na memoria
    SymbolTable.UpdateMem(FSymbolInfo.SymbolType, Integer(FSymbolInfo.Address));
  end;

  raise EExitException.Create('', 0, 0, Parser);
end;

{ TProd_FunctionAssign }

procedure TProd_FunctionAssign.Parse;
var
  P: TProd_Function;
begin
  FSymbolInfo := SymbolTable.FindSymbol(Parser.TokenString); // again
  Parser.GetNextToken; // function name
  P := TFunctionType(FSymbolInfo.SymbolType).FProduction;
  FSymbolInfo := P.FSiResult;
end;

{ TProd_VarReference }

procedure TProd_VarReference.Parse;
var
  Qualif: TProductionClass;
  T: TSymbolType;

  function QualifClass: TProductionClass;
  begin
    if (FSymbolInfo.SymbolType is TArrayType) and
       (Parser.CurrentToken = tkLBracket) then
      Result := TProd_QualifIndex
    else if (FSymbolInfo.SymbolType is TRecordType) and
       (Parser.CurrentToken = tkPeriod) then
      Result := TProd_QualifField
    else if (FSymbolInfo.SymbolType is TPointerType) and
       (Parser.CurrentToken = tkCaret) then
      Result := TProd_QualifPointer
    else
      Result := nil;
  end;

begin
  FIsLValue := True;
  FSymbolInfo := SymbolTable.FindSymbol(Parser.TokenString); // (maybe) again
  if FSymbolInfo = nil then
    Error(Format(sUndeclaredIdentifier, [Parser.TokenString]), ProductionLine,
      ProductionCol);

  if FSymbolInfo.SymbolClass = scField then
  begin // prepare for interpretation
    FWith := SolveWithStmt(Self, FSymbolInfo);
    FFieldOffset := FSymbolInfo.FOffset;
    T := FSymbolInfo.SymbolType;
    FSymbolInfo := SymbolTable.DuplicateSymbolInfo(FWith);
    FSymbolInfo.FOffset := FFieldOffset;
    FSymbolInfo.FSymbolType := T;
  end;

  if FSymbolInfo.SymbolClass = scFunction then
  begin
    TProduction(FFuncCall) := Compile(TProd_FunctionCall);
    FSymbolInfo := FFuncCall.SymbolInfo;
    FIsLValue := False;
  end
  else
    Parser.GetNextToken; // get variable id

  FVarRef := FSymbolInfo; // store for interpretation
  Qualif := QualifClass();
  if Qualif <> nil then
  begin
    FQualified := True;
    FSymbolInfo := SymbolTable.DuplicateSymbolInfo(FSymbolInfo);
    repeat
      Compile(Qualif);
      Qualif := QualifClass();
    until Qualif = nil;
  end;
end;

procedure TProd_VarReference.Interpret;
var
  I: Integer;
  Aux: TSymbolInfo;
begin
  if FWith <> nil then
  begin
    FVarRef.FOffset := FFieldOffset + Integer(FWith.Address);
    FVarRef.FSymbolClass := scPointer;
  end;

  if FFuncCall <> nil then
  begin
    Aux := FSymbolInfo;
    FSymbolInfo := FVarRef;
    FFuncCall.Interpret;
    FSymbolInfo := Aux;
  end;

  if FQualified then
  begin // there is one or more qualifiers
    // start with the variable reference (without qualifiers)
    FSymbolInfo.Assign(FVarRef);
//    Move(PChar(FVarRef)^, PChar(FSymbolInfo)^, TSymbolInfo.InstanceSize);

    // transform address mode;
    // the order of the next two statements is important
    Pointer(FSymbolInfo.FOffset) := FSymbolInfo.Address;
    FSymbolInfo.FSymbolClass := scPointer;
    if FFuncCall <> nil then
      I := 1 // skip function call production
    else
      I := 0;
    while I <= ProductionCount - 1 do
    begin
      Productions[I].Interpret;
      I := I + 1;
    end;
  end;
end;

{ TProd_QualifIndex }

procedure TProd_QualifIndex.Parse;
begin
  Parser.GetNextToken; // '['
  while True do
  begin
    FSymbolInfo := Compile(TProd_Expression).SymbolInfo;
    CheckTypes(FSymbolInfo.SymbolType,
      TArrayType(Parent.SymbolInfo.SymbolType).FIndexSymbol.SymbolType, tkAssign);

    // update Parent.SymbolInfo
    Parent.SymbolInfo.FSymbolType :=
      TArrayType(Parent.SymbolInfo.SymbolType).FElemSymbol.SymbolType;

    if Parser.CurrentToken <> tkComma then
      Break;
    Parser.GetNextToken; // comma
    if not (Parent.SymbolInfo.SymbolType is TArrayType) then
      Error(sArrayTypeRequired, Parser.TokenLine, Parser.TokenCol);
  end;
  GetTerminal(tkRBracket);
end;

procedure TProd_QualifIndex.Interpret;
var
  I: Integer;
  Value, MinIndex, MaxIndex: Integer;
  Si: TSymbolInfo;
begin
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret;
    Si := Productions[I].SymbolInfo;

    // get index expression value
    if Si.SymbolType.Size = 1 then
      Value := Ord(PByte(Si.Address)^)
    else
      Value := PInteger(Si.Address)^;

    // check indexing
    MinIndex := TOrdinalType(
        TArrayType(Parent.SymbolInfo.SymbolType).FIndexSymbol.SymbolType).MinValue;
    MaxIndex := TOrdinalType(
        TArrayType(Parent.SymbolInfo.SymbolType).FIndexSymbol.SymbolType).MaxValue;
    if (Value < MinIndex) or (Value > MaxIndex) then
      Error(sIndexOutOfRange, ProductionLine, ProductionCol);

    // adjust according to index type minimum value
    Value := Value -
      TOrdinalType(
        TArrayType(Parent.SymbolInfo.SymbolType).FIndexSymbol.SymbolType).MinValue;

    // calculate offset according to element size
    Value := Value *
      TOrdinalType(
        TArrayType(Parent.SymbolInfo.SymbolType).FElemSymbol.SymbolType).Size;

    { acrescenta área para o tamanho do array }
//    Value := Value + TSymbolTable.SizeOfArraySize();

    // adjust address
    PByte(Parent.SymbolInfo.FOffset) := PByte(Parent.SymbolInfo.FOffset) + Value;

    // update type
    Parent.SymbolInfo.FSymbolType :=
      TArrayType(Parent.SymbolInfo.SymbolType).FElemSymbol.SymbolType;
  end;
end;

{ TProd_QualifField }

procedure TProd_QualifField.Parse;
var
  T: TRecordType;
  Evaluating: Boolean;
begin
  Parser.GetNextToken; // '.'

  TSymbolType(T) := Parent.SymbolInfo.SymbolType;

  SymbolTable.AddScope(T.FScope);

  // turn evaluating off, temporarily
  Evaluating := csEvaluating in Compiler.State;
  Compiler.State := Compiler.State - [csEvaluating];

  // look for the field
  Compiler.State := Compiler.State + [csFindInScope];
  FSymbolInfo := SymbolTable.FindSymbol(Parser.TokenString);
  Compiler.State := Compiler.State - [csFindInScope];

  // turn evaluation on
  if Evaluating then
    Compiler.State := Compiler.State + [csEvaluating];

  SymbolTable.RemoveScope;

  if FSymbolInfo = nil then
    Error(Format(sUndeclaredIdentifier, [Parser.TokenString]),
      Parser.TokenLine, Parser.TokenCol);
  Parser.GetNextToken; // field id

  // update Parent.SymbolInfo
  Parent.SymbolInfo.FSymbolType := FSymbolInfo.SymbolType;
end;

procedure TProd_QualifField.Interpret;
begin
  // adjust address
  PByte(Parent.SymbolInfo.FOffset) := PByte(Parent.SymbolInfo.FOffset) +
    FSymbolInfo.FOffset;
  // update type
  Parent.SymbolInfo.FSymbolType := FSymbolInfo.SymbolType;
end;

{ TProd_QualifPointer }

procedure TProd_QualifPointer.Parse;
var
  T: TPointerType;
begin
  Parser.GetNextToken; // '^'
  TSymbolType(T) := Parent.SymbolInfo.SymbolType;
  // update Parent.SymbolInfo
  Parent.SymbolInfo.FSymbolType := T.FBaseType;
  // update address mode
  Parent.SymbolInfo.FSymbolClass := scPointer; // redundant
end;

procedure TProd_QualifPointer.Interpret;
begin
  // adjust address
  Pointer(Parent.SymbolInfo.FOffset) := Pointer(Parent.SymbolInfo.Address^);
  // update address mode
  Parent.SymbolInfo.FSymbolClass := scPointer;
  // update type
  Parent.SymbolInfo.FSymbolType :=
    TPointerType(Parent.SymbolInfo.FSymbolType).FBaseType;
end;

{ TCaseSelector }

constructor TCaseSelector.Create;
begin
  inherited Create;
  FLstMember := TList.Create;
  FLstStmt := TList.Create;
end;

destructor TCaseSelector.Destroy;
begin
  FLstMember.Free;
  FLstStmt.Free;
  inherited Destroy;
end;

procedure TCaseSelector.AddEntry(E: TProd_MemberGroup);

  procedure CheckCollision;
  var
    I: Integer;
    M: TProd_MemberGroup;
  begin
    for I := 0 to FLstMember.Count - 1 do
    begin
      M := TProd_MemberGroup(FLstMember[I]);
      if M.InRange(E.InfSymbol) or
         M.InRange(E.SupSymbol) then
        raise Exception.Create('');
    end;
  end;

begin
  CheckCollision;
  FLstMember.Add(E);
end;

procedure TCaseSelector.SetStmt(Stmt: TProd_Stmt);
var
  I, Count: Integer;
begin
  Count := FLstMember.Count - FLstStmt.Count;
  for I := 1 to Count do
    FLstStmt.Add(Stmt);
end;

function TCaseSelector.TestCase(Si: TSymbolInfo): Boolean;
var
  I: Integer;
  M: TProd_MemberGroup;
begin
  Result := False;
  for I := 0 to FLstMember.Count - 1 do
  begin
    M := TProd_MemberGroup(FLstMember[I]);
    if M.InRange(Si) then
    begin
      TProd_Stmt(FLstStmt[I]).Interpret;
      Result := True;
    end;
  end;
end;

{ TPascalInterpreter }

constructor TPascalInterpreter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFloatFormat := '0.0#########';
end;

destructor TPascalInterpreter.Destroy;
begin
  TCompiler(C).Free;
  inherited Destroy;
end;

function TPascalInterpreter.Evaluate(Expression: String): String;
begin
  if C = nil then
    Result := sEvaluationError
  else
    try
      Result := TCompiler(C).Evaluate(Expression);
    except
      on E: Exception do
        Result := E.Message;
    end;
end;

procedure TPascalInterpreter.Run(Source: TStrings; ProgramFileName: String);
//var
//  S: TMemoryStream;
begin
  if C <> nil then
  begin // get some compiler properties from the previous instance
    FBreakpointLine := TCompiler(C).FBreakpointLine;
    FBreakpointFileName := TCompiler(C).FBreakpointFileName;
    FBreakOnNextStmt := csBreakOnNextStmt in TCompiler(C).State;
    TCompiler(C).Free;
  end;
  C := TCompiler.Create;
  if FGraphicImage <> nil then
    TCompiler(C).Canvas := FGraphicImage.Canvas
  else if FCanvas <> nil then
    TCompiler(C).Canvas := FCanvas;

  TCompiler(C).FloatFormat := FFloatFormat;
  TCompiler(C).OnReadChar := FOnReadChar;
  TCompiler(C).OnReadInteger := FOnReadInteger;
  TCompiler(C).OnReadReal := FOnReadReal;
  TCompiler(C).OnReadString := FOnReadString;
  TCompiler(C).OnWrite := FOnWrite;
  TCompiler(C).OnDebug := FOnDebug;
  TCompiler(C).OnWaitFor := FOnWaitFor;
  TCompiler(C).SetBreakpoint(FBreakpointFileName, FBreakpointLine);
  FBreakpointLine := 0;
  FBreakpointFileName := '';
  if FBreakOnNextStmt then
  begin
    TCompiler(C).BreakOnNextStatement;
    FBreakOnNextStmt := False;
  end;
  TCompiler(C).ProgramName := ProgramFileName;

//  S := TMemoryStream.Create;
  try
//    Source.SaveToStream(S);
//    S.Position := 0;
//    TCompiler(C).Compile(S, TProd_Program);
    TCompiler(C).Compile(Source.Text, TProd_Program);
    TCompiler(C).Interpret;
  finally
//    S.Free;
    TCompiler(C).FBreakpointLine := 0;
    TCompiler(C).FBreakpointFileName := '';
    TCompiler(C).State := TCompiler(C).State - [csBreakOnNextStmt];
//    TCompiler(C).DestroyBitmaps;
//    TCompiler(C).FBitmapList.Free;
//    TCompiler(C).FBitmapList := nil;
//    TCompiler(C).DestroyStreams;
//    TCompiler(C).FStreamList.Free;
//    TCompiler(C).FStreamList := nil;
  end;
end;

procedure TPascalInterpreter.SetBreakpoint(FileName: String; LineNumber: Integer);
begin
  if C <> nil then
    TCompiler(C).SetBreakpoint(FileName, LineNumber)
  else
  begin
    FBreakpointFileName := FileName;
    FBreakpointLine := LineNumber;
  end;
end;

procedure TPascalInterpreter.Stop;
begin
  if C <> nil then
    TCompiler(C).Stop;
end;

procedure TPascalInterpreter.BreakOnNextStatement;
begin
  if C <> nil then
    TCompiler(C).BreakOnNextStatement
  else
    FBreakOnNextStmt := True;
end;

procedure TPascalInterpreter.RegisterMouseXY(X, Y: Integer);
begin
  if C <> nil then
    TCompiler(C).RegisterMouseXY(X, Y);
end;

procedure TPascalInterpreter.RegisterLastEvent(Event: Integer; Sender: TObject);
begin
  if C <> nil then
    TCompiler(C).RegisterLastEvent(Event, Sender);
end;

procedure TPascalInterpreter.RegisterShiftState(Shift: TShiftState);
begin
  if C <> nil then
    TCompiler(C).RegisterShiftState(Shift);
end;

procedure TPascalInterpreter.RegisterKeyPressed(Key: Char);
begin
  if C <> nil then
    TCompiler(C).RegisterKeyPressed(Key);
end;

procedure TPascalInterpreter.RegisterKeyDown(Key: Word);
begin
  if C <> nil then
    TCompiler(C).RegisterKeyDown(Key);
end;

procedure TPascalInterpreter.RegisterKeyUp(Key: Word);
begin
  if C <> nil then
    TCompiler(C).RegisterKeyUp(Key);
end;

procedure TPascalInterpreter.TrataOnPaint(Sender: TObject);
begin
  if C <> nil then
    TCompiler(C).TrataOnPaint(Sender);
end;

{ Registration }

procedure Register;
begin
  RegisterComponents('Decarva', [TPascalInterpreter]);
end;

procedure TPascalInterpreter.SetFloatFormat(const Value: String);
begin
  FFloatFormat := Value;
  if C <> nil then
    TCompiler(C).FloatFormat := Value;
end;

procedure TPascalInterpreter.SetGraphicImage(const Value: TImage);
begin
  FGraphicImage := Value;
  if (C <> nil) and (Value <> nil) then
    TCompiler(C).Canvas := Value.Canvas;
end;

procedure TPascalInterpreter.SetCanvas(const Value: TCanvas);
begin
  FCanvas := Value;
  if (C <> nil) and (Value <> nil) then
    TCompiler(C).Canvas := Value;
end;

procedure TPascalInterpreter.SetOnDebug(const Value: TDebugEvent);
begin
  FOnDebug := Value;
  if C <> nil then
    TCompiler(C).OnDebug := Value;
end;

procedure TPascalInterpreter.SetOnReadChar(const Value: TReadCharEvent);
begin
  FOnReadChar := Value;
  if C <> nil then
    TCompiler(C).OnReadChar := Value;
end;

procedure TPascalInterpreter.SetOnReadInteger(
  const Value: TReadIntegerEvent);
begin
  FOnReadInteger := Value;
  if C <> nil then
    TCompiler(C).OnReadInteger := Value;
end;

procedure TPascalInterpreter.SetOnReadReal(const Value: TReadRealEvent);
begin
  FOnReadReal := Value;
  if C <> nil then
    TCompiler(C).OnReadReal := Value;
end;

procedure TPascalInterpreter.SetOnReadString(
  const Value: TReadStringEvent);
begin
  FOnReadString := Value;
  if C <> nil then
    TCompiler(C).OnReadString := Value;
end;

procedure TPascalInterpreter.SetOnWrite(const Value: TWriteEvent);
begin
  FOnWrite := Value;
  if C <> nil then
    TCompiler(C).OnWrite := Value;
end;

procedure TPascalInterpreter.SetOnWaitFor(const Value: TWaitForEvent);
begin
  FOnWaitFor := Value;
  if C <> nil then
    TCompiler(C).OnWaitFor := Value;
end;

procedure TPascalInterpreter.SetProgramFile(const Value: String);
begin
  FProgramFile := Value;
  TCompiler(C).Parser.Name := FProgramFile;
end;

{ TProd_arqParaTxt }

procedure TProd_arqParaTxt.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // arqParaTxt
  GetTerminal(tkLParen);
  E := Compile(TProd_Expression); // nome do arquivo
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);
  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeString);
end;

procedure TProd_arqParaTxt.Interpret;
var
  Si: TSymbolInfo;
  NomeArq, NomeArqRestrito, S: String;
  ArqStm: TStringStream;
begin
  Productions[0].Interpret; // nome do arquivo
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  NomeArq := PString(Si.Address)^;
  NomeArqRestrito := ExpandeNomeArq(NomeArq);

  // carrega o arquivo
  ArqStm := TStringStream.Create;
  try
    ArqStm.LoadFromFile(NomeArqRestrito);
  except
    ArqStm := nil;
  end;
  if ArqStm = nil then
    Error(sArquivoNaoEncontrado + ': ' + NomeArq + #13#10 + sVerifiqueNomeArq,
          ProductionLine, ProductionCol);

  // verifica o tamanho
  if ArqStm.Size > MAX_TAM_ARQ then
    Error(sTamanhoArqInvalido, ProductionLine, ProductionCol);

  // trasfere o conteúdo para o texto que será o retorno da função arqParaTxt
  S := ArqStm.DataString;
//  S := FileStreamToString(ArqStm);
//  S := AdjustLineBreaks(S, tlbsLF); // converte crlf para lf
  PString(FSymbolInfo.Address)^ := S;
  ArqStm.Free;
end;

{ TProd_txtParaArq }

procedure TProd_txtParaArq.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // txtParaArq
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // nome do arquivo
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // texto
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

  GetTerminal(tkRParen);
end;

procedure TProd_txtParaArq.Interpret;
var
  Si: TSymbolInfo;
  NomeArq, NomeArqRestrito, Txt: String;
  ArqStm: TStringStream;
begin
  Productions[0].Interpret; // nome do arquivo
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  NomeArq := PString(Si.Address)^;
  NomeArqRestrito := ExpandeNomeArq(NomeArq);

  Productions[1].Interpret; // texto
  Si := Productions[1].SymbolInfo;
  if Productions[1].ExecPromotion then
    Si := Productions[1].Promoted;
  Txt := PString(Si.Address)^;
//  Txt := AdjustLineBreaks(Txt, tlbsCRLF); // converte lf para crlf

  // abre o arquivo
  try
    ArqStm := TStringStream.Create(Txt);
  except
    ArqStm := nil;
  end;
  if ArqStm = nil then ///// mensagem de erro precisa ser revisada!!!
    Error(sArquivoNaoEncontrado + ': ' + NomeArq + #13#10 + sVerifiqueNomeArq,
          ProductionLine, ProductionCol);

  // verifica o tamanho
  if Length(Txt) > MAX_TAM_ARQ then
    Error(sTamanhoTxtInvalido, ProductionLine, ProductionCol);

  // grava o arquivo
  try
    ArqStm.SaveToFile(NomeArqRestrito);
  except
    Error(sErroGravandoArq + ': ' + NomeArq, ProductionLine, ProductionCol);
  end;
  ArqStm.Free;
end;

{ TProd_SetFontStyleStmt }

procedure TProd_SetFontStyleStmt.Interpret;
var
  Si: TSymbolInfo;
  Estilo: Integer;
  Q: TQuadro;
begin
  { obtém o quadro }
  Productions[0].Interpret;
  Si := Productions[0].SymbolInfo;
  Q := TQuadro(PInteger(Si.Address)^);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  Productions[1].Interpret;
  Si := Productions[1].SymbolInfo;
  Estilo := PInteger(Si.Address)^;

  { desenha no quadro e no bmp }
  Q.alt_estilo_fonte(IntParaEstiloFonte(Estilo));
end;

procedure TProd_SetFontStyleStmt.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // SetFontStyle
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (TQuadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // name
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

{ TProd_nova_imagem }

procedure TProd_nova_imagem.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..4] of Integer;
  Ps: PString;
  Img: TImage;
  JanelaMaeOk: Boolean;
  Q: TQuadro;
  JanelaMae: TWinControl;
  Imagem: TQuadroImagem;
begin
  for I := 0 to 4 do
  begin
    Productions[I].Interpret; // janela, x, y, largura, altura
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;
  Productions[5].Interpret; // texto
  Si := Productions[5].SymbolInfo;
  if Productions[5].ExecPromotion then
    Si := Productions[5].Promoted;
  Ps := PString(Si.Address);

  // verifica se a janela é válida
  JanelaMaeOk := (TObject(V[0]) is TQuadro);
  if not JanelaMaeOk then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Q := TQuadro(V[0]);
  JanelaMae := Q.obt_win_control();
  if JanelaMae = nil then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  // verifica se ultrapassa limite de janelas
  if Compiler.FTQuadroList.Count >= MAX_COMPONENTES then
    Error(sLimiteComponentesAtingido, ProductionLine, ProductionCol);

  // cria o TImage (imagem)
  Img := TImage.Create(nil);
  Img.Parent := JanelaMae;
  Img.Stretch := True;
  Img.SetBounds(V[1], V[2], V[3], V[4]);

  // eventos
  Img.OnClick := Compiler.TrataOnClickBotao;

  // cria o TQuadroImagem
  Imagem := TQuadroImagem.Cria(Img);
  Imagem.crg_img(Ps^); // carrega a imagem

  // inclui na lista de componentes
  Compiler.FTQuadroList.Add(Imagem);

  // salva o valor de retorno
  PInteger(FSymbolInfo.Address)^ := Integer(Imagem);
end;

procedure TProd_nova_imagem.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // nova_imagem
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Janela
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // largura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // altura
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // texto
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

{ TProd_reg_evento }

procedure TProd_reg_evento.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // reg_evento
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (TQuadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // evento
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // substituto
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

procedure TProd_reg_evento.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..2] of Integer;
  Q: TQuadro;
begin
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret; // quadro, evento, substituto
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  { obtém o quadro }
  Q := TQuadro(V[0]);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  { registra o evento substituto }
  Q.reg_evento(V[1], V[2]);
end;

{ TProd_obt_txt_janela }

procedure TProd_obt_txt_janela.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // obt_txt_janela
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // Tela (TQuadro)

  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);

  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeString);
end;

procedure TProd_obt_txt_janela.Interpret;
var
  Si: TSymbolInfo;
  Q: TQuadro;
  V: Integer;
begin
  Productions[0].Interpret; // Tela (TQuadro)
  Si := Productions[0].SymbolInfo;
  V := PInteger(Si.Address)^;

  { obtém o quadro }
  Q := TQuadro(V);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  { obtém o texto }
  PString(FSymbolInfo.Address)^ := Q.obt_txt_janela();
end;


{ TProd_copJanelaRet }

procedure TProd_copJanelaRet.Interpret;
var
  Si: TSymbolInfo;
  V: array [0..5] of Integer;
  Jan, JanOrig: TQuadro;
  I: Integer;
begin
  for I := 0 to 5 do
  begin
    Productions[I].Interpret; // jan, x1, y1, x2, y2, janOrig
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  // verifica se as janelas são válidas
  if not (TObject(V[0]) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  if not (TObject(V[5]) is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);
  Jan := TQuadro(V[0]);
  JanOrig := TQuadro(V[5]);

  // copia JanOrig para Jan (via CopyRect)
  Jan.cop_janela_ret(V[1], V[2], V[3], V[4], JanOrig);
end;

procedure TProd_copJanelaRet.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // cop_janela_ret
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // jan
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // janOrig
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

{ TProd_DsnRetSel }

procedure TProd_DsnRetSel.Interpret;
var
  I: Integer;
  Si: TSymbolInfo;
  V: array [0..4] of Integer;
  Q: TQuadro;
begin
  for I := 0 to ProductionCount - 1 do
  begin
    Productions[I].Interpret; // todas as expressões inteiras
    Si := Productions[I].SymbolInfo;
    V[I] := PInteger(Si.Address)^;
  end;

  { obtém o quadro }
  Q := TQuadro(V[0]);
  if not (Q is TQuadro) then
    Error(sFrameTypeExpected, ProductionLine, ProductionCol);

  { desenha no quadro e no bmp }
  Q.dsn_ret_sel(V[1], V[2], V[3], V[4]);
end;

procedure TProd_DsnRetSel.Parse;
var
  E: TProduction;
begin
  Parser.GetNextToken; // dsn_ret_sel
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // tela (Quadro)
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y1
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // x2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkComma);

  E := Compile(TProd_Expression); // y2
  if E.SymbolInfo.SymbolType <> Compiler.DeclTypeInteger then
    Error(sIntExprExpected, E.ProductionLine, E.ProductionCol);
  GetTerminal(tkRParen);
end;

{ TProd_novo_som }

procedure TProd_novo_som.Interpret;
var
  Si: TSymbolInfo;
  Ps: PString;
  Som: TCtrlMediaPlayer;
begin
  Productions[0].Interpret; // nome
  Si := Productions[0].SymbolInfo;
  if Productions[0].ExecPromotion then
    Si := Productions[0].Promoted;
  Ps := PString(Si.Address);

  // verifica se ultrapassa limite de componentes
  if Compiler.FTMediaPlayerList.Count >= MAX_MPLAYERS then
    Error(sLimiteMediaPlayersAtingido, ProductionLine, ProductionCol);

  // cria o TCtrlMediaPlayer
  Som := TCtrlMediaPlayer.Cria(Ps^);

  // eventos
     // sem eventos

  // inclui na lista de media players
  Compiler.FTMediaPlayerList.Add(Som);

  // salva o valor de retorno
  PInteger(FSymbolInfo.Address)^ := Integer(Som);
end;

procedure TProd_novo_som.Parse;
var
  E: TProduction;
  T: TSymbolType;
begin
  Parser.GetNextToken; // novo_som
  GetTerminal(tkLParen);

  E := Compile(TProd_Expression); // nome do som
  T := CheckTypes(Compiler.DeclTypeString, E.SymbolInfo.SymbolType, tkAssign);
  E.PromoteTo(T);

  GetTerminal(tkRParen);
  FSymbolInfo := SymbolTable.AllocSymbolInfo(scVar, Compiler.DeclTypeInteger);
end;

end.

