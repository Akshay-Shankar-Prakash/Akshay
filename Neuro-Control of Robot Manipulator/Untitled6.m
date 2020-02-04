ts=[0 0.05]
x0=[0.01 0 0 0]';
[t,x]=ode23('robotadapt123',ts,x0)
[qd,e]=robout(t,x)
plot(t,e)