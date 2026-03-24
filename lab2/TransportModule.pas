unit TransportModule;

interface

type
  TTransportType = (Bus=1, Tram=2, Trolleybus=3);
  TTransport = record
    TransportType: TTransportType;
    RouteNumber: string[5];
    StopsToMetro: Integer;
  end;

procedure CreateTypedFile;
procedure CreateFromText(const TextFileName: string);
procedure ViewFile;
procedure FindAndMove;

implementation

var
  TransportFile: file of TTransport;

procedure CreateTypedFile;
var
  transport: TTransport;
  filename: string;
  ch: char;
begin
  write('Введите имя файла: ');
  readln(filename);
  AssignFile(TransportFile, filename);
  Rewrite(TransportFile);
  repeat
    write('Введите вид транспорта (1-Автобус, 2-Трамвай, 3-Троллейбус): ');
    readln(ch);
    transport.TransportType := TTransportType(Ord(ch) - 48);
    write('Введите номер маршрута: ');
    readln(transport.RouteNumber);
    write('Введите количество остановок до метро: ');
    readln(transport.StopsToMetro);
    write(TransportFile, transport);
    write('Добавить ещё один маршрут? (y/n): ');
    readln(ch);
  until UpCase(ch) = 'N';
  CloseFile(TransportFile);
end;

procedure CreateFromText(const TextFileName: string);
var
  TextFile: Text;
  transport: TTransport;
  TransportStr: string;
  kol: integer;
begin
  AssignFile(TextFile, TextFileName);
  Reset(TextFile);
  AssignFile(TransportFile, 'output.dat');
  Rewrite(TransportFile);

  while not EOF(TextFile) do
  begin
    ReadLn(TextFile, TransportStr);
    ReadLn(TextFile, transport.RouteNumber);
    ReadLn(TextFile, transport.StopsToMetro);
    inc(kol);
    case TransportStr of
      '1': transport.TransportType := Bus;
      '2': transport.TransportType := Tram;
      '3': transport.TransportType := Trolleybus;
    end;

    Write(TransportFile, transport);
  end;
  if kol=0 then
    writeln('Недостаточно параметров. Файл не содержит ни одной записи')
  else 
    writeln('Создан типизированный файл из ', kol, ' записей');
  CloseFile(TextFile);
  CloseFile(TransportFile);
end;

procedure ViewFile;
var
  transport: TTransport;
  filename: string;
begin
  write('Введите имя файла: ');
  readln(filename);
  AssignFile(TransportFile, filename);
  Reset(TransportFile);
  while not Eof(TransportFile) do
  begin
    read(TransportFile, transport);
    writeln('Тип: ', Ord(transport.TransportType), ', Маршрут: ', transport.RouteNumber, ', Остановок до метро: ', transport.StopsToMetro);
  end;
  CloseFile(TransportFile);
end;

procedure FindAndMove;
var
  transport, lastTransport: TTransport;
  filename: string;
  lastPos, totalRecords: Integer;
  found: Boolean;
begin
  write('Введите имя файла: ');
  readln(filename);
  AssignFile(TransportFile, filename);
  Reset(TransportFile);

  totalRecords := FileSize(TransportFile);
  writeln('Всего записей в файле: ', totalRecords);

  if totalRecords = 0 then
  begin
    writeln('Файл пуст.');
    CloseFile(TransportFile);
    Exit;
  end;

  found := False;
  lastPos := -1;

  for var i := 0 to totalRecords - 1 do
  begin
    Seek(TransportFile, i);
    read(TransportFile, transport);
    if (transport.RouteNumber.countof('2')+transport.RouteNumber.countof('3')=Length(transport.RouteNumber)) then
    begin
      lastTransport := transport;
      lastPos := i;
      found := True;
    end;
  end;

  if found then
  begin
    Seek(TransportFile, lastPos);
    for var i := lastPos to totalRecords - 2 do
    begin
      Seek(TransportFile, i + 1);
      read(TransportFile, transport);
      Seek(TransportFile, i);
      write(TransportFile, transport);
    end;
    Seek(TransportFile, totalRecords - 1);
    write(TransportFile, lastTransport);
    writeln('Последняя запись с номером маршрута из 2 и 3 перемещена в конец.');
  end
  else
    writeln('Запись с номером маршрута из 2 и 3 не найдена.');

  CloseFile(TransportFile);
end;

end.