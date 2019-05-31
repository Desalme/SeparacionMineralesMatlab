function [ h_wc ] = alturaConoAguaMaximo( q_o, B_o, mu_o, r_e, r_w, k_f, rho_diferencia, cementado )
%alturaConoAguaMaximo - Calcula la altura maxima de conificaci�n de agua en la correlaci�n de P�rez-Mart�nez para un ycaimiento con una formaci�n carbonatada fracturada. 
% h_wc = ( 2.963 + F_bc ) * ( ( q_o * B_o * mu_o * Ln( r_e/r_w ) ) / ( k_f * rho_diferencia ) ) ^ 0.5 
%
% Syntax: [ h_wc ] = alturaConoAguaMaximo( q_o, B_o, mu_o, r_e, r_w, k_f, rho_diferencia)
%
% Utilizando la f�rmula h_wc = ( 2.963 + F_bc ) * ( ( q_o * B_o * mu_o * Ln( r_e/r_w ) ) / ( k_f * rho_diferencia ) ) ^ 0.5 se calcula la altura m�xima de conificaci�n de agua, donde:
% h_wc = Altura maxima del cono de agua (metros)
% q_o= tasa de gasto de aceite (MSTB/D)
% B_o= Factor de volumen de aceite (RB/STB)
% mu_o= viscosidad (cp)
% r_e= radio externo (metros)
% r_w= radio de pozo (metros)
% k_f= permeabilidad fracturada  (Darcy)
% rho_diferencia  La diferencia entre la densidad del agua menos la densidad del aceite (gr/cm^3)
% F_bc= Coeficiente de cementaci�n (adimensional) El valor ser�a igual a 0.217 cuando es pobremente cementado en el espacio anular. Y su valor es igual a cero
% cuando se tiene una buena cementaci�m.
% La funci�n pide como argumento cementado que es un booleano.(es decir, valor de verdadero o falso). Es verdadero si tiene una buena cementaci�n y falso en %caso contrario.

	if cementado
		F_bc = 0.217;
	else
		F_bc = 0;
	end
	
	h_wc = ( 2.963 + F_bc ) * ( ( q_o * B_o * mu_o * log( r_e/r_w ) ) / ( k_f * rho_diferencia ) ) ^ 0.5 ;

end