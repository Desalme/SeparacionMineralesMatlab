%function principal(nombreArchivo, nombreHoja)
function principal
	clf
	clear
	%configuraciones de Matlab
	addpath('./Compuestos/'); %añadir una subcarpeta del proyecto al path
	warning('off','MATLAB:xlswrite:AddSheet'); %no mostrar advertencias cuando se crea una hoja nueva en el documento de excel
	
	%leer datos
	tic
	disp("Tiempo del módulo de lectura");
	nombreArchivo='DatosPruebaMvsN.xlsx';
	nombreHoja='Hoja1';
	[X,Y]=leerDatosExcel(nombreArchivo,nombreHoja);
	numPuntos=min([length(X) length(Y)]);
	%definir un cell array para almacenar todos los datos con sus clasificaciones
	cellTodoslosDatos=cell(numPuntos,4); %i x(i) y(i) nombrecompuesto
	for i=1:numPuntos
		cellTodoslosDatos{i,1}=i;
		cellTodoslosDatos{i,2}=X(i);
		cellTodoslosDatos{i,3}=Y(i);
		cellTodoslosDatos{i,4}='';
	end
	toc

	%escribir datos
	nombreArchivoSalida='PruebaSalida.xlsx';

	strNombreCompuestos=["ArcillaDOLSIL", "DOLCALSIL", "FI2CaCOCaCODOL", "FI2DOLDOLCaCO", "GYPANHDOL", "SalSIL", "FI2CaCOCaCOSil", "FI2SilSilCaCO"];
	%strNombreCompuestos=["ArcillaDOLSIL"]
	longitud=length(strNombreCompuestos);
	cellDatosMatrizCompuestos=cell(1,longitud);
	%separando los datos en matrices distintas y guardándolas en un cerll rarray con indices de los nombres
	for i=1:longitud
		tic
		[cellDatosMatrizCompuestos{i}]=escribirExcelCompuesto(X,Y,strNombreCompuestos(i),nombreArchivoSalida);
		tiempo=toc; %tiempo de ejecución
		mensaje=strcat("El tiempo de ejecución de escribirExcel de ", strNombreCompuestos(i), " es de ", string(tiempo), " segundos.");
		disp(mensaje);
	end

	%una vez clasificados los datos dentro de cellDatosMatrizCompuestos, entonces agregamos la cuarta columna (la correspondiente al nombre del compuesto) dentro de cellTodoslosDatos{indice,4}
	tic
	for long=1:longitud
		matrizTemporal=cellDatosMatrizCompuestos{long};
		if ~isempty(matrizTemporal)
			for i=1:length(matrizTemporal)
				indice=matrizTemporal(i,1);
				cellTodoslosDatos{indice,4}=convertStringsToChars(strNombreCompuestos(long));
			end
		end
	end

	%en este punto del programa los datos ya están clasifcados en cellTodoslosDatos 
	%gclasificar los datos sobrantes (o sea los que quedan afuera de las regiones)
	cellSobrantes={}; %puntos que están afuera
	contadorSobrantes=0;
	for i=1:numPuntos
		if isempty(cellTodoslosDatos{i,4})
			contadorSobrantes=contadorSobrantes+1;
			cellSobrantes(contadorSobrantes,:)=cellTodoslosDatos(i,(1:3));
		end
	end

	matrizSobrantes=cell2mat(cellSobrantes); %convierte un cell array a un num array
	tiempo=toc; %tiempo de ejecución
	mensaje=strcat("El tiempo de ejecución para clasificar todos los datos en un cellarray según compuestos es de ", string(tiempo), " segundos.");
	disp(mensaje);

	%Guardar en Excel todos los datos y los sobrantes (los que están afuera)
	%xlswrite(filename,A,sheet)
	xlswrite(nombreArchivoSalida,cellTodoslosDatos,'ResumenRegiones');
	xlswrite(nombreArchivoSalida,cellSobrantes,'FueraDeRegion');

	%graficar

	%colores RGB
	colores={[.9,.22,.21],[.925,.251,.478],[.482,.122,.635],[.102,.137,.494],[.129,.588,.952],[.149,.776,.855],[.302,.714,.675],[.263,.627,.278], [.804,.863,.224],[1,.769,0], [.937,.424,0]};
	
	%1rojo, 2rosa, 3morado, 4indigo, 5azul, 6cyan, 7aqua, 8verde, 9lima, 10ambar, 11naranjaFuerte
	graphObjArr=gobjects(1,longitud);
	hold on;
	%graficarinterfaces
	for i=1:longitud
		graphObjArr(i)=graficarInterfaces(strNombreCompuestos(i), colores{i});
		graficarDatosColor(cellDatosMatrizCompuestos{i}, colores{i});%graficar puntos de las matrices
	end
	plot(matrizSobrantes(:,2), matrizSobrantes(:,3),'LineStyle', 'none', 'Marker', '.', 'color', 'black');
	%propiedades de la gráfica
	title('Evaluación de litoporosidad');
	xlabel('N');
	ylabel('M');
	leyenda=convertStringsToChars(strNombreCompuestos);
	legend(graphObjArr,leyenda);
	%saveas(gcf,'graficoLitoporosidad.png');
	print('graficoLitoporosidad','-dpng','-r0') %guardar el archivo en imagen Use '-r0' to save it with screen resolution
	
end


