ts=[0 10]
x0=[0.1 0 0 0 0 0]';
[t,x]=ode45('robotadapt',ts,x0)
[qd,e]=robout(t,x)
plot(t,e)
plot(t,qd)