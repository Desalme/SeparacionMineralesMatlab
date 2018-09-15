%prueba de nuestras funciones
	%Punto 1
	x1=5;y1=2;
	%Punto 2
	x2=7;y2=10;
	%Punto 3
	x3=4;y3=15;
	%punto a probar
	x=2;y=7;

	a=triangulo(x1,y1,x2,y2,x3,y3,x,y);

	VectorX=[x1 x2 x3];
	VectorY=[y1 y2 y3];

	plot(VectorX,VectorY, 'linewidth',1)