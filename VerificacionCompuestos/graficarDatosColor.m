function graficarDatosColor(matriz, colorRGB)
	if ~isempty(matriz)
		vectorX=matriz(:,2);
		vectorY=matriz(:,3);
		plot(vectorX,vectorY, 'x', 'color', colorRGB);
	end
end