function xdot=gravitycontrol(t,x)
period=2;
amp1=0.1;
amp2=0.1;
fact=2*pi/period;
sinf=sin(fact*t)
cosf=cos(fact*t);
qd=[amp1*sinf amp2*cosf];
qdp=fact*[amp1*cosf -amp2*cosf];
qdpp=-fact^2*qd;
m1=1;
m2=1;
a1=1;a2=1;
g=9.8;
kp=100;
kv=20;
e=qd-[x(1) x(2)];
ep=qdp-[x(3) x(4)];
m11=(m1+m2)*a1^2+m2*a2^2+2*m2*a1*a2*cos(x(2));
m12=m2*a2^2+m2*a1*a2*cos(x(2));
m22=m2*a2^2;
n1=-m2*a1*a2*(2*x(3)*x(4)+x(4)^2)*sin(x(2));
n1=n1+(m1+m2)*g*a1*cos(x(1))+m2*g*a2*cos(x(1)+x(2));
n2=m2*a1*a2*x(3)^2*sin(x(2))+m2*g*a2*cos(x(1)+x(2));
m1= 1 ; m2= 1 ; a1= 1 ; a2= 1 ; g= 9.8 ; % arm parameters
kp= 100 ; kv= 20 ; % controller parameters

% computed gravity terms
G1= (m1 + m2)*g*a1*cos(x(1)) + m2*g*a2*cos(x(1) + x(2));
G2= m2*g*a2*cos(x(1) + x(2)) ;
% PD CT control torques
s1= kv*ep(1) + kp*e(1) ;
s2= kv*ep(2) + kp*e(2) ;
tau1= s1 + G1
tau2= s2 + G2   


det=m11*m22-m12*m12;
mi11=m22/det;
mi12=-m12/det;
mi22=m11/det;

xdot(1)=x(3);
xdot(2)=x(4);
xdot(3)=mi11*(-n1+tau1)+mi12*(-n2+tau2);
xdot(4)=mi12*(-n1+tau1)+mi12*(-n2+tau2);
xdot=[xdot(1);xdot(2);xdot(3);xdot(4)];