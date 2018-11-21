%function principal(nombreArchivo, nombreHoja)
%function principal

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

	strNombreCompuestos=["GYPANHDOL","ArcillaDOLSIL", "DOLCALSIL", "SalSIL","FI2DOLDOLCaCO", "FI2CaCOCaCODOL", "FI2CaCOCaCOSil", "FI2SilSilCaCO"];
	%strNombreCompuestos=["ArcillaDOLSIL"]
	%strNombreCompuestos=["GYPANHDOL"];
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
	tic
	xlswrite(nombreArchivoSalida,cellTodoslosDatos,'ResumenRegiones');
	xlswrite(nombreArchivoSalida,cellSobrantes,'FueraDeRegion');
	toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	tic
	%Registros geológicos y matrices
	registrosGeologicos={'DT','NPHI','RHOB'}; %no mover este orden porque se utiliza para la cosntruccion de abajo
	cellVectoresIndependientes=leerRegistrosGeologicos('NuevoPozoPruebaDatos.xlsx','Hoja1',registrosGeologicos); %construye un cell array donde cada entrada es una columna de 4*1 donde cada entrada es un vector independiente 
	
	%inicializar cell arrays que tengan la matriz de coeficientes A y el vector independiente b para resolver un sistema de ecuaiones lineales 
	cellb=cell(numPuntos,1);
	cellA=cell(numPuntos,1);
	cellX=cell(numPuntos,1);
	% verificar que los datos tengan las mismas dimensiones
	datosSonCorrectos=true;
	for i=1:length(registrosGeologicos)
		if length(cellVectoresIndependientes{i})==numPuntos
			datosSonCorrectos=datosSonCorrectos&&true;
		else
			datosSonCorrectos=false;
		end
	end

	

	if datosSonCorrectos
		for i=1:numPuntos
			%construir cell b
			cellb{i}=[cellVectoresIndependientes{1}(i);cellVectoresIndependientes{2}(i);cellVectoresIndependientes{3}(i);1];
			%construir cell A
			nombreTemp=cellTodoslosDatos{i,4};
%{
			booleano=false;
			for compuesto=1:longitud
				booleano=booleano | contains(strNombreCompuestos{compuesto},nombreTemp);
			end
%}
			if ~isempty(nombreTemp)
			%si el renglon i de los datos está clasificado con un compuesto, entonces
				%reemplazar esta cell a por una función que devuelva los parámetros de acuerdo al compuesto
				cellA{i}=matrizCoeficientesA(nombreTemp);
				%cellA{i}=[189,43.5,50,52;1,.02,0,.49;1,2.87,2.98,2.35;1,1,1,1];
				%cellA{i}=[189,43.5,47.6,55.5;1,.02,0,-.035;1,2.87,2.71,2.65;1,1,1,1];
				cellX{i}=linsolve(cellA{i},cellb{i});
			end
		end
	end
	longitudcellTodo=4+4+16+4; %'No.','N','M','NombreCompuesto','b1','b2','b3','b4','A11','A12','A13','A14','A21','A22','A23','A24', 'A31','A32','A33','A34', 'A41','A42','A43','A44','X1','X2','X3','X4'
	cellTodo=cell(numPuntos,longitudcellTodo);
	for i=1:numPuntos
		for j=1:4
			cellTodo{i,j}=cellTodoslosDatos{i,j};
		end

		for j2=1:4
			cellTodo{i,j2+j}=cellb{i}(j2);
		end	

		if ~isempty(cellTodo{i,4});
			for j3=1:4
				for k=1:4
					cellTodo{i,(j3-1)*4+k+j2+j}=cellA{i}(j3,k);
				end
			end

			for j4=1:4
				cellTodo{i,j4+j3*k+j2+j}=cellX{i}(j4);
			end
		end
	end

	encabezadosCellTodo={'No.','N','M','NombreCompuesto','b1','b2','b3','b4','A11','A12','A13','A14','A21','A22','A23','A24', 'A31','A32','A33','A34', 'A41','A42','A43','A44','X1','X2','X3','X4'};%'Phi_1', 'V_DOL', 'Vol_ANH','V_yes'}
	datosExcelTodo=[encabezadosCellTodo; cellTodo];
	toc
	tic
	xlswrite(nombreArchivoSalida,datosExcelTodo,'Todo');
	toc
	%disp(cellX{1});
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	cellRegistrosPetrofisicos=[registrosGeologicos; cellVectoresIndependientes];
	
	indicesSobrantes=NaN(length(cellSobrantes),1);

	for i=1:length(cellSobrantes)
		indicesSobrantes(i) = cellSobrantes{i,1};
	end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%graficar
	tic
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
	toc
%end


