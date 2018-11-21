function [A, B, C] = ecGeneralRecta(P1, P2)
	%Esta es una función que devuelve los parámetros de la ecucación general de la recta A, B, C, dados dos puntos P1, P2 que pasen por ella.
	x1 = P1(1);
	y1 = P1(2);
	x2 = P2(1);
	y2 = P2(2);

	%calcular pendiente
	m = (y2-y1)/(x2-x1);
	A = -m;
	B = 1;
	C = m*x2-y2;
end
