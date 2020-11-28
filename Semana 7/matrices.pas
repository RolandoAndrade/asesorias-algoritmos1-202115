program Matrices;
	type
		matriz = array[1..5, 1..5] of Integer; 

var
	A: matriz;

function leerMatriz(): matriz;
var
	m: matriz;
	i, j: Integer;
begin
	for i := 1 to 5 do 
	begin
		write('F',i,': ');
		for j := 1 to 5 do
		begin
			read(m[i,j]);
		end;
	end;
	leerMatriz := m;
end;


procedure mostrar(m: matriz);
var
	i, j: Integer;
begin
	for i := 1 to 5 do 
	begin
		for j := 1 to 5 do
		begin
			if(m[i, j] < 10) then
			begin
				write('0');
			end;
			write(m[i,j], ' ');
		end;
		writeln;
	end;
end;

begin
	A := leerMatriz;
	writeln('Matriz guardada: ');
	mostrar(A);
end.