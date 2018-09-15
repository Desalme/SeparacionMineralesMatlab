function [nombreDelArchivo]=escribirExcel(X,Y) %esto es una prueba
	%recibe vectores X y Y con  datos
	
	nombreDelArchivo='DatosSalida.xlsx';
	nombreDeLaHoja= 'Datos';

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

	

	encabezadosCirculo={'M','N','Círculo'};
	nombreDeLaHojaCirculo='Círculo';
	xlswrite(nombreDelArchivo,encabezadosCirculo,nombreDeLaHojaCirculo);

end
