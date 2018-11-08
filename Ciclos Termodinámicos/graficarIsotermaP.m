function [propiedadesGrafica] = graficarIsotermaP(ax,T, p_inicial, p_final, n)
    %pV=nRT
    p=linspace(p_inicial,p_final,250);
    R=8.3144598; %8.3144598(48) J?mol?1?K?1
    V=n*R*T./p;
    propiedadesGrafica=plot(ax,V,p,'LineWidth', 2);
end
