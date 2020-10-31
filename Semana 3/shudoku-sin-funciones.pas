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
	columna: Integer;
	valorAleatorio: Char;
	noChocaZona, noChocaFila: Boolean;
	columnaPasada: Integer;
	valorRescatado: Char;
	columnaZona, i: Integer;
	choca: Boolean;

begin
	randomize;
   	repeat
   		s1:='000000000';
	   	s2:='000000000';
	   	s3:='000000000';


		for columna:= 1 to 9 do
		begin
			repeat
				{Toma un valor aleatorio}
				valorAleatorio:= chr(random(9) + 1 + 48);

				{Verifica que no choque}
				choca:=false;
				{Existen 3 zonas, 9 columnas, al dividir la columna entre 3, la parte entera es la zona, le resto 1 por comodidad}
				columnaZona:= (columna - 1) DIV 3;
				for i:= 1 to 3 do
				begin
					{
						Aquí recorremos las columnas de cada zona, columna * 3 nos pone al principio de nuestra zona,
						mientras que i nos da la columna, ej: 0*3+1 = columna 1, 1*3+1 = columna 4
					}
					if (s1[columnaZona*3 + i] = valorAleatorio) or (s2[columnaZona*3 + i ] = valorAleatorio) or (s3[columnaZona*3 + i] = valorAleatorio) then
					begin
						choca:=true;
						break;
					end;
				end;

				noChocaZona:= not choca;
				noChocaFila:= not (pos(valorAleatorio, s1) <> 0);

				{Si no choca con la fila y choca con la zona, intenta colocar el valor que choca en una zona anterior}
				if noChocaFila and not noChocaZona then
				begin
					for columnaPasada := 1 to columna do
					begin
						{toma el valor viejo}
						valorRescatado := s1[columnaPasada];

						choca:=false;
						{Existen 3 zonas, 9 columnas, al dividir la columna entre 3, la parte entera es la zona, le resto 1 por comodidad}
						columnaZona:= (columnaPasada - 1) DIV 3;
						for i:= 1 to 3 do
						begin
							{
								Aquí recorremos las columnas de cada zona, columna * 3 nos pone al principio de nuestra zona,
								mientras que i nos da la columna, ej: 0*3+1 = columna 1, 1*3+1 = columna 4
							}
							if (s1[columnaZona*3 + i] = valorAleatorio) or (s2[columnaZona*3 + i ] = valorAleatorio) or (s3[columnaZona*3 + i] = valorAleatorio) then
							begin
								choca:=true;
								break;
							end;
						end;

						if not choca then
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
								if (s1[columnaZona*3 + i] = valorRescatado) or (s2[columnaZona*3 + i ] = valorRescatado) or (s3[columnaZona*3 + i] = valorRescatado) then
								begin
									choca:=true;
									break;
								end;
							end;
						end;

						if not choca then
						begin
							s1[columnaPasada] := valorAleatorio;
							break;
						end;
					end;
				end;
			until noChocaZona and noChocaFila;
			s1[columna] := valorAleatorio;
		end;

		for columna:= 1 to 9 do
		begin
			repeat
				{Toma un valor aleatorio}
				valorAleatorio:= chr(random(9) + 1 + 48);

				{Verifica que no choque}
				choca:=false;
				{Existen 3 zonas, 9 columnas, al dividir la columna entre 3, la parte entera es la zona, le resto 1 por comodidad}
				columnaZona:= (columna - 1) DIV 3;
				for i:= 1 to 3 do
				begin
					{
						Aquí recorremos las columnas de cada zona, columna * 3 nos pone al principio de nuestra zona,
						mientras que i nos da la columna, ej: 0*3+1 = columna 1, 1*3+1 = columna 4
					}
					if (s1[columnaZona*3 + i] = valorAleatorio) or (s2[columnaZona*3 + i ] = valorAleatorio) or (s3[columnaZona*3 + i] = valorAleatorio) then
					begin
						choca:=true;
						break;
					end;
				end;

				noChocaZona:= not choca;
				noChocaFila:= not (pos(valorAleatorio, s2) <> 0);

				{Si no choca con la fila y choca con la zona, intenta colocar el valor que choca en una zona anterior}
				if noChocaFila and not noChocaZona then
				begin
					for columnaPasada := 1 to columna do
					begin
						{toma el valor viejo}
						valorRescatado := s2[columnaPasada];

						choca:=false;
						{Existen 3 zonas, 9 columnas, al dividir la columna entre 3, la parte entera es la zona, le resto 1 por comodidad}
						columnaZona:= (columnaPasada - 1) DIV 3;
						for i:= 1 to 3 do
						begin
							{
								Aquí recorremos las columnas de cada zona, columna * 3 nos pone al principio de nuestra zona,
								mientras que i nos da la columna, ej: 0*3+1 = columna 1, 1*3+1 = columna 4
							}
							if (s1[columnaZona*3 + i] = valorAleatorio) or (s2[columnaZona*3 + i ] = valorAleatorio) or (s3[columnaZona*3 + i] = valorAleatorio) then
							begin
								choca:=true;
								break;
							end;
						end;

						if not choca then
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
								if (s1[columnaZona*3 + i] = valorRescatado) or (s2[columnaZona*3 + i ] = valorRescatado) or (s3[columnaZona*3 + i] = valorRescatado) then
								begin
									choca:=true;
									break;
								end;
							end;
						end;

						if not choca then
						begin
							s2[columnaPasada] := valorAleatorio;
							break;
						end;
					end;
				end;
			until noChocaZona and noChocaFila;
			s2[columna] := valorAleatorio;
		end;


		for columna:= 1 to 9 do
		begin
			repeat
				{Toma un valor aleatorio}
				valorAleatorio:= chr(random(9) + 1 + 48);

				{Verifica que no choque}
				choca:=false;
				{Existen 3 zonas, 9 columnas, al dividir la columna entre 3, la parte entera es la zona, le resto 1 por comodidad}
				columnaZona:= (columna - 1) DIV 3;
				for i:= 1 to 3 do
				begin
					{
						Aquí recorremos las columnas de cada zona, columna * 3 nos pone al principio de nuestra zona,
						mientras que i nos da la columna, ej: 0*3+1 = columna 1, 1*3+1 = columna 4
					}
					if (s1[columnaZona*3 + i] = valorAleatorio) or (s2[columnaZona*3 + i ] = valorAleatorio) or (s3[columnaZona*3 + i] = valorAleatorio) then
					begin
						choca:=true;
						break;
					end;
				end;

				noChocaZona:= not choca;
				noChocaFila:= not (pos(valorAleatorio, s3) <> 0);

				{Si no choca con la fila y choca con la zona, intenta colocar el valor que choca en una zona anterior}
				if noChocaFila and not noChocaZona then
				begin
					for columnaPasada := 1 to columna do
					begin
						{toma el valor viejo}
						valorRescatado := s3[columnaPasada];

						choca:=false;
						{Existen 3 zonas, 9 columnas, al dividir la columna entre 3, la parte entera es la zona, le resto 1 por comodidad}
						columnaZona:= (columnaPasada - 1) DIV 3;
						for i:= 1 to 3 do
						begin
							{
								Aquí recorremos las columnas de cada zona, columna * 3 nos pone al principio de nuestra zona,
								mientras que i nos da la columna, ej: 0*3+1 = columna 1, 1*3+1 = columna 4
							}
							if (s1[columnaZona*3 + i] = valorAleatorio) or (s2[columnaZona*3 + i ] = valorAleatorio) or (s3[columnaZona*3 + i] = valorAleatorio) then
							begin
								choca:=true;
								break;
							end;
						end;

						if not choca then
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
								if (s1[columnaZona*3 + i] = valorRescatado) or (s2[columnaZona*3 + i ] = valorRescatado) or (s3[columnaZona*3 + i] = valorRescatado) then
								begin
									choca:=true;
									break;
								end;
							end;
						end;

						if not choca then
						begin
							s3[columnaPasada] := valorAleatorio;
							break;
						end;
					end;
				end;
			until noChocaZona and noChocaFila;
			s3[columna] := valorAleatorio;
		end;
		writeln(s1);
		writeln(s2);
		writeln(s3);
   		writeln;


   		write('continuar? [SI/NO]: ');
   		readln(continuar);
   	until upcase(continuar) = 'NO';
end.