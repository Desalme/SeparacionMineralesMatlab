function ecuacionGeneralizada(pws, ip, pb)
	pws=6000;
	ip=54;
	pb=3000;

	%n=input('¿Cuántas divisiones quieres para pwf? ');
	n=50;
	pwf=linspace(pws,0,n);
	[pwfM pwfN]=size(pwf);
	q=zeros(pwfM, pwfN);
	longitud=length(pwf);

	contador=0;
	for i=1:longitud
		if pwf(i)>=pb
			contador=contador+1;
			q(i)=ip*(pws-pwf(i));
		elseif pwf(i)<pb
			q(i)=ip*(pws-pb)+(ip*pb)/1.8*(1-0.2*(pwf(i)/pb)-0.8*(pwf(i)/pb)^2);
		end
	end

	qLinea=ip*(pws-pb);
	X=linspace(qLinea,qLinea);
	Y=linspace(0,pws);

	%plot(q(1:contador),pwf(1:contador));
	%plot(q(contador+1:end),pwf(contador+1:end));
	
	p=plot(q(1:contador),pwf(1:contador),'r--',q(contador+1:end),pwf(contador+1:end),'b',X,Y,'*');
	%p(1).LineWidth = 2;
	%p(3).Marker = '*';
	

%hold on
	%plot(X,Y)

		title('Ecuación generalizada');
		ylabel('Presión');
		xlabel('Gasto');
		%axis equal;
	
end
