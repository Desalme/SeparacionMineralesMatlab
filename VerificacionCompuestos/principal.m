%function principal(nombreArchivo, nombreHoja)
function principal
	%clf
	%clear
	addpath('./Compuestos/');
	warning('off','MATLAB:xlswrite:AddSheet');
	
	%leer datos
	nombreArchivo='DatosPruebaMvsN.xlsx';
	nombreHoja='Hoja1';
	[X,Y]=leerDatosExcel(nombreArchivo,nombreHoja);

	%escribir datos
	nombreArchivoSalida='PruebaSalida.xlsx';

	strArcillaDOLSIL='ArcillaDOLSIL';
	strDOLCALSIL='DOLCALSIL';
	strFI2CaCOCaCODOL='FI2CaCOCaCODOL';
	strFI2DOLDOLCaCO='FI2DOLDOLCaCO';
	strGYPANHDOL='GYPANHDOL';
	strSalSIL='SalSIL';

	escribirExcelCompuesto(X,Y,strArcillaDOLSIL,nombreArchivoSalida);
	escribirExcelCompuesto(X,Y,strDOLCALSIL,nombreArchivoSalida);
	escribirExcelCompuesto(X,Y,strFI2CaCOCaCODOL,nombreArchivoSalida);
	escribirExcelCompuesto(X,Y,strFI2DOLDOLCaCO,nombreArchivoSalida);
	escribirExcelCompuesto(X,Y,strGYPANHDOL,nombreArchivoSalida);
	escribirExcelCompuesto(X,Y,strSalSIL,nombreArchivoSalida);
		%{
		numPuntos=min([length(X) length(Y)]);
		matrizGYPANHDOL=[];
		for i=1:numPuntos
			if verificacionGYPANHDOL(X(i),Y(i))
				matrizGYPANHDOL=[matrizGYPANHDOL;i, X(i), Y(i)];
			end
		end
		
		%definimos los encabezados
		encabezadosGYPANHDOL={'GYPANDHOL','',''; 'No.','M','N'};
		cellGYPANHDOL=num2cell(matrizGYPANHDOL);
		datosGYPANHDOL=[encabezadosGYPANHDOL; cellGYPANHDOL];

		%Para el excel
		nombreDeLaHoJaDeSalida='Salida';
		archivoSalida='PruebaSalida.xlsx';

		xlswrite(archivoSalida,datosGYPANHDOL,nombreDeLaHoJaDeSalida);
%}


end


