%function principal(nombreArchivo, nombreHoja)
function principal
	clf
	clear
	nombreArchivo='DatosPruebaMvsN';
	nombreHoja='Hoja1';
	[X Y]=leerDatosExcel(nombreArchivo,nombreHoja);
	
	
	numPuntos=min([length(X) length(Y)]);

	matrizGYPANHDOL=[];
	for i=1:numPuntos
		if verificacionGYPANHDOL(X(i),Y(i))
			matrizGYPANHDOL=[matrizGYPANHDOL;i, X(i), Y(i)];
		end
	end
	%Para el excel
	nombreDeLaHoJaDeSalida='Salida';
	archivoSalida='PruebaSalida.xlsx'
	%definimos los encabezados
	encabezadosGYPANHDOL={'GYPANDHOL','',''; 'No.','M','N'};
	cellGYPANHDOL=num2cell(matrizGYPANHDOL);
	datosGYPANHDOL=[encabezadosGYPANHDOL; cellGYPANHDOL];
	xlswrite(archivoSalida,datosGYPANHDOL,nombreDeLaHoJaDeSalida);

end


