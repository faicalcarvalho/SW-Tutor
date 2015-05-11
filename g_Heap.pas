unit g_Heap;

interface

uses
  Windows;

type
  THeap = class
  private
    FInitialSize: Integer;
    FMaximumSize: Integer;
    FHeap: THandle;
  public
    constructor Create(InitialSize, MaximumSize: Integer);
    destructor Destroy; override;
    function AllocMem(Size: Integer): Pointer;
    function ReallocMem(P: Pointer; Size: Integer): Pointer;
    procedure FreeMem(P: Pointer);
    property MaximumSize: Integer read FMaximumSize;
    property InitialSize: Integer read FInitialSize;
    property Handle: THandle read FHeap;
  end;

implementation

// consts: winnt.h
const
  HEAP_NO_SERIALIZE               = $00000001;
  HEAP_GROWABLE                   = $00000002;
  HEAP_GENERATE_EXCEPTIONS        = $00000004;
  HEAP_ZERO_MEMORY                = $00000008;
  HEAP_REALLOC_IN_PLACE_ONLY      = $00000010;
  //...

  BLOCK_SIZE                      = 1024 * 1024;
{ THeap }

function THeap.AllocMem(Size: Integer): Pointer;
begin
  Result := HeapAlloc(FHeap, HEAP_NO_SERIALIZE or HEAP_ZERO_MEMORY, Size);
end;

constructor THeap.Create(InitialSize, MaximumSize: Integer);
begin
  FInitialSize := InitialSize;
  FMaximumSize := MaximumSize;
  FHeap := HeapCreate(HEAP_NO_SERIALIZE, FInitialSize, FMaximumSize);
end;

destructor THeap.Destroy;
begin
  HeapDestroy(FHeap);
end;

procedure THeap.FreeMem(P: Pointer);
begin
  HeapFree(FHeap, HEAP_NO_SERIALIZE, P);
end;

function THeap.ReallocMem(P: Pointer; Size: Integer): Pointer;
begin
  Result := HeapRealloc(FHeap, HEAP_NO_SERIALIZE or HEAP_ZERO_MEMORY, P, Size);
end;

end.
