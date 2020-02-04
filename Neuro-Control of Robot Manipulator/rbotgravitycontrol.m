ts=[0 0.2]
x0=[0.1 0 0 0]
[T,X]=ode45(@(t,x) robgravity(t,x),ts,x0)
[qd,e]=robout(T,X);
plot(T,e)