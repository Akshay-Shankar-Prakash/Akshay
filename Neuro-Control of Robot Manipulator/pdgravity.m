s1= qdpp(1) + kv*ep(1) + kp*e(1) + ki*x(5) ;
s2= qdpp(2) + kv*ep(2) + kp*e(2) + ki*x(6) ;
tau1= M11*s1 + M12*s2 + N1 ;
tau2= M12*s1 + M22*s2 + N2 ;
xdot(5)= e(1)
xdot(6)= e(2)
% PD-Gravity control input
m1= 1 ; m2= 1 ; a1= 1 ; a2= 1 ; g= 9.8 ; % arm parameters
kp= 100 ; kv= 20 ; % controller parameters
% tracking errors
e= qd - [x(1) x(2)]’ ;
ep= qdp - [x(3) x(4)]’ ;
% computed gravity terms
G1= (m1 + m2)*g*a1*cos(x(1)) + m2*g*a2*cos(x(1) + x(2));
G2= m2*g*a2*cos(x(1) + x(2)) ;
% PD CT control torques
s1= kv*ep(1) + kp*e(1) ;
s2= kv*ep(2) + kp*e(2) ;
tau1= s1 + G1
tau2= s2 + G2
