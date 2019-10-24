%Método de Runge-Kutta de dimension n para aproximar la solución de y'(t) = f(t,y(t))
%la solucion de y'(t) = f(t, y(t))
%t en [to, T] con m pasos de tamaño h = (T-to)/m
%Especificar f en este archivo
%El vector t de salida contiene una particion regular del intervalo de to a
%a T con m+1 puntos
%La matriz YY de salida contiene en sus columnas las aproximaciones a Y(T)
%El vector y de salida contiene las aproximaciones 
%a y(t). Aqui el valor de y en t0;

function [t,YY] = RK_n(t0, T,Y0,m)
h = (T-t0)/m;
n=length(Y0);
t = linspace(t0, T, m+1);
YY = zeros(n,m+1); %y0,..,ym
YY(:,1)= Y0;
for j=1:m
    k1=GM(t(j),YY(:,j));
    k2=GM(t(j)+h/2,YY(:,j)+h/2*k1);
    k3=GM(t(j)+h/2,YY(:,j)+h/2*k2);
    k4=GM(t(j)+h,YY(:,j)+h*k3);
    YY(:,j+1) = YY(:,j)+h/6*(k1+2*k2+2*k3+k4);
end
end
function [z]= F(t,y)
 n=length(y);
 z=zeros(n,1);
z(1)=-y(2)+y(1);
z(2)=y(1)+y(2);
%x'=-y+x; y'=x+y;
end

function [z]= GM(t,y) %Gierer-Meinhardt
n=length(y);
z=zeros(n,1);
z(1)=(y(1)^2)*(y(2)^(-1))-y(1);
z(2)=(y(1)^2)-y(2);
%(y(1),y(2))=(x,y)
%x'=(x^2)*(y^(-1))-x;
%y'=x^2-y;
%aqui el punto de equilibrio es (1,1)
end

function [z]= H(t,y) %Gierer-Meinhardt
n=length(y);
z=zeros(n,1);
z(1)=(1-y(1)-y(2))*y(1);
z(2)=(4-2*y(1)-7*y(2))*y(2);

%Puntos de equilibrio:(0,0), (0,4/7), (1,0),(3/5,2/5)
%(y(1),y(2))=(x,y)
%x'=(x^2)*(y^(-1))-x;
%y'=x^2-y;
%aqui el puno de equilibrio es (1,1)
end

function [z]= M(t,y) %Gierer-Meinhardt
n=length(y);
z=zeros(n,1);
z(1)=y(1)*(12-2*(y(1)))-3*(y(1)*y(2));
z(2)=y(2)*(20-4*y(2))-4*(y(1)*y(2));

%Puntos de equilibrio:(0,0), (0,4/7), (1,0),(3/5,2/5)
%(y(1),y(2))=(x,y)
%x'=(x^2)*(y^(-1))-x;
%y'=x^2-y;
%aqui el puno de equilibrio es (1,1)
%Para calcularlos 

end




