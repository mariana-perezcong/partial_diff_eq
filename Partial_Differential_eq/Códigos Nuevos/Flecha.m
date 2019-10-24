%Dibuja una flecha que une al punto (x0,y0)con (p1,q1) en el punto (p1,q1).
%El parámetro escala indica el tamaño de la punta de la flecha.
function [] = Flecha(x0,y0,p1,q1,Escala)
x1=p1-x0;
y1=q1-y0;
P=[x1/2-y1/2,y1/2+x1/2];
Q=[x1/2+y1/2,y1/2-x1/2];
Pt=P+[x0,y0];
Qt=Q+[x0,y0];
Pf=[p1,q1]+Escala*(Pt-[p1,q1]);
Qf=[p1,q1]+Escala*(Qt-[p1,q1]);
%plot([p1,Pf(1)],[q1,Pf(2)],[p1,Qf(1)],[q1,Qf(2)],[x0,p1],[y0,q1]);
plot([p1,Pf(1)],[q1,Pf(2)],[p1,Qf(1)],[q1,Qf(2)]);

