function graficarUI(ax, p_succion, p_descarga, T_1, n, diametro_piston, longitud_piston)
   %clf(ax);
   
   %Conversiones
   diametro_piston=diametro_piston/100;%en metros
   longitud_piston=longitud_piston/100;%en metros
   p_succion=p_succion*9.81*(100^2);% Pascales o N/m^2
   p_descarga=p_descarga*9.81*(100^2);%Pascales o M/m^2
   T_1=T_1+273.15; %De Celsius a Kelvin
   
   

   %Constantes físicas
   masa_molar_aire=28.96; %En g/mol
   R=8.3144; %J/(Kelvin*mol)
   masa_molar_aire=masa_molar_aire/1000; %Kg/mol 

   volumen_cilindro=pi*((diametro_piston/2)^2)*longitud_piston;

   %puntos de la grafica

   %Calculamos el volumen muerto  
   %volumen_muerto= ((pi*(diametro_piston^2)/4)*longitud_piston)*0.03; %probablemente mal
   %T_2=(p_descarga*volumen_muerto)/(n*R);
   %el punto de abajo a la derecha es el punto 1 y todos los demás se nombran en sentido antihorario
   p=NaN(1,4);
   V=NaN(1,4);
   T=NaN(1,4);
   %presión
   p(1)=p_succion;
   p(2)=p_descarga;
   p(3)=p_descarga;
   p(4)=p_succion;

   %Temperatura
   T(1)=T_1;
   T(2)=T_1;

   %volumen
   V(1)=n*R*T(1)/p(1);
   %volumen_muerto=V(1)-volumen_cilindro

   V(2)=n*R*T(2)/p(2);
   V(3)=V(2)-volumen_cilindro;

   T(3)=p(3)*V(3)/(n*R);
   T(4)=T(3);
   V(4)=n*R*T(4)/p(4);


   %T(4)=p(4)*V(4)/(n*R);
   
   hold(ax,'on');

   [~]=graficarIsotermaP(ax,T(1),p(1),p(2),n);
   [~]=graficarIsobaraV(ax,p(2),V(2),V(3),n);
   [~]=graficarIsotermaP(ax,T(3),p(3),p(4),n);
   [~]=graficarIsobaraV(ax,p(4),V(4),V(1),n);

   title(ax,"Diagrama P-V, compresor embolo-pistón, simple etapa, simple efecto, aire= gas ideal ", 'fontsize',20)
   xlabel(ax,"V [m^3]",'fontsize',12)
   ylabel(ax,"p [Pa]", 'fontsize',12)
   legend(ax,{'Compresión', 'Descarga', 'Expansión', 'Admisión'}, 'fontsize',14);
   %grid on;
end