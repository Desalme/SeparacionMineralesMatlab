function [bool]=circulo(h,k,r,x,y)
	%verifica si el punto (x,y) est� dentro del c�rculo con centro (h,k) y radio r. Devuelve true si s� y false si no.
	%ecuaci�n del c�rcyulo r^2=(x-h)^2+(y-k)^2
	if (x-h)^2+(y-k)^2<=r^2 %est� dentro del c�rculo
		bool=true;
	elseif (x-h)^2+(y-k)^2>r^2
		bool=false;
	end
end