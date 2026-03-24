program Laba2;
const
  v = 5;
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
  fxy: file of integer;
  g: file of integer;
begin
  n:= 6;
  assign(fxy, 'ввод.txt');
  reset(fxy);
  i:= 0;
  while not eof(fxy) do
    begin
      inc(i);
      read(fxy, x[i]);
      read(fxy, y[i]);
    end;
    close(fxy);
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
assign(g, 'вывод.txt');
rewrite(g);
for i:=0 to n-2 do
  sum += sqrt(sqr(d[i])+sqr(d1[i]));
write('Лаб.2':35);
write('Количество точек n = ', n);
write('Абсциссы и ординаты:');
for i:=0 to n-1 do
  begin
    write(x[i]:3, y[i]:2);
  end;
write('Количество точек, ордината которых больше абсциссы, равно ',k);
write('Сумма расстояний от последней точки до остальных равна ', sum:8:5);
if (f>0) and (f<>n) then
  write('Имеются',f,'точка(и), ордината и абсцисса которой(ых) равны');
if f=n then
    write('Ордината и абсцисса каждой точки одинаковы');
end.