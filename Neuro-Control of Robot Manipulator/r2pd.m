function xdot=r2pd(t,x,ths,spec,Kpd)   
xdot=zeros(8,1); 
th1s=ths(1); 
th2s=ths(2);
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
Kp1=Kpd(1); Kd1=Kpd(2);  
Kp2=Kpd(3); Kd2=Kpd(4);
f1=Kp1*(th1s-x(3))-Kd1*x(5); f2=Kp2*(th2s-x(4))-Kd2*x(6); Fhat=[f1;f2]; 
F=Bq*Fhat;
td=[5 5]'
xdot(1)=(th1s-x(3));  xdot(2)=(th2s-x(4));
xdot(3)=x(5);  xdot(4)=x(6);    
q2dot=inv(Bq)*(-Cq-Gq+F+td);                                                                                                
xdot(5)=q2dot(1);  xdot(6)=q2dot(2);  xdot(7)=F(1); xdot(8)=F(2); 
