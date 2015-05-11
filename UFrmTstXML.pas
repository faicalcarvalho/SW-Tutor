unit UFrmTstXML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XpDOM;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xml: TXpObjModel;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  b: Boolean;
begin
  xml := TXpObjModel.Create(Self);
  b := xml.LoadDataSource('email.xml');
  if (b) then
    ShowMessage(xml.DocName)
  else
    ShowMessage('erro');
end;

end.
