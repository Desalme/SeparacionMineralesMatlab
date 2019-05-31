[ q_o, B_o, mu_o, r_e, r_w, k_f, rho_diferencia, cementado] = datosAleatorios();

q_o_vector = intervaloDatos('q_o');
k_f_vector = intervaloDatos('k_f');

n = length(q_o_vector);
h_wc_vector = zeros( n, n );

for i = 1: n
	for j = 1: n
		[ h_wc_vector( j, i ) ] = alturaConoAguaMaximo( q_o_vector(i), B_o, mu_o, r_e, r_w, k_f_vector(j), rho_diferencia, cementado);
	end
end

% plot( q_o_vector, h_wc_vector );

surf( q_o_vector, k_f_vector, h_wc_vector );
title('Conificación de agua en yacimiento con formación carbonatada fracturada')


set(get(gca, 'XLabel'), 'String', 'Gasto aceite (MSTB/D)');
set(get(gca, 'YLabel'), 'String', 'Permeabilidad de fractura (Darcy)');
set(get(gca, 'ZLabel'), 'String', 'Altura de conificación (metros)'); 


%{
 
writerObj = VideoWriter('GastoContraAltura.avi'); % Name it.
writerObj.FrameRate = 10; % How many frames per second.
open(writerObj);

for j = 1 : n
	plot( q_o_vector(:), h_wc_vector( j, :) );
	titulo = ['Gasto contra altura de conificación. k_f = ', num2str( k_f_vector( j ) ) ];
	title(titulo);
	xlabel('Gasto');
	ylabel('Altura');
	% axis equal;
	axis([ 0 100 0 1000]);
	frame = getframe(gcf); % 'gcf' can handle if you zoom in to take a movie.
  writeVideo(writerObj, frame);
end

close(writerObj); % Saves the movie. 
%}
