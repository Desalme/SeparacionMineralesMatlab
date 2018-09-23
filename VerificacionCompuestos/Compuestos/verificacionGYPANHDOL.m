function [bool]=verificacionGYPANHDOL(x,y)
	[x1 y1 x2 y2 x3 y3]=cteGYPANHDOL;
	bool=triangulo(x1,y1,x2,y2,x3,y3,x,y);
end
