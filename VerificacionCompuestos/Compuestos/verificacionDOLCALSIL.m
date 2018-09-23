function [bool]=verificacionDOLCALSIL(x,y)
	[x1 y1 x2 y2 x3 y3]=cteDOLCALSIL;
	bool=triangulo(x1,y1,x2,y2,x3,y3,x,y);
end
