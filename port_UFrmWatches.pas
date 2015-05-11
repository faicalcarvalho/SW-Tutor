unit port_UFrmWatches;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFrmWatches = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    BtnOk: TButton;
    BtnCancel: TButton;
    procedure FormShow(Sender: TObject);
  private
    function GetWatches: TStrings;
    { Private declarations }
  public
    { Public declarations }
    function Execute: Boolean;
    property Watches: TStrings read GetWatches;
  end;

var
  FrmWatches: TFrmWatches;

implementation

{$R *.DFM}

function TFrmWatches.Execute: Boolean;
begin
  Result := ShowModal = mrOk;
end;

function TFrmWatches.GetWatches: TStrings;
begin
  Result := Memo1.Lines;
end;

procedure TFrmWatches.FormShow(Sender: TObject);
begin
  FocusControl(Memo1);
end;

end.
