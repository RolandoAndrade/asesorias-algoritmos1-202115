program eliminar;
const
	max_filas = 6;
	max_columnas = 6;
type
	matriz = array[1..max_filas, 1..max_columnas] of Integer; 

var
	A, B: matriz;
	alto, ancho: Integer;

function leerMatriz(): matriz;
var
	m: matriz;
	i, j: Integer;
begin
	for i := 1 to max_filas do 
	begin
		write('F',i,': ');
		for j := 1 to max_columnas do
		begin
			read(m[i,j]);
		end;
	end;
	leerMatriz := m;
end;

procedure mostrar(m: matriz; ancho: Integer; alto: Integer);
var
	i, j: Integer;
begin
	for i := 1 to alto do 
	begin
		for j := 1 to ancho do
		begin
			if(m[i, j] < 10) then
			begin
				write(' ');
			end;
			write(m[i,j], ' ');
		end;
		writeln;
	end;
end;

{Intercambia dos números}
procedure swap(var x: Integer; var y: Integer);
var
	ax: Integer;
begin
	ax := x;
	x := y;
	y := ax;
end;


function laFilaEsVacia(m: matriz; fila: Integer): Boolean;
var
	columna: Integer;
	estaVacia: Boolean;
begin
	estaVacia := true;
	columna := 1;
	{Recorre todas las columnas de una fila}
	while(estaVacia and (columna <= max_columnas)) do
	begin
		{Si encuentra un número distinto a 0, no está vacía}
		if(m[fila, columna] <> 0) then
		begin
			estaVacia := false;
		end;
		columna := columna + 1;
	end;
	laFilaEsVacia := estaVacia;
end;

{Verifica si una columna está vacía}
function laColumnaEsVacia(m: matriz; columna: Integer): Boolean;
var
	fila: Integer;
	estaVacia: Boolean;
begin
	estaVacia := true;
	fila := 1;
	{Recorre todas las filas de una columna}
	while(estaVacia and (fila <= max_filas)) do
	begin
		{Si encuentra un número distinto a 0, no está vacía}
		if(m[fila, columna] <> 0) then
		begin
			estaVacia := false;
		end;
		fila := fila + 1;
	end;
	laColumnaEsVacia := estaVacia;
end;

{Envía la fila al final de las filas}
procedure eliminarFila(var m: matriz; fila: Integer);
var
	columna: Integer;
	i: Integer;
begin
	for i:=fila to max_filas - 1 do
	begin
		{Para todas las columnas de una fila, coloca el valor inferior en la fila, y el valor de la fila en la fila inferior}
		for columna := 1 to max_columnas do
		begin
			swap(m[i, columna], m[i + 1, columna]);
		end;
	end;
end;

{Envía la columna al final de las columnas}
procedure eliminarColumna(var m: matriz; columna: Integer);
var
	fila: Integer;
	i: Integer;
begin
	for i:=columna to max_columnas - 1 do
	begin
		{Para todas las filas de una columna, coloca el valor de su siuiente en la columna, y el valor de la celda en la columna siguiente}
		for fila := 1 to max_filas do
		begin
			swap(m[fila, i], m[fila, i + 1]);
		end;
	end;
end;


{Elimina todas las columnas vacías de una matriz y altero su ancho}
procedure eliminarSoloColumnasVacias(var m: matriz; var ancho: Integer);
var
	columna: Integer;
begin
	columna := 1;
	while columna <= ancho do
	begin
	 	if(laColumnaEsVacia(m, columna)) then
	 	begin
	 		eliminarColumna(m, columna);
	 		{Disminuímos el ancho porque avanzamos una columna al enviar la que teníamos al final}
	 		ancho := ancho - 1;
	 	end
	 	else
	 	begin
	 		columna := columna + 1;
	 	end;
	end; 
end;

{Elimina todas las filas vacías de una matriz y altero su alto}
procedure eliminarSoloFilasVacias(var m: matriz; var alto: Integer);
var
	fila: Integer;
begin
	fila := 1;
	while fila <= alto do
	begin
	 	if(laFilaEsVacia(m, fila)) then
	 	begin
	 		eliminarFila(m, fila);
	 		{Al enviar la fila al final disminuímos el alto}
	 		alto := alto - 1;
	 	end
	 	else
	 	begin
	 		fila := fila + 1;
	 	end;
	end; 
end;


{Llama a ambos}
procedure eliminarFilasYColumnasVacias(var m: matriz; var ancho: Integer; var alto: Integer);
begin
	eliminarSoloColumnasVacias(m, ancho);
	eliminarSoloFilasVacias(m, alto);
end;

begin
	writeln('Introduce matriz 6x6: ');
	A := leerMatriz;

	writeln('La matriz introducida es: ');
	mostrar(A, max_columnas, max_filas);

	alto:= max_filas;
	B := A;
	writeln('Eliminando filas vacias es: ');
	eliminarSoloFilasVacias(B, alto);
	mostrar(B, max_columnas, alto);

	ancho:= max_columnas;
	B := A;
	writeln('Eliminando columnas vacias es: ');
	eliminarSoloColumnasVacias(B, ancho);
	mostrar(B, ancho, max_filas);

	alto:= max_filas;
	ancho:= max_columnas;
	B := A;
	writeln('Eliminando filas y columnas vacias es: ');
	eliminarFilasYColumnasVacias(B, ancho, alto);
	mostrar(B, ancho, alto);
end.