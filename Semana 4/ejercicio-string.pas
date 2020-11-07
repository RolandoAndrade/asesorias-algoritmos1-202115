{Dado un texto (TEXTO1) que contiene solamente letras mayúsculas, 
se pide desarrollar un programa que cuente


las vocales en cada palabra y genere sustituya todas las consonantes
de cada palabra por la vocal que aparece
más veces. 

Si hay más de una vocal con la misma cantidad 
de ocurrencias, se toma la primera vocal de la palabra
con el máximo de ocurrencias. 
Al final debe mostrarse también la palabra 
con mayor número de vocales. No
debe modificarse TEXTO1. En TEXTO1 cada palabra puede estar 

separada por uno o más espacios en blanco, pero
en TEXTO2 se separarán con un solo espacio. 
(Debe usarse los mismos nombres de variables que solicita el
enunciado)

de ejemplo dan:
Entrada:
texto1 = EL CLUB DE PARACOTOS
Salida:
texto2 = EE UUUU AAAAAOAOA
}


program Ejercicio;
var
	texto1, texto2: String;

function cuentaVocal(vocal: Char; palabra: String): Integer;
var
	i, veces: Integer;
begin
	veces := 0;
	for i:=1 to length(palabra) do
	begin
		if palabra[i] = vocal then
		begin
			veces := veces + 1; 
		end;
	end;
	cuentaVocal := veces;
end;

function esVocal(letra: Char): Boolean;
var
	vocales: String;
begin
	vocales := 'AEIOU';
	esVocal := pos(letra, vocales) <> 0;
end;

procedure sustituir(var palabra: String; vocal: Char);
var
	i: Integer;
begin
	for i:=1 to length(palabra) do
	begin
		if(not esVocal(palabra[i])) then
		begin
			palabra[i] := vocal;
		end;
	end;
end;

function buscarMasRepetidaYSustituir(palabra: String): String;
var
	i, vecesRepetida, cuenta: Integer;
	vocalMasRepetida: Char;
begin
	vecesRepetida := 0;
	for i:=1 to length(palabra) do
	begin
		if esVocal(palabra[i]) then
		begin
			cuenta := cuentaVocal(palabra[i], palabra);
			if cuenta > vecesRepetida then
			begin
				vocalMasRepetida := palabra[i];
				vecesRepetida := cuenta;
			end;
		end;
	end;
	sustituir(palabra, vocalMasRepetida);
	buscarMasRepetidaYSustituir := palabra;
end;

procedure recorrerPalabras(texto: String);
var
	i: Integer;
	palabra: String;
begin
	palabra := '';
	texto2 := '';
	for i := 1 to length(texto) do
	begin
	 	if(texto[i] = ' ') then
	 	begin
	 		texto2 := texto2 + buscarMasRepetidaYSustituir(palabra) + ' ';
	 		palabra := '';
	 	end
	 	else
	 	begin
	 		palabra := palabra + texto[i];
	 	end;
	end; 
	texto2 := texto2 + buscarMasRepetidaYSustituir(palabra);
end;

begin
	while (true) do
	begin
		write('texto1: ');
	 	readln(texto1);
		recorrerPalabras(texto1);
	 	writeln('texto2: ', texto2);
	 	writeln;
 	end; 
end.