t0=0;
tf=10;
x0=[0.1 0 0 0]
tspan=[t0 tf]
[t,x]=ode23('robotcontrol',[0 10],x0);
[qd,e]=robout(t,x);
plot(t,e)