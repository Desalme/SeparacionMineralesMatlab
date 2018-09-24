function [X Y]=vectoresAleatorios(cantidad, cotaInferior, cotaSuperior)
	%{
cantidad=150; %cantidad de puntos
	cotaInferior=-10;
	cotaSuperior=10;
%}

	rango=cotaSuperior-cotaInferior;
	%X = randi([-10 10],1,cantidad); %entero
	%Y = randi([-10 10],1,cantidad);
	X=cotaInferior+rango*rand(cantidad,1);
	Y=cotaInferior+rango*rand(cantidad,1);
end