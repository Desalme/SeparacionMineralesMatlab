function [bool]=compuestoVerificacionTriangulo(x,y)
	[x1 y1 x2 y2 x3 y3]=constanteCompuesto;
	bool=triangulo(x1,y1,x2,y2,x3,y3,x,y);
%{
	if bool
		sprintf('Los puntos M=%d y N=%d se clasifican como el compuesto imaginario',x,y);
	else
		"Está fuera"
	end
%}

end
