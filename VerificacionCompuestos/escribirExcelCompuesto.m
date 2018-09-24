function escribirExcelCompuesto(X,Y,nombreCompuesto,nombreArchivoSalida)
	%C, Y deben de ser puntos, nombreCompuesto un string array, nombreArchivoSalida un char array
	%aquí comienza la función
	numPuntos=min([length(X) length(Y)]);
	matriz=[];
	strfuncionEvaluar=strcat("verificacion",nombreCompuesto);
	
	for i=1:numPuntos
		if feval(strfuncionEvaluar,X(i),Y(i))
			matriz=[matriz;i, X(i), Y(i)];
		end
	end

	%definimos los encabezados
	%disp(nombreCompuesto);
	%nombreCompuesto
	encabezados={char(nombreCompuesto),'',''; 'No.','M','N'};
	cellCompuesto=num2cell(matriz);
	datos=[encabezados; cellCompuesto];
	nombreDeLaHoJaDeSalida=nombreCompuesto;

	xlswrite(nombreArchivoSalida,datos,nombreDeLaHoJaDeSalida);
	
end