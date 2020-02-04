ts=[0 20]
x0=[0.1 0 0 0 0 0]';
[t,x]=ode23('flnn2',ts,x0)
[qd,e]=robout(t,x)
plot(t,e)