%function principal(nombreArchivo, nombreHoja)
function principal
	%clf
	%clear
	%configuraciones de Matlab
	addpath('./Compuestos/'); %añadir una subcarpeta del proyecto al path
	warning('off','MATLAB:xlswrite:AddSheet'); %no mostrar advertencias cuando se crea una hoja nueva en el documento de excel
	
	%leer datos
	tic
	disp("Tiempo del módulo de lectura");
	nombreArchivo='DatosPruebaMvsN.xlsx';
	nombreHoja='Hoja1';
	[X,Y]=leerDatosExcel(nombreArchivo,nombreHoja);
	toc

	%escribir datos
	nombreArchivoSalida='PruebaSalida.xlsx';

	strNombreCompuestos=["ArcillaDOLSIL", "DOLCALSIL", "FI2CaCOCaCODOL", "FI2DOLDOLCaCO", "GYPANHDOL", "SalSIL"];

	for i=1:length(strNombreCompuestos)
		tic
		escribirExcelCompuesto(X,Y,strNombreCompuestos(i),nombreArchivoSalida);
		tiempo=toc;
		%tiempo de ejecución
		mensaje=strcat("El tiempo de ejecución de escribirExcel de ", strNombreCompuestos(i), " es de ", string(tiempo), " segundos.");
		disp(mensaje);
	end


end


