unit port_UFrmPasta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ShellCtrls, ExtCtrls;

type
  TFrmPasta = class(TForm)
    Panel1: TPanel;
    ShellTreeView: TShellTreeView;
    BtnOk: TButton;
    BtnCancelar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPasta: TFrmPasta;

implementation

{$R *.dfm}

end.
