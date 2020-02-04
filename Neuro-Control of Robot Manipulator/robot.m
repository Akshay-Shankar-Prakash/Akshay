function [r,f]=robot1(t1,x1)
period=2;
amp1=1;
amp2=1;
fact1=2*pi/period;
sinf=sin(fact1*t1);
cosf=cos(fact1*t1);
qd=[amp1*sinf amp2*cosf]';
qdp=fact1*[amp1*cosf -amp2*sinf]';
qdpp=-fact1^2*qd;
m1=0.8;
m2=2.3;
a1=1;
a2=1;
g=9.8;
kv=20*eye(2);
lam=5*eye(2);
gam=10*eye(2);
e=qd-[x1(1) x1(2)]';
ep=qdp-[x1(3) x1(4)]';
r=ep+lam*e;
f=qdpp+lam*ep;
w(1,1)=a1^2*f(1)+a1*g*cos(x1(1));
w(1,2)=(a2^2+2*a1*a2*cos(x1(2))+a1^2)*f(1)+(a2^2+a1*a2*cos(x1(2)))*f(2)-a1*a2*x1(4)*(qdp(1)*sin(x1(2))+lam(1,1)*e(1))-a1*a2*(x1(3)+x1(4))*(qdp(2)+sin(x1(2))+lam(2,2)*e(2))+a2*g*cos(x1(1)+x1(2))+a1*g*cos(x1(1));
w(2,1)=0;
w(2,2)=(a2^2+a1*a2*cos(x1(2)))*f(1)+a2^2*f(2)+a1*a2*(qdp(1)+lam(1,1)*e(1))*sin(x1(2))+a2*g*cos(x1(1)+x1(2));

m11=(m1+m2)*a1^2+m2*a2^2+2*m2*a1*a2*cos(x1(2));
m12=m2*a2^2+m2*a1*a2*cos(x1(2));
m22=m2*a2^2;
n1=-m2*a1*a2*(2*x1(3)*x1(4)+x1(4)^2)*sin(x1(2));
n1=n1+(m1+m2)*g*a1*cos(x1(1))+m2*g*a2*cos(x1(1)+x1(2));
n2=m2*a1*a2*x1(3)^2*sin(x1(2))+m2*g*a2*cos(x1(1)+x1(2));
t1au=kv*r+w*[x1(5) x1(6)]';
t1au1=t1au(1);
t1au2=t1au(2);
phidot1=gam*w'*r;

%Kv=diag(ones(1,20))
%F=diag(ones(1,50))
%lambda=diag(ones(1,5))


det1=m11*m22-m12*m12;
mi11=m22/det1;
mi12=-m12/det1;
mi22=m11/det1;

x1dot1(1)=x1(3);
x1dot1(2)=x1(4);
x1dot1(3)=mi11*(-n1+t1au1)+mi12*(-n2+t1au2);
x1dot1(4)=mi12*(-n1+t1au1)+mi12*(-n2+t1au2);
x1dot1(5)=phidot1(1);
x1dot1(6)=phidot1(2);
 x1dot1=[x1dot1(1) x1dot1(2) x1dot1(3) x1dot1(4) x1dot1(5) x1dot1(6)]';