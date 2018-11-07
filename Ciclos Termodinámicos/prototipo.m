%Compresor embolo-pistón, simple etapa, simple efecto, aire= gas ideal

%datos
diametro_piston=10; %[cm]
longitud_piston=13; %[cm]
m_porcentual=3; % masa porcentual [%]
w=150; %velocidad angular [rpm]
p_succion=1; %[kgf/cm^2]
T_1=17; %[C] proceso isotérmico
p_descarga=5; %[kgf/cm^2]
eficiencia_indicada=.75;
eficiencia_mecanica=.85;
n=1; %n de la Ecuacion de gases. 
%Constantesd físicas
masa_molar_aire=28.96; %En g/mol
R=8.3144; %J/(Kelvin*mol)
%Conversiones
diametro_piston=diametro_piston/100;%en metros
longitud_piston=longitud_piston/100;%en metros
m_porcentual=m_porcentual/100;% en fraccion
w=w/60; %rps
p_succion=p_succion*9.81*(100^2);% Pascales o N/m^2
T_1=T_1+273.15; %De Celsius a Kelvin
p_descarga=p_descarga*9.81*(100^2);%Pascales o M/m^2
masa_molar_aire=masa_molar_aire/1000; %Kg/mol 

%Formulas
%eficiencia_volumetrica=volumen_i/volumen_p
eficiencia_volumetrica=1+m_porcentual-m_porcentual*((p_descarga/p_succion)^(1/n));
%volumen_p se trata del flujo volumetrico geometrico que se obtiene a partir de los efectos
%Su formula es ((Pi*diametro^2)/4)*L*w
volumen_p=((pi*(diametro_piston)^2)/4)*longitud_piston*w;
%Entonces ahora si podemos calcular volumen_i
volumen_i=eficiencia_volumetrica*volumen_p;%Unidades resultantes [m^3/s]

%Ahora a partir de la ecuacion de Gas despejamos el flujo masico.Asumimos que n es igual a 1
% flujo_masico=(P1*V1*M1)/(R*T_1), De donde R es una cte, la temperatura en unidades absolutas en kelvin,
%M es la masa molar depende del tipo de gas que usemos. En este caso es aire.
% Donde V1 es flujo de volumen.

flujo_masico=(p_succion*volumen_i*masa_molar_aire)/(T_1*R); %Unidades [Kg/s]
%Trabajo de compresion
%Se parte de la Formula W[c]=P1*VolFlujo*ln(p2/p1)
trabajo_de_compresion=p_succion*(volumen_i)*log(p_descarga/p_succion);
%Trabajo indicado
%Se parte de la Formula W[i]=Wc/ni  es decir, el trabajo de compresion/la eficiencia indicada.
trabajo_indicado=trabajo_de_compresion/eficiencia_indicada; %[W] watt's
%Trabajo mecanico 
%Se parte de la formula W[i]/nm es decir, el trabajo indicado/eficiencia mecanica.
trabajo_mecanico=trabajo_indicado/eficiencia_mecanica; %watt's


%puntos de la grafica
%Calculamos el volumen muerto  
volumen_muerto= ((pi*(diametro_piston^2)/4)*longitud_piston)*0.03;
T_2=(p_descarga*volumen_muerto)/(n*R);


%V(1)=vol