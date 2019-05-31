function t_hwc = tiempoDeHwc ( k_f, mu_o, q_o, B_o )
% tiempoDeHwc - Es una funci�n secundaria para obtener el tiempo de formaci�n del fen�meno de conificaci�n de acuerdo al articulo de Perez- Martinez
% y de La Garza
%
% Syntax: t_hwc = tiempoDeHwc( k_f, mu_o, q_o, B_o )
%
% k_f Permeabilidad de fractura (Darcy)
% q_o * B_o  tasa de aceite producido en condiciones de yacimiento (MRB/D)
% t_hwc tiempo de formaci�n del cono de agua (d�as)
% mu_o  se trata de la viscosidad del aceite (cp)

	t_hwc = 182.9*(k_f/mu_o)^(-0.26)*(q_o*B_o)^(-0.72);

end