function [jF]=JF(x1)
syms x y
v=[x,y]
f=F(x1(1),x1(2))
%jF=subs(inv(jacobian(F(x,y),v)),[x,y],[x1(1),x1(2)]);
jF=jacobian(F(x,y),v);
end

function [y1]= f1(x,y)%x'(t)
y1=(x^2)*(y^(-1))-x;
end

function [y2]= f2(x,y)%y'(t)
y2=x^2-y;
end

function [y]=F(x,y)%F(Y(t))
y = [f1(x,y),f2(x,y)]
end