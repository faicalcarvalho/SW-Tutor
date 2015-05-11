unit UCtrlMediaPlayers;

interface

uses
  MPlayer, Classes, WavePlayer;

const
  NUM_MPLAYERS = 1; // número de players para cada som;
                    // a idéia de criar múltiplos players para um som é
                    // para permitir um curto intervalo entre um mesmo som

type

  TCtrlMediaPlayer = class
  private
//    FMP: array [0..NUM_MPLAYERS-1] of TWavePlayer;
//    FMP: array [0..NUM_MPLAYERS-1] of TMediaPlayer;
//    FIndToque: Integer;
//    FWavePlayer: TWavePlayer;
    FResStream: TResourceStream;
  public
    constructor Cria(Nome: String);
    destructor Destroy; override;
    procedure Toque;
  end;

implementation

uses
  SysUtils, MMSystem, port_UFrmDSL, port_Recursos, port_PasTokens,
  port_PascalInterpreter;


//var
//  CntNomeMM: Integer; // usado na identificaçao dos media players criados

{ TCtrlMediaPlayer }

constructor TCtrlMediaPlayer.Cria(Nome: String);
//var
//  I: Integer;
//  NomeArq: String;
begin
  try
    FResStream := TResourceStream.Create(HInstance, Nome, 'WAVE');
  except
    raise EInterpreterException.Create(sFalhaToqSom + ' (' + Nome + ')', 1, 1, nil);
  end;

//  for I := 0 to NUM_MPLAYERS - 1 do
//  begin
//    ResStream.Position := 0;
(*
    FMP[I] := TWavePlayer.Create;
    FMP[I].Source := ResStream;
    FMP[I].Open;
*)

(*
    NomeArq := Recursos.NomeArqTemporario();
    ResStream.Position := 0;
    ResStream.SaveToFile(NomeArq);
    FMP[I] := TMediaPlayer.Create(nil);
//    Inc(CntNomeMM);
//    FMP[I].Name := 'MM' + IntToStr(CntNomeMM);
    FMP[I].SetBounds(-1000, -1000, 100, 100);
    FMP[I].Parent := FrmDSL;
//    FMP[I].Visible := True;
    FMP[I].DeviceType := dtWaveAudio;
    FMP[I].FileName := NomeArq;
    FMP[I].Open;

  end;
*)
end;

destructor TCtrlMediaPlayer.Destroy;
begin
  FResStream.Free;
  inherited;
end;

procedure TCtrlMediaPlayer.Toque;
begin
  PlaySound(FResStream.Memory, HInstance, SND_ASYNC or
                                          SND_MEMORY or
                                          SND_NODEFAULT or
                                          SND_NOWAIT);
//  if FMP[FIndToque].Mode <> mpStopped then
//    FMP[FIndToque].Stop;
//  FMP[FIndToque].Play;
//  FIndToque := (FIndToque + 1) mod NUM_MPLAYERS;
//  FWavePlayer.Play;
end;

end.
