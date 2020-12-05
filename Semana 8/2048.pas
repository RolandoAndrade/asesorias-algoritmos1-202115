program DosmilCuarentaYOcho;
type
	tablero = array[1..4, 1..4] of Integer;
	fila = array[1..4] of Integer;
var
	t: tablero;

procedure mostrar(t: tablero);
var
	i, j: Integer;
begin
	for i := 1 to 4 do
	begin
		for j := 1 to 4 do 
		begin
			write(t[i, j], ' ');
		end;
		writeln;
	end;
	writeln;
end;

procedure mostrarV(t: fila);
var
	i, j: Integer;
begin
	for i := 1 to 4 do
	begin
		write(t[i], ' ');
	end;
	writeln;
end;

procedure swap(var x: Integer; var y: Integer);
var
	ax: Integer;
begin
	ax := x;
	x := y;
	y := ax;
end;

procedure llenaAleatorio(var t: tablero);
var
	i, j: Integer;
begin
	repeat
		i := random(4) + 1;
		j := random(4) + 1;
	until t[i,j] = 0;
	t[i, j] := 2;
end;


function generaTablero(): tablero;
var
	i, j: Integer;
	t: tablero;
begin
	for i := 1 to 4 do
	begin
		for j := 1 to 4 do 
		begin
			t[i, j]:=0;
		end;
	end;
	generaTablero := t;
end;

function moverIzq(f: fila): fila;
var
	i, j: Integer;
begin
	for i := 1 to 4 do
	begin
		if (f[i] = 0) then
		begin
			for j := i + 1 to 4 do 
			begin
				if(f[j] <> 0) then
				begin
					swap(f[i], f[j]);
					break;
				end;
			end;
		end;
	end;
	moverIzq := f;
end;

function unirIguales(f: fila): fila;
var
	i: Integer;
begin
	for i := 1 to 3 do
	begin
		if(f[i] = f[i + 1]) then
		begin
			f[i] := f[i] + f[i + 1];
			f[i + 1] := 0;
		end;
	end;
	unirIguales := f;
end;

function voltear(f: fila): fila;
var
	v: fila;
	i: Integer;
begin
	for i := 1 to 4 do
	begin
	 	v[i]:=f[5-i];
 	end;
 	voltear := v;
end;

procedure left(var t: tablero);
var
	i: Integer;
begin
	for i := 1 to 4 do
	begin
		//movemos a la izq eliminando 0
	 	t[i] := moverIzq(t[i]);
	 	//unimos iguales
	 	t[i] := unirIguales(t[i]);
	 	//volvemos a eliminar los 0s resultantes de los iguaeles
	 	t[i] := moverIzq(t[i]);
	end; 
end;

procedure right(var t: tablero);
var
	i: Integer;
begin
	for i := 1 to 4 do
	begin
		//volteamos la fila para que esté de izq a der
		t[i] := voltear(t[i]);
		//movemos a la izq eliminando 0
	 	t[i] := moverIzq(t[i]);
	 	//unimos iguales
	 	t[i] := unirIguales(t[i]);
	 	//volvemos a eliminar los 0s resultantes de los iguales
	 	t[i] := moverIzq(t[i]);
	 	//colocamos el resultado volteado
	 	t[i] := voltear(t[i]);
	end; 
end;

function obtenerColumna(t: tablero; columna: Integer): fila;
var
	i: Integer;
	f: fila;
begin
	for i := 1 to 4 do
	begin
		f[i] := t[i, columna];
	end;
	obtenerColumna := f;
end;

function remplazarColumna(t: tablero; columna: Integer; remplazo: fila): tablero;
var
	i: Integer;
begin
	for i := 1 to 4 do 
	begin
		t[i, columna] := remplazo[i];
	end;
	remplazarColumna := t;
end;

procedure up(var t: tablero);
var
	i: Integer;
	filaRemplazo: fila;
begin
	for i := 1 to 4 do
	begin
		//obtenemos la columna
		filaRemplazo := obtenerColumna(t, i);
		//movemos a la izq eliminando 0
	 	filaRemplazo := moverIzq(filaRemplazo);
	 	//unimos iguales
	 	filaRemplazo := unirIguales(filaRemplazo);
	 	//volvemos a eliminar los 0s resultantes de los iguales
		filaRemplazo := moverIzq(filaRemplazo);
		//remplazamos la columna
	 	t := remplazarColumna(t, i, filaRemplazo);
	end; 
end;

procedure down(var t: tablero);
var
	i: Integer;
	filaRemplazo: fila;
begin
	for i := 1 to 4 do
	begin
		//obtenemos la columna
		filaRemplazo := obtenerColumna(t, i);
		//volteamos para leer de izq a derecha
		filaRemplazo := voltear(filaRemplazo);
		//movemos a la izq eliminando 0
	 	filaRemplazo := moverIzq(filaRemplazo);
	 	//unimos iguales
	 	filaRemplazo := unirIguales(filaRemplazo);
	 	//volvemos a eliminar los 0s resultantes de los iguales
		filaRemplazo := moverIzq(filaRemplazo);
		//volteamos para mover todo a la derecha (abajo)
		filaRemplazo := voltear(filaRemplazo);
		//remplazamos
	 	t := remplazarColumna(t, i, filaRemplazo);
	end; 
end;


procedure leer(var t: tablero);
var
	r: Char;
begin
	write('r: ');
	readln(r);
	if(r = 'u')then
		up(t)
	else if (r = 'd') then
		down(t)
	else if(r = 'l') then
		left(t)
	else
		right(t);
end;

begin
	randomize;
	t := generaTablero;
	while true do
	begin
		llenaAleatorio(t);
		mostrar(t);
		leer(t);
	end; 

end.