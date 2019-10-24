%Dibujo del plano fase usando Runge-Kutta
%Seleccionar con el ratón distintos puntos iniciales

%CALCULO DE PUNTOS DE EQUILIBRIO DE UN SISTEMA AUTONOMO DIM 2 QUE SE
%ENCUENTRA EN UN RECTANDULO [a,b]x[c,d]

a=0;b=6;c=0; d=6; %Gierer-Meinhardt
%a=-1;b=1.5;c=-1; d=1; %H
axis([a,b,c,d]);
T=15; m=1000;
[x0,y0,boton]=ginput(1);
while boton==1
    [t,YY]=RK_n(0,T,[x0,y0]',m);
    [t,YY2]=RK_n(0,-T,[x0,y0]',m);
    Escala=1/50*sqrt((b-a)^2+(d-c)^2);
    L=norm(YY(:,1)-YY(:,2));
    Flecha(x0,y0,YY(1,2),YY(2,2),Escala/L)
    plot(YY(1,:),YY(2,:),YY2(1,:),YY2(2,:));
    [r]=Newton([5,5],1e-8,50);
    %plot(YY(1,:),YY(2,:));
    hold on
    plot(r(1),r(2),'r*');
    axis([a,b,c,d]);
    [x0,y0,boton]=ginput(1);
end

%Cálculo de puntos de equilibrio con el método de newton, dado x0
%Calcular xj+1=xj-((F'(xj))^-1)*F(xj)

