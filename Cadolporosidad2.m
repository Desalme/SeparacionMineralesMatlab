function [ x ] = Eliminacion_gaussiana( A, b )
%Algoritmo eliminacion gaussiana
%A= input ('matriz cuadrada A: ')
%b= input ('vector de terminos independientes b: ')
A=[189,43.5,50,55.5;1,0.02,0,-0.035;1,2.87,2.98,2.55;1,1,1,1]
xlsread('NuevoPozo20196.xlsx',3,'AH210:AK210')
b=ans
b=b'
[n, q]=size(A);

for i=1:n-1;
    for k=i+1:n ;
        m=A(k,i)/A(i,i);
        for j= i+1:n;
            A(k,j)= A(k,j)-m*A(i,j);
        end
        A(k,i)=0;
        b(k)=b(k)-m*b(i);
    end
end
x=zeros(n,1);
disp(A);
disp(b);
for i=n:-1:1;
    aux=0;
    for j=i+1:n
        aux=aux+A(i,j)*x(j);
    end
    x(i)=(b(i)-aux)/A(i,i);
end
disp(x)
x=x'
xlswrite('NuevoPozo20196.xlsx',x,3,'AL210:AO210')



