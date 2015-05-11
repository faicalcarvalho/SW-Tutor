unit CSTokens;

interface

uses
  SysUtils, Classes;

resourcestring

  // Erros léxicos
  sStringIncomplete = 'Texto incompleto';
  sUnexpectedEndOfSourceInComment = 'Fim de arquivo inesperado em um comentário';
  sPushBackError = 'Erro interno em PushBack';
  sInvalidRealNumber = 'Número real inválido';
  sInvalidIntNumber = 'Número inteiro inválido';
  sInvalidHexNumber = 'Número hexadecimal inválido';
  sInvalidControlString = 'Texto de controle inválido';
  sInvalidOperator = 'Operador inválido';

const
  STRQUOTE = '"';

type
  { TToken }

  TToken = (
    // palavras reservadas
    tkRWand,
    tkRWarray,
    tkRWbegin,
    tkRWboolean,
    tkRWcase,
    tkRWchar,
    tkRWconst,
    tkRWdispose,
    tkRWdiv,
    tkRWdo,
    tkRWdownto,
    tkRWelse,
    tkRWend,
    tkRWfalse,
    tkRWfile,
    tkRWfor,
    tkRWforward,
    tkRWfunction,
    tkRWif,
    tkRWin,
    tkRWinclude,
    tkRWinteger,
    tkRWmod,
    tkRWnew,
    tkRWnil,
    tkRWnot,
    tkRWof,
    tkRWor,
    tkRWprocedure,
    tkRWprogram,
    tkRWread,
    tkRWreal,
    tkRWrecord,
    tkRWrepeat,
    tkRWreturn,
    tkRWset,
    tkRWshl,
    tkRWshr,
    tkRWstring,
    tkRWthen,
    tkRWto,
    tkRWtrue,
    tkRWtype,
    tkRWuntil,
    tkRWvar,
    tkRWwhile,
    tkRWwith,
    tkRWwrite,
    tkRWwriteln,
    tkRWxor,
    tkRWyes,
    tkRWyesOrNo,
    tkRWpointer,
    tkRWchoose,

    // especiais
    tkAny, tkUnknown, tkUnaryMinus, tkEndOfSource, tkComment, tkBlank,

    // símbolos
    tkId, tkIntNumber, tkFloatNumber, tkHexNumber, tkString, tkChar,

    // tokens de 1 caracter
    tkPlus, tkMinus, tkTimes, tkSlash, tkEqual, tkLT, tkGT, tkLBracket,
    tkRBracket, tkPeriod, tkComma, tkLParen, tkRParen, tkColon, tkSemiColon,
    tkCaret, tkAt, tkDollar, tkFence,

    // pares de caracteres
    tkLE, tkGE, tkNE, tkAssign, tkDotDot
    );

  { TTokens }

  TTokens = set of TToken;

  { TTokenValue }

  TTokenValue = class
  private
    FInteger: Integer;
    FChar: Char;
    FExtended: Extended;
    FString: String;
  public
    property AsInteger: Integer read FInteger;
    property AsChar: Char read FChar;
    property AsExtended: Extended read FExtended;
    property AsString: String read FString;
  end;

  { CSTokenizer - C# Tokenizer}

  CSTokenizer = class
  private
    FStream: TStream;
    FBuffer: PChar;
    FBufEnd: PChar;
    FBufPos: PChar;
    FDotDot: Boolean;
    FNewLine: Boolean;
    FPosition: Integer;
    FSourceLine: Integer;
    FSourceCol: Integer;
    FTokenLine: Integer;
    FTokenCol: Integer;
    FTokenPosition: Integer;
    FTokenStr: String;
    FTokenValue: TTokenValue;
    FCurrentToken: TToken;
    CurrentChar: Char;
    FName: String;
    function CheckHexNumber(S: String): Integer;
    function CheckRealNumber(S: String): Extended;
    function CheckIntNumber(S: String): Integer;
    function CheckReservedWord(S: String): TToken;
    function GetChar: Char;
    procedure GetQuotedString;
    procedure GetControlString;
    procedure Error(S: String);
    procedure PushBack(Current: Char);
  protected
    procedure SkipBlanks; virtual;
  public
    constructor Create(Stream: TStream); overload;
    constructor Create(Stream: TStream; Name: String); overload;
    destructor Destroy; override;
    function GetNextToken: TToken; virtual;
    function GetTokenName(Token: TToken): String;
    property Stream: TStream read FStream;
    property CurrentToken: TToken read FCurrentToken;
    property TokenLine: Integer read FTokenLine;
    property TokenCol: Integer read FTokenCol;
    property TokenPosition: Integer read FTokenPosition;
    property TokenString: String read FTokenStr;
    property TokenValue: TTokenValue read FTokenValue;
    property Name: String read FName write FName;
  end;

  { Exception: EInterpreterException }

  EInterpreterException = class(Exception)
  private
    FLine: Integer;
    FCol: Integer;
    FParser: TPascalTokenizer;
  public
    constructor Create(S: String; Line, Col: Integer; Parser: TPascalTokenizer);
    property Line: Integer read FLine;
    property Col: Integer read FCol;
    property Parser: TPascalTokenizer read FParser write FParser;
  end;

  { TSimplePascalTokenizer }

  TSimplePascalTokenizer = class(TPascalTokenizer)
  private
    FTokenPositionDotDot: Integer;
    FTokenLineDotDot: Integer;
    FTokenColDotDot: Integer;
  public
    function GetNextToken: TToken; override;
  end;



implementation

{ TPascalTokenizer }

const
  BUFSIZE = 80000;

var
  // one character tokens (see initialization section)
  TokChar: array [Char] of TToken;

  // palavras reservadas
  ReservedWords: TStrings;

constructor CSTokenizer.Create(Stream: TStream);
begin
  inherited Create;
  FStream := Stream;
  GetMem(FBuffer, BUFSIZE);
  FTokenValue := TTokenValue.Create;
  FBufPos := FBuffer;
  FBufEnd := FBuffer;
  FPosition := -1;
  FNewLine := True;
  GetChar;
  GetNextToken;
end;

constructor CSTokenizer.Create(Stream: TStream; Name: String);
begin
  Create(Stream);
  FName := Name;
end;

destructor CSTokenizer.Destroy;
begin
  if FBuffer <> nil then
    FreeMem(FBuffer);
  FTokenValue.Free;
  inherited Destroy;
end;

procedure CSTokenizer.Error(S: String);
begin
  raise EInterpreterException.Create(S, FSourceLine, FSourceCol, Self);
end;

function CSTokenizer.CheckReservedWord(S: String): TToken;
var
  Ind: Integer;
  Aux: String;

  // esta funçao resolve o uso opcional de acentos, tils e
  // cedilhas.
  function port_Equivalent(S: String): String;
  begin
    Result := S;
    if (Result = 'até') then
      Result := 'ate'
    else if (Result = 'então') then
      Result := 'entao'
    else if (Result = 'faça') then
      Result := 'faca'
    else if (Result = 'funçao') then
      Result := 'funcao'
    else if (Result = 'funcão') then
      Result := 'funcao'
    else if (Result = 'função') then
      Result := 'funcao'
    else if (Result = 'início') then
      Result := 'inicio'
    else if (Result = 'lógico') then
      Result := 'logico'
    else if (Result = 'não') then
      Result := 'nao'
    else if (Result = 'senão') then
      Result := 'senao'
    else if (Result = 'simounão') then
      Result := 'simounao';
  end;

begin
//  Aux := LowerCase(S);
  Aux := S;
  Aux := port_Equivalent(Aux);
  Ind := ReservedWords.IndexOf(Aux);
  if Ind >= 0 then
    Result := TToken(ReservedWords.Objects[Ind])
  else
    Result := tkId;
end;

function CSTokenizer.GetChar: Char;
begin
  if FBufPos >= FBufEnd then
  begin
    // fill the buffer
    FBufEnd := FBuffer + FStream.Read(FBuffer^, BUFSIZE);
    FBufPos := FBuffer;
  end;
  if FBufPos >= FBufEnd then
    Result := #0
  else
  begin
    Result := FBufPos^;
    Inc(FBufPos);
    Inc(FPosition);
    if FNewLine then
    begin
      Inc(FSourceLine);
      FSourceCol := 0;
      FNewLine := False;
    end;
    Inc(FSourceCol);
    if Result = #10 then
      FNewLine := True;
  end;
  CurrentChar := Result;
end;

procedure CSTokenizer.PushBack(Current: Char);
begin
  if FBufPos = FBuffer then
    Exit; // Error(sPushBackError);

  Dec(FBufPos);
  Dec(FPosition);
  Dec(FSourceCol);
  CurrentChar := Current;
end;

procedure CSTokenizer.GetQuotedString;
var
  P: PChar;
begin
  FTokenStr := '';
  while CurrentChar = STRQUOTE do
  begin
    repeat
      FTokenStr := FTokenStr + CurrentChar;
    until GetChar in [STRQUOTE, #13, #0];
    if CurrentChar in [#13, #0] then
      Error(sStringIncomplete);
    FTokenStr := FTokenStr + CurrentChar;
    GetChar;
  end;
  P := PChar(FTokenStr);
  TokenValue.FString := TokenValue.FString + AnsiExtractQuotedStr(P, STRQUOTE);
end;

procedure CSTokenizer.GetControlString;
var
  Value: Integer;
begin
  Value := 0;
  FTokenStr := '';
  if GetChar = '$' then
  begin
    repeat
      FTokenStr := FTokenStr + CurrentChar;
    until not (GetChar in ['0'..'9', 'A'..'F', 'a'..'f']);
    try
      Value := CheckHexNumber(FTokenStr);
    except
      Error(sInvalidControlString);
    end;
    if (Value < 0) or (Value > 255) then
      Error(sInvalidControlString);
    TokenValue.FString := TokenValue.FString + Chr(Value);
  end
  else
  begin
    while CurrentChar in ['0'..'9'] do
    begin
      FTokenStr := FTokenStr + CurrentChar;
      GetChar;
    end;
    try
      Value := CheckIntNumber(FTokenStr);
    except
      Error(sInvalidControlString);
    end;
    if (Value < 0) or (Value > 255) then
      Error(sInvalidControlString);
    TokenValue.FString := TokenValue.FString + Chr(Value);
  end;
end;

procedure CSTokenizer.SkipBlanks;
begin
  while True do
  begin
    case CurrentChar of
    #0:
      Exit;

    #1..' ':
      GetChar;

//    '{':
//      begin
//        repeat
//          GetChar;
//        until CurrentChar in [#0, '}'];
//        if CurrentChar = #0 then
//          Error(sUnexpectedEndOfSourceInComment);
//        GetChar;
//      end;

    '/':
      if GetChar = '/' then
      begin
        repeat
          GetChar;
        until CurrentChar in [#0, #10];
        if CurrentChar = #0 then
          Exit;
        GetChar;
      end
      else if CurrentChar = '*' then
      begin
        while True do
        begin
          repeat
            GetChar;
          until CurrentChar in [#0, '*'];
          if CurrentChar = #0 then
            Error(sUnexpectedEndOfSourceInComment);
          if GetChar = '/' then
          begin
            GetChar;
            Break;
          end
          else
            PushBack('*');
        end;
      end
      else
      begin
        PushBack('/');
        Exit;
      end;

//    '(':
//      if GetChar = '*' then
//      begin
//        while True do
//        begin
//          repeat
//            GetChar;
//          until CurrentChar in [#0, '*'];
//          if CurrentChar = #0 then
//            Error(sUnexpectedEndOfSourceInComment);
//          if GetChar = ')' then
//          begin
//            GetChar;
//            Break;
//          end
//          else
//            PushBack('*');
//        end;
//      end
//      else
//      begin
//        PushBack('(');
//        Exit;
//      end;

    else // default case
      Break;
    end;
  end;
end;

function CSTokenizer.CheckHexNumber(S: String): Integer;
var
  I, Len: Integer;
  C: Char;
  V: Byte;
begin
  Result := 0;
  Len := Length(S);
  if (Len <= 1) or (Len > 9) then Error(sInvalidHexNumber);
  try
    for I := 2 to Len do
    begin
      C := S[I];
      if C in ['0'..'9'] then
        V := Ord(C) - Ord('0')
      else if C in ['A'..'F'] then
        V := Ord(C) - Ord('A') + 10
      else { C in ['a'..'f'] }
        V := Ord(C) - Ord('a') + 10;
      Result := (Result shl 4) or V;
    end;
  except
    Error(sInvalidHexNumber);
  end;
end;

function CSTokenizer.CheckRealNumber(S: String): Extended;
var
  SaveDecSep: Char;
begin
  Result := 0.0;
  try
    SaveDecSep := DecimalSeparator;
    DecimalSeparator := '.';
    Result := StrToFloat(S);
    DecimalSeparator := SaveDecSep;
  except
    Error(sInvalidRealNumber);
  end;
end;

function CSTokenizer.CheckIntNumber(S: String): Integer;
begin
  Result := 0;
  if Length(S) = 0 then
    Error(sInvalidIntNumber);
  try
    Result := StrToInt(S);
  except
    Error(sInvalidIntNumber);
  end;
end;

function CSTokenizer.GetNextToken: TToken;
begin
  // the dotdot special case (see case '0'..'9' below)
  if FDotDot then
  begin
    Result := tkDotDot;
    FTokenStr := '..';
    FDotDot := False;
    FCurrentToken := Result;
    Exit;
  end;

  SkipBlanks;
  FTokenPosition := FPosition;
  FTokenLine := FSourceLine;
  FTokenCol := FSourceCol;
  FTokenStr := '';
  case CurrentChar of
  #0:
    Result := tkEndOfSource;

  ':':
    begin
      Result := tkColon;
      FTokenStr := ':';
      if GetChar = '=' then
      begin
        Result := tkAssign;
        FTokenStr := ':=';
        GetChar;
      end;
    end;

  '<':
    begin
      Result := tkLT;
      FTokenStr := '<';
      if GetChar = '=' then
      begin
        Result := tkLE;
        FTokenStr := '<=';
        GetChar;
      end
      else if CurrentChar = '>' then
      begin
        Result := tkNE;
        FTokenStr := '<>';
        GetChar;
      end;
    end;

  '>':
    begin
      Result := tkGT;
      FTokenStr := '>';
      if GetChar = '=' then
      begin
        Result := tkGE;
        FTokenStr := '>=';
        GetChar;
      end;
    end;

  '&':
    begin
      if GetChar <> '&' then
        Error(sInvalidOperator);
      Result := tkRWand;
      FTokenStr := '&&';
      GetChar;
    end;

  '|':
    begin
      if GetChar <> '|' then
        Error(sInvalidOperator);
      Result := tkRWor;
      FTokenStr := '||';
      GetChar;
    end;

  '.':
    begin
      Result := tkPeriod;
      FTokenStr := '.';
      if GetChar = '.' then
      begin
        Result := tkDotDot;
        FTokenStr := '..';
        GetChar;
      end;
    end;

  'A'..'Z', 'a'..'z', '_', #192..#255:
    begin
      repeat
        FTokenStr := FTokenStr + CurrentChar;
      until not (GetChar in ['A'..'Z', 'a'..'z', '0'..'9', '_', #192..#255]);
      Result := CheckReservedWord(FTokenStr);
    end;

  '$':
    begin
      repeat
        FTokenStr := FTokenStr + CurrentChar;
      until not (GetChar in ['0'..'9', 'A'..'F', 'a'..'f']);
      if FTokenStr = '$' then
        Result := tkDollar
      else
      begin
        Result := tkIntNumber;
        TokenValue.FInteger := CheckHexNumber(FTokenStr);
      end;
    end;

  '0'..'9':
    begin
      Result := tkIntNumber;
      repeat
        FTokenStr := FTokenStr + CurrentChar;
      until not (GetChar in ['0'..'9']);

      if CurrentChar = '.' then
      begin
        // the dotdot special case
        if GetChar = '.' then
        begin
          FDotDot := True;
          FCurrentToken := Result; // tkIntNumber
          TokenValue.FInteger := CheckIntNumber(FTokenStr);
          GetChar;
          Exit;
        end;

        FTokenStr := FTokenStr + '.' + CurrentChar;
        Result := tkFloatNumber;
        while GetChar in ['0'..'9'] do
          FTokenStr := FTokenStr + CurrentChar;
      end;

      if CurrentChar in ['E', 'e'] then
      begin
        Result := tkFloatNumber;
        FTokenStr := FTokenStr + CurrentChar;
        if GetChar in ['+', '-'] then
        begin
          FTokenStr := FTokenStr + CurrentChar;
          GetChar;
        end;
        if not (CurrentChar in ['0'..'9']) then
          Error(sInvalidRealNumber);
        repeat
          FTokenStr := FTokenStr + CurrentChar;
        until not (GetChar in ['0'..'9']);
      end;
      if Result = tkFloatNumber then
        TokenValue.FExtended := CheckRealNumber(FTokenStr)
      else
        TokenValue.FInteger := CheckIntNumber(FTokenStr);
    end;

  STRQUOTE, '#':
    begin
      Result := tkString;
      TokenValue.FString := '';
      while CurrentChar in [STRQUOTE, '#'] do
      begin
        if CurrentChar = STRQUOTE then
        begin
          GetQuotedString;
          if CurrentChar <> '#' then
            Break;
        end;
        if CurrentChar = '#' then
          GetControlString;
      end;
      if Length(TokenValue.FString) = 1 then
      begin
        Result := tkChar;
        TokenValue.FChar := TokenValue.FString[1];
      end;
    end;

  '+', '-', '*', '/', '=', '[', ']', ',', '(', ')', ';', '^', '@':
    begin
      Result := TokChar[CurrentChar];
      FTokenStr := CurrentChar;
      GetChar;
    end;

  else
    Result := tkUnknown;
    GetChar;

  end;
  FCurrentToken := Result;
end;

function CSTokenizer.GetTokenName(Token: TToken): String;
var
  Ind: Integer;
begin
  Ind := ReservedWords.IndexOfObject(TObject(Token));
  if Ind >= 0 then
    Result := ReservedWords[Ind]
  else
    Result := '???';
end;

{ EInterpreterException }

constructor EInterpreterException.Create(S: String; Line, Col: Integer;
  Parser: TPascalTokenizer);
begin
  inherited Create(S);
  FLine := Line;
  FCol := Col;
  FParser := Parser;
end;

{ TSimplePascalTokenizer }

function TSimplePascalTokenizer.GetNextToken: TToken;
begin
  // the dotdot special case (see case '0'..'9' below)
  if FDotDot then
  begin
    Result := tkDotDot;
    FTokenStr := '..';
    FTokenPosition := FTokenPositionDotDot;
    FTokenLine := FTokenLineDotDot;
    FTokenCol := FTokenColDotDot;
    FDotDot := False;
    FCurrentToken := Result;
    Exit;
  end;

  FTokenPosition := FPosition;
  FTokenLine := FSourceLine;
  FTokenCol := FSourceCol;
  FTokenStr := '';
  case CurrentChar of
  #0:
    Result := tkEndOfSource;

  #1..' ':
    begin
      repeat
        FTokenStr := FTokenStr + CurrentChar;
      until not (GetChar in [#1..' ']);
      Result := tkBlank;
    end;

  ':':
    begin
      Result := tkColon;
      FTokenStr := ':';
      if GetChar = '=' then
      begin
        Result := tkAssign;
        FTokenStr := ':=';
        GetChar;
      end;
    end;

  '<':
    begin
      Result := tkLT;
      FTokenStr := '<';
      if GetChar = '=' then
      begin
        Result := tkLE;
        FTokenStr := '<=';
        GetChar;
      end
      else if CurrentChar = '>' then
      begin
        Result := tkNE;
        FTokenStr := '<>';
        GetChar;
      end;
    end;

  '>':
    begin
      Result := tkGT;
      FTokenStr := '>';
      if GetChar = '=' then
      begin
        Result := tkGE;
        FTokenStr := '>=';
        GetChar;
      end;
    end;

  '.':
    begin
      Result := tkPeriod;
      FTokenStr := '.';
      if GetChar = '.' then
      begin
        Result := tkDotDot;
        FTokenStr := '..';
        GetChar;
      end;
    end;

  '{':
    begin
      repeat
        FTokenStr := FTokenStr + CurrentChar;
      until GetChar in [#0, '}'];
      if CurrentChar = '}' then
      begin
        FTokenStr := FTokenStr + CurrentChar;
        GetChar;
      end;
      Result := tkComment;
    end;

  '/':
    begin
      Result := tkSlash;
      FTokenStr := '/';
      if GetChar = '/' then
      begin
        Result := tkComment;
        repeat
          FTokenStr := FTokenStr + CurrentChar;
        until GetChar in [#0, #10];
        if CurrentChar = #0 then
          Exit;
        FTokenStr := FTokenStr + CurrentChar;
        GetChar;
      end;
    end;

  '(':
    begin
      Result := tkLParen;
      FTokenStr := '(';
      if GetChar = '*' then
      begin
        Result := tkComment;
        while True do
        begin
          repeat
            FTokenStr := FTokenStr + CurrentChar;
          until GetChar in [#0, '*'];
          if CurrentChar = #0 then
            Break;
          FTokenStr := FTokenStr + CurrentChar;
          if GetChar = ')' then
          begin
            FTokenStr := FTokenStr + CurrentChar;
            GetChar;
            Break;
          end;
        end;
      end;
    end;

  'A'..'Z', 'a'..'z', '_', #192..#255:
    begin
      repeat
        FTokenStr := FTokenStr + CurrentChar;
      until not (GetChar in ['A'..'Z', 'a'..'z', '0'..'9', '_', #192..#255]);
      Result := CheckReservedWord(FTokenStr);
    end;

  '$':
    begin
      repeat
        FTokenStr := FTokenStr + CurrentChar;
      until not (GetChar in ['0'..'9', 'A'..'F', 'a'..'f']);
      if FTokenStr = '$' then
        Result := tkDollar
      else
      begin
        Result := tkIntNumber;
        TokenValue.FInteger := 0; // não importa o valor
      end;
    end;

  '0'..'9':
    begin
      Result := tkIntNumber;
      repeat
        FTokenStr := FTokenStr + CurrentChar;
      until not (GetChar in ['0'..'9']);

      if CurrentChar = '.' then
      begin
        // the dotdot special case
        if GetChar = '.' then
        begin
          FDotDot := True;
          FTokenPositionDotDot := FPosition - 1;
          FTokenLineDotDot := FTokenLine;
          FTokenColDotDot := FSourceCol - 1;

          FCurrentToken := Result; // tkIntNumber
          TokenValue.FInteger := 0; // não importa o valor
          GetChar;
          Exit;
        end;

        FTokenStr := FTokenStr + '.' + CurrentChar;
        Result := tkFloatNumber;
        while GetChar in ['0'..'9'] do
          FTokenStr := FTokenStr + CurrentChar;
      end;

      if CurrentChar in ['E', 'e'] then
      begin
        Result := tkFloatNumber;
        FTokenStr := FTokenStr + CurrentChar;
        if GetChar in ['+', '-'] then
        begin
          FTokenStr := FTokenStr + CurrentChar;
          GetChar;
        end;

        if not (CurrentChar in ['0'..'9']) then
        begin
          FCurrentToken := Result; // tkFloatNumber
          Exit;
        end;

        repeat
          FTokenStr := FTokenStr + CurrentChar;
        until not (GetChar in ['0'..'9']);
      end;
      if Result = tkFloatNumber then
        TokenValue.FExtended := 0.0
      else
        TokenValue.FInteger := 0;
    end;

  STRQUOTE:
    begin
      Result := tkString;
      repeat
        FTokenStr := FTokenStr + CurrentChar;
      until GetChar in [#0, #10, STRQUOTE];
      if CurrentChar = STRQUOTE then
      begin
        FTokenStr := FTokenStr + CurrentChar;
        GetChar;
      end;
    end;

  '#':
    begin
      Result := tkString;
      repeat
        FTokenStr := FTokenStr + CurrentChar;
      until not (GetChar in ['0'..'9']);
    end;

  '+', '-', '*', '=', '[', ']', ',', ')', ';', '^', '@':
    begin
      Result := TokChar[CurrentChar];
      FTokenStr := CurrentChar;
      GetChar;
    end;

  else
    Result := tkUnknown;
    FTokenStr := CurrentChar;
    GetChar;

  end;
  FCurrentToken := Result;
end;

initialization
  // one character tokens
  TokChar['+'] := tkPlus;
  TokChar['-'] := tkMinus;
  TokChar['*'] := tkTimes;
  TokChar['/'] := tkSlash;
  TokChar['='] := tkEqual;
  TokChar['['] := tkLBracket;
  TokChar[']'] := tkRBracket;
  TokChar[','] := tkComma;
  TokChar['('] := tkLParen;
  TokChar[')'] := tkRParen;
  TokChar[';'] := tkSemiColon;
  TokChar['^'] := tkCaret;
  TokChar['@'] := tkAt;

  // registra palavras reservadas
  ReservedWords := TStringList.Create;
  (ReservedWords as TStringList).CaseSensitive := True;

  ReservedWords.AddObject('adiante',            TObject(tkRWforward));
//  ReservedWords.AddObject('arquivo',            TObject(tkRWfile));
  ReservedWords.AddObject('arranjo',            TObject(tkRWarray));
  ReservedWords.AddObject('ate',                TObject(tkRWuntil));
  ReservedWords.AddObject('caso',               TObject(tkRWcase));
  ReservedWords.AddObject('caractere',          TObject(tkRWchar));
//  ReservedWords.AddObject('com',                TObject(tkRWwith));
//  ReservedWords.AddObject('conjunto',           TObject(tkRWset));
  ReservedWords.AddObject('const',              TObject(tkRWconst));
  ReservedWords.AddObject('de',                 TObject(tkRWof));
//  ReservedWords.AddObject('decr',               TObject(tkRWdownto));
  ReservedWords.AddObject('desld',              TObject(tkRWshr));
  ReservedWords.AddObject('desle',              TObject(tkRWshl));
  ReservedWords.AddObject('div',                TObject(tkRWdiv));
//  ReservedWords.AddObject('e',                  TObject(tkRWand));
  ReservedWords.AddObject('em',                 TObject(tkRWin));
  ReservedWords.AddObject('enquanto',           TObject(tkRWwhile));
  ReservedWords.AddObject('entao',              TObject(tkRWthen));
  ReservedWords.AddObject('escolha',            TObject(tkRWchoose));
  ReservedWords.AddObject('escreva',            TObject(tkRWwrite));
  ReservedWords.AddObject('escrevaLn',          TObject(tkRWwriteln));
  ReservedWords.AddObject('faca',               TObject(tkRWdo));
  ReservedWords.AddObject('falso',              TObject(tkRWfalse));
  ReservedWords.AddObject('fim',                TObject(tkRWend));
  ReservedWords.AddObject('funcao',             TObject(tkRWfunction));
  ReservedWords.AddObject('inclui',             TObject(tkRWinclude));
  ReservedWords.AddObject('inicio',             TObject(tkRWbegin));
  ReservedWords.AddObject('inteiro',            TObject(tkRWinteger));
  ReservedWords.AddObject('leia',               TObject(tkRWread));
  ReservedWords.AddObject('logico',             TObject(tkRWboolean));
  ReservedWords.AddObject('libere',             TObject(tkRWdispose));
  ReservedWords.AddObject('mod',                TObject(tkRWmod));
  ReservedWords.AddObject('nao',                TObject(tkRWnot));
  ReservedWords.AddObject('novo',               TObject(tkRWnew));
  ReservedWords.AddObject('nulo',               TObject(tkRWnil));
//  ReservedWords.AddObject('ou',                 TObject(tkRWor));
  ReservedWords.AddObject('oux',                TObject(tkRWxor));
  ReservedWords.AddObject('para',               TObject(tkRWfor));
  ReservedWords.AddObject('procedimento',       TObject(tkRWprocedure));
  ReservedWords.AddObject('programa',           TObject(tkRWprogram));
  ReservedWords.AddObject('real',               TObject(tkRWreal));
  ReservedWords.AddObject('registro',           TObject(tkRWrecord));
  ReservedWords.AddObject('repita',             TObject(tkRWrepeat));
  ReservedWords.AddObject('retorne',            TObject(tkRWreturn));
  ReservedWords.AddObject('se',                 TObject(tkRWif));
  ReservedWords.AddObject('senao',              TObject(tkRWelse));
  ReservedWords.AddObject('sim',                TObject(tkRWyes));
  ReservedWords.AddObject('simOuNao',           TObject(tkRWyesOrNo));
  ReservedWords.AddObject('texto',              TObject(tkRWstring));
  ReservedWords.AddObject('tipo',               TObject(tkRWtype));
  ReservedWords.AddObject('var',                TObject(tkRWvar));
  ReservedWords.AddObject('verdadeiro',         TObject(tkRWtrue));
  ReservedWords.AddObject('ponteiro',           TObject(tkRWpointer));

  // os tokens seguintes estão incluídos apenas para o eventual
  // uso da propriedade TokName; eles iniciam com branco, o que
  // garante que eles não seráo encontrados na pesquisa normal
  // por palavra reservada
  ReservedWords.AddObject(' Qualquer ',         TObject(tkAny));
  ReservedWords.AddObject(' Desconhecido ',     TObject(tkUnknown));
  ReservedWords.AddObject(' - ',                TObject(tkUnaryMinus));
  ReservedWords.AddObject(' FimDoFonte ',       TObject(tkEndOfSource));
  ReservedWords.AddObject(' Id ',               TObject(tkId));
  ReservedWords.AddObject(' NumInteiro ',       TObject(tkIntNumber));
  ReservedWords.AddObject(' NumReal ',          TObject(tkFloatNumber));
  ReservedWords.AddObject(' NumHexa ',          TObject(tkHexNumber));
  ReservedWords.AddObject(' Texto ',            TObject(tkString));
  ReservedWords.AddObject(' Caractere ',        TObject(tkChar));
  ReservedWords.AddObject(' + ',                TObject(tkPlus));
  ReservedWords.AddObject(' - ',                TObject(tkMinus));
  ReservedWords.AddObject(' * ',                TObject(tkTimes));
  ReservedWords.AddObject(' / ',                TObject(tkSlash));
  ReservedWords.AddObject(' = ',                TObject(tkEqual));
  ReservedWords.AddObject(' < ',                TObject(tkLT));
  ReservedWords.AddObject(' > ',                TObject(tkGT));
  ReservedWords.AddObject(' [ ',                TObject(tkLBracket));
  ReservedWords.AddObject(' ] ',                TObject(tkRBracket));
  ReservedWords.AddObject(' . ',                TObject(tkPeriod));
  ReservedWords.AddObject(' , ',                TObject(tkComma));
  ReservedWords.AddObject(' ( ',                TObject(tkLParen));
  ReservedWords.AddObject(' ) ',                TObject(tkRParen));
  ReservedWords.AddObject(' : ',                TObject(tkColon));
  ReservedWords.AddObject(' ; ',                TObject(tkSemiColon));
  ReservedWords.AddObject(' ^ ',                TObject(tkCaret));
  ReservedWords.AddObject(' @ ',                TObject(tkAt));
  ReservedWords.AddObject(' $ ',                TObject(tkDollar));
  ReservedWords.AddObject(' # ',                TObject(tkFence));
  ReservedWords.AddObject(' <= ',               TObject(tkLE));
  ReservedWords.AddObject(' >= ',               TObject(tkGE));
  ReservedWords.AddObject(' <> ',               TObject(tkNE));
  ReservedWords.AddObject(' := ',               TObject(tkAssign));
  ReservedWords.AddObject(' .. ',               TObject(tkDotDot));

finalization

  ReservedWords.Free;

end.
