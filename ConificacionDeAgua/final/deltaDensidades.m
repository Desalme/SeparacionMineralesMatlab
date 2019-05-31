function rho_Diferencia = deltaDensidades(rho_aceite, rho_agua)
% deltaDensidades - Calcula la diferencia de densidades entre la densidad del agua y la densidad del aceite en gr/cm^3
%
% Syntax: rho_Diferencia = deltaDensidades(rho_aceite, rho_agua)
%
% rho_aceite se trata de la densidad del aceite y rho_agua se trata de la densidad del agua. El usuario tendra que ingresar
%la densidad en unidades  de gr/cm^3. Representa el potencial entre dos liquidos no inmiscibles en contacto.
	
	rho_Diferencia = abs(rho_agua - rho_aceite) ;
	
end