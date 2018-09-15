%function verificaciones(x,y)
function verificaciones
	%main
	clf
	clear
	%generar números aleatorios y almancenarlos en un archivo de excel
	[XAleatorio YAleatorio]=vectoresAleatorios; %vector columna
	[archivoEntrada hojaEntrada]=escribirExcelAleatorio(XAleatorio,YAleatorio); %vectores columna
	%leer los datos de un archivo de excel
	[X Y]=leerDatosExcel(archivoEntrada,hojaEntrada);
	tic
	%escribir al archivo donde queremos almacenar la información
	archivoSalida=escribirExcel(X,Y); %pone los encabezados y los datos iniciales
	toc
	
	iteracion=min([length(X) length(Y)]);
	contadorTriangulo=0;
	MatrizTriangulo=[];
	contadorCirculo=0;
	MatrizCirculo=[];
	tic
	for i= 1 : iteracion
		if compuestoVerificacionTriangulo(X(i),Y(i));
			contadorTriangulo=contadorTriangulo+1;		
			MatrizTriangulo=[MatrizTriangulo; X(i) Y(i)];
%{
			celdaX=['A' num2str(contador+1,'%d')];
			%celdaY=['B' num2str(contador,'%d')];
			xlswrite(archivoSalida,[X(i) Y(i)],nombreDeLaHojaTriangulo,celdaX);
%}
		end
	end
	%reemplazar por escribir triangulo
	nombreDeLaHojaTriangulo='Triángulo';
	encabezadosTriangulo={'Triángulo',''; 'M','N'};
	MatrizTriangulo=num2cell(MatrizTriangulo);
	datosTriangulo=[encabezadosTriangulo; MatrizTriangulo];
	xlswrite(archivoSalida,datosTriangulo,nombreDeLaHojaTriangulo);
	toc

	tic
	for i= 1 : iteracion
		if compuestoCirculoVerificacion(X(i),Y(i));
			contadorCirculo=contadorCirculo+1;
			MatrizCirculo=[MatrizCirculo; X(i) Y(i)];
			%{
			celdaX=['A' num2str(contadorCirculo+1,'%d')];
			%celdaY=['B' num2str(contador,'%d')];
			xlswrite(archivoSalida,[X(i) Y(i)], nombreDeLaHojaCirculo, celdaX);
%}
		end
	end
	nombreDeLaHojaCirculo='Círculo';
	encabezadosCirculo={'Círculo',''; 'M','N'};
	MatrizCirculo=num2cell(MatrizCirculo);
	datosCirculo=[encabezadosCirculo; MatrizCirculo];
	xlswrite(archivoSalida,datosCirculo,nombreDeLaHojaCirculo);
	toc

	restantes=length(X)-contadorTriangulo;
	restantes2=length(X)-contadorCirculo;
	sprintf('Hay %d puntos dentro del triángulo y %d fuera.',contadorTriangulo,restantes)
	sprintf('Hay %d puntos dentro del círculo y %d puntos fuera.',contadorCirculo,restantes2)

%%%%%%%%%%% Gráficas
	graficarInterfaces

	for i= 1 : length(X)
		graficarPuntos(X(i),Y(i));
	end
%{
	if compuesto
		"Está sustancia es este compuesto"
		%almancenar en un nuevo documento en la pestaña ecorrespondiente al compuesto
		return
	else
		return
%}

end