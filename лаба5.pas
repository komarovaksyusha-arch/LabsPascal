program Laba5;
var
  inputFile, outputFile: TextFile;
  A, C: array of Integer;
  n, i: Integer;
  l, k, h: real;
  
begin
	Assign(inputFile, 'input.txt');
	Reset(inputFile);
	ReadLn(inputFile, n);
	
	SetLength(A, n);
	SetLength(C, n);
	
	for i := 0 to n - 1 do
	begin
		ReadLn(inputFile, A[i], C[i]);
	end;
	
	Close(inputFile);
	
	k:=exp(C[1]*ln(A[1]));
	
	Assign(outputFile, 'output.txt');
	Rewrite(outputFile);	

	for i:=0 to n-1 do
	begin
		if C[i]<0 then
		begin
			l := 1.0;
			h := abs(C[i]);
			l:= 1/exp(h*ln(A[i]));
			if l<k then
				k:=l;
		end;
		if C[i]>0 then
			begin
				l := 1.0;
				l := exp(C[i]*ln(A[i]));
				if l<k then
					k:=l;
			end;
	end;
	
	
	writeln(outputFile, 'Лаба5':35);
	writeln(outputFile, 'Исходный массив А: ');
	for i:=0 to n-1 do
		write(outputFile, A[i]);
	writeln(outputFile);
	writeln(outputFile, 'Исходный массив C: ');
	for i:=0 to n-1 do
		write(outputFile, C[i]);
	writeln(outputFile);
	writeln(outputFile, 'Наименьшее значение A[i]^C[i] равно ', k:8:5);
	
	Close(outputFile);
end.