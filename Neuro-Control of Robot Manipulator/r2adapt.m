function xdot=r2adapt(t,x,ths,spec,Kpid)  
xdot=zeros(8,1); 
ths1=ths(1); 
ths2=ths(2);
qd=[ths(1) ths(2)]';
a1=1;a2=1;
M1=spec(3); M2=spec(4); L1=spec(1); L2=spec(2); 
g=9.8;
b11=(M1+M2)*L1^2+M2*L2^2+2*M2*L1*L2*cos(x(4)); 
b12=M2*L2^2+M2*L1*L2*cos(x(4)); 
b21=M2*L2^2+M2*L1*L2*cos(x(4)); 
b22=M2*L2^2; 
Bq=[b11 b12;b21 b22];
c1=-M2*L1*L2*sin(x(4))*(2*x(5)*x(6)+x(6)^2); 
c2=-M2*L1*L2*sin(x(4))*x(5)*x(6); 
Cq=[c1;c2];
g1=-(M1+M2)*g*L1*sin(x(3))-M2*g*L2*sin(x(3)+x(4)); 
g2=-M2*g*L2*sin(x(3)+x(4)); 
Gq=[g1;g2];
kv=20*eye(2);

%qd=[sin(2*pi*t) cos(2*pi*t)]';
e=qd-[x(1) x(2)]';
lam=5*eye(2);
qdp=[ths1 -ths2]'; 
ep=qdp-[x(3) x(4)]';
r=ep+lam*e;
qdpp=-qd;
f=qdpp+lam*ep;

w(1,1)=a1^2*f(1)+a1*g*cos(x(1));
w(1,2)=(a2^2+2*a1*a2*cos(x(2))+a1^2)*f(1)+(a2^2+a1*a2*cos(x(2)))*f(2)-a1*a2*x(4)*(qdp(1)*sin(x(2))+lam(1,1)*e(1))-a1*a2*(x(3)+x(4))*(qdp(2)+sin(x(2))+lam(2,2)*e(2))+a2*g*cos(x(1)+x(2))+a1*g*cos(x(1));
w(2,1)=0;
w(2,2)=(a2^2+a1*a2*cos(x(2)))*f(1)+a2^2*f(2)+a1*a2*(qdp(1)+lam(1,1)*e(1))*sin(x(2))+a2*g*cos(x(1)+x(2));

Kp1=Kpid(1); Kd1=Kpid(2); Ki1=Kpid(3); 
Kp2=Kpid(4); Kd2=Kpid(5); Ki2=Kpid(6);
tau=kv*r+w*[x(5) x(6)]';
tau1=tau(1);
tau2=tau(2);
Fhat=[tau1;tau2]; 
F=Bq*Fhat;

xdot(1)=(ths1-x(3));  xdot(2)=(ths2-x(4));
xdot(3)=x(5);  xdot(4)=x(6);    
q2dot=inv(Bq)*(-Cq-Gq+F);
xdot(5)=q2dot(1);  xdot(6)=q2dot(2);  xdot(7)=F(1); xdot(8)=F(2); 
