function [X,Y]=leerDatosExcel(nombreArchivo,nombreHoja)
	%funcion que lee un archivo de excel, localiza los encabezados 'N'y 'M' y guarda lo que esté debajo de esas columnas en vectores X y Y y los devuelve
	[num txt sinProcesar]=xlsread(nombreArchivo,nombreHoja);
	[m n]=size(sinProcesar);
	for i=1:1:m
		for j=1:1:n
			if sinProcesar{i,j}=='N'
				renN=i;
				colN=j;
			elseif sinProcesar{i,j}=='M'
				renM=i;
				colM=j;
			end
		end
	end
	X=zeros(m-renN,1);
	Y=zeros(m-renM,1);
	for i=1:1:m-renN
		X(i,1)=sinProcesar{i+renN,colN};
	end

	for i=1:1:m-renN
		Y(i,1)=sinProcesar{i+renM,colM};
	end
end



				


