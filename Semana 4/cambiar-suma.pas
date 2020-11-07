program CambiarSuma;
var
	x, y: String;

procedure swapStrings(var a: String; var b: String);
var
	ax: String;
begin
	ax:=a;
	a:=b;
	b:=ax;
end;

function esAMayorLongitudQueB(a: String; b: String): Boolean;
begin
	esAMayorLongitudQueB := length(a) > length(b);
end;

begin
	while(true) do
	begin
		write('x: ');
		readln(x);
		write('y: ');
		readln(y);

		if not esAMayorLongitudQueB(x, y) then
		begin
			swapStrings(x, y);
			writeln('Los cambio');
		end;

		writeln('Voy a sumar x = ', x, ' y = ', y);
	end;
end.