unit port_UFrmDSL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ExtCtrls, Menus, StdCtrls, StdActns, ActnList, Buttons,
  ImgList, port_PascalInterpreter, port_PasTokens, UFrmEditor, System.Actions,
  AdvSmoothListBox, GDIPPictureContainer, AdvSmoothPopup, AdvMenus;

const
  WM_INIT_EDITOR = 2000;

type
  TFrmDSL = class(TForm)
    Status: TStatusBar;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Editar1: TMenuItem;
    Programa1: TMenuItem;
    Help1: TMenuItem;
    Panel3: TPanel;
    Panel4: TPanel;
    PnlSaida: TPanel;
    MemoSaida: TMemo;
    Splitter2: TSplitter;
    ActionList1: TActionList;
    ActFileOpen: TAction;
    ActFileClose: TAction;
    ActFileSave: TAction;
    ActFileSaveAs: TAction;
    ActFileNew: TAction;
    ActFileExit: TAction;
    ActEditCopy: TEditCopy;
    ActEditCut: TEditCut;
    ActEditPaste: TEditPaste;
    ActEditSelectAll: TAction;
    ActInterpreterRun: TAction;
    ActInterpreterStop: TAction;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    Close1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    SelectAll1: TMenuItem;
    Run1: TMenuItem;
    Stop1: TMenuItem;
    ActHelpAbout: TAction;
    About1: TMenuItem;
    ActEnvironmentOptions: TAction;
    PnlEditor: TPanel;
    SplitterExpressoes: TSplitter;
    ActInterpreterRunToCursor: TAction;
    ActInterpreterRunToNextStmt: TAction;
    ActInterpreterPause: TAction;
    RuntoCursor1: TMenuItem;
    RuntoNextStatement1: TMenuItem;
    N3: TMenuItem;
    Pause1: TMenuItem;
    Panel1: TPanel;
    PnlLogo: TPanel;
    Image1: TImage;
    ActFileOpenExample: TAction;
    OpenExamples1: TMenuItem;
    ToolbarImages: TImageList;
    ToolBar1: TToolBar;
    BtnOpen: TToolButton;
    BtnSave: TToolButton;
    ToolButton2: TToolButton;
    BtnRun: TToolButton;
    BtnStop: TToolButton;
    ToolButton3: TToolButton;
    BtnPause: TToolButton;
    ToolButton4: TToolButton;
    BtnRunToCursor: TToolButton;
    BtnRunToNextStmt: TToolButton;
    ToolButton1: TToolButton;
    Splitter4: TSplitter;
    Exibir1: TMenuItem;
    ExibirMemoria: TMenuItem;
    PnlProgram: TPanel;
    PnlMemoria: TPanel;
    SplitterMemoria: TSplitter;
    ActShowWatches: TAction;
    ActShowMemory: TAction;
    PnlPonteiros: TPanel;
    PnlMem: TPanel;
    Splitter1: TSplitter;
    ListViewMem: TListView;
    PnlHeap: TPanel;
    Panel6: TPanel;
    ListViewHeap: TListView;
    PaintBoxMem: TPaintBox;
    Panel8: TPanel;
    TimerEvent: TTimer;
    ActRunToReturn: TAction;
    Executaratsairdoprocedimentooufuno1: TMenuItem;
    PnlGraf: TPanel;
    ScrollBoxGra: TScrollBox;
    PaintBox: TPaintBox;
    PnlDoc: TPanel;
    SplitterDoc: TSplitter;
    RichEditDoc: TRichEdit;
    ActShowDoc: TAction;
    BitBtn2: TBitBtn;
    ToolButton5: TToolButton;
    CkDiagramaMem: TCheckBox;
    ActEditFind: TAction;
    N2: TMenuItem;
    Localizar1: TMenuItem;
    ActEditReplace: TAction;
    Substituir1: TMenuItem;
    LblFntEditorMais: TLabel;
    LblFntEditorMenos: TLabel;
    procedure ActEditSelectAllExecute(Sender: TObject);
    procedure ActEditCutExecute(Sender: TObject);
    procedure ActEditCopyExecute(Sender: TObject);
    procedure ActEditPasteExecute(Sender: TObject);
    procedure ActFileSaveAsExecute(Sender: TObject);
    procedure ActFileSaveExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActFileOpenExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActFileCloseExecute(Sender: TObject);
    procedure ActFileExitExecute(Sender: TObject);
    procedure ActFileNewExecute(Sender: TObject);
    procedure ActInterpreterRunExecute(Sender: TObject);
    procedure ActFileOpenExampleExecute(Sender: TObject);
    procedure ActInterpreterStopExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActInterpreterPauseExecute(Sender: TObject);
    procedure ActInterpreterRunToNextStmtExecute(Sender: TObject);
    procedure ActInterpreterRunToCursorExecute(Sender: TObject);
    procedure ActHelpAboutExecute(Sender: TObject);
    procedure PaintBoxClick(Sender: TObject);
    procedure PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActShowMemoryExecute(Sender: TObject);
    procedure ListViewMemResize(Sender: TObject);
    procedure PaintBoxMemPaint(Sender: TObject);
    procedure TimerEventTimer(Sender: TObject);
    procedure ListViewMemCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure PnlSaidaResize(Sender: TObject);
    procedure ActEnvironmentOptionsExecute(Sender: TObject);
    procedure PaintBoxPaint(Sender: TObject);
    procedure CkDiagramaMemClick(Sender: TObject);
    procedure ActEditFindExecute(Sender: TObject);
    procedure ActEditReplaceExecute(Sender: TObject);
    procedure PnlProgramResize(Sender: TObject);
    procedure LblFntEditorMaisClick(Sender: TObject);
    procedure LblFntEditorMenosClick(Sender: TObject);
  private
    { Private declarations }
    PasInterpreter: TPascalInterpreter;
    FGraphBgColor: TColor;
    FBrush: TBrush;
    FFont: TFont;
    FPen: TPen;
    FTicksBefore: DWORD;
    FTicksAfter: DWORD;
    FDebugging: Boolean;
    FRunning: Boolean;
    FDebLin: Integer;
    FDebCol: Integer;
    FDebParser: TPascalTokenizer;
    FEditorFont: TFont;
    FClosing: Boolean;
    FBitmapRoutine: TBitmap;
    FMouseX: Integer;
    FMouseY: Integer;
    FChangingShowMem: Boolean;

    procedure DestroyCanvas;
    procedure RestoreCanvas;
    procedure SaveCanvas;
    procedure PasInterpreterDebug(Sender: TObject; Lin, Col: Integer;
      Parser: TPascalTokenizer);
    procedure PasInterpreterWaitFor(Sender: TObject; Events: Integer);
    function VerifInteger(S: String): Boolean;
    function VerifReal(S: String; var Value: Extended): Boolean;
    procedure ErroLeia(Valor, Tipo: String);
    procedure PasInterpreterWrite(Sender: TObject; S: String);
    procedure PasInterpreterReadChar(Sender: TObject; var Value: Char);
    procedure PasInterpreterReadInteger(Sender: TObject;
      var Value: Integer);
    procedure PasInterpreterReadReal(Sender: TObject; var Value: Extended);
    procedure PasInterpreterReadString(Sender: TObject; var Value: String);
    function MsgUserInput(DefaultType: String): String;
    procedure AjustaLabelsFonteEditor;
  protected
    procedure WMInitEditor(var Msg: TMessage); message WM_INIT_EDITOR;
  public
    { Public declarations }
    FEvents: Integer;
    FWaitingFor: Boolean;
    procedure BeforeRun;
    procedure AfterRun;
    procedure BeforeDebugging;
    procedure AfterDebugging;
    procedure BeforeWaitFor;
    procedure AfterWaitFor;
    property GraphBgColor: TColor read FGraphBgColor;
    property Closing: Boolean read FClosing;
  end;

var
  FrmDSL: TFrmDSL;

implementation

{$R *.DFM}

uses
  Registry, port_UFrmExamples, port_UFrmWatches, port_UFrmAbout, port_UFrmLeia,
  port_UFrmMemoria, port_UFrmConfig, UFrmExample2;

const
  sNaoExibirDiagramaMem = 'Não exibir o diagrama';
  sExibirDiagramaMem = 'Exibir o diagrama';

procedure TFrmDSL.ActEditSelectAllExecute(Sender: TObject);
begin
  FrmEditor.AdvMemo1.SelectAll;
end;

procedure TFrmDSL.ActEditCutExecute(Sender: TObject);
begin
  FrmEditor.AdvMemo1.CutToClipBoard;
end;

procedure TFrmDSL.ActEditCopyExecute(Sender: TObject);
begin
  FrmEditor.AdvMemo1.CopyToClipBoard;
end;

procedure TFrmDSL.ActEditPasteExecute(Sender: TObject);
begin
  FrmEditor.AdvMemo1.PasteFromClipBoard;
end;

procedure TFrmDSL.ActFileSaveAsExecute(Sender: TObject);
begin
  FrmEditor.SaveFileAs;
end;

procedure TFrmDSL.ActFileSaveExecute(Sender: TObject);
begin
  FrmEditor.SaveFile;
end;

procedure TFrmDSL.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (FDebugging or FRunning) then
  begin
    ShowMessage('Por favor, termine a execução do programa antes de fechar o SW-Tutor.');
    CanClose := False;
    Exit;
  end;
  CanClose := FrmEditor.CloseAllTabs <> mrCancel;
  if CanClose then
    FClosing := True;
end;

procedure TFrmDSL.ActFileOpenExecute(Sender: TObject);
begin
  FrmEditor.OpenTab;
end;

procedure TFrmDSL.FormResize(Sender: TObject);
begin
  PnlLogo.Left := Width - PnlLogo.Width - 20;

  // ajusta a posição dos labels para aumentar/diminuir a fonte do editor
  AjustaLabelsFonteEditor;
end;

procedure TFrmDSL.FormCreate(Sender: TObject);
var
  FS: TFormatSettings;
begin
  // separador de decimais: sempre o ponto
  FS := TFormatSettings.Create();
  FS.DecimalSeparator := '.';

  // cria o form com os exemplos
//  FrmExamples := TFrmExamples.Create(Application);

  // cria e inicializa o interpretador
  PasInterpreter := TPascalInterpreter.Create(nil);
  PasInterpreter.OnDebug := PasInterpreterDebug;
  PasInterpreter.OnReadChar := PasInterpreterReadChar;
  PasInterpreter.OnReadInteger := PasInterpreterReadInteger;
  PasInterpreter.OnReadReal := PasInterpreterReadReal;
  PasInterpreter.OnReadString := PasInterpreterReadString;
  PasInterpreter.OnWrite := PasInterpreterWrite;
  PasInterpreter.OnWaitFor := PasInterpreterWaitFor;
  PasInterpreter.Canvas := PaintBox.Canvas;

  // exibe o diagrama da memória
  ActShowMemoryExecute(nil);

  FGraphBgColor := clBtnFace;
  SaveCanvas;

  // prepara o bitmap para indicar chamada de rotina no diagrama da memória
  FBitmapRoutine := TBitmap.Create;
  ToolbarImages.GetBitmap(22, FBitmapRoutine);

  // ajusta a posição dos labels para aumentar/diminuir a fonte do editor
  LblFntEditorMenos.Left := 3;
  LblFntEditorMenos.Top := 2;
  LblFntEditorMais.Left := PnlProgram.Width - 5;
  LblFntEditorMais.Top := 2;

  // prepara pra inicializar o editor
  PostMessage(Handle, WM_INIT_EDITOR, 0, 0);
end;

procedure TFrmDSL.ActFileCloseExecute(Sender: TObject);
begin
  FrmEditor.CloseTab;
end;

procedure TFrmDSL.ActFileExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmDSL.ActFileNewExecute(Sender: TObject);
begin
  FrmEditor.NewTab;
end;

procedure TFrmDSL.BeforeRun;
var
  Color: TColor;
begin
  ActInterpreterRun.Enabled := False;
  ActInterpreterRunToCursor.Enabled := False;
  ActInterpreterRunToNextStmt.Enabled := False;
  ActInterpreterStop.Enabled := True;
  ActInterpreterPause.Enabled := True;
  ActShowMemory.Enabled := False;
  Exibir1.Enabled := False;
  ExibirMemoria.Enabled := False;
  CkDiagramaMem.Enabled := False;

  MemoSaida.Clear;
  RestoreCanvas;

  with PaintBox.Canvas do
  begin
    Color := Brush.Color;
    Brush.Color := GraphBgColor;
    FillRect(Rect(0, 0, PaintBox.Width, PaintBox.Height));
    Brush.Color := Color;
    MoveTo(0,0);
  end;

  FTicksBefore := 0;
  FTicksAfter := 0;
  FrmEditor.EditorsReadOnly(True);
  Status.Panels[1].Text := 'Executando...';
  FDebugging := False;
  FRunning := True;
  FrmMemoria.IniciaAtualizacao;

  FDebLin := FrmEditor.AdvMemo1.CurY + 1;
  FDebCol := FrmEditor.AdvMemo1.CurX + 1;
  FrmEditor.ShowLine(FDebLin, FDebCol, False);

  TimerEvent.Interval := 1000;
  TimerEvent.Enabled := True;
end;

procedure TFrmDSL.AfterRun;
begin
  ActInterpreterRun.Enabled := True;
  ActInterpreterRunToCursor.Enabled := True;
  ActInterpreterRunToNextStmt.Enabled := True;
  ActInterpreterStop.Enabled := False;
  ActInterpreterPause.Enabled := False;
  ActShowMemory.Enabled := True;
  Exibir1.Enabled := True;
  ExibirMemoria.Enabled := True;
  CkDiagramaMem.Enabled := True;

  FRunning := False;

  if FTicksAfter <> 0 then
    Status.Panels[1].Text :=
      IntToStr(FTicksAfter - FTicksBefore) + ' ms'
  else
    Status.Panels[1].Text := '';

  FrmEditor.EditorsReadOnly(False);
  FrmMemoria.TerminaAtualizacao;
  TimerEvent.Enabled := False;

//  FrmEditor.ShowLine(FDebLin, FDebCol, False);
end;

procedure TFrmDSL.ActInterpreterRunExecute(Sender: TObject);

  function MessageString(E: EInterpreterException): String;
  begin
    Result := E.Message + #13#10 + 'Linha: ' + IntToStr(E.Line) +
      ' Coluna: ' + IntToStr(E.Col);
  end;

begin
  try
    if FDebugging then
    begin
      FDebugging := False;
      Exit;
    end;

    BeforeRun;
    try
      FTicksBefore := GetTickCount;
      PasInterpreter.Run(FrmEditor.SourceCode(), FrmEditor.FileName());
      FTicksAfter := GetTickCount;
    finally
      AfterRun;
    end;
  except
    on E: EInterpreterException do
    begin
      if E.Message <> '' then
        MessageDlg(MessageString(E), mtError, [mbOK], 0);
      if E.Parser <> nil then
        FrmEditor.ShowTab(E.Parser.Name);
      FrmEditor.ShowLine(E.Line, E.Col, E.Message <> '');
    end;
  end;
end;

procedure TFrmDSL.RestoreCanvas;
begin
  PaintBox.Canvas.Brush.Assign(FBrush);
  PaintBox.Canvas.Font.Assign(FFont);
  PaintBox.Canvas.Pen.Assign(FPen);

(*
  ImgTela.Canvas.Brush.Assign(FBrush);
  ImgTela.Canvas.Font.Assign(FFont);
  ImgTela.Canvas.Pen.Assign(FPen);
*)
end;

procedure TFrmDSL.SaveCanvas;
begin
  PaintBox.Canvas.Brush.Color := PaintBox.Color;
  FBrush := TBrush.Create;
  FBrush.Assign(PaintBox.Canvas.Brush);
  FFont := TFont.Create;
  FFont.Assign(PaintBox.Canvas.Font);
  FFont.Name := 'Arial';
  FPen := TPen.Create;
  FPen.Assign(PaintBox.Canvas.Pen);
(*
  FBrush := TBrush.Create;
  FBrush.Assign(ImgTela.Canvas.Brush);
  FFont := TFont.Create;
  FFont.Assign(ImgTela.Canvas.Font);
  FPen := TPen.Create;
  FPen.Assign(ImgTela.Canvas.Pen);
*)
end;

procedure TFrmDSL.DestroyCanvas;
begin
  FBrush.Free;
  FFont.Free;
  FPen.Free;
end;

procedure TFrmDSL.ActFileOpenExampleExecute(Sender: TObject);
begin
  if FrmExample2.Execute() then
    FrmExample2.CarregaExemploSelecionado();
end;

procedure TFrmDSL.ActInterpreterStopExecute(Sender: TObject);
begin
  PasInterpreter.Stop;
  FDebugging := False;
  FWaitingFor := False;
end;

procedure TFrmDSL.FormDestroy(Sender: TObject);
begin
  DestroyCanvas;
  FEditorFont.Free;
  FBitmapRoutine.Free;
end;

procedure TFrmDSL.ActInterpreterPauseExecute(Sender: TObject);
begin
  PasInterpreter.BreakOnNextStatement;
  FDebugging := False;
end;

procedure TFrmDSL.BeforeDebugging;
begin
  ActInterpreterRun.Enabled := True;
  ActInterpreterRunToCursor.Enabled := True;
  ActInterpreterRunToNextStmt.Enabled := True;
  ActInterpreterStop.Enabled := True;
  ActInterpreterPause.Enabled := False;
  ActShowMemory.Enabled := True;
  FrmEditor.ShowTab(FDebParser.Name);
  FrmEditor.ShowLine(FDebLin, FDebCol, True);
  FrmMemoria.TerminaAtualizacao;
  Status.Panels[1].Text := 'Depurando...';
end;

procedure TFrmDSL.AfterDebugging;
begin
  ActInterpreterRun.Enabled := False;
  ActInterpreterRunToCursor.Enabled := False;
  ActInterpreterRunToNextStmt.Enabled := False;
  ActInterpreterStop.Enabled := True;
  ActInterpreterPause.Enabled := True;
  ActShowMemory.Enabled := False;

  FrmEditor.ShowLine(FDebLin, FDebCol, False);

  FrmMemoria.IniciaAtualizacao;
  Status.Panels[1].Text := 'Executando...';
end;

procedure TFrmDSL.BeforeWaitFor;
begin
  Status.Panels[1].Text := 'Esperando...';
end;

procedure TFrmDSL.AfterWaitFor;
begin
  Status.Panels[1].Text := 'Executando...';
end;

procedure TFrmDSL.ActInterpreterRunToNextStmtExecute(Sender: TObject);
begin
  PasInterpreter.BreakOnNextStatement;
  if (not FDebugging) and (not FRunning) then
    ActInterpreterRunExecute(Self);
  FDebugging := False;
end;

procedure TFrmDSL.ActInterpreterRunToCursorExecute(Sender: TObject);
//var
//  LineNo: Integer;
begin
  FDebLin := FrmEditor.AdvMemo1.CurY + 1;
  FDebCol := FrmEditor.AdvMemo1.CurX + 1;
  //LineNo := FrmEditor.AdvMemo1.CurY;
  PasInterpreter.SetBreakpoint(FrmEditor.FileName(), FDebLin);
  if (not FDebugging) and (not FRunning) then
    ActInterpreterRunExecute(Self);
  FDebugging := False;
end;

procedure TFrmDSL.PasInterpreterDebug(Sender: TObject; Lin, Col: Integer;
  Parser: TPascalTokenizer);
begin
  // registra linha, coluna e parser
  FDebLin := Lin;
  FDebCol := Col;
  FDebParser := Parser;

  // depura
  BeforeDebugging;
  try
    FDebugging := True;
    while FDebugging do
      Application.ProcessMessages;
  finally
    AfterDebugging;
  end;
end;

procedure TFrmDSL.PasInterpreterWaitFor(Sender: TObject; Events: Integer);
begin
  FEvents := Events;

  // habilita o timer, se for o caso
//  if (EV_TIME and FEvents) <> 0 then
//    TimerEvent.Enabled := True;

  BeforeWaitFor;
  try
    FWaitingFor := True;
    while FWaitingFor do
      Application.ProcessMessages;
  finally
    AfterWaitFor;
  end;
end;

procedure TFrmDSL.PasInterpreterWrite(Sender: TObject; S: String);
begin
  // ajusta CRLF no lugar de LF (\n)
  S := AdjustLineBreaks(S, tlbsCRLF);
  MemoSaida.Text := MemoSaida.Text + S;
  MemoSaida.SelStart := Length(MemoSaida.Text) - 1;

  // verifica limite
  if Length(MemoSaida.Text) >= MEM_MEMO_SAIDA_MAX then
    raise EInterpreterException.Create(sMemoSaidaMax, 1, 1, nil);

end;

procedure TFrmDSL.PasInterpreterReadChar(Sender: TObject;
  var Value: Char);
var
  S: String;
  Ok: Boolean;
begin
  repeat
    FrmLeia.Leia('SW-Tutor', MsgUserInput('caractere'), S);
    Ok := Length(S) = 1;
    if not Ok then
      ErroLeia(S, 'caractere');
  until Ok;
  Value := S[1];
  // exibe na saída de texto
  PasInterpreterWrite(nil, S + #13#10);
end;

procedure TFrmDSL.PasInterpreterReadInteger(Sender: TObject;
  var Value: Integer);
var
  S: String;
  Ok: Boolean;
begin
  repeat
    FrmLeia.Leia('SW-Tutor', MsgUserInput('inteiro'), S);
    Ok := VerifInteger(S);
    if not Ok then
      ErroLeia(S, 'inteiro');
  until Ok;
  Value := StrToInt(S);
  PasInterpreterWrite(nil, S + #13#10);
end;

procedure TFrmDSL.PasInterpreterReadReal(Sender: TObject;
  var Value: Extended);
var
  S: String;
  Ok: Boolean;
  SaveDecSep: Char;
begin
  SaveDecSep := SysUtils.FormatSettings.DecimalSeparator;
  SysUtils.FormatSettings.DecimalSeparator := '.';
  repeat
    FrmLeia.Leia('SW-Tutor', MsgUserInput('real'), S);
    Ok := VerifReal(S, Value);
    if not Ok then
      ErroLeia(S, 'real');
  until Ok;
  PasInterpreterWrite(nil, S + #13#10);
  SysUtils.FormatSettings.DecimalSeparator := SaveDecSep;
end;

procedure TFrmDSL.PasInterpreterReadString(Sender: TObject;
  var Value: String);
begin
  FrmLeia.Leia('SW-Tutor', MsgUserInput('texto'), Value);
  PasInterpreterWrite(nil, Value + #13#10);
end;

function TFrmDSL.MsgUserInput(DefaultType: String): String;
begin
  Result := 'Entre com um valor do tipo ' + DefaultType;
  if MemoSaida.Lines.Count > 0 then
    Result := MemoSaida.Lines[MemoSaida.Lines.Count - 1];
end;

procedure TFrmDSL.ActHelpAboutExecute(Sender: TObject);
begin
  FrmAbout.ShowModal;
end;

procedure TFrmDSL.PaintBoxClick(Sender: TObject);
begin
  if FWaitingFor then
    if (EV_MOUSE_CLICK and FEvents) <> 0 then
    begin
      PasInterpreter.RegisterMouseXY(FMouseX, FMouseY);
      FWaitingFor := False; // libera a espera por evento
      PasInterpreter.RegisterLastEvent(EV_MOUSE_CLICK, Sender);
    end;
end;

procedure TFrmDSL.PaintBoxMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  FMouseX := X;
  FMouseY := Y;
  if FWaitingFor then
    if (EV_MOUSE_MOVE and FEvents) <> 0 then
    begin
      PasInterpreter.RegisterMouseXY(X, Y);
      PasInterpreter.RegisterShiftState(Shift);
      FWaitingFor := False; // libera a espera por evento
      PasInterpreter.RegisterLastEvent(EV_MOUSE_MOVE, Sender);
    end;
end;

procedure TFrmDSL.PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMouseX := X;
  FMouseY := Y;
  if FWaitingFor then
    if (EV_MOUSE_DOWN and FEvents) <> 0 then
    begin
      PasInterpreter.RegisterMouseXY(X, Y);
      PasInterpreter.RegisterShiftState(Shift);
      FWaitingFor := False; // libera a espera por evento
      PasInterpreter.RegisterLastEvent(EV_MOUSE_DOWN, Sender);
    end;
end;

procedure TFrmDSL.PaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMouseX := X;
  FMouseY := Y;
  if FWaitingFor then
    if (EV_MOUSE_UP and FEvents) <> 0 then
    begin
      PasInterpreter.RegisterMouseXY(X, Y);
      PasInterpreter.RegisterShiftState(Shift);
      FWaitingFor := False; // libera a espera por evento
      PasInterpreter.RegisterLastEvent(EV_MOUSE_UP, Sender);
    end;
end;

procedure TFrmDSL.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FWaitingFor then
    if (EV_KEYBOARD and FEvents) <> 0 then
    begin
      PasInterpreter.RegisterKeyPressed(Key);
      FWaitingFor := False; // libera a espera por evento
      PasInterpreter.RegisterLastEvent(EV_KEYBOARD, Sender);
      Key := #0;
    end;
end;

procedure TFrmDSL.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  KeyAux: Char;
begin
  PasInterpreter.RegisterKeyDown(Key);
  PasInterpreter.RegisterShiftState(Shift);

  // verifique casos de teclas especiais
  KeyAux := #0;
  case Key of
    VK_INSERT:     KeyAux := TECLA_INS;
    VK_DELETE:     KeyAux := TECLA_DEL;
    VK_HOME:       KeyAux := TECLA_HOME;
    VK_END:        KeyAux := TECLA_END;

    VK_LEFT:       KeyAux := TECLA_ESQUERDA;
    VK_UP:         KeyAux := TECLA_CIMA;
    VK_RIGHT:      KeyAux := TECLA_DIREITA;
    VK_DOWN:       KeyAux := TECLA_BAIXO;

    VK_PRIOR:      KeyAux := TECLA_PGUP;
    VK_NEXT:       KeyAux := TECLA_PGDN;

    VK_F1:         KeyAux := TECLA_F1;
    VK_F2:         KeyAux := TECLA_F2;
    VK_F3:         KeyAux := TECLA_F3;
    VK_F4:         KeyAux := TECLA_F4;
    VK_F5:         KeyAux := TECLA_F5;
    VK_F6:         KeyAux := TECLA_F6;
    VK_F7:         KeyAux := TECLA_F7;
    VK_F8:         KeyAux := TECLA_F8;
    VK_F9:         KeyAux := TECLA_F9;
    VK_F10:        KeyAux := TECLA_F10;
    VK_F11:        KeyAux := TECLA_F11;
    VK_F12:        KeyAux := TECLA_F12;
  end;
  if KeyAux <> #0 then
  begin
    PasInterpreter.RegisterKeyPressed(KeyAux);
    if FWaitingFor then
      if (EV_KEYBOARD and FEvents) <> 0 then
      begin
        FWaitingFor := False; // libera a espera por evento
        PasInterpreter.RegisterLastEvent(EV_KEYBOARD, Sender);
      end;
  end;
end;

procedure TFrmDSL.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  PasInterpreter.RegisterKeyUp(Key);
  PasInterpreter.RegisterShiftState(Shift);
end;

procedure TFrmDSL.ActShowMemoryExecute(Sender: TObject);
begin
  if ExibirMemoria.Checked then
  begin
    SplitterMemoria.Visible := False;
    PnlMemoria.Visible := False;
  end
  else begin
    PnlMemoria.Visible := True;
    SplitterMemoria.Visible := True;
  end;
  ExibirMemoria.Checked := not ExibirMemoria.Checked;
  FChangingShowMem := True;
  CkDiagramaMem.Checked := ExibirMemoria.Checked;
  FChangingShowMem := False;
end;

procedure TFrmDSL.ListViewMemResize(Sender: TObject);
begin
  if FrmMemoria <> nil then
    FrmMemoria.AtualizaPonteiros;
end;

procedure TFrmDSL.PaintBoxMemPaint(Sender: TObject);
begin
  FrmMemoria.AtualizaPonteiros;
end;

procedure TFrmDSL.TimerEventTimer(Sender: TObject);
begin
//  TimerEvent.Enabled := False;
  if FWaitingFor then
    if (EV_TIME and FEvents) <> 0 then
    begin
      FWaitingFor := False; // libera a espera por evento
      PasInterpreter.RegisterLastEvent(EV_TIME, Sender);
    end;
end;

procedure TFrmDSL.ListViewMemCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  // inclui bitmap só se for rotina
  if (Item.Data <> Pointer(-1)) then
    Exit;

  // desenhe o bitmap e o texto
  Sender.Canvas.Draw(Item.Left, Item.Top, FBitmapRoutine);
  Sender.Canvas.TextOut(Item.Left + 18, Item.Top, Item.Caption);
  DefaultDraw := False;
end;

procedure TFrmDSL.PnlSaidaResize(Sender: TObject);
begin
  // ajusta a posição dos labels para aumentar/diminuir a fonte do editor
  AjustaLabelsFonteEditor;

  if FWaitingFor then
    if (EV_RESIZE and FEvents) <> 0 then
    begin
      FWaitingFor := False; // libera a espera por evento
      PasInterpreter.RegisterLastEvent(EV_RESIZE, Sender);
    end;
end;

procedure TFrmDSL.ActEnvironmentOptionsExecute(Sender: TObject);
begin
  FrmConfig.Execute;
end;

procedure TFrmDSL.PaintBoxPaint(Sender: TObject);
begin
  PasInterpreter.TrataOnPaint(Sender);
end;

procedure TFrmDSL.ErroLeia(Valor, Tipo: String);
begin
  ShowMessage('"' + Valor + '" não é um valor válido para o tipo ' +
              Tipo + '.' + #13#10 +
              'Por favor entre com um valor do tipo ' + Tipo);
end;

function TFrmDSL.VerifInteger(S: String): Boolean;
begin
  Result := True;
  try
    StrToInt(S);
  except
    Result := False;
  end;
end;

function TFrmDSL.VerifReal(S: String; var Value: Extended): Boolean;
var
  SaveDecSep: Char;
begin
  SaveDecSep := SysUtils.FormatSettings.DecimalSeparator;
  SysUtils.FormatSettings.DecimalSeparator := '.';
  Result := True;
  try
    Value := StrToFloat(S);
  except
    Result := False;
  end;
  SysUtils.FormatSettings.DecimalSeparator := SaveDecSep;
end;

procedure TFrmDSL.WMInitEditor(var Msg: TMessage);
begin
  FrmEditor.SetMainFormControls(PnlEditor, PnlProgram, Status, RichEditDoc);
end;

procedure TFrmDSL.CkDiagramaMemClick(Sender: TObject);
begin
  if FChangingShowMem then
    Exit;
  ActShowMemoryExecute(nil);
end;

procedure TFrmDSL.ActEditFindExecute(Sender: TObject);
begin
  FrmEditor.FindDialog.Execute;
end;

procedure TFrmDSL.ActEditReplaceExecute(Sender: TObject);
begin
  FrmEditor.ReplaceDialog.Execute;
end;

// ajusta a posição dos labels para aumentar/diminuir a fonte do editor
procedure TFrmDSL.AjustaLabelsFonteEditor;
begin
  LblFntEditorMenos.Left := 4;
  LblFntEditorMenos.Top := 1;
  LblFntEditorMais.Left := PnlProgram.Width - 13;
  LblFntEditorMais.Top := 1;
end;

procedure TFrmDSL.PnlProgramResize(Sender: TObject);
begin
  AjustaLabelsFonteEditor;
end;

procedure TFrmDSL.LblFntEditorMaisClick(Sender: TObject);
const
  MAX_FONTE = 15;
begin
  with FrmEditor.AdvMemo1 do
    if Font.Size < MAX_FONTE then
    begin
      Font.Size := Font.Size + 1;
      FrmConfig.alt_tam_fonte_editor(Font.Size);
    end;
end;

procedure TFrmDSL.LblFntEditorMenosClick(Sender: TObject);
const
  MIN_FONTE = 6;
begin
  with FrmEditor.AdvMemo1 do
    if Font.Size > MIN_FONTE then
    begin
      Font.Size := Font.Size - 1;
      FrmConfig.alt_tam_fonte_editor(Font.Size);
    end;
end;

end.

