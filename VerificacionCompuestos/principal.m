%function principal(nombreArchivo, nombreHoja)
function principal
	%clf
	%clear
	%configuraciones de Matlab
	addpath('./Compuestos/'); %a�adir una subcarpeta del proyecto al path
	warning('off','MATLAB:xlswrite:AddSheet'); %no mostrar advertencias cuando se crea una hoja nueva en el documento de excel
	
	%leer datos
	tic
	disp("Tiempo del m�dulo de lectura");
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
		%tiempo de ejecuci�n
		mensaje=strcat("El tiempo de ejecuci�n de escribirExcel de ", strNombreCompuestos(i), " es de ", string(tiempo), " segundos.");
		disp(mensaje);
	end


end


