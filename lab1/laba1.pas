Program lab1;

{$AppType CONSOLE}

Uses unit1;

Var 
  S, S1, S2: string;
  Nom: Byte;
Begin 

  Writeln('Введите строку (смените шрифт на Lucida Console)');
  readln(S); // ввод 

 S1:=Copy(S, 1, Length(S)); S2:=Copy(S, 1, Length(S)); // создание копий дин.строки 

  // без своей таблицы символов (со сложным условием обмена)
  Writeln(#13#10, 'Строка до сортировки'#13#10, S1);
  Nom:= Prov1(s1); // проверка
  Case Nom of
    1: writeln('Пустая строка');
    2: writeln('Некорректные символы');
    else
     begin // сортировка
       Sort1(s1);
       Writeln('Отсортированная строка 1: "', S1, '"');  // вывод строки S1
     end; {else}
  End; {case}
  
  // со своей таблицей символов
  Writeln(#13#10'Строка до сортировки'#13#10, S2);
  Nom:= Prov2(s2); // проверка
  Case Nom of
    1: writeln('Пустая строка');
    2: writeln('Некорректные символы');
    else
     begin // сортировка
       Sort2(s2);
       Writeln('Отсортированная строка 2: "', S2, '"');  // вывод строки S2
     end; {else}
  End; {case}

  writeln(#13#10'Press ENTER to exit');
  readln
End.