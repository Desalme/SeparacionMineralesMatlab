function [booleano]=recta(x1,y1,x2,y2,x3,y3,x,y)
	%función que hace una recta con dos puntos de un triángulo. Luego toma el tercer punto del triángulo y dice si un punto (x,y) está del mismo lado o no. 
	%tomamos los puntos 1 y 2 para construir los parámetros de la recta
	if x2~=x1
		m=(y2-y1)/(x2-x1);
		b=y1-m*x1;
		%constantes del problema (parámetro de la recta)
		c=m*x3+b;
		d=m*x+b;
		% verificar si el tercer punto del triángulo queda por abajo o por arriba de la recta
		if y3>c
			%el triángulo tiene pico para arriba
			if y>=d
				booleano=true; %el punto está del mismo lado
			elseif y<d
				booleano=false; %el punto está del lado contrario
			end
		elseif y3<c
			%el triángulo tiene pico para abajo
			if y<=d
				booleano=true; %el punto está del mismo lado
			elseif y>d
				booleano=false; %el punto está del lado contrario.
			end
		end
		
	elseif x2==x1 %triángulo con un lado paralelo al eje y
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