function [ vector ] = datosAleatorios( cadena)
% datosAleatorios - Esta función devuelve datos aleatorios en forma de vector para un intervalo de las variables del problema de altura de conificación del agua
%
% Syntax: [ vector] = datosAleatorios( cadena)
%
% Cadena puede ser uno de los siguientes (encerrado en comillas simples):
% h_wc = Altura maxima del cono de agua (metros)
% q_o= tasa de gasto de aceite (MSTB/D)
% B_o= Factor de volumen de aceite (RB/STB)
% mu_o= viscosidad (cp)
% r_e= radio externo (metros)
% r_w= radio de pozo (metros)
% k_f= permeabilidad fracturada  (Darcy)
% rho_diferencia  La diferencia entre la densidad del agua menos la densidad del aceite (gr/cm^3)
% n = numero de divisiones
	n = 100 ;

	switch cadena
		case 'q_o'
			vector = linspace ( 1 , 100 , n );
		case 'B_o'
			vector = linspace( 1, 1.3, n );
		case 'mu_o'
			vector = linspace( 2, 40, n );
		case 'r_e'
			vector = linspace ( 50 , 400 , n );
		case 'r_w'
			vector = linspace( .2, 10, n );
		case 'k_f'
			vector = linspace( 0.5, 10, n );
		case 'rho_o'
			vector = linspace ( 0.5 , 1.9 , n );
		case 'rho_w'
			vector = linspace( 0.5, 1.9, n );
  end

end