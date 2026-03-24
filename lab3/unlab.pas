unit unlab;
interface
type
  TInfo = char; // С4 - символы
  PElem = ^TElem;
  TElem = record // С1 - односвязный список
    info: TInfo;
    next: PElem;
  end;

// создать список из одного элемента
procedure CreateList(var ListN, ListK: PElem; r: TInfo);
// добавить гласную в начало
procedure AddVowel(var ListN: PElem; r: TInfo);
// добавить согласную в конец
procedure AddConsonant(var ListK: PElem; r: TInfo);
// очистить список
procedure FreeList(var ListN, ListK: PElem);
// проверка на гласную
function IsVowel(c: char): boolean;
procedure PrintList(head: PElem);
implementation

const
  Vowels = ['А','Е','Ё','И','О','У','Ы','Э','Ю','Я',
            'а','е','ё','и','о','у','ы','э','ю','я'];

// создать список из одного элемента
procedure CreateList(var ListN, ListK: PElem; r: TInfo);
begin
  New(ListN);
  ListK := ListN;
  ListN^.info := r;
  ListN^.next := nil;
end;

// добавить гласную в начало
procedure AddVowel(var ListN: PElem; r: TInfo);
var 
  Elem: PElem;
begin
  new(Elem);
  Elem^.info := r;
  Elem^.next := ListN;
  ListN := Elem;
end;

// добавить согласную в конец
procedure AddConsonant(var ListK: PElem; r: TInfo);
begin
  new(ListK^.next);
  ListK := ListK^.next;
  ListK^.info := r;
  ListK^.next := nil;
end;

// очистить список
procedure FreeList(var ListN, ListK: PElem);
var 
  Elem: PElem;
begin
  while ListN <> nil do
  begin
    Elem := ListN;
    ListN := ListN^.next;
    Dispose(Elem);
  end;
  ListK := nil;
end;

// проверка на гласную
function IsVowel(c: char): boolean;
begin
  Result := c in Vowels;
end;

//вывод списка
procedure PrintList(head: PElem);
var
  current: PElem;
  count: Integer;
begin
  current := head;
  count := 0;
  
  if current = nil then
  begin
    Writeln('Список пуст');
    Exit;
  end;

  Writeln('Содержимое списка:');
  while current <> nil do
  begin
    Inc(count);
    Write(count, '. ', current^.info);
    if IsVowel(current^.info) then
      Writeln(' (гласная)')
    else
      Writeln(' (согласная)');
    current := current^.next;
  end;
  Writeln('Всего элементов: ', count);
end;
end.