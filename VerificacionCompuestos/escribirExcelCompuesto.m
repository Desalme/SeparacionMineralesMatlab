function escribirExcelCompuesto(X,Y,nombreCompuesto,nombreArchivoSalida)
	numPuntos=min([length(X) length(Y)]);
	matriz=[];
	strfuncionEvaluar=strcat('verificacion',nombreCompuesto,'(X(i),Y(i))');
	for i=1:numPuntos
		if eval(strfuncionEvaluar)
			matriz=[matriz;i, X(i), Y(i)];
		end
	end

	%definimos los encabezados
	encabezados={nombreCompuesto,'',''; 'No.','M','N'};
	cellCompuesto=num2cell(matriz);
	datos=[encabezados; cellCompuesto];
	nombreDeLaHoJaDeSalida=nombreCompuesto;

	xlswrite(nombreArchivoSalida,datos,nombreDeLaHoJaDeSalida);
end