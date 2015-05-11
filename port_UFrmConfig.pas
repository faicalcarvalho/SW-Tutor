unit port_UFrmConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Registry;

const
  ARQ_CONFIG = 'swtutor.cfg';
  SEC_MODULOS = 'modulos';
  NUM_DIRS = 'ndir';

  REG_BASE = '\Software\Decarva\SW-Tutor\';
  REG_EDITOR = 'Editor\';

type
  TFrmConfig = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    BtnOk: TButton;
    BtnCancelar: TButton;
    ListBox: TListBox;
    BtnIncluir: TButton;
    BtnExcluir: TButton;
    procedure FormActivate(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    FStrConfig: String;
    FSalvaDirsModulos: TStringList;
    FRegistry: TRegistry;
    function cria_registry: TRegistry;
    function StrConfig: String;
    function AlterouConfig: Boolean;
    procedure GravaConfig;
    function get_registry: TRegistry;
  public
    { Public declarations }
    procedure alt_tam_fonte_editor(tam: integer);
    function obt_tam_fonte_editor(): integer;
    procedure Execute;
    function NomeModuloCompleto(Nome: String): String;
    function NomeProgramaCompleto(Nome: String): String;
    function NomeArquivoCompleto(Nome: String): String;
    function ExtensaoDefaultPrg: String;
    function IsWindows64: Boolean;
  end;

var
  FrmConfig: TFrmConfig;

implementation

{$R *.dfm}

uses
  IniFiles;

procedure TFrmConfig.FormActivate(Sender: TObject);
begin
  if ListBox.Count > 0 then
    ListBox.Selected[0] := True;
  BtnOk.SetFocus;
end;

procedure TFrmConfig.BtnIncluirClick(Sender: TObject);
begin
(*
  FrmPasta.ShowModal;
  if (FrmPasta.ModalResult = mrOK) then
  begin
    if ListBox.Items.IndexOf(FrmPasta.ShellTreeView.Path) < 0 then
      ListBox.Items.Add(FrmPasta.ShellTreeView.Path);
  end;
*)
end;

function TFrmConfig.StrConfig: String;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to ListBox.Count - 1 do
    Result := Result + ListBox.Items[I] + ';';
end;

function TFrmConfig.AlterouConfig: Boolean;
begin
  Result := FStrConfig <> StrConfig();
end;

procedure TFrmConfig.Execute;
begin
  FStrConfig := StrConfig();
  FSalvaDirsModulos.Assign(ListBox.Items);
  ShowModal;
  if ((ModalResult = mrOK) and (AlterouConfig())) then
    GravaConfig
  else
    ListBox.Items.Assign(FSalvaDirsModulos);
end;

procedure TFrmConfig.GravaConfig;
(*
var
  Ini: TIniFile;
  I: Integer;
*)
begin
  Exit;
(*
  if ListBox.Count = 0 then
  begin
    GravaConfigDefault;
    Exit;
  end;
  Ini := TIniFile.Create(NomeArqConfig());
  try
    Ini.WriteInteger(SEC_MODULOS, NUM_DIRS, ListBox.Count);
    for I := 0 to ListBox.Count - 1 do
      Ini.WriteString(SEC_MODULOS, 'd' + IntToStr(I), ListBox.Items[I]);
  finally
    Ini.Free;
  end;
*)
end;

procedure TFrmConfig.FormCreate(Sender: TObject);
begin
  FSalvaDirsModulos := TStringList.Create;
//  ObtemConfig;
end;

procedure TFrmConfig.BtnExcluirClick(Sender: TObject);
begin
  if ListBox.Count = 0 then
    Exit;
  if ListBox.SelCount = 0 then
    Exit;
  ListBox.DeleteSelected;
end;

function TFrmConfig.NomeModuloCompleto(Nome: String): String;
const
  DIR_MDLS = 'mdls';
begin
  Result := ExtractFilePath(Application.ExeName);
  Result := IncludeTrailingPathDelimiter(Result) + DIR_MDLS;
  if not IsPathDelimiter(Nome, 1) then
    Result := IncludeTrailingPathDelimiter(Result);
  Result := Result + Nome;
(*
  { varre a lista }
  for I := 0 to ListBox.Count - 1 do
  begin
    Result := ListBox.Items[I];
    Result := ExcludeTrailingPathDelimiter(Result);
    Result := IncludeTrailingPathDelimiter(Result);
    Result := Result + Nome;
    if FileExists(Result) then
      Exit;
  end;

  { se chegou aqui: lista vazia ou não encontrou o arquivo }
  Result := Nome; // não sei se é a melhor alternativa; vai assim por enquanto
*)
end;

function TFrmConfig.NomeProgramaCompleto(Nome: String): String;
const
  DIR_PRGS = 'prgs';
begin
  Result := ExtractFilePath(Application.ExeName);
  Result := IncludeTrailingPathDelimiter(Result) + DIR_PRGS;
  if not IsPathDelimiter(Nome, 1) then
    Result := IncludeTrailingPathDelimiter(Result);
  Result := Result + Nome;
end;

function TFrmConfig.NomeArquivoCompleto(Nome: String): String;
const
  DIR_ARQS = 'arqs';
begin
  Result := ExtractFilePath(Application.ExeName);
  Result := IncludeTrailingPathDelimiter(Result) + DIR_ARQS;
  if not IsPathDelimiter(Nome, 1) then
    Result := IncludeTrailingPathDelimiter(Result);
  Result := Result + Nome;
end;

(*function TFrmConfig.MuralConfFileName: String;
const
  MURALCONF = 'mural.conf';
  DIR_CONF = 'conf';
begin
  Result := ExtractFilePath(Application.ExeName);
  Result := IncludeTrailingPathDelimiter(Result) + DIR_CONF;
  Result := IncludeTrailingPathDelimiter(Result) + MURALCONF;
end;
*)
function TFrmConfig.ExtensaoDefaultPrg: String;
begin
  Result := '.lbr';
end;

procedure TFrmConfig.alt_tam_fonte_editor(tam: integer);
begin
  FRegistry := get_registry();
  if FRegistry = nil then
    Exit; // algum problema; nada a fazer?

  try
    FRegistry.RootKey := HKEY_CURRENT_USER;
    if FRegistry.OpenKey(REG_BASE + REG_EDITOR, True) then
      FRegistry.WriteInteger('FontSize', tam);
    FRegistry.CloseKey;
  except
  end;
end;

function TFrmConfig.obt_tam_fonte_editor: integer;
begin
  Result := 9; // default
  FRegistry := get_registry();
  if FRegistry = nil then
    Exit; // algum problema; nada a fazer?

  try
    FRegistry.RootKey := HKEY_CURRENT_USER;
    if FRegistry.OpenKey(REG_BASE + REG_EDITOR, False) then
      Result := FRegistry.ReadInteger('FontSize');
    FRegistry.CloseKey;
  except
  end;
end;

function TFrmConfig.cria_registry: TRegistry;
begin
  try
    if not IsWindows64() then
      FRegistry := TRegistry.Create
    else
      FRegistry := TRegistry.Create(KEY_WRITE or $0100);
  except
    FRegistry := nil;
  end;
  Result := FRegistry;
end;

function TFrmConfig.IsWindows64: Boolean;
type
  TIsWow64Process = function(AHandle:THandle; var AIsWow64: BOOL): BOOL; stdcall;
var
  vKernel32Handle: DWORD;
  vIsWow64Process: TIsWow64Process;
  vIsWow64       : BOOL;
begin
  // 1) assume that we are not running under Windows 64 bit
  Result := False;

  // 2) Load kernel32.dll library
  vKernel32Handle := LoadLibrary('kernel32.dll');
  if (vKernel32Handle = 0) then Exit; // Loading kernel32.dll was failed, just return

  try

    // 3) Load windows api IsWow64Process
    @vIsWow64Process := GetProcAddress(vKernel32Handle, 'IsWow64Process');
    if not Assigned(vIsWow64Process) then Exit; // Loading IsWow64Process was failed, just return

    // 4) Execute IsWow64Process against our own process
    vIsWow64 := False;
    if (vIsWow64Process(GetCurrentProcess, vIsWow64)) then
      Result := vIsWow64;   // use the returned value

  finally
    FreeLibrary(vKernel32Handle);  // unload the library
  end;
end;

function TFrmConfig.get_registry: TRegistry;
begin
  if FRegistry = nil then
    FRegistry := cria_registry();
  Result := FRegistry;
end;

end.
