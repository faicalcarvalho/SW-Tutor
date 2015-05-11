unit port_UFrmExamples2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, MPlayer, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    TreeView1: TTreeView;
    Panel1: TPanel;
    Button1: TButton;
    MediaPlayer1: TMediaPlayer;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    MediaPlayer2: TMediaPlayer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  MediaPlayer2 := TMediaPlayer.Create(Self);
  MediaPlayer2.AutoOpen := True;
  MediaPlayer2.Display := Panel1;
  MediaPlayer2.FileName := 'C:\faical\fotos\caiobá2007\caiobá 293.mpg';
  MediaPlayer2.Play;
end;

end.
