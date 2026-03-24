program lab10;

procedure three(A: array of Integer; N: Integer; var MinOdd1: Integer);
var
  i, j: Integer;
  Found: Boolean;
begin
  Found := False;
  MinOdd1 := 9999; // Инициализируем минимальное значение максимально возможным числом

  // Ищем первый элемент, кратный трём
  for i := 1 to N do
  begin
    if A[i] mod 3 = 0 then
    begin
      // Если нашли элемент кратный 3, начинаем проверять элементы после него
      for j := i + 1 to N do
      begin
        if (A[j] mod 2 <> 0) and (A[j] < MinOdd1) then  // Проверка на нечетность и минимальность
        begin
          MinOdd1 := A[j];
          Found := True;
        end;
      end;
      Break; // Выход из первого цикла после нахождения элемента кратного 3
    end;
  end;
end;

procedure nothree(A: array of Integer; N: Integer; var MinOdd2: Integer);
var
  i: integer;
begin
  MinOdd2:=9999;
    for i := 0 to N - 1 do
    begin
      if (A[i] mod 2 <> 0) and (A[i] < MinOdd2) then // Проверка на нечетность и минимальность
      begin
        MinOdd2 := A[i];
      end;
    end;
end;

  // Если минимальное значение осталась как MaxInt, значит нечетных элементов нет
  if MinOdd1 = 9999 and MinOdd2=9999 then
  begin
    MinOdd1 := 0;	// Или другое значение, указывающее, что не нашли ни одного нечетного
	MinOdd2 := 0;
  end;

var
  A: array[1..100] of Integer; // Массив размера 100
  N, MinOdd1, MinOdd2, i: Integer;

begin
  
  // Ввод количества элементов в массиве
  Write('Введите количество элементов массива (N): ');
  ReadLn(N);
  
  // Ввод элементов массива
  WriteLn('Введите элементы массива:');
  for i := 1 to N do
  begin
    Read(A[i]);
  end;

  // Вывод результата
  if MinOdd = 0 then
    WriteLn('Не найдено нечетных элементов.');
  if three(A,N,MinOdd1)<>9999 then
    WriteLn('Минимальное значение нечетных элементов после нечетного: ', MinOdd1)
  else:
    WriteLn('Минимальное значение нечетных элементов во всем массиве: ', MinOdd2);
  
  ReadLn;
end.