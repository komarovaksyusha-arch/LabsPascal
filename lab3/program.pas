program Lab3;
{$APPTYPE CONSOLE}

uses

  unlab in 'unlab.pas',
  unvar in 'unvar.pas',

  System.Text;

// Добавить элемент в список (С2 - гласные в начало, остальные в конец)
procedure AddR(var ListN, ListK: PElem; r: TInfo);
begin
  if ListN = nil then
    CreateList(ListN, ListK, r)
  else if IsVowel(r) then
    AddVowel(ListN, r)
  else
    AddConsonant(ListK, r);
end;

// Генерация N псевдослучайных символов от А до Я, включая Ё (С3)
procedure AddN(var head, tail: PElem);
var 
  n, i: integer;
  s: string;
  r: TInfo;
begin
  write('Сколько символов добавить? N = ');
  readln(s);
  if not TryStrToInt(s, n) then n := 1;
  
  for i := 1 to n do
  begin
    // Генерация русского символа (А-Я, ё)
    case Random(67) of
      0..32: r := Chr(Ord('А') + Random(Ord('Я')-Ord('А')+1));
      33:    r := 'Ё';
      34..66:r := Chr(Ord('а') + Random(Ord('я')-Ord('а')+1));
    end;
    AddR(head, tail, r);
  end;
  writeln('Добавлено ', n, ' символов');
end;

// Добавление данных из текстового файла
procedure AddFromTextFile(var head, tail: PElem; filename: string);
var
  f: TextFile;
  r: TInfo;
  s: string;
  FileOpened: Boolean;
begin
  if not FileExists(filename) then
  begin
    Writeln('Ошибка: файл ', filename, ' не существует');
    Exit;
  end;

  FileOpened := False;
  try
    // Устанавливаем кодировку файла
    AssignFile(f, filename);
    Reset(f,Encoding.UTF8);
    FileOpened := True;
    

    try
      while not eof(f) do
      begin
        readln(f, s);
        if Length(s) > 0 then
        begin
          r := s[1];
          // Проверка считанного символа
          Writeln('Прочитан символ: ', r, ' (код: ', Ord(r), ')');
          
          // Проверяем, что символ является русской буквой
          if (Ord(r) >= Ord('А')) and (Ord(r) <= Ord('я')) or (r = 'Ё') or (r = 'ё') then
          begin
            AddR(head, tail, r);
          end
          else
          begin
            Writeln('Пропущен не-русский символ: ', r);
          end;
        end;
      end;
      Writeln('Данные из файла ', filename, ' успешно добавлены в список');
    except
      on E: Exception do
        Writeln('Ошибка при чтении файла: ', E.Message);
    end;
  finally
    if FileOpened then
      CloseFile(f);
  end;
end;

// Функция поиска первого символа "Д" или "Ё" (пункт 5 меню)
function FindFirstMatch(head: PElem): PElem;
var
  current: PElem;
  position: Integer;
  found: Boolean;
begin
  current := head;
  position := 1;
  found := False;
  Result := nil;

  Writeln('Поиск первого символа "Д" или "Ё"...');
  
  while (current <> nil) and (not found) do
  begin
    if (current^.info = 'Д') or (current^.info = 'Ё') or (current^.info = 'д') or (current^.info = 'ё') then
    begin
      Writeln('Найден элемент #', position, ': ', current^.info);
      Result := current;
      found := True;
    end
    else
    begin
      current := current^.next;
      Inc(position);
    end;
  end;

  if not found then
    Writeln('Элементы "Д" или "Ё" не найдены в списке');
end;

var
  head, tail: PElem;
  choice: Integer;
  inputChar: Char;
  foundNode: PElem;
  inputFileName: string;
  inputFile: Text;
  
begin
  
  head := nil;
  tail:=nil;
  
  repeat
    Writeln('Меню:');
    Writeln('1. Создать список из N случайных символов (А-Я, Ё)');
    Writeln('2. Добавить один символ в список');
    Writeln('3. Загрузить список из файла');
    Writeln('4. Вывести список');
    Writeln('5. Найти первый символ "Д" или "Ё"');
    Writeln('0. Выход');
    Write('Выберите действие: ');
    Readln(choice);
    
    case choice of
      1: begin
           if head <> nil then FreeList(head, tail);
           AddN(head, tail);
           Writeln('Список создан.');
         end;
      2: begin
           Write('Введите символ: ');
           Readln(inputChar);
           AddR(head, tail, inputChar);
           Writeln('Символ добавлен в список.');
         end;
      3: begin
           if head <> nil then FreeList(head, tail);
           Write('Введите имя файла: ');
           Readln(inputFileName);
           AddFromTextFile(head, tail, inputFileName);
           Writeln('Список загружен из файла.');
         end;
      4: begin
           PrintList(head);
         end;
      5: begin
           foundNode := FindFirstMatch(head);
         end;
      0: Writeln('Завершение программы...');
      else Writeln('Неверный выбор. Попробуйте снова.');
    end;
  until choice = 0;
  
  if head <> nil then FreeList(head, tail);

  // Завершение программы
  writeln('Программа завершена');
  readln; // Чтобы консоль не закрывалась сразу
end.