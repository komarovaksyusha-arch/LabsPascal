program SortString;

var
  str: string;
  i, j, temp: Integer;

procedure SelectionSort(var s: string);
var
  i, j, minIndex: Integer;
begin
  for i := 1 to Length(s) - 1 do
  begin
    minIndex := i;
    for j := i + 1 to Length(s) do
    begin
      if s[j] < s[minIndex] then
        minIndex := j;
    end;
    if minIndex <> i then
    begin
      // Меняем местами символы
      temp := Ord(s[i]);
      s[i] := s[minIndex];
      s[minIndex] := Chr(temp);
    end;
  end;
end;

procedure BubbleSort(var s: string);
var
  i, j: Integer;
  swapped: Boolean;
begin
  swapped := True;
  while swapped do
  begin
    swapped := False;
    for i := 1 to Length(s) - 1 do
    begin
      if s[i] > s[i + 1] then
      begin
        // Меняем местами символы
        temp := Ord(s[i]);
        s[i] := s[i + 1];
        s[i + 1] := Chr(temp);
        swapped := True;
      end;
    end;
  end;
end;

begin
  Write('Введите символьную строку: ');
  Readln(str);
  
  // Сортировка методом простого выбора
  SelectionSort(str);
  WriteLn('Строка после сортировки методом простого выбора: ', str);
  
  // Сортировка методом "пузырька"
  Write('Введите символьную строку для сортировки методом пузырька: ');
  Readln(str);
  BubbleSort(str);
  WriteLn('Строка после сортировки методом пузырька: ', str);
  
  Readln;
end.