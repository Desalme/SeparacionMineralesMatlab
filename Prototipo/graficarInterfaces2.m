function graficarInterfaces2
	[ax1 ay1 ax2 ay2 ax3 ay3]=constanteCompuesto;
	VectoraX=[ax1 ax2 ax3 ax1];
	VectoraY=[ay1 ay2 ay3 ay1];
	plot(VectoraX,VectoraY,'linewidth',1)
    axis equal;
	hold on

	[h,k,r]=constanteCompuestoCirculo;
	ancho=pi/200;
	theta=0:ancho:2*pi;
	Xcirculo=h+r*cos(theta);
	Ycirculo=k+r*sin(theta);
	plot(Xcirculo,Ycirculo,'linewidth',1)	
	
	hold on
end