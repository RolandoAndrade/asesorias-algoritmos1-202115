program conjuntos;
	type
		caracteres = set of Char;
	var
		A,B,C,D: caracteres;
begin
	A:=['a','z', 'h', 'f', '!', '*'];
	B:=['z','*'];
	C:=['A', '%', 'k'];
	D:=['!', 'h', 'z', 'f'];
	//'z','*', '!', 'h', 'f'
	writeln(A*B = B);
	writeln(B+D<=A);
end.