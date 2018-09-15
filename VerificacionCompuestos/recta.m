function [booleano]=recta(x1,y1,x2,y2,x3,y3,x,y)
	%funci�n que hace una recta con dos puntos de un tri�ngulo. Luego toma el tercer punto del tri�ngulo y dice si un punto (x,y) est� del mismo lado o no. 
	%tomamos los puntos 1 y 2 para construir los par�metros de la recta
	if x2~=x1
		m=(y2-y1)/(x2-x1);
		b=y1-m*x1;
		%constantes del problema (par�metro de la recta)
		c=m*x3+b;
		d=m*x+b;
		% verificar si el tercer punto del tri�ngulo queda por abajo o por arriba de la recta
		if y3>c
			%el tri�ngulo tiene pico para arriba
			if y>=d
				booleano=true; %el punto est� del mismo lado
			elseif y<d
				booleano=false; %el punto est� del lado contrario
			end
		elseif y3<c
			%el tri�ngulo tiene pico para abajo
			if y<=d
				booleano=true; %el punto est� del mismo lado
			elseif y>d
				booleano=false; %el punto est� del lado contrario.
			end
		end
		
	elseif x2==x1 %tri�ngulo con un lado paralelo al eje y
		if x3>x2 %el pico del triangulo abre hacia la derecha
			if x>=x2 %el caso en el que el punto a evaluar esta del mismo lado
				booleano=true;
			elseif x<x2
				booleano=false;
			end
		elseif x3<x2 %el pico abre hacia la derecha
			if x<=x2
				booleano=true;
			elseif x>x2
				booleano=false;
			end
		end
	end
end