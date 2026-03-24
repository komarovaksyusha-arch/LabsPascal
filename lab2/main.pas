program TransportManager;

uses TransportModule;

var
  ch: char;
begin
  repeat
    writeln('--------------------------------------');
    writeln('D - создать новый типизированный файл; ');
    writeln('N - создать из текстового файла; ');
    writeln('V - просмотр содержимого файла;');
    writeln('F - поиск и перемещение последнего маршрута 2 или 3; ');
    writeln('E - выход.');
    write('Ваш выбор? '); readln(ch);
    writeln('--------------------------------------');

    ch := UpCase(ch);
    case ch of
      'D': CreateTypedFile;
      'N': CreateFromText('input.txt');
      'V': ViewFile;
      'F': FindAndMove;
      'E': exit;
    else
      begin
        writeln('Нет такой команды');
        write('Нажмите ENTER'); readln;
      end;
    end;
  until ch = 'E';
end.
