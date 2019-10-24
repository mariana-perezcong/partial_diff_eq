%Cálculo de puntos de equilibrio con el método de newton, dado x0
%(x'(t),y'(t))=Y'(t)=F(Y(T))=F(x(t),y(t))
%Calcular xj+1=xj-((F'(xj))^-1)*F(xj)

%Necesito la funcion F, las soluciones x(t) y y(t) y un punto inicial x0

%(xk+1,yk+1)=(xk,yk)-(J(F)(xk,yk))^-1)*F(xk))

function [X]=Newton(X0,tol,maxIter)
X=X0';
Xold=X0;
for i=1:maxIter
    [f,j]=FJacob(X)
    X=X-inv(j)*f;
    %err(:,i)=abs(X-Xold);
    if(abs(X-Xold)<tol)
        Xold=X;
        break
    end
    Xold=X;
end
end



function [fval, J]=FJacob(X1)
x=X1(1);
y=X1(2);

%Gierer-Meinhardt
fval(1,1)=(x^2)*(y^(-1))-x;
fval(2,1)=x^2-y;
%%jacob
J=[(2*x)/y - 1,-x^2/y^2; 2*x,-1]; %Gierer-Meinhardt




end

function [y1]= f1(x,y)%x'(t)
y1=4*x^2-y^3+28;
end

function [y2]= f2(x,y)%y'(t)
y2=3*x^3+4*y^2-145;
end

function [y]=F(x,y)%F(Y(t))
y = [f1(x,y),f2(x,y)];
end
