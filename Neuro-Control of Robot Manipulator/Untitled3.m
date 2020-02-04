ts=[0 10];
x0=[0.1 0 0 0 0 0]';
[xout tout]=rk(robotadapt,ts,x0);
% [t,x]=ode23('robotadapt',ts,x0);
[qd,e]=robout(tout,xout)
plot(t,qd)
 xdot=robotadapt(t,x)