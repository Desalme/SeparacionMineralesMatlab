function graficarInterfaces(nombreCompuesto)
	strFuncionEvaluar=strcat("cte",nombreCompuesto);
	charFuncionEvaluar=convertStringsToChars(strFuncionEvaluar);
	numeroDevoluciones=nargout(str2func(charFuncionEvaluar));

	%{
arregloIntermedio=zeros(1,numeroDevoluciones);
	arregloIntermedio=feval(strFuncionEvaluar);
%}		
	%{
if numeroDevoluciones==6
		[a,b,c,d,e,f]=feval(strFuncionEvaluar);
		arregloIntermedio=[a b c d e f];
	elseif numeroDevoluciones==8
		[a,b,c,d,e,f,g,h]=feval(strFuncionEvaluar);
		arregloIntermedio=[a b c d e f g h];
	end
%}


	celdaIntermedia=cell(1,numeroDevoluciones);
	[celdaIntermedia{:}]=feval(strFuncionEvaluar);
	arregloIntermedio=cell2mat(celdaIntermedia);

	vectorX=[];
	vectorY=[];

	for i=1:numeroDevoluciones
		if mod(i,2)==1
			vectorX=[vectorX, arregloIntermedio(i)];
		elseif mod(i,2)==0
			vectorY=[vectorY, arregloIntermedio(i)];
		end
	end

	vectorX=[vectorX,arregloIntermedio(1)];
	vectorY=[vectorY,arregloIntermedio(2)];

	plot(vectorX, vectorY)
end

