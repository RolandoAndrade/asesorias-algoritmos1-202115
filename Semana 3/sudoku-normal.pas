{

De verdad que intenté una forma par sudokus de 9x9, pero no encontré una que
se adapte a sus capacidades actuales, por lo que les voy a dar una posible
solución con el uso de varias cosas que no pueden usar para que no puedan dar
esta respuesta en el taller.


El algoritmo que les planteo es el siguiente

1. Para cada casilla en una fila elegir un número aleatorio

2. Evaluar si choca con la zona y la fila.

3. Si no choca entonces colocarlo, de lo contrario 

	Si choca en la zona nada más, inserta el valor en una zona pasada donde
	el nuevo valor no choque y el que tenía no choque en la nueva zona

	Elegir otro número aleatorio y volver a 2

4. Al terminar la zona, ir a la siguiente.

}

program SudokuNormal;
var
   s1: String;
   s2: String;
   s3: String;
   continuar: String;



{Procedimiento que imprime el tablero}
procedure mostrar();
begin
	writeln(s1);
	writeln(s2);
	writeln(s3);
end;


{Verifica si choca con la zona}
function noChocaConZona(columna: Integer; valorBuscado: Char): Boolean;
var
	columnaZona, i: Integer;
	choca: Boolean;
begin
	choca:=false;
	{Existen 3 zonas, 9 columnas, al dividir la columna entre 3, la parte entera es la zona, le resto 1 por comodidad}
	columnaZona:= (columna - 1) DIV 3;
	for i:= 1 to 3 do
	begin
		{
			Aquí recorremos las columnas de cada zona, columna * 3 nos pone al principio de nuestra zona,
			mientras que i nos da la columna, ej: 0*3+1 = columna 1, 1*3+1 = columna 4
		}
		if (s1[columnaZona*3 + i] = valorBuscado) or (s2[columnaZona*3 + i ] = valorBuscado) or (s3[columnaZona*3 + i] = valorBuscado) then
		begin
			choca:=true;
			break;
		end;
	end;
	noChocaConZona:= not choca;
end;


{Verifica que no choca con la fila}
function noChocaConLaFila(fila: String; valorBuscado: Char): Boolean;
begin
	{ Ojo, no pueden usar pos}
	noChocaConLaFila:= not (pos(valorBuscado, fila) <> 0);
end;


{Inserta el nuevo valor donde no choque con la zona anterior si puede, y donde el valor que estaba colocado no choque en la zona actual}
procedure insertarAntesDondeNoChoque(var fila: String; columna: Integer; valorAleatorio: Char);
var
	columnaPasada: Integer;
	valorRescatado: Char;
begin
	for columnaPasada := 1 to columna do
	begin
		{toma el valor viejo}
		valorRescatado := fila[columnaPasada];

		{Verifica que el nuevo valor no choca en la zona anterior  Y    el viejo valor no choca con la zona actual }
		if noChocaConZona(columnaPasada, valorAleatorio) and noChocaConZona(columna, valorRescatado) then
		begin
			fila[columnaPasada] := valorAleatorio;
			break;
		end;
	end;
end;


{Llena las filas con valores aleatorios}
procedure llenarFila(var fila: String);
var
	columna: Integer;
	valorAleatorio: Char;
	noChocaZona, noChocaFila: Boolean;
begin
	for columna:= 1 to 9 do
	begin
		repeat
			{Toma un valor aleatorio}
			valorAleatorio:= chr(random(9) + 1 + 48);

			{Verifica que no choque}
			noChocaZona:= noChocaConZona(columna, valorAleatorio);
			noChocaFila:= noChocaConLaFila(fila, valorAleatorio);

			{Si no choca con la fila y choca con la zona, intenta colocar el valor que choca en una zona anterior}
			if noChocaFila and not noChocaZona then
			begin
				insertarAntesDondeNoChoque(fila, columna, valorAleatorio);
			end;
		until noChocaZona and noChocaFila;
		fila[columna] := valorAleatorio;
	end


end;


procedure llenar();
begin
	llenarFila(s1);
	llenarFila(s2);
	llenarFila(s3);
end;


begin
	randomize;
   	repeat
   		s1:='000000000';
	   	s2:='000000000';
	   	s3:='000000000';
   	   	llenar();
   		mostrar();
   		writeln;
   		write('continuar? [SI/NO]: ');
   		readln(continuar);
   	until upcase(continuar) = 'NO';
end.