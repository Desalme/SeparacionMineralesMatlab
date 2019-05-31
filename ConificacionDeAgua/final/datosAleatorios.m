function [ q_o, B_o, mu_o, r_e, r_w, k_f, rho_diferencia, cementado] = datosAleatorios()
% datosAleatorios - Esta función devuelve datos aleatorios de las variables del problema de altura de conificación del agua
%
% Syntax: [ q_o, B_o, mu_o, r_e, r_w, k_f, rho_diferencia, cementado] = datosAleatorios()
%
% h_wc = Altura maxima del cono de agua (metros)
% q_o= tasa de gasto de aceite (MSTB/D)
% B_o= Factor de volumen de aceite (RB/STB)
% mu_o= viscosidad (cp)
% r_e= radio externo (metros)
% r_w= radio de pozo (metros)
% k_f= permeabilidad fracturada  (Darcy)
% rho_diferencia  La diferencia entre la densidad del agua menos la densidad del aceite (gr/cm^3)
% F_bc= Coeficiente de cementación (adimensional) El valor sería igual a 0.217 cuando es pobremente cementado en el espacio anular. Y su valor es igual a cero
% cuando se tiene una buena cementacióm.
% La función pide como argumento cementado que es un booleano.(es decir, valor de verdadero o falso). Es verdadero si tiene una buena cementación y falso en %caso contrario.

	q_o = 1 + 19 * rand();
	B_o = 1 + 0.3 * rand();
	mu_o = 2 + 38 * rand();
	r_e = 300; 
	r_w = 2;
	k_f = 0.5 + 9.5 * rand() ;
	rho_o = 0.5 + 1.4 * rand() ;
	rho_w = 0.5 + 1.4 * rand() ;
	rho_diferencia = deltaDensidades( rho_o, rho_w ) ;
	cementado = 0.5 > rand();
	
end