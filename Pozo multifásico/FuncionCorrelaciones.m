function [Rs, Densidad_gasDisuelto] = FuncionCorrelaciones(Opcion, Grados_API, DensidadR_gas, P_promedio, T_promedio)
	%CalculoCorrelaciones = {'Standing', 'Vazquez'}
	%Vazquez
	if Grados_API <=30
		Constantes = [.03062, 1.0937, 25.724];
	elseif Grados_API > 30
		Constantes = [.0178, 1.187, 23.931];
	end

	if strcmp(Opcion, 'Vazquez');
		Rs = Constantes(1) * DensidadR_gas * P_promedio ^ Constantes(2) * exp( Constantes(3) * (Grados_API/ (T_promedio + 460) ) ); %Vazquez
	elseif strcmp(Opcion, 'Standing')		
		Rs = DensidadR_gas * ( (P_promedio / 18.2 + 1.4) * 10 ^ (0.0125 * Grados_API - 0.00091 * T_promedio) ) ^ (1 / 0.83); %Standing
	end

	Densidad_gasDisuelto = 0.25 + (.02 * Grados_API) + (Rs* 1E-6) * (0.0874 - 3.5864 * Grados_API);
	
	ErrorSolubilidad = 100;
	ErrorGasDisuelto = 100;

	NormaError = sqrt(ErrorGasDisuelto^2 + ErrorSolubilidad^2);
	
	while NormaError > .00000001
		RsAnterior = Rs;
		Densidad_gasDisueltoAnterior = Densidad_gasDisuelto;

		if strcmp(Opcion, 'Vazquez')
			Rs = Constantes(1) * Densidad_gasDisuelto * P_promedio ^ Constantes(2) * exp( Constantes(3) * (Grados_API/ (T_promedio + 460) ) ); %Vazquez
		elseif strcmp(Opcion, 'Standing')
			Rs = Densidad_gasDisuelto * ( (P_promedio / 18.2 + 1.4) * 10 ^ (0.0125 * Grados_API - 0.00091 * T_promedio) ) ^ (1 / 0.83); %Standing
		end

		Densidad_gasDisuelto = 0.25 + (.02 * Grados_API) + (Rs* 1E-6) * (0.0874 - 3.5864 * Grados_API);

		ErrorSolubilidad= abs(Rs - RsAnterior);
		ErrorGasDisuelto = abs(Densidad_gasDisuelto - Densidad_gasDisueltoAnterior);
		NormaError = sqrt(ErrorGasDisuelto^2 + ErrorSolubilidad^2);		
	end
	%Rs = Constantes(1) * DensidadR_gas * P_promedio ^ Constantes(2) * exp( Constantes(3) * (Grados_API/ (T_promedio + 460) ) ); 
end