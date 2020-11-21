program Calendario;

type
	Vdias = array[1..7] of String;
	Vmeses = array[1..12] of Integer;

procedure imprimirDiasSobrantes(diaDeInicio: Integer);
var
	i: Integer;
begin
	for i := 1 to diaDeInicio - 1 do 
		write('   ');
end;

procedure imprimir(diaDeInicio: Integer; cantidadDeDias: Integer);
var
	dias: Vdias = ('Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa', 'Do');
	i, diaAColocar: Integer;
begin
	for i := 1 to 7 do
	begin
	 	write(dias[i], ' ')
	end;
	writeln;
	imprimirDiasSobrantes(diaDeInicio);
	diaAColocar := diaDeInicio;
	for i := 1 to cantidadDeDias do
	begin
		if(i < 10) then
		begin
			write(0, i, ' ');
		end
		else
		begin
			write(i, ' ');
		end;
		diaAColocar := diaAColocar + 1;
		if(diaAColocar>7) then
		begin
			diaAColocar := 1;
			writeln;
		end;
	end;
	writeln;
end;

function factorSiglo(anio: Integer): Integer;
begin
	if((1700 <= anio) and (anio < 1800)) then
		factorSiglo := 5
	else if((1800 <= anio) and (anio < 1900)) then
		factorSiglo := 3
	else if((1900 <= anio) and (anio < 2000)) then
		factorSiglo := 1
	else if((2000 <= anio) and (anio < 2100)) then
		factorSiglo := 0
	else if((2100 <= anio) and (anio < 2200)) then
		factorSiglo := -2
	else if((2200 <= anio) and (anio < 2300)) then
		factorSiglo := -4
	else
		factorSiglo := 0;
end;

function factorAnio(anio: Integer): Integer;
begin
	anio:= anio mod 100;
	anio := anio + trunc(anio/4);
	factorAnio := anio;
end;

function esBisiesto(anio: Integer): Boolean;
begin
	esBisiesto:= ((anio mod 4) = 0) and (not ((anio mod 100) = 0) or ((anio mod 400) = 0));
end;

function factoBisiesto(anio: Integer; mes: Integer): Integer;
begin
	if (esBisiesto(anio) and (mes = 1)) or (esBisiesto(anio) and (mes = 2)) then
	begin
		factoBisiesto := -1;
	end
	else
	begin
		factoBisiesto := 0;
	end;
end;

function factorMes(mes: Integer): Integer;
var
	factores: Vmeses = (6,2,2,5,0,3,5,1,4,6,2,4);
begin
	factorMes := factores[mes];
end;

function diaSemana(dia: Integer; mes: Integer; anio: Integer): Integer;
var
	r: Integer;
begin
	r := factorSiglo(anio) + factorAnio(anio) + factoBisiesto(anio, mes) + factorMes(mes) + dia;
	r := r mod 7;
	if (r = 0) then
		diaSemana := 7
	else
		diaSemana := r;
end;

function diasEnMes(mes: Integer; anio: Integer): Integer;
var
	factores: Vmeses = (31,28,31,30,31,30,31,31,30,31,30,31);
	r: Integer;
begin
	r := factores[mes];
	if((mes = 2) and (esBisiesto(anio))) then
	begin
		r:= r + 1;
	end;
	diasEnMes := r;
end;

begin
	imprimir(diaSemana(1,2,2020), diasEnMes(2, 2020));
end.