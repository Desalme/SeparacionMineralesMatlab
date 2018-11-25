function [A, B, C] = CalcularCoeficientes(VectorCaudal, VectorCabezal)

	%Creando el arreglo de la matriz
	MatrizSistema = [VectorCaudal.^2, VectorCaudal, ones(3,1)];
	VectorIndependiente=VectorCabezal;

	%Para Solucionar el sistema

	SolucionCoeficientes=linsolve(MatrizSistema,VectorIndependiente);
	A=SolucionCoeficientes(1);
	B=SolucionCoeficientes(2);
	C=SolucionCoeficientes(3);
end