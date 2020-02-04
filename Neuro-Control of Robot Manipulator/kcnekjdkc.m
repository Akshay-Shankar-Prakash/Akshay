t0=0;
t1=1
x0=[0.1 0 0 0];
[t,x]=ode23('flnnold',[0 .05],x0);
[qd,e]=robout(t,x);
plot(t,e);