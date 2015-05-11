unit port_UFrmJanela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TFrmJanela = class(TForm)
    procedure FormPaint(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmJanela: TFrmJanela;

implementation

{$R *.dfm}

uses
  port_UFrmDSL;

{ Eventos terão o mesmo tratamento que os da Tela (form principal }

procedure TFrmJanela.FormPaint(Sender: TObject);
begin
  FrmDSL.PaintBox.OnPaint(Sender);
end;

procedure TFrmJanela.FormClick(Sender: TObject);
begin
  FrmDSL.PaintBoxClick(Sender);
end;

procedure TFrmJanela.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  FrmDSL.PaintBoxMouseMove(Sender, Shift, X, Y);
end;

procedure TFrmJanela.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FrmDSL.PaintBoxMouseDown(Sender, Button, Shift, X, Y);
end;

procedure TFrmJanela.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FrmDSL.PaintBoxMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TFrmJanela.FormKeyPress(Sender: TObject; var Key: Char);
begin
  FrmDSL.FormKeyPress(Sender, Key);
end;

procedure TFrmJanela.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FrmDSL.FormKeyDown(Sender, Key, Shift);
end;

procedure TFrmJanela.FormResize(Sender: TObject);
begin
  FrmDSL.PnlSaidaResize(Sender);
end;

end.
