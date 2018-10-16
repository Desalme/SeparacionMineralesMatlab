function [cellMatriz]=leerRegistrosGeologicos(nombreDeArchivo, nombreDeHoja, titulosColumnas)
	%función que obtiene los datos NPHI
	%nombre archivo y nombreDeHoja deben ser char array y tituloColumna debe ser un cell array que contenga strings o char vectors
	%devuelve un cell array donde cada entrada es una matriz. La primer columna de esa matriz es el dato asociado al titulo de la columna 
	[~,~,sinProcesar]=xlsread(nombreDeArchivo,nombreDeHoja);
	[m,n]=size(sinProcesar);
	longTitulos=length(titulosColumnas);
	indicesRenglonesColumnas=cell(1,longTitulos); %un cell array de dimensiones iguales a las de los titulos que buscamos, donde cada entrada es una matriz que tiene dos índices [m n], en m se encuentra el renglon donde se encuentra el título y en n, la columna 

	%leer los índices en los que se encuentran los títulos de las columnas
	for k=1:longTitulos
		for i=1:m
			for j=1:n
				if strcmp(titulosColumnas{k}, sinProcesar{i,j}) %strcmp(s1,s2) compares s1 and s2 and returns 1 (true) if the two are identical and 0 (false) otherwise.
					indicesRenglonesColumnas{k}=[i,j];
				end
			end
		end
	end
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%almacenar los datos que se encuentran debajo de cada título
	cellMatriz=cell(1,longTitulos);
	
	for k=1:longTitulos
		renglonInicial=indicesRenglonesColumnas{k}(1);
		columna=indicesRenglonesColumnas{k}(2);
		%renglonesRestantes=m-indicesRenglonesColumnas{k}(1);
		%cellMatriz{k}=NaN(renglonesRestantes,2);
		for i=1:m-renglonInicial
			%cellMatriz{k}(i,1)=i;
			if ~isnan(sinProcesar{i+renglonInicial,columna})
				%cellMatriz{k}(i,1)=i;
				cellMatriz{k}(i,1)=sinProcesar{i+renglonInicial,columna};
			end
		end
	end 


end
