function [X,Y]=leerDatosExcel(nombreDeArchivo, nombreDeHoja)
	[num,txt,sinProcesar]=xlsread(nombreDeArchivo, nombreDeHoja);
	longitud=length(txt(1,:));
	for i=1:1:longitud
		if txt{1,i}=='M'
			X=num(:,i);
		elseif txt{1,i}=='N'
			Y=num(:,i);
		else
			X='error'
			Y='error'
		end
	end

end