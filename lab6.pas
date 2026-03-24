program lab_6;

const 
    max_size = 5;
type 
    mat = array [1..max_size, 1..max_size] of integer;
var
  a: mat;
  n, j, k, i, m, count, str, t, x, c, d: integer; // n - кол-во строк, m - кол-во строк
  stop_flag: boolean;
  pr: real;
  f: TextFile;
begin 
  if ParamCount < 2 then 
    writeln('Недостаточно параметров!')
  else
  begin
    if not FileExists(ParamStr(1)) then
      writeln('Невозможно открыть файл''',ParamStr(1),''' для чтения')
    else
    begin
      writeln('Введите t:');
      readln(t);
      while (t = 0) do
      begin
        writeln('Ошибка: на 0 делить нельзя.');
        readln(t);
      end;
      writeln('Введите c:');
      readln(c);
      writeln('Введите d:');
      readln(d);
      while c >= d do
      begin
        writeln('Значение c дожно быть меньше d.');
        readln(d);
      end;
      writeln('Введите n:');
      readln(n);
      while (n < 1) or (n > max_size) do
      begin
        writeln('Ошибка: n должно быть в диапазоне от 1 до ', max_size);
        readln(n);
      end;
      writeln('Введите m:');
      readln(m);
      while (m < 1) or (m > max_size) do
      begin
        writeln('Ошибка: m должно быть в диапазоне от 1 до ', max_size);
        readln(m);
      end;
      Assign(f, ParamStr(1));
      Reset(f);
      for i := 1 to n do
      begin
        for j := 1 to m do
        begin
          read(f,a[i,j]);
        end;
        readln(f)
      end;
      Close(f);
      Assign(f, ParamStr(2));
      Rewrite(f);
      str := 1;
      for i := 1 to n do 
      begin 
        x := 0;
        for j := 1 to m do
        begin
          if (abs(a[i,j]) mod t) = 0 then
            x:=x+1;
        end;
        if x = 0 then
          str := i + 1;
      end;
      if (str = 0) or ( str > n) then
        writeln(f,'Не найдены строчки');
      if (str > 0) and (str <= n) then
      begin
        
        pr := 1;
        k := 0;
        for i := str to n do
        begin
          for j := 1 to m do
          begin
            if (a[i,j] > c) and (a[i,j] < d) then
            begin
              pr := pr * a[i,j];
              k := k + 1;
            end;
          end;  
        end;
        if k = 0 then
          writeln(f,'Нет подходящих элeментов для произведения.')
        else
          writeln(f,'Произведение: ',pr);
      end;
      Close(f);
    end;
  end;
end.