program lab9;

const
  MAX_SIZE = 10; // Максимальные размеры матрицы

var
  matrix: array[1..MAX_SIZE, 1..MAX_SIZE] of Integer;
  rows, cols: Integer;
  lastCol: Integer;
  currentCol, currentRow: Integer;
  isAllNonNegative: Boolean;

begin
  // Ввод размеров матрицы
  Write('Введите количество строк матрицы (макс ', MAX_SIZE, '): ');
  ReadLn(rows);
  Write('Введите количество столбцов матрицы (макс ', MAX_SIZE, '): ');
  ReadLn(cols);

  // Проверка на корректность ввода размеров матрицы
  if (rows < 1) or (rows > MAX_SIZE) or (cols < 1) or (cols > MAX_SIZE) then
  begin
    WriteLn('Некорректные размеры матрицы. Попробуйте снова.');
    Exit;
  end;

  // Ввод элементов матрицы
  WriteLn('Введите элементы матрицы:');
  currentRow := 1;
  while currentRow <= rows do
  begin
    currentCol := 1;
    while currentCol <= cols do
    begin
      Read(matrix[currentRow, currentCol]);
      currentCol := currentCol + 1;
    end;
    currentRow := currentRow + 1;
  end;
// Поиск последнего столбца с неотрицательными элементами
  lastCol := -1; // Инициализация значения, в случае если найдется только отрицательные столбцы
  currentCol := cols;

  while currentCol >= 1 do
  begin
    isAllNonNegative := True; // Предположение, что все элементы неотрицательны
    currentRow := 1;
    
    while currentRow <= rows do
    begin
      if matrix[currentRow, currentCol] < 0 then
      begin
        isAllNonNegative := False; // Найден отрицательный элемент
        Break; 
      end;
      currentRow := currentRow + 1;
    end;

    if isAllNonNegative then
    begin
      lastCol := currentCol; // Запоминаем номер последнего подходящего столбца
      Break;
    end;

    currentCol := currentCol - 1; // Переход к предыдущему столбцу
  end;

  // Вывод результата
  if lastCol = -1 then
    WriteLn('Не найдено ни одного столбца с неотрицательными элементами.')
  else
    WriteLn('Последний столбец с неотрицательными элементами: ', lastCol);
end.