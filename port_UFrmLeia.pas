unit port_UFrmLeia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TFrmLeia = class(TForm)
    Button1: TButton;
    EdtValor: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    FTerminou: Boolean;
  public
    { Public declarations }
    procedure Leia(Titulo, Mensagem: String; var Valor: String);
  end;

var
  FrmLeia: TFrmLeia;

implementation

{$R *.dfm}

uses
  port_PasTokens, port_PascalInterpreter;

{ TFrmLeia }

procedure TFrmLeia.Leia(Titulo, Mensagem: String; var Valor: String);
begin
  Caption := Titulo;
  EdtValor.EditLabel.Caption := Mensagem;
  EdtValor.Text := '';
  FTerminou := False;
  ShowModal;
  if FTerminou then
    raise EInterpreterException.Create(sUserBreak, 1, 1, nil);
  Valor := EdtValor.Text;
end;

procedure TFrmLeia.FormShow(Sender: TObject);
begin
  EdtValor.SetFocus;
end;

procedure TFrmLeia.SpeedButton1Click(Sender: TObject);
begin
  FTerminou := True;
  FrmLeia.ModalResult := mrOk;
end;

end.
