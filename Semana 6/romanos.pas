program Romanos;
{
	MCLXVI

	CXLVI
	R = 0
	A = 1 B = -
	R = 0 + 100 = 100
	R = 100 + 50 - 10 = 140
	R = 140 + 5 = 145
	R = 145 + 1 = 146
}

var
	romano: String;

function dameValor(letra: Char): Integer;
begin
	if letra = 'M' then 
		dameValor := 1000
	else if letra = 'D' then
		dameValor := 500
	else if letra = 'C' then
		dameValor := 100
	else if letra = 'L' then
		dameValor := 50
	else if letra = 'X' then
		dameValor := 10
	else if letra = 'V' then
		dameValor := 5
	else
		dameValor := 1;
end;

function arabigo(romano: String): Integer;
var
	r,a,b, i: Integer;
begin
	i:=1;
	r:=0;
	while (i <= length(romano)) do
	begin
	 	a:= dameValor(romano[i]);
	 	if( (i + 1) <= length(romano)) then
	 	begin
	 		b := dameValor(romano[i + 1]);
	 		if(a >= b) then
	 		begin
	 			r:= r + a;
	 		end
	 		else
	 		begin
	 			r:= r + b - a;
	 			i := i + 1;
	 		end;
	 	end
	 	else
	 	begin
	 		r := r + a;
	 	end;
	 	i := i + 1;
 	end;

 	arabigo := r;
end;

begin
	while(true) do
	begin
		write('Introduce numero romano: ');
		readln(romano);
		writeln('En arabigo es ', arabigo(romano));
	end;
end.