function [H]=FuncionCargaH(A, B, C, Q)
%Se trata de la ecuacion caracteristica de la bomba,como ya tenemos 
%los coeficientes A,B,C. Aqui se calcula H que es la carga.A partir de 
%un Q propuesto previamente por el usuario.
H=A*Q.^2+B*Q+C;

end


