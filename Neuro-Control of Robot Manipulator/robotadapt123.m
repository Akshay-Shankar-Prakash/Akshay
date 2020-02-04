function xdot=robotadapt123(t,x)
period=2*pi;
amp1=.01;
amp2=.01;
fact=2*pi/period;
sinf=sin(fact*t);
cosf=cos(fact*t);
qd=[amp1*sinf amp2*cosf]';
disp(size(qd))
disp('qd');
qdp=fact*[amp1*cosf -amp2*sinf]';
qdpp=-fact^2*qd;
m1=0.8;
m2=2.3;
a1=1;
a2=1;
g=9.8;
kv=20*eye(2);
lam=5*eye(2);
gam=10*eye(2);
e=qd-[x(1) x(2)]';
ep=qdp-[x(3) x(4)]';
r=ep+lam*e;
disp('rf');
disp(size(r))

m11=(m1+m2)*a1^2+m2*a2^2+2*m2*a1*a2*cos(x(2));
m12=m2*a2^2+m2*a1*a2*cos(x(2));
m22=m2*a2^2;
n1=-m2*a1*a2*(2*x(3)*x(4)+x(4)^2)*sin(x(2));
n1=n1+(m1+m2)*g*a1*cos(x(1))+m2*g*a2*cos(x(1)+x(2));
n2=m2*a1*a2*x(3)^2*sin(x(2))+m2*g*a2*cos(x(1)+x(2));
F=50*eye(2);
p=[sigmf(qd',[1 0.6324]); sigmf(qd',[1 0.0975]); sigmf(qd',[1 0.2785]);  sigmf(qd',[1 0.5469])]
wei=zeros(4,1);
tau=kv*r+(wei'*p)';
wei=wei+0.02*(p*F)*r;
tau1=tau(1);
tau2=tau(2);

%Kv=diag(ones(1,20))
%F=diag(ones(1,50))
%lambda=diag(ones(1,5))


det=m11*m22-m12*m12;
mi11=m22/det;
mi12=-m12/det;
mi22=m11/det;

xdot(1)=x(3);
xdot(2)=x(4);
xdot(3)=mi11*(-n1+tau1)+mi12*(-n2+tau2);
xdot(4)=mi12*(-n1+tau1)+mi12*(-n2+tau2);
 xdot=[xdot(1) xdot(2) xdot(3) xdot(4)]';