close all
clear all
clc
th_int=[-pi/2 pi/2];
ths=[pi/2 -pi/2];    
x0=[0 0 th_int 0 0 0 0];  
Ts=[0 0.15];
L1=1;  L2=1;  M1=0.8;  M2=2.3;  spec=[L1 L2 M1 M2];
Kp1=12 ; Kd1=18; Ki1=10;  Kp2=12; Kd2=18; Ki2=10;   Kpid=[Kp1 Kd1 Ki1 Kp2 Kd2 Ki2];
[T,X] = ode45(@(t,x) flnnnew(t,x,ths,spec,Kpid),Ts,x0); 

th1=X(:,3);  
th2= X(:,4);

F1=diff(X(:,7))./diff(T);  
F2=diff(X(:,8))./diff(T); 
tt=0:(T(end)/(length(F1)-1)):T(end);

x1=L1.*sin(th1);  
y1=L1.*cos(th1);  
x2=L1.*sin(th1)+L2.*sin(th1+th2);  
y2=L1.*cos(th1)+L2.*cos(th1+th2); 
plot(T,ths(1)-th1,T,ths(2)-th2) 
grid 
title('Theta-1 and Theta-2 error')
ylabel('theta1 error (rad)')
xlabel('time (sec)')
figure 
plot(T,ths(2)-th2)
grid 
title('Theta-2 error') 
ylabel('theta2 error (rad)') 
xlabel('time (sec)')
figure 
plot(tt,F1) 
grid 
title('Torque of theta 1') 
ylabel('theta1 torque') 
xlabel('time (sec)')
figure 
plot(tt,F2) 
grid 
title('Torque of theta 2') 
ylabel('theta2 torque') 
xlabel('time (sec)') 