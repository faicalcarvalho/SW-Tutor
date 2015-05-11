unit UAnLiteral;

interface

uses
  Classes;

const
  { Tokens }
  TOKEN_FIM = 0;
  TOKEN_LITERAL = 1;
  TOKEN_OUTRO = 2;

type

  { TAnLiteral }

  TAnLiteral = class
  private
    FStr: String;
    FPos: Integer;
    FTam: Integer;
    FToken: Integer;
    FCaractere: Char;
    FTokenStr: String;
    function ProximoCaractere: Char;
  public
    constructor Cria(Str: String);
    destructor Destroy; override;
    function ProximoToken: Integer;
    property Token: Integer read FToken;
    property TokenStr: String read FTokenStr;
  end;

implementation

{ TAnLiteral }

constructor TAnLiteral.Cria(Str: String);
begin
  FStr := Str;
  FPos := 1;
  FTam := Length(FStr);
  ProximoCaractere();
  ProximoToken();
end;

destructor TAnLiteral.Destroy;
begin
  FStr := '';
  inherited Destroy;
end;

function TAnLiteral.ProximoCaractere: Char;
begin
  if FPos > FTam then
    Result := #0
  else begin
    Result := FStr[FPos];
    Inc(FPos);
  end;
  FCaractere := Result;
end;

function TAnLiteral.ProximoToken: Integer;
begin
  FTokenStr := '';
  case FCaractere of
  #0:
    Result := TOKEN_FIM;

  '"':
    begin
      repeat
        FTokenStr := FTokenStr + FCaractere;
      until ProximoCaractere() in ['"', #0, #10];
      FTokenStr := FTokenStr + FCaractere;
      if FCaractere = '"' then
        Result := TOKEN_LITERAL
      else
        Result := TOKEN_OUTRO;
      if FCaractere in ['"', #10] then
        ProximoCaractere();
    end;

  else
    repeat
      FTokenStr := FTokenStr + FCaractere;
    until ProximoCaractere() in ['"', #0];
    Result := TOKEN_OUTRO;

  end;
  FToken := Result;
end;

end.

