function xdot=robotadapt(t,x,wei)
period=2;
amp1=1;
amp2=1;
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
kv=2*eye(2);
lam=5*eye(2);
gam=10*eye(2);
e=qd-[x(1) x(2)]';
ep=qdp-[x(3) x(4)]';
r=ep+lam*e
f=qdpp+lam*ep;
disp('rf');
disp(size(r))
disp(size(f))
w(1,1)=a1^2*f(1)+a1*g*cos(x(1));
w(1,2)=(a2^2+2*a1*a2*cos(x(2))+a1^2)*f(1)+(a2^2+a1*a2*cos(x(2)))*f(2)-a1*a2*x(4)*(qdp(1)*sin(x(2))+lam(1,1)*e(1))-a1*a2*(x(3)+x(4))*(qdp(2)+sin(x(2))+lam(2,2)*e(2))+a2*g*cos(x(1)+x(2))+a1*g*cos(x(1));
w(2,1)=0;
w(2,2)=(a2^2+a1*a2*cos(x(2)))*f(1)+a2^2*f(2)+a1*a2*(qdp(1)+lam(1,1)*e(1))*sin(x(2))+a2*g*cos(x(1)+x(2));

m11=(m1+m2)*a1^2+m2*a2^2+2*m2*a1*a2*cos(x(2));
m12=m2*a2^2+m2*a1*a2*cos(x(2));
m22=m2*a2^2;
n1=-m2*a1*a2*(2*x(3)*x(4)+x(4)^2)*sin(x(2));
n1=n1+(m1+m2)*g*a1*cos(x(1))+m2*g*a2*cos(x(1)+x(2));
n2=m2*a1*a2*x(3)^2*sin(x(2))+m2*g*a2*cos(x(1)+x(2));
% *tau=kv*r+w*[x(5) x(6)]';
p=[sigmf(qd',[1 0.6324]); sigmf(qd',[1 0.0975]); sigmf(qd',[1 0.2785]);  sigmf(qd',[1 0.5469])]
wei=zeros(1,4);

(wei*p)'+kv*r
wei=wei+0.02*(p*f)*r'
tau1=tau(1);
tau2=tau(2);
phidot=gam*w'*r;

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
xdot(5)=phidot(1);
xdot(6)=phidot(2);
 xdot=[xdot(1) xdot(2) xdot(3) xdot(4) xdot(5) xdot(6)]';