function [cellPuntosDeRecta] = datosRectasM()
	%devuelve un cell array con el formato 'nombre', P1, P2, donde P1 y P2 son los puntos de la recta
	PAgua=[1, 189];

	cellPuntosDeRecta={
	'Silica', [2.65, 55.5], PAgua;
	'CaCO3', [2.71, 47.6], PAgua;
	'DOLOMITE2', [2.87, 43.5], PAgua;
	'ANHYDRITE', [2.98, 50], PAgua;
	'GYPSUM', [2.35, 52], PAgua;
	'SALT', [2.05, 67], PAgua;
	'LUTITA', [2.35, 120], PAgua;
	};

end
