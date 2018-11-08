function [propiedadesGrafica] = graficarIsobaraV(ax,p, V_inicial, V_final, n )
%myFun - Description
%
% Syntax: [propiedadesGráfica] = graficarIsobaraV(p, V_inicial, V_final, n )
%
% Long description
   %pV=nRT;
   V=[V_inicial, V_final];
   P=[p,p];
   propiedadesGrafica=plot(ax, V, P, 'LineWidth', 2);
end