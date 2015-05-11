unit port_RWStreams;

interface

uses
  SysUtils, Classes;

type
  { TRWStream }

  TRWStream = class
  private
    FChar: Char;
    FHasChar: Boolean;
    FStream: TStream;
    function GetCurrentChar: Char;
  public
    constructor Create(Stream: TStream);
    destructor Destroy; override;
    function ReaderHasChar: Boolean;
    function ReaderNextChar: Char;
    procedure WriterWriteChar(C: Char);
    property CurrentChar: Char read GetCurrentChar;
  end;

implementation

{ TRWStream }

constructor TRWStream.Create(Stream: TStream);
begin
  FStream := Stream;
end;

destructor TRWStream.Destroy;
begin
  FStream.Free;
  inherited Destroy;
end;

function TRWStream.GetCurrentChar: Char;
begin
  // exceção ativada se não houver caractere lido
  if not FHasChar then
    raise Exception.Create('');

  // retorna o último caractere lido
  Result := FChar;
end;

function TRWStream.ReaderHasChar: Boolean;
begin
  // presume que tem
  Result := True;

  // nada a fazer se já registrou que tem
  if FHasChar then
    Exit;

  // tenta ler
  if FStream.Read(FChar, 1) < 1 then
    Result := False;

  // registra
  FHasChar := Result;
end;

function TRWStream.ReaderNextChar: Char;
begin
  // exceção ativada se não houver caractere lido
  if not FHasChar then
    raise Exception.Create('');

  // retorna o último caractere lido e desmarca o flag
  Result := FChar;
  FHasChar := False;
end;

procedure TRWStream.WriterWriteChar(C: Char);
begin
  FStream.Write(C, 1);
end;

end.
