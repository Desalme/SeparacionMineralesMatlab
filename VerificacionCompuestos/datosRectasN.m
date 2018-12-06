function [cellPuntosDeRecta] = datosRectasN()
	%devuelve un cell array con el formato 'nombre', P1, P2, donde P1 y P2 son los puntos de la recta
	PAgua=[1, 1];

	cellPuntosDeRecta={
	'Silica', [2.65, -.035], PAgua;
	'CaCO3', [2.71, 0], PAgua;
	'DOLOMITE2', [2.87, 0.02], PAgua;
	'ANHYDRITE', [2.98, 0], PAgua;
	'GYPSUM', [2.35, 0.49], PAgua;
	'SALT', [2.05, 0.04], PAgua;
	'LUTITA', [2.35, 0.35], PAgua;
	};

end
