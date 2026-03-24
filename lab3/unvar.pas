unit UnVar;
interface
uses unlab;
var 
  NachaloSpiska, KonecSpiska: PElem;
implementation

initialization
  NachaloSpiska := nil;
  KonecSpiska := nil;
finalization
  FreeList(NachaloSpiska, KonecSpiska);
end.
