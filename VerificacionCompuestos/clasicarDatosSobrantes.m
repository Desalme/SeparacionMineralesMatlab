function [cellSobrantesClasificacionConclusion, cellTodoslosDatos] = clasicarDatosSobrantes(cellSobrantesClasificacionRectas, cellTodoslosDatos); 
	[mS, nS] = size(cellSobrantesClasificacionRectas);

	%cellSobrantesClasificacionConclusion = cell(mS, nS+1);
	cellSobrantesClasificacionConclusion = [cellSobrantesClasificacionRectas, cell(mS,1)];

	for i=1:mS
		if strcmp(cellSobrantesClasificacionConclusion{i,2}, cellSobrantesClasificacionConclusion{i,3})
			cellSobrantesClasificacionConclusion{i,4} = cellSobrantesClasificacionConclusion{i,2};
			indice = cellSobrantesClasificacionConclusion{i,1};
			cellTodoslosDatos{indice,4} = cellSobrantesClasificacionConclusion{i,4};
		end
			
	end

end
