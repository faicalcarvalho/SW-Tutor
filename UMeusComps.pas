unit UMeusComps;

interface

uses
  StdCtrls, ExtCtrls, Graphics, Buttons;
  
type

  TMeuPanel = class(TPanel)
  public
    property Canvas;
  end;

  TMeuGroupBox = class(TGroupBox)
  public
    property Canvas;
  end;

//  TMeuSpeedButton = class(TSpeedButton)
  TMeuSpeedButton = class(TBitBtn)
  public
//    property Canvas;
  end;
  
implementation

end.
