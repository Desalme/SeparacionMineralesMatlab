%calcula las presiones de salida de una columna de líquido de un pozo mediante iteraciones a partir ade la densidad y de la relacion de solubilidad, de la densidad relativa del gas y de la presión de cabeza
%se calcula el primer punto de burbuja 

%Datos de Entrada 
Grados_API = 23;
Pwh = 135; %Presion de Cabeza
Tr = 7; %Tuberia de revestimiento
Tp = 5.5; %Tuberia de Produccion
Rugosidad = 0.0006;
DensidadR_gas = 0.7;
L = 6800; %En pies
T_cabeza =  60 ;%Farenheit
T_fondo = 230 ; %Temperatura de Fondo en Farenheit
RGA = 54 ; %Unidades m^3/m^3
Qo = 5000; %Barriles por dia
Pwf = 2487; %Presion De Fondo Fluyendo en PSIA
Pws = 2510; %Presion estatica o superficie en PSIA
P_atm = 14.7; %Presion atmosferica en PSIA
Densidad_aire = 0.0764; %Densidad del Aire en lb//ft^3
Angulo=90;
Viscosidad_aceite=24 ;%En Unidades Centipoise [cp]
Qo_propuestoCE=5000 ;%Gasto Propuesto en bpd
DensidadR_agua=62.4 ;

%Opciones de calculo
%CalculoCorrelaciones = {'Standing', 'Vazquez'}
Opcion = 'Vazquez';
%Opcion = 'Standing';

%calcul;os
RsCE = RGA*5.615; % Relación de gas disuelto en solución (petroleo) para condiciones estandar. aproximidamente es una relación de solubilidad de gas, cambia en funcion de la presión y temperatura

%Se calcula la Densidad del aceite a partir de API
Densidad_aceite=141.5/(Grados_API+131.5); 

%Calculo de la Presion de burbuja
P_burbuja = 18.2*( ( (RsCE/DensidadR_gas)^.83) * 10 ^( (0.00091*T_cabeza) - (0.0125*Grados_API) ) - 1.4);


%distancia
DistanciaDivision = 100; %el número de pies que el usuario quiere evaluar la nueva presion. verificar que sea menor a L
vectorDistancia = 0:DistanciaDivision:L;
tamVector = length(vectorDistancia);

%presion
aumentoPresionAproxPorPie = .2;%.135; %esta es una condición experimental, está entre 10 y 30, tipicamente 20
aumentoPresionAproxPorDivision = DistanciaDivision * aumentoPresionAproxPorPie; 
P_salida = NaN(tamVector-1 , 1); %este vector comienza en la posición 2 del vector distancia

%temperatura
%vectorTemperatura = NaN(tamVector);
pendienteTemperatura = (T_fondo - T_cabeza) / L;
vectorTemperatura = pendienteTemperatura * vectorDistancia + T_cabeza;

%calcular presiones mediante iteraciones

for i = 1:length(P_salida)
	Error = 100;
	primerIteracionWhile = true;

	while Error > 0.00000001
		%presión
		if i == 1
			P_entrada = Pwh;
		else
			P_entrada = P_salida(i-1);
		end
		%valor semilla presión
		if primerIteracionWhile == true 
			P_supuesta = P_entrada + aumentoPresionAproxPorDivision;
			primerIteracionWhile = false;
		else
			P_supuesta = P_salida(i);
		end

		P_promedio = mean([P_entrada, P_supuesta]);

		%temperatura
		T_entrada = vectorTemperatura(i);
		T_salida = vectorTemperatura(i+1);
		T_promedio = mean([T_entrada, T_salida]);

		%densidad de gas disuelto y solubilidad
		%iteración \

		[Rs, Densidad_gasDisuelto] = FuncionCorrelaciones(Opcion, Grados_API, DensidadR_gas, P_promedio, T_promedio);


		Densidad_gasL = (abs( (RsCE * DensidadR_gas) - Rs * Densidad_gasDisuelto) ) / ( RsCE - Rs );
		
		Ppc = 677 + (15 * Densidad_gasL) - (37.5 * Densidad_gasL^2 );
		Ppr = P_promedio / Ppc;

		Tpc = 168 + 325 * Densidad_gasL - 12.5 * Densidad_gasL^2;
		Tpr = (T_promedio + 460) / Tpc;

		Z = 1 - ( (3.25 * Ppr) / (10 ^ (0.9813 *Tpr) ) ) + ( (0.274 * Ppr^2) / (10 ^ (0.8157 * Tpr) ) );

		Bg = (Z*(T_promedio+460)/P_promedio)*(P_atm/520);
		Rog_CF=(Densidad_gasL*(Densidad_aire/Bg));
		x=3.5+(986/(T_promedio+460))+(0.2896*Densidad_gasL);
		y=2.4-(0.2*x);
		k=((9.4+(0.5792*Densidad_gasL))*(T_promedio+460)^1.5)/((209+(550.24*Densidad_gasL)+(T_promedio+460)));

		Viscosidad_gas=k*((10^(-4))*exp(x*(Densidad_gasL/62.928)^y));
		Bo=0.9759+0.00012*(Rs*((Densidad_gasDisuelto/Densidad_aceite)^0.5)+(1.25*T_promedio))^1.2;
		Ro_aceiteCF=((Densidad_aceite*DensidadR_agua)+(Densidad_gasDisuelto*Densidad_aire*Rs))/Bo;
		A_total=(pi*(Tp/12)^2)/4;
		Gasto_aceite_CF= Qo*Bo*(5.615/1)*(1/86400);
		Gasto_gas_CF=Qo*(RsCE-Rs)*Bg*(1/86400);
		vsl=Gasto_aceite_CF/A_total;
		vsg=Gasto_gas_CF/A_total;
		vm=vsg+vsl;
		Landa_L=Gasto_aceite_CF/(Gasto_aceite_CF+Gasto_gas_CF);
		%Comienza Correlacion HandB
		A=1.071-((0.2218*((vsl+vsg)^2))/(Tp*0.0833333));

		B=vsg/(vsg+vsl);
		DiferenciaBA=B-A;
		Cirq_aceite=(42.4-(0.047*T_entrada)-(0.267*Grados_API))*exp(-0.0007*P_promedio);
		Nlv=1.938*vsl*(Ro_aceiteCF/Cirq_aceite)^0.25;
		Ngv=1.938*vsg*(Ro_aceiteCF/Cirq_aceite)^0.25;

		Nd=((120.872*Tp)/12)*((Ro_aceiteCF/Cirq_aceite)^0.25);

		Nlmu=0.15726*Viscosidad_aceite*(1/(Ro_aceiteCF*Cirq_aceite^3)^0.25);
		Nlc=0.0104*(1.163-exp(-6.407*Nlmu));
		Xmayuscula=(Nlv*Nlc*P_promedio^0.1)/((Ngv^0.575)*Nd*P_atm^0.1);
		RelacionHLPsi=(0.0745*0.000841+1.0725*Xmayuscula^0.884)/(0.000841+Xmayuscula^0.884);
		zi=(Ngv*Nlmu^0.1)/(Nd^2.14);
		Psi=(0.97471888*0.0102865321+1.7467011*zi^3.8462632)/(0.0102865321+zi^3.8462632);
		

		HL=Psi*RelacionHLPsi;
		
		if HL < Landa_L
			%disp('Menor');
			HL = Landa_L;
		end

		Pm=(Rog_CF*(1-HL))+(Ro_aceiteCF*HL);
		Uns=(Viscosidad_gas*(1-Landa_L))+(Viscosidad_aceite*Landa_L);
		NRE=(1488*Pm*vm*(Tp/12))/Uns;

		Ff = (-2 * log10( Rugosidad / (3.71 * Tp) ) ) ^ (-2);
		ErrorFf = 100;

		while  ErrorFf > .00000001
			FfAnterior = Ff;
			Ff = (-2 * log10( Rugosidad / (3.71 * Tp) + 2.514 / ( sqrt(Ff) *NRE ) ) ) ^ (-2); 
			ErrorFf = abs(Ff - FfAnterior);
		end

		%RelacionDpDht= (Ff * Pm * vm^2) / (144 * 2 * 32.2* (Tp/12) ) + (Pm * sin( deg2rad(Angulo) )) / 144 ;%este es el bien calculado
		RelacionDpDht= (Ff * Pm * vm^2) / (144 * 2 * 32.2* (Tp/12) ) + (Pm * sin( Angulo )) / 144 ; %este es el mal calculado (como en Excel)

		DeltaP=RelacionDpDht*DistanciaDivision;
		P_salida(i) = DeltaP + P_entrada;

		Error = abs(P_salida(i) - P_supuesta);%recalcular el error
	end
end

