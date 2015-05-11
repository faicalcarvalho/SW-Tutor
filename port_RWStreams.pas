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
  // exce��o ativada se n�o houver caractere lido
  if not FHasChar then
    raise Exception.Create('');

  // retorna o �ltimo caractere lido
  Result := FChar;
end;

function TRWStream.ReaderHasChar: Boolean;
begin
  // presume que tem
  Result := True;

  // nada a fazer se j� registrou que tem
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
  // exce��o ativada se n�o houver caractere lido
  if not FHasChar then
    raise Exception.Create('');

  // retorna o �ltimo caractere lido e desmarca o flag
  Result := FChar;
  FHasChar := False;
end;

procedure TRWStream.WriterWriteChar(C: Char);
begin
  FStream.Write(C, 1);
end;

end.
