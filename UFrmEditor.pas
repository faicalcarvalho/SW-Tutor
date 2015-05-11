unit UFrmEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Contnrs, AdvMemo, AdvmPS, Menus, ActnList,
  ExtCtrls, AdvFindDialogForm, AdvReplaceDialogForm;

type
  TTabDescriptor = class;

  TFrmEditor = class(TForm)
    Tab: TTabControl;
    AdvMemo1: TAdvMemo;
    LblPosition: TLabel;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    PopupMenu1: TPopupMenu;
    Abrirnovaaba1: TMenuItem;
    Fecharestaaba1: TMenuItem;
    ReplaceDialog: TAdvMemoFindReplaceDialog;
    AdvReplaceDialog1: TAdvReplaceDialog;
    FindDialog: TAdvMemoFindDialog;
    AdvFindDialog1: TAdvFindDialog;
    procedure AdvMemo1CursorChange(Sender: TObject);
    procedure TabChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Abrirnovaaba1Click(Sender: TObject);
    procedure Fecharestaaba1Click(Sender: TObject);
    procedure AdvMemo1Change(Sender: TObject);
  private
    { Private declarations }
    TabDescriptorList: TList;
    FSemTituloCont: Integer;
    FCreatingNewTab: Boolean;
    FTabParent: TWinControl;
    FPnlProgram: TPanel;
    FStatusBar: TStatusBar;
    FRichEditDoc: TRichEdit;
    FClosingAll: Boolean;
    FTabWithActiveLine: TTabDescriptor;
    FActiveLine: Integer;
    FUltimoDoc: String;
    procedure ShowPos;
  public
    { Public declarations }
    Lume_br_styler: TAdvPascalMemoStyler;
    function AddTab(TabContents: TStrings; FileName: String;
                    IsExample: Boolean): TTabDescriptor;
    procedure InitialTab;
    function OpenTab: TTabDescriptor;
    function NewTab: TTabDescriptor;
    function CloseTab(): Integer;
    function CloseAllTabs(): Integer;
    function SaveFileAs(): Integer;
    function SaveFile(): Integer;
    function IndexOfFile(FileName: String): Integer;
    function SourceCode: TStringList;
    function FileName: String;
    procedure ShowLine(Line, Col: Integer; Show: Boolean);
    procedure ShowLineOld(Line: Integer; Show: Boolean);
    procedure ShowTab(FileName: String);
    procedure EditorsReadOnly(Value: Boolean);
    procedure ShowDoc(ResName: String);
    procedure SetMainFormControls(TabParent: TWinControl;
                                  PnlProgram: TPanel;
                                  StatusBar: TStatusBar;
                                  RichEditDoc: TRichEdit);
  end;

  TTabDescriptor = class
  public
    FFileName: String;
    FIsExample: Boolean;
    FMemoSource: TAdvMemoSource;
    constructor Create(TabContents: TStrings; FileName: String;
                       IsExample: Boolean);
    destructor Destroy; override;
    function TabName: String;
  end;

var
  FrmEditor: TFrmEditor;

implementation

{$R *.dfm}

uses
  UITypes, StrUtils, ULume_br_style, UFrmExample2, port_UFrmConfig, port_UFrmDSL;

{ TTabDescriptor }

constructor TTabDescriptor.Create(TabContents: TStrings; FileName: String;
                                  IsExample: Boolean);
begin
  FFileName := FileName;
  FIsExample := IsExample;

  // cria o MemoSource associado
  FMemoSource := TAdvMemoSource.Create(nil);
  FMemoSource.SyntaxStyler := FrmEditor.Lume_br_styler;
  FMemoSource.Lines.Assign(TabContents);
end;

function TTabDescriptor.TabName: String;
begin
  Result := ExtractFileName(FFileName);
//  Result := ChangeFileExt(Result, '');
end;

destructor TTabDescriptor.Destroy;
begin
//  FMemoSource.Free;
  FMemoSource.Lines.Clear; // está havendo um bug com .Free
end;

{ TFrmEditor }

procedure TFrmEditor.ShowPos;
begin
  FStatusBar.Panels[0].Text := IntToStr(AdvMemo1.CurY + 1) + ' : ' +
                               IntToStr(AdvMemo1.CurX + 1);
end;

procedure TFrmEditor.AdvMemo1CursorChange(Sender: TObject);
begin
  ShowPos;
  if not AdvMemo1.MemoSource.ReadOnly then
  begin
    AdvMemo1.ActiveLineSettings.ShowActiveLineIndicator := False;
    AdvMemo1.ActiveLineSettings.ShowActiveLine := False;
  end;
end;

function TFrmEditor.AddTab(TabContents: TStrings; FileName: String;
                           IsExample: Boolean): TTabDescriptor;
var
  Ind: Integer;
begin
  // verifica se o arquivo já está carregado
  Ind := IndexOfFile(FileName);
  if Ind >= 0 then
  begin
    Tab.TabIndex := Ind;
    TabChange(Self);
    Result := TTabDescriptor(TabDescriptorList[Ind]);
    Exit;
  end;

  FCreatingNewTab := True;
  try
    Result := TTabDescriptor.Create(TabContents, FileName, IsExample);
    TabDescriptorList.Add(Result);
    Tab.Tabs.Add(Result.TabName());
    Tab.TabIndex := Tab.Tabs.Count - 1;
    AdvMemo1.MemoSource := Result.FMemoSource;
    FrmDSL.Caption := 'SW-Tutor - ' + Result.TabName();
    FPnlProgram.Caption := Result.TabName();
    if AdvMemo1.Visible then
      AdvMemo1.SetFocus;
    FrmDsl.ActFileSave.Enabled := False;
  finally
    FCreatingNewTab := False;
  end;
end;

procedure TFrmEditor.TabChange(Sender: TObject);
var
  Td: TTabDescriptor;
begin
  if Tab.TabIndex < 0 then
    Exit; // nada a fazer
  Td := TTabDescriptor(TabDescriptorList.Items[Tab.TabIndex]);

  AdvMemo1.ActiveLineSettings.ShowActiveLineIndicator := FTabWithActiveLine = Td;
  AdvMemo1.ActiveLineSettings.ShowActiveLine := FTabWithActiveLine = Td;
  if FTabWithActiveLine <> nil then
    AdvMemo1.ActiveLine := FActiveLine;

  AdvMemo1.MemoSource := Td.FMemoSource;
  if AdvMemo1.Visible then
    AdvMemo1.SetFocus;
  FPnlProgram.Caption := Td.TabName();
  FrmDSL.Caption := 'SW-Tutor - ' + Td.TabName();
  ShowPos;
  FrmDsl.ActFileSave.Enabled := Td.FMemoSource.Modified;
end;

procedure TFrmEditor.FormCreate(Sender: TObject);
begin
  TabDescriptorList := TList.Create;
  Lume_br_styler := CreateLumeBrStyler(Self);
end;

procedure TFrmEditor.InitialTab;
begin
  FrmExample2.CarregaPrimeiroExemplo;
end;

procedure TFrmEditor.FormDestroy(Sender: TObject);
begin
//  TabDescriptorList.Free;
end;

function TFrmEditor.SaveFile: Integer;
var
  Td: TTabDescriptor;
begin
  Result := mrYes;
  if Tab.TabIndex < 0 then
    Exit; // nada a fazer
  Td := TTabDescriptor(TabDescriptorList.Items[Tab.TabIndex]);

  if ((not Td.FMemoSource.Modified) and (not Td.FIsExample)) then
    Exit; // nada a fazer

  if Td.FIsExample then
  begin
    Result := SaveFileAs();
    Exit;
  end
  else
  begin
    Td.FMemoSource.Lines.SaveToFile(Td.FFileName);;
    Td.FIsExample := False;
    Td.FMemoSource.Modified := False;
    FrmDsl.ActFileSave.Enabled := Td.FMemoSource.Modified;
  end;
end;

function TFrmEditor.SaveFileAs: Integer;
const
  SWarningText = 'O arquivo %s já existe. Deseja substituí-lo?';
var
  Td: TTabDescriptor;
begin
  Result := mrNo;
  if Tab.TabIndex < 0 then
    Exit; // nada a fazer
  Td := TTabDescriptor(TabDescriptorList.Items[Tab.TabIndex]);
  SaveDialog.FileName := Td.FFileName;

  if not SaveDialog.Execute then
  begin
    Result := mrCancel;
    Exit; // nada a fazer
  end
  else
    Result := mrYes;

  if FileExists(SaveDialog.FileName) then
    Result := MessageDlg(Format(SWarningText, [Td.FFileName]),
                         mtConfirmation, [mbYes, mbNo, mbCancel], 0);
  if (Result in [mrNo, mrCancel]) then
    Exit; // nada mais a fazer

  // salva o arquivo
  Td.FFileName := SaveDialog.FileName;
  Td.FMemoSource.Lines.SaveToFile(Td.FFileName);
  Td.FIsExample := False;
  Td.FMemoSource.Modified := False;
  Tab.Tabs[Tab.TabIndex] := Td.TabName();
  TabChange(Self);
end;

function TFrmEditor.CloseTab: Integer;
const
  SWarningText = 'Deseja salvar as alterações feitas em %s?';
var
  Td: TTabDescriptor;
  Ind: Integer;
begin
  Result := mrNo;
  if Tab.TabIndex < 0 then
    Exit; // nada a fazer; não deve acontecer

  Td := TTabDescriptor(TabDescriptorList.Items[Tab.TabIndex]);
  if Td.FMemoSource.Modified then
    Result := MessageDlg(Format(SWarningText, [Td.FFileName]),
                         mtConfirmation, [mbYes, mbNo, mbCancel], 0);

  // Se cancelou, nada mais a fazer
  if Result = mrCancel then
    Exit;

  // Verifica se é pra salvar antes de fechar
  if Result = mrYes then
    Result := SaveFile;

  // Testa de novo: Se cancelou, nada mais a fazer
  if Result = mrCancel then
    Exit;

  // fecha
  Ind := Tab.TabIndex;
  TabDescriptorList.Delete(Ind);
  Tab.Tabs.Delete(Ind);
  if Tab.Tabs.Count > 0 then
  begin
    if Ind >= Tab.Tabs.Count then
      Tab.TabIndex := Tab.Tabs.Count - 1
    else
      Tab.TabIndex := Ind;
  end
  else if not FClosingAll then
    InitialTab;
  Td.Free;
  if not FClosingAll then TabChange(Self);
end;

function TFrmEditor.OpenTab: TTabDescriptor;
var
  S: TStringList;
  Ind: Integer;
begin
  Result := nil;
  OpenDialog.FileName := '';
  if (not OpenDialog.Execute) then
    Exit; // nada a fazer

  // verifica se o arquivo já está aberto em alguma aba
  Ind := IndexOfFile(OpenDialog.FileName);
  if Ind >= 0 then
  begin
    Tab.TabIndex := Ind;
    TabChange(Self);
    Exit;
  end;

  S := TStringList.Create;
  S.LoadFromFile(OpenDialog.FileName);
  Result := AddTab(S, OpenDialog.FileName, False);
  S.Free;
end;

function TFrmEditor.NewTab: TTabDescriptor;
var
  S: TStringList;
  FileName: String;
begin
  S := TStringList.Create;
  Inc(FSemTituloCont);
  FileName := 'sem_título' + IntToStr(FSemTituloCont) +
              FrmConfig.ExtensaoDefaultPrg();
  Result := AddTab(S,  FileName, False);
  S.Free;
end;

procedure TFrmEditor.Abrirnovaaba1Click(Sender: TObject);
begin
  NewTab;
end;

procedure TFrmEditor.Fecharestaaba1Click(Sender: TObject);
begin
  CloseTab;
end;

function TFrmEditor.CloseAllTabs: Integer;

  function IndexOfModified(): Integer;
  var I: Integer;
  begin
    Result := -1;
    if Tab.Tabs.Count = 0 then
      Exit;
    for I := Tab.Tabs.Count - 1 downto 0 do
      if TTabDescriptor(TabDescriptorList[I]).FMemoSource.Modified then
      begin
        Result := I;
        Exit;
      end;
  end;

  function CloseModified(): Integer;
  var
    Ind: Integer;
  begin
    Result := mrCancel;
    Ind := IndexOfModified();
    if Ind = -1 then
      Exit;
    Tab.TabIndex := Ind;
    Result := CloseTab();
  end;

begin
  FClosingAll := True;
  try
    repeat
      Result := CloseModified();
    until (Result = mrCancel);
    if (Tab.Tabs.Count = 0) or (IndexOfModified() = -1) then
      Result := mrYes;
  finally
    FClosingAll := False;
  end;
end;

function TFrmEditor.IndexOfFile(FileName: String): Integer;
var
  I: Integer;

  function FileNamesAreEqual(F1, F2: String): Boolean;
  begin
    Result := UpperCase(F1) = UpperCase(F2);
  end;

begin
  Result := -1;
  for I := 0 to TabDescriptorList.Count - 1 do
    if FileNamesAreEqual(TTabDescriptor(TabDescriptorList.Items[I]).FFileName,
                         FileName) then
    begin
      Result := I;
      Exit;
    end;
end;

function TFrmEditor.SourceCode: TStringList;
var
  Td: TTabDescriptor;
begin
  Result := nil;
  if Tab.TabIndex < 0 then
    Exit; // nunca deve acontecer
  Td := TTabDescriptor(TabDescriptorList.Items[Tab.TabIndex]);
  Result := Td.FMemoSource.Lines;
end;

function TFrmEditor.FileName: String;
var
  Td: TTabDescriptor;
begin
  Result := '';
  if Tab.TabIndex < 0 then
    Exit; // nunca deve acontecer
  Td := TTabDescriptor(TabDescriptorList.Items[Tab.TabIndex]);
  Result := Td.FFileName;
end;

procedure TFrmEditor.ShowLine(Line, Col: Integer; Show: Boolean);
begin
  FActiveLine := Line - 1;
  if Show then
    FTabWithActiveLine := TTabDescriptor(TabDescriptorList.Items[Tab.TabIndex])
  else
    FTabWithActiveLine := nil;
  AdvMemo1.CurX := Col - 1;
  AdvMemo1.CurY := Line - 1;
  TabChange(Self);
end;

procedure TFrmEditor.ShowTab(FileName: String);

  procedure ShowThisFile(FileName: String);
  var
    Ts: TStringList;
  begin
    if not FileExists(FileName) then
      Exit; // não deve acontecer
    Ts := TStringList.Create;
    Ts.LoadFromFile(FileName);
    AddTab(Ts, FileName, False);
    Ts.Free;
  end;

var
  Ind: Integer;
begin
  Ind := IndexOfFile(FileName);
  if Ind < 0 then
    ShowThisFile(FileName)
  else
  begin
    Tab.TabIndex := Ind;
    TabChange(Self);
  end;
end;

procedure TFrmEditor.EditorsReadOnly(Value: Boolean);
var
  I: Integer;
  Td: TTabDescriptor;
begin
  for I := 0 to TabDescriptorList.Count - 1 do
  begin
    Td := TTabDescriptor(TabDescriptorList.Items[I]);
    Td.FMemoSource.ReadOnly := Value;
  end;
end;

procedure TFrmEditor.SetMainFormControls(TabParent: TWinControl;
                                         PnlProgram: TPanel;
                                         StatusBar: TStatusBar;
                                         RichEditDoc: TRichEdit);
begin
  FTabParent := TabParent;
  FPnlProgram := PnlProgram;
  FStatusBar := StatusBar;
  FRichEditDoc := RichEditDoc;

  // carrega no editor o primeiro exemplo
  Tab.Align := alClient;
  Tab.Parent := FTabParent;
  InitialTab;

  AdvMemo1.Font.Size := FrmConfig.obt_tam_fonte_editor();
end;

procedure TFrmEditor.ShowLineOld(Line: Integer; Show: Boolean);
begin
  AdvMemo1.ActiveLine := Line - 1;
//  AdvMemo1.ActiveLineSettings.ShowActiveLineIndicator := Show;
//  AdvMemo1.ActiveLineSettings.ShowActiveLine := Show;
//  AdvMemo1.ActiveLineSettings.ActiveLineAtCursor := Show;
  AdvMemo1.HiddenCaret := Show;
  if Show then
  begin
    AdvMemo1.ActiveLineSettings.ActiveLineTextColor := clWhite;
    AdvMemo1.ActiveLineSettings.ActiveLineColor := clNavy;
  end
  else
  begin
    AdvMemo1.ActiveLineSettings.ActiveLineTextColor := clBlack;
    AdvMemo1.ActiveLineSettings.ActiveLineColor := clWhite;
  end;
end;

procedure TFrmEditor.ShowDoc(ResName: String);
var
  Res: TResourceStream;
begin
  if FUltimoDoc = ResName then
    Exit;

  // cria o resource
  try
    Res := TResourceStream.Create(HInstance, 'Doc-' + ResName, RT_RCDATA);
  except
    Exit; // não encontrou o resource
  end;

  // coloca no rich edit
  FRichEditDoc.Lines.LoadFromStream(Res);
  FUltimoDoc := ResName;

  Res.Free;
end;

procedure TFrmEditor.AdvMemo1Change(Sender: TObject);
begin
  FrmDsl.ActFileSave.Enabled := True;
end;

end.
