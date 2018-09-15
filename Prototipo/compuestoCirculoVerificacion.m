function [bool]=compuestoCirculoVerificacion(x,y)
	[h k r]=constanteCompuestoCirculo;
	bool=circulo(h,k,r,x,y);
end
