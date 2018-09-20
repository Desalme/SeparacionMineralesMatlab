function [X,Y]=leerDatosExcel(nombreArchivo,nombreHoja)
	%funcion que lee un archivo de excel, localiza los encabezados 'N'y 'M' y guarda lo que esté debajo de esas columnas en vectores X y Y y los devuelve
	[~,~,sinProcesar]=xlsread(nombreArchivo,nombreHoja);
	[m,n]=size(sinProcesar);
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

	dim=0;
	renglon=renN;
	while ~isnan(sinProcesar{renglon,colN}) && ~isnan(sinProcesar{renglon,colM}) && renglon<m
		dim=dim+1;
		renglon=renglon+1;
	end

	%{
for i=renN+1:m
		if ~isnan(sinProcesar{i,colN}) && ~isnan(sinProcesar{i,colM})
			dim=dim+1;
		end
	end
%}
	X=zeros(dim,1);
	Y=zeros(dim,1);

    for i=1:dim
		if ~isnan(sinProcesar{i+renN,colN}) && ~isnan(sinProcesar{i+renM,colM}) && isnumeric(sinProcesar{i+renN,colN}) && isnumeric(sinProcesar{i+renM,colM})
			X(i,1)=sinProcesar{i+renN,colN};
        end
    end

    for i=1:dim
        if ~isnan(sinProcesar{i+renN,colN}) && ~isnan(sinProcesar{i+renM,colM}) && isnumeric(sinProcesar{i+renN,colN}) && isnumeric(sinProcesar{i+renM,colM})
			Y(i,1)=sinProcesar{i+renM,colM};
        end
    end
    
end



				


