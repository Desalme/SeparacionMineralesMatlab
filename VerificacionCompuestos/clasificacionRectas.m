function [cellSobrantesClasificados, matrizSobrantes_DT_NPHI_RHOB] = clasificacionRectas(cellRegistrosPetrofisicos, indicesSobrantes)
	%clasifica los puntos fuera de las regiones de acuerdo a la minimizacion de la distancia respecto a unas rectas	
	[tamx tamy] = size(cellRegistrosPetrofisicos);
	nombres={'DT','NPHI','RHOB'};
	%for i=1:length(nombres)
		for j=1:tamy
			if strcmp(nombres{1}, cellRegistrosPetrofisicos{1,j})
				matrizDT=cellRegistrosPetrofisicos{2,j};
			end
			if strcmp(nombres{2}, cellRegistrosPetrofisicos{1,j})
				matrizNPHI=cellRegistrosPetrofisicos{2,j};
			end
			if strcmp(nombres{3}, cellRegistrosPetrofisicos{1,j})
				matrizRHOB=cellRegistrosPetrofisicos{2,j};
			end
		end
	%end

	longt=length(indicesSobrantes);

	cellSobrantesClasificados= cell(longt, 3);

	for i=1:longt
		cellSobrantesClasificados{i, 1}=indicesSobrantes(i);
	end

	matrizDTExtraidos=NaN(length(indicesSobrantes),1);
	matrizNPHIExtraidos=NaN(length(indicesSobrantes),1);
	matrizRHOBExtraidos=NaN(length(indicesSobrantes),1);

	for pos=1:longt
		indice = indicesSobrantes(pos);
		
		%matrizDTExtraidos =[ matrizDTExtraidos; matrizDT(indice)];
		matrizDTExtraidos(pos)= matrizDT(indice);
		matrizNPHIExtraidos(pos) = matrizNPHI(indice);
		matrizRHOBExtraidos(pos) = matrizRHOB(indice);
	end

	%Para la gráfica N
	% x=RHOB y= NPHI
	rectasN=datosRectasN();
	[Nx Ny] = size(rectasN);


	for puntosN=1:longt
		Q = [matrizRHOBExtraidos(puntosN), matrizNPHIExtraidos(puntosN)];
		distancias = NaN(Nx,1);
		for NoRecta=1:Nx
			P1 = rectasN{NoRecta,2};
			P2 = rectasN{NoRecta,3};
			[A, B, C] = ecGeneralRecta(P1, P2);
			[distancia]= distanciaPuntoRecta(A, B, C, Q);
			distancias(NoRecta)=distancia;
		end
		[minimaDistancia, indiceDistancia] = min(distancias);
		cellSobrantesClasificados{puntosN,2} = rectasN{indiceDistancia, 1};
	end
	%plot(matrizRHOBExtraidos, matrizNPHIExtraidos, '*')

	%Para la gráfica M
	% x=RHOB y= DT
	rectasM=datosRectasM();
	[Mx My] = size(rectasM);


	for puntosM=1:longt
		Q = [matrizRHOBExtraidos(puntosM), matrizDTExtraidos(puntosM)];
		distancias = NaN(Mx,1);
		for NoRecta=1:Mx
			P1 = rectasM{NoRecta,2};
			P2 = rectasM{NoRecta,3};
			[A, B, C] = ecGeneralRecta(P1, P2);
			[distancia]= distanciaPuntoRecta(A, B, C, Q);
			distancias(NoRecta)=distancia;
		end
		[minimaDistancia, indiceDistancia] = min(distancias);
		cellSobrantesClasificados{puntosM,3} = rectasM{indiceDistancia, 1};
	end

	matrizSobrantes_DT_NPHI_RHOB = [matrizDTExtraidos, matrizNPHIExtraidos, matrizRHOBExtraidos];

end