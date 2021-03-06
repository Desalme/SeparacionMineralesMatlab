

VectorCaudal=NaN(3,1);
VectorCabezal=NaN(3,1);

%El vector caudal datos ingresados por el usuario, inicialmente se trata de l/s. Litros sobre segundo.
VectorCaudal(1)=40;
VectorCaudal(2)=100;
VectorCaudal(3)=180;
%El vector cabezal datos ingresados por el usuario, deben ser ingresados en metros m.
VectorCabezal(1)=83.26;
VectorCabezal(2)=63.58;
VectorCabezal(3)=11.07;



%conversiones
VectorCaudal=VectorCaudal./1000;

%Creando el arreglo de la matriz
MatrizSistema=[VectorCaudal.^2, VectorCaudal, ones(3,1)];
VectorIndependiente=VectorCabezal;

%Para Solucionar el sistema

SolucionCoeficientes=linsolve(MatrizSistema,VectorIndependiente);
A=SolucionCoeficientes(1);
B=SolucionCoeficientes(2);
C=SolucionCoeficientes(3);

%crear vector Q
Qmin=0;
%Qmin=min(roots(SolucionCoeficientes));
Qmax=max(roots(SolucionCoeficientes)); %Haciendo Cero a H,da solucion a una ecuacion de
%segundo grado y una vez obtenida las raicez escoge la mas grande. Con el objetivo de calcular\
%el caudal maximo.


%Crear al vectorQ utilizando el maximo caudal.
VectorQ=linspace(Qmin,Qmax,250);

%Crear al vector H (ya tenemos la funcion H). Para la bomba
VectorH=FuncionCargaH(A,B,C,VectorQ);

%Función característica del sistema de ductos

% Net Positive Suction Head (NPSH)
%NPSH can be defined as two parts:
%NPSH Available (NPSHA): The absolute pressure at the suction port of the pump.
%NPSH Required (NPSHR): The minimum pressure required at the suction port of the pump to keep the pump from cavitating.
NPSHAprox=abs(VectorCabezal(1)-VectorCabezal(end));

%buscamos una k para la cual en Q especificado la carga H coincida
QEsp = Qmax/4;
kAprox = A + B/QEsp + C/QEsp^2 - NPSHAprox/QEsp^2;

VectorHDucto = funcionCaracteristicaDuctos (kAprox,VectorQ, NPSHAprox);

plot(VectorQ,VectorH, VectorQ, VectorHDucto);

