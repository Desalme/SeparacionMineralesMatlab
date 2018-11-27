
Grados_API = 25;
Pwh = 132; %Presion de Cabeza
Tr = 7; %Tuberia de revestimiento
Tp = 3; %Tuberia de Produccion
Rugosidad = 0.0006;
DensidadR_gas = 0.68;
L = 6500; %En pies
T_cabeza =  60 ;%Farenheit
T_fondo = 230 ; %Temperatura de Fondo en Farenheit
RGA = 62 ; %Unidades m^3/m^3
Qo = 4500; %Barriles por dia
Pwf = 2487; %Presion De Fondo Fluyendo en PSIA
Pws = 2510; %Presion estatica o superficie en PSIA
RsCE = 348.13; % Relación de gas disuelto en solución (petroleo) para condiciones estandar. aproximidamente es una relación de solubilidad de gas, cambia en funcion de la presión y temperatura
P_atm = 14.7; %Presion atmosferica en PSIA
Densidad_aire = 0.0764; %Densidad del Aire en lb//ft^3
Angulo=90;

%Se calcula la Densidad del aceite a partir de API
Densidad_aceite=141.5/(Grados_API+131.5); 

Viscosidad_aceite=24 ;%En Unidades Centipoise [cp]
Qo_propuestoCE=5000 ;%Gasto Propuesto en bpd
DensidadR_agua=62.4 ;

%Calculo de la Presion de burbuja
P_burbuja = 18.2*( ( (RsCE/DensidadR_gas)^.83) * 10 ^( (0.00091*T_cabeza) - (0.0125*Grados_API) ) - 1.4);

