program DSL_PORT;

uses
  Forms,
  port_UFrmDSL in 'port_UFrmDSL.pas' {FrmDSL},
  port_PascalInterpreter in 'port_PascalInterpreter.pas',
  port_UFrmAbout in 'port_UFrmAbout.pas' {FrmAbout},
  port_UFrmExamples in 'port_UFrmExamples.pas' {FrmExamples},
  port_UFrmWatches in 'port_UFrmWatches.pas' {FrmWatches},
  port_UFrmLeia in 'port_UFrmLeia.pas' {FrmLeia},
  port_PasTokens in 'port_PasTokens.pas',
  port_UFrmMemoria in 'port_UFrmMemoria.pas' {FrmMemoria},
  g_Heap in 'g_Heap.pas',
  port_RWStreams in 'port_RWStreams.pas',
  port_UFrmConfig in 'port_UFrmConfig.pas' {FrmConfig},
  port_UFrmPasta in 'port_UFrmPasta.pas' {FrmPasta},
  port_UFrmExamples2 in 'port_UFrmExamples2.pas' {Form1},
  port_UQuadro in 'port_UQuadro.pas',
  port_Recursos in 'port_Recursos.pas',
  WavePlayer in 'WavePlayer.pas',
  port_UFrmJanela in 'port_UFrmJanela.pas' {FrmJanela},
  UMeusComps in 'UMeusComps.pas',
  UCtrlMediaPlayers in 'UCtrlMediaPlayers.pas',
  UFrmEditor in 'UFrmEditor.pas' {FrmEditor},
  ULume_br_style in 'ULume_br_style.pas',
  UFrmExample2 in 'UFrmExample2.pas' {FrmExample2};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmDSL, FrmDSL);
  Application.CreateForm(TFrmEditor, FrmEditor);
  Application.CreateForm(TFrmAbout, FrmAbout);
  Application.CreateForm(TFrmWatches, FrmWatches);
  Application.CreateForm(TFrmLeia, FrmLeia);
  Application.CreateForm(TFrmMemoria, FrmMemoria);
  Application.CreateForm(TFrmConfig, FrmConfig);
  Application.CreateForm(TFrmPasta, FrmPasta);
  Application.CreateForm(TFrmExample2, FrmExample2);
  Application.Run;
end.
