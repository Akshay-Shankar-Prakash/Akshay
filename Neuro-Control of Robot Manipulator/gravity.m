ts=[0 10]
x0=[.1 0 0 0]
[t,x]=ode23('gravitycontrol',ts,x0);
[qd,e]=robout(t,x);
plot(t,e);