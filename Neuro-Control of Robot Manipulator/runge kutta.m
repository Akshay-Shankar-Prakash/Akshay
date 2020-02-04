clc;
clear all;
function y=rk(F,h,init)
x=0:h:10
y=zeros(1,length(x))
y(1)=init

for i=1:(length(x)-1)
    k1=h*F(x(i),y(i));
    k2=h*F(x(i)+0.5*h,y(i)+0.5*k1);
    k3=h*F(x(i)+0.5*h,y(i)+0.5*k2);
    k4=h*F(x(i)+h,y(i)+k3);
    x(i+1)=x(i)+h;
    y(i+1)=y(i)+(1/6)*(k1+2*k2+2*k3+k4);
end
plot(x,y)

