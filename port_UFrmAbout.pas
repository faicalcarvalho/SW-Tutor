unit port_UFrmAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFrmAbout = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    Image2: TImage;
    Label6: TLabel;
    Button1: TButton;
    procedure Label6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAbout: TFrmAbout;

implementation

{$R *.DFM}

uses
  ShellApi;

procedure TFrmAbout.Label6Click(Sender: TObject);
var
  MyLink: string;
begin
  MyLink := 'http://www.ojovemprogramador.com.br/';
  ShellExecute(Application.Handle, PChar('open'), PChar(MyLink),
   nil, nil, SW_SHOW);
end;

end.
