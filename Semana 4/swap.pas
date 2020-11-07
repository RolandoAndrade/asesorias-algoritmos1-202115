program Cambio;
var
	a, b: Integer;
	x, y: String;

procedure swapNumeros(var a: Integer; var b: Integer);
var
	ax: Integer;
begin
	ax:=a;
	a:=b;
	b:=ax;
end;

procedure swapStrings(var a: String; var b: String);
var
	ax: String;
begin
	ax:=a;
	a:=b;
	b:=ax;
end;

procedure pideNumeros();
begin
	write('a: ');
	readln(a);
	write('b: ');
	readln(b);
	swapNumeros(a,b);
	writeln('a: ', a);
	writeln('b: ', b);
end;

procedure pideStrings();
begin
	write('x: ');
	readln(x);
	write('y: ');
	readln(y);
	swapStrings(x,y);
	writeln('x: ', x);
	writeln('y: ', y);
end;

begin
	repeat
		pideNumeros;
		pideStrings;
	until (a=-1) or (b=-1);
end.