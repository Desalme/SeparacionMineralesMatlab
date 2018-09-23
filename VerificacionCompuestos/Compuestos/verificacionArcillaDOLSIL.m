function [bool]=verificacionArcillaDOLSIL(x,y)
	[x1 y1 x2 y2 x3 y3]=cteArcillaDOLSIL;
	bool=triangulo(x1,y1,x2,y2,x3,y3,x,y);
end
