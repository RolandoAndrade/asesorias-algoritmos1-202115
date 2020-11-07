program mostrar;
var
	n: Integer;

procedure mostrarNumeros(n: Integer);
var
	i: Integer;
begin
	for i:= 1 to n do
	begin
		write(i, ' ');
	end;
	writeln;
end;

begin
	for n:=1 to 3 do
	begin
		mostrarNumeros(n);
	end;
end.