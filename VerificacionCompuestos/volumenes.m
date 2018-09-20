
nombreArchivo='volumenes.xlsx';
nombreHoja='Matrices';
tic
matrizDatos=xlsread(nombreArchivo,nombreHoja,'N5:AG404');
toc
tic
[mD,nD]=size(matrizDatos);

%construir el super vecto b (cada renglon es un vector b de un suistema de ecuaciones)
superb=zeros(mD,4);
for i=1:mD
	contador=1;
	for j=1:nD
		if mod(j,5)==0
			superb(i,contador)=matrizDatos(i,j);
			contador=contador+1;
		end
	end
end

%definir la superMatrizA
superA=zeros(mD,16);
for i=1:mD
	contador=1;
	for j=1:nD	
		if mod(j,5)~=0
			superA(i,contador)=matrizDatos(i,j);
			contador=contador+1;
		end
	end
end

%disp(superb);
%disp(superA);

%Construir una matriz A a partir de un renglón de super matriz A


%superA(n,:)

%inicializar un super vector X
superX=zeros(mD,4);
%inicializar una matriz A
A=zeros(4);
%resolver el sistema de ecuaciones para cada renglón
for m=1:mD
	%hacer la matriz A para el renglón m
	for i=1:4
		for j=1:4
			A(i,j)=superA(m,4*(i-1)+j);
		end
	end
	%hacer el vector independiente b para un renglón m
	b=superb(m,:)';
	x=linsolve(A,b);
	superX(m,:)=x';
	%x=inv(A)*b;
end

%{
%format long
nombreDeLaHoJaDeSalida='Salida';
archivoSalida='PruebaSalida.xlsx';

%}
toc
tic
xlswrite(nombreArchivo,superX,nombreHoja,'AP5:AS404');
toc
