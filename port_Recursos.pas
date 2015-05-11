unit port_Recursos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, MPlayer, ExtCtrls, WavePlayer, StdCtrls, MMSystem;

const
  NUM_WP = 5;

type
  MultiWP = record
    Ind: Integer;
    WP: array [0..NUM_WP-1] of TWavePlayer;
  end;

type
  TRecursos = class
  private
    // streams
//    StmCaixa1: TStream;
//    StmCaixa1, StmCaixa2, StmCaixa3, StmCaixa4,
//    StmCaixa5, StmCaixa6, StmCaixa7, StmCaixa8: TStream;

    // wave players
//    WPCaixa1: MultiWP;
//    WPCaixa1, WPCaixa2, WPCaixa3, WPCaixa4,
//    WPCaixa5, WPCaixa6, WPCaixa7, WPCaixa8: TWavePlayer;
  public
    constructor Cria;
    destructor Destroy; override;
    procedure ToqSom(Som: String);
    function ObtResImg(Nome: String): TStream;
    procedure LibResImg(Stm: TStream);
    function NomeArqTemporario: String;
  end;

var
  Recursos: TRecursos;

implementation

{$R sw_tutor.res}

uses
  port_PasTokens, port_PascalInterpreter;
  
{ TRecursos }

constructor TRecursos.Cria;
//var
//  I: Integer;
begin
  // cria streams a partir de resources
//  StmCaixa1 := TResourceStream.Create(HInstance, 'Caixa-1', 'WAVE');
//  StmCaixa2 := TResourceStream.Create(HInstance, 'caixa2', 'WAVE');
//  StmCaixa3 := TResourceStream.Create(HInstance, 'caixa3', 'WAVE');
//  StmCaixa4 := TResourceStream.Create(HInstance, 'caixa4', 'WAVE');
//  StmCaixa5 := TResourceStream.Create(HInstance, 'caixa5', 'WAVE');
//  StmCaixa6 := TResourceStream.Create(HInstance, 'caixa6', 'WAVE');
//  StmCaixa7 := TResourceStream.Create(HInstance, 'caixa7', 'WAVE');
//  StmCaixa8 := TResourceStream.Create(HInstance, 'caixa8', 'WAVE');

  // cria os wave players
//  for I := 0 to NUM_WP - 1 do
//  begin
//    WPCaixa1.WP[I] := TWavePlayer.Create;
//    WPCaixa1.WP[I].Source := StmCaixa1;
//  end;
//  WPCaixa1.Ind := 0;

//  WPCaixa2 := TWavePlayer.Create;
//  WPCaixa3 := TWavePlayer.Create;
//  WPCaixa4 := TWavePlayer.Create;
//  WPCaixa5 := TWavePlayer.Create;
//  WPCaixa6 := TWavePlayer.Create;
//  WPCaixa7 := TWavePlayer.Create;
//  WPCaixa8 := TWavePlayer.Create;

  // associa os streams
//  WPCaixa1.Source := StmCaixa1;
//  WPCaixa2.Source := StmCaixa2;
//  WPCaixa3.Source := StmCaixa3;
//  WPCaixa4.Source := StmCaixa4;
//  WPCaixa5.Source := StmCaixa5;
//  WPCaixa6.Source := StmCaixa6;
//  WPCaixa7.Source := StmCaixa7;
//  WPCaixa8.Source := StmCaixa8;
end;

destructor TRecursos.Destroy;
//var
//  I: Integer;
begin
//  StmCaixa1.Free;
//  StmCaixa2.Free;
//  StmCaixa3.Free;
//  StmCaixa4.Free;
//  StmCaixa5.Free;
//  StmCaixa6.Free;
//  StmCaixa7.Free;
//  StmCaixa8.Free;

//  for I := 0 to NUM_WP-1 do
//    WPCaixa1.WP[I].Free;

//  WPCaixa1.Free;
//  WPCaixa2.Free;
//  WPCaixa3.Free;
//  WPCaixa4.Free;
//  WPCaixa5.Free;
//  WPCaixa6.Free;
//  WPCaixa7.Free;
//  WPCaixa8.Free;
end;

procedure TRecursos.LibResImg(Stm: TStream);
begin
  Stm.Free;
end;

function TRecursos.NomeArqTemporario: String;
var
  Cod: Integer;
  Pathbuf: array [0..500] of Char;
  Filebuf: array [0..500] of Char;
begin
  Cod := GetTempPath(200, Pathbuf);
  if Cod = 0 then
    raise EInterpreterException.Create(sFalhaArqTemp, 1, 1, nil);

  Cod := GetTempFileName(Pathbuf, 'TMP', 0, Filebuf);
  if Cod = 0 then
    raise EInterpreterException.Create(sFalhaArqTemp, 1, 1, nil);

  Result :=  Filebuf;
end;

function TRecursos.ObtResImg(Nome: String): TStream;
begin
  Result := TResourceStream.Create(HInstance, Nome, RT_BITMAP);
end;

procedure TRecursos.ToqSom(Som: String);
begin
{
  if Som = 'Caixa1' then
    WPCaixa1.Play
  else if Som = 'Caixa2' then
    WPCaixa2.Play
  else if Som = 'Caixa3' then
    WPCaixa3.Play
  else if Som = 'Caixa4' then
    WPCaixa4.Play
  else if Som = 'Caixa5' then
    WPCaixa5.Play
  else if Som = 'Caixa6' then
    WPCaixa6.Play
  else if Som = 'Caixa7' then
    WPCaixa7.Play
  else if Som = 'Caixa8' then
    WPCaixa8.Play;
}
  PlaySound(PWideChar(Som), HInstance, SND_RESOURCE or SND_ASYNC);
//  WPCaixa1.WP[WPCaixa1.Ind].Play;
//  WPCaixa1.Ind := (WPCaixa1.Ind + 1) mod NUM_WP;

end;

initialization
  Recursos := TRecursos.Cria;

finalization
  Recursos.Free;
end.

