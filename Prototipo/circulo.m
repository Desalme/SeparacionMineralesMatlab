function [bool]=circulo(h,k,r,x,y)
	%verifica si el punto (x,y) está dentro del círculo con centro (h,k) y radio r. Devuelve true si sí y false si no.
	%ecuación del círcyulo r^2=(x-h)^2+(y-k)^2
	if (x-h)^2+(y-k)^2<=r^2 %está dentro del círculo
		bool=true;
	elseif (x-h)^2+(y-k)^2>r^2
		bool=false;
	end
end