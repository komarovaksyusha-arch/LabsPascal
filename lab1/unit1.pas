Unit unit1;      // имя модуля – меняется при сохранении File ( Save As…
Interface       // раздел описания межмодульного интерфейса


Const
  SymbTable = 'abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLNOPQRSTUVWXYZ';

Const
  BukvLatS: set of char = ['a'.. 'z'];
  Cifr : set of '0'.. '9' = ['0'.. '9'];
  BukvLatZ: set of char = ['A'.. 'Z'];


Function Prov1(const s: string): Byte; // проверка без SymbTable
Function Prov2(const s: string): Byte; // проверка с SymbTable
Procedure Sort1(var s: string);  // сортировка без SymbTable
Procedure Sort2(var s: string);  // сортировка с SymbTable

Implementation  // раздел реализации и описания закрытых процедур

Function Prov1(const s: string): Byte; // проверка без SymbTable
Var
  Nom: byte; // номер аномалии
  i,Len: word; // текущий символ и длина строки
Begin
  Nom:=0; len:= Length(S);
  If Len=0 then Nom:=1
  Else
    Begin
      i:=1;
      while (i<=Len) and (Nom=0) do
      begin
        if Not ((S[i] in Cifr) or (S[i] in BukvLatS) or (S[i] in BukvLatZ)) then Nom:=2;
        Inc(i);
      end;
    End;
  Prov1:=Nom; 
End;

Function Prov2(const s: string): Byte; // проверка с SymbTable
Var
  Nom: byte; // номер аномалии
  i,Len: word; // текущий символ и длина строки
Begin
  Nom:=0; len:= Length(S);
  If Len=0 then Nom:=1
  Else
    Begin
      i:=1;
      while (i<=Len) and (Nom=0) do
      begin
        if Not (Pos(S[i], SymbTable)>0) then Nom:=2;
        Inc(i);
      end;
    End;
  Prov2:=Nom; 
End;

Procedure Sort1(var s: string);  // сортировка без SymbTable
Var 
  i, z, len: Word; // номер текущего символа, номер итерации (шага), длина строки
  flag: Boolean; // упорядочено? (нет обменов?)
  ch: char; // для обмена
Begin
  Z:=1;  len:=length(s);
  Repeat // пузырёк
    flag:=true;
    for i:=1 to len-z do
      if (s[i] in BukvLatZ) and (s[i+1] in Cifr) or    
         (s[i] in Cifr) and (s[i+1] in Cifr) and (s[i]>s[i+1]) or     
         (s[i] in BukvLatZ) and (s[i+1] in BukvLatZ) and (s[i]>s[i+1]) or
         (s[i] in BukvLatZ) and (s[i+1] in BukvLatS) or
         (s[i] in Cifr) and (s[i+1] in BukvLatS)
      then
      begin // обмен
        ch:=s[i]; s[i]:=s[i+1]; s[i+1]:=ch; flag:= false;
      end;
    inc(z);
  Until flag or (z=len);
End; 

Procedure Sort2(var s: string);  // сортировка с SymbTable
Var 
  i, z, len: Word; // номер текущего символа, номер итерации (шага), длина строки
  flag: Boolean; // упорядочено? (нет обменов?)
  ch: char; // для обмена
Begin
  z:=1;  len:=length(s);
  Repeat // пузырёк
    flag:=true;
    for i:=1 to len-z do
      if (Pos(s[i], SymbTable) > Pos(s[i+1], SymbTable))  // неправильный порядок по своей «таблице»
        and not ((s[i] in BukvLatS) and (s[i+1] in BukvLatS)) // но латинские строчные не упорядочивать
      then
      begin // обмен
        ch:=s[i]; s[i]:=s[i+1]; s[i+1]:=ch; flag:= false;
      end;
    inc(z);
  Until flag or (z=len);
End; 

end.