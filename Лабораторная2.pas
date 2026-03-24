program Laba2;
const
  v = 10;
var
  f: integer;
  n: integer;
  k: integer;
  t: integer;
  sum: real;
  i: integer;
  x: array[0..v] of integer;
  y: array[0..v] of integer;
  d: array[0..v] of real;
  d1: array[0..v] of real;
begin
  readln(n);
  for i:=0 to n-1 do
    begin
      readln(x[i], y[i]);
    end;
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
for i:= 0 to n-2 do
  begin
    d[i]:=x[i]-x[n-1];
    d1[i]:=y[i]-y[n-1];
  end;
for i:=0 to n-2 do
  sum += sqrt(sqr(d[i])+sqr(d1[i]));
writeln('Лаб.2':35);
writeln('Количество точек n = ', n);
writeln('Абсциссы и ординаты:');
for i:=0 to n-1 do
  begin
    writeln(x[i]:3, y[i]:2);
  end;
writeln('Количество точек, ордината которых больше абсциссы, равно ',k);
writeln('Сумма расстояний от последней точки до остальных равна ', sum:8:5);
if (f>0) and (f<>n) then
  writeln('Имеются',f,'точка(и), ордината и абсцисса которой(ых) равны');
if f=n then
    writeln('Ордината и абсцисса каждой точки одинаковы');
writeln('Press Enter to end program');
readln();
end.