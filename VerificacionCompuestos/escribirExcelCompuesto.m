function [matriz]=escribirExcelCompuesto(X,Y,nombreCompuesto,nombreArchivoSalida)
	%C, Y deben de ser puntos, nombreCompuesto un string array, nombreArchivoSalida un char array
	%aquí comienza la función
	numPuntos=min([length(X) length(Y)]);
    columnas=3;

	matriz=[];
	strfuncionEvaluar=strcat("verificacion",nombreCompuesto);
	
	for i=1:numPuntos
		if feval(strfuncionEvaluar,X(i),Y(i)) %"area",x, y=> area(x,y)
			matriz=[matriz;i, X(i), Y(i)];
		end
    end

    %{
    matriz=NaN(numPuntos,columnas);
	strfuncionEvaluar=strcat("verificacion",nombreCompuesto);
	contador=0;
	for i=1:numPuntos
		if feval(strfuncionEvaluar,X(i),Y(i))
			contador=contador+1;
            matriz(contador,:)=[i,X(i),Y(i)];
		end
    end
    matriz=matriz((1:contador),:);
    %}
    
	%definimos los encabezados
	%disp(nombreCompuesto);
	%nombreCompuesto
	encabezados={char(nombreCompuesto),'',''; 'No.','M','N'};
	cellCompuesto=num2cell(matriz);
	datos=[encabezados; cellCompuesto];
	nombreDeLaHoJaDeSalida=nombreCompuesto;

	xlswrite(nombreArchivoSalida,datos,nombreDeLaHoJaDeSalida);
	
end