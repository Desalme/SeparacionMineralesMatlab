function [bool]=verificacionFI2DOLDOLCaCO(x,y)
	[x1,y1,x2,y2,x3,y3]=cteFI2DOLDOLCaCOParte1;
	bool1=triangulo(x1,y1,x2,y2,x3,y3,x,y);

	[x1,y1,x4,y4,x3,y3]=cteFI2DOLDOLCaCOParte2;
	bool2=triangulo(x1,y1,x4,y4,x3,y3,x,y);

	if bool1==true || bool2==true
		bool=true;
	else
		bool=false;
	end
	
end