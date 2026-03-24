program Laba2;
var
  n1,f,n,k,t,i,p: integer;
  sum: real;
  x, y: array[0..10] of integer;
  s: array[0..10] of real;
begin
  writeln('Введите количество точек (не более 10):');
  readln(n);
  if n>10 then
    begin
      writeln('Не более 10 точек!');
      halt(0);
    end;
  n1:=n;
  writeln('Введите координаты ',n,' точек:');
  for i:=0 to n-1 do
    readln(x[i], y[i]);
    k:=0;
    f:=0;
    for i:=0 to n-1 do
      begin
        if x[i]<y[i] then
          k+=1;
        if x[i]=y[i] then
          begin
            f+=1;
          end;
      end;
    t:=n-2;
    for t:=0 to t do
      for n1:=0 to n-1 do
        s[t]:= sqrt(sqr(x[n1]-x[n])+sqr(y[n1]-y[n]));
    sum:=0.0;
    for p:=0 to t do
      sum+=s[p];
    writeln('Лаб.2':35);
    writeln('Количество точек n =', n);
    writeln('Абсциссы и ординаты:');
    for i:=0 to n-1 do
      begin
        writeln(x[i]:4, y[i]:2);
      end;
    writeln('Количество точек, ордината которых больше абсциссы, равно',k);
    writeln('Сумма расстояний от последней точки до остальных равна ', sum:8:5);
    if (f>0) and (f<>6) then
      writeln('Имеются',f,'точка(и), ордината и абсцисса которой(ых) равны');
    if f=6 then
        writeln('Ордината и абсцисса каждой точки одинаковы');
    for i:=0 to n-2 do
      writeln(s[i]);
end.