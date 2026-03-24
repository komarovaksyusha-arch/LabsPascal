program PointsAnalysis;

var
  inputFile, outputFile: TextFile;
  X, Y: array of Real;
  n, i: Integer;
  count: Integer;
  sum: Real;
  d: Real;

function CalculateDistance(X1, Y1, X2, Y2: Real): Real;
begin
  CalculateDistance := Sqrt(Sqr(X2 - X1) + Sqr(Y2 - Y1));
end;

begin
  // Открываем файл для чтения
  AssignFile(inputFile, 'ввод.txt');
  Reset(inputFile);
  
  // Считываем количество точек
  ReadLn(inputFile, n);
  
  // Инициализируем массивы
  SetLength(X, n);
  SetLength(Y, n);
  
  // Считываем координаты
  for i := 0 to n - 1 do
  begin
    ReadLn(inputFile, X[i], Y[i]);
  end;
  
  // Закрываем входной файл
  CloseFile(inputFile);
  
  // Подсчитываем количество точек, где Y > X
  count := 0;
  for i := 0 to n - 1 do
  begin
    if Y[i] > X[i] then
      Inc(count);
  end;

  // Суммируем расстояния от последней точки до всех остальных
  sum := 0;
  for i := 0 to n - 2 do // Проходим только до n-2, так как n-1 - это последняя точка
  begin
    d := CalculateDistance(X[n - 1], Y[n - 1], X[i], Y[i]);
    sum := sum + d;
  end;

  // Открываем файл для записи
  AssignFile(outputFile, 'вывод.txt');
  Rewrite(outputFile);
  
  // Записываем результаты в файл
  Writeln(outputFile, 'Количество точек, где Y > X: ', count);
  Writeln(outputFile, 'Сумма расстояний от последней точки: ', sum:0:2);
  
  // Закрываем выходной файл
  CloseFile(outputFile);
end.