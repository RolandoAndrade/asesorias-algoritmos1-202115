program Pares;
var
	n: Integer;

function esPar(x: Integer): Boolean;
begin
	esPar := x mod 2 = 0;
end;

begin
	repeat
		write('n: ');
		readln(n);
	until not esPar(n);
end.