function [BOOL]=triangulo(X1,Y1,X2,Y2,X3,Y3,X,Y)
	% (x1,y1), (x2,y2), (x3,y3) son los puntos del triángulo. (x,y) es el punto a verificar
	if recta(X1,Y1,X2,Y2,X3,Y3,X,Y) %lado 1
		if recta(X2,Y2,X3,Y3,X1,Y1,X,Y) % lado 2
			if recta(X3,Y3,X1,Y1,X2,Y2,X,Y) %lado 3
				BOOL=true;
			else
				BOOL=false;
			end
		else
			BOOL=false;
		end
	else 
		BOOL=false;
	end
end








		
