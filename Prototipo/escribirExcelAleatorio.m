function [nombreDelArchivo nombreDeLaHoja]=escribirExcelAleatorio(X,Y) %esto es una prueba
	%recibe vectores X y Y con  datos
	
	nombreDelArchivo='DatosEntrada.xlsx';
	nombreDeLaHoja= 'DatosAleatorios';
	%delete(nombreDelArchivo);
	encabezados={'M','N'};
	numeros=num2cell([X Y]);
	datosAEscribir=[encabezados; numeros];
	warning('off','MATLAB:xlswrite:AddSheet');
	xlswrite(nombreDelArchivo,datosAEscribir,nombreDeLaHoja);

%{

	xlswrite(nombreDelArchivo,encabezados,nombreDeLaHoja);

	rangoDeCeldasDeX='A2';
	rangoDeCeldasDeY='B2';
	xlswrite(nombreDelArchivo, X, nombreDeLaHoja, rangoDeCeldasDeX);
	xlswrite(nombreDelArchivo, Y, nombreDeLaHoja, rangoDeCeldasDeY);

%}

end



