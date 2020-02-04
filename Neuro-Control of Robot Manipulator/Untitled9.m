t=0:1:10

[T,X]=ode23('rot',[0 10],0)

qw=exp(-5*t);
plot(T,X,'r',T,qw,'--b')

