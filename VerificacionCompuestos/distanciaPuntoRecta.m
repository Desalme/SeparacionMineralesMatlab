function [distancia]= distanciaPuntoRecta(A, B, C, Q)
	%devuelve la mínima de las distancias entre un punto y una recta, tomando los parámetros de una recta en su forma general y dado un punto Q=(q1,q2)
	q1 = Q(1) ;
	q2 = Q(2);
	distancia = (abs(A*q1 + B*q2 + C))/((A^2 + B^2)^.5);
end