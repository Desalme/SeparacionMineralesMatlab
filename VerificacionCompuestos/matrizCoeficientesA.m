function [A]=matrizCoeficientesA(nombreCompuesto)
	if isstring(nombreCompuesto)
		convertStringsToChars(nombreCompuesto);
	end
	%strNombreCompuestos=["GYPANHDOL","ArcillaDOLSIL","DOLCALSIL", "SalSIL","FI2DOLDOLCaCO", "FI2CaCOCaCODOL", "FI2CaCOCaCOSil", "FI2SilSilCaCO"];
%{
VectorIndependiente
DT
NPHI
RHOB
1
%}
	switch nombreCompuesto
	case 'GYPANHDOL'
		A=[189,52,50,43.5;
		1,0.49,0,0.02;
		1,2.35,2.98,2.87;
		1,1,1,1];

	case 'ArcillaDOLSIL'
		A=[189,52,50,43.5;
		1,0.49,0,0.02;
		1,2.35,2.98,2.87;
		1,1,1,1];

	case 'DOLCALSIL'
		A=[189,43.5,47.6,55.5;
		1,0.02,0,-0.035;
		1,2.87,2.71,2.65;
		1,1,1,1];

	case 'SalSIL'
		A=[189,47.6,67,55.5;
		1,0,0.04,-0.035;
		1,2.71,2.05,2.65;
		1,1,1,1];

	case 'FI2DOLDOLCaCO'
		A=[189,45.55,43.5,47.6;
		1,1,0.02,0;
		1,1,2.87,2.71;
		1,1,1,1;];

	case 'FI2CaCOCaCODOL'
		A=[189,45.55,47.6,43.5;
		1,1,0,0.02;
		1,1,2.71,2.87;
		1,1,1,1];

	case 'FI2CaCOCaCOSil'
		A=[189,51.55,47.6,55.5;
		1,1,0,-0.035;
		1,1,2.71,2.65;
		1,1,1,1];

	case 'FI2SilSilCaCO'
		A=[189,51.55,55.5,47.6;
		1,1,-0.035,0;
		1,1,2.65,2.71;
		1,1,1,1];
	otherwise
		A=NaN;
	end
end