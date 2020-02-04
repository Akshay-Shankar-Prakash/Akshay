function y=rk2(F,h,xfinal,init1,init2)
x=0:h:xfinal
y=zeros(1,length(x))
y(1)=init1
v(1)=init2;
%F=@(x,y,v) 5-v         % v= dy/dx
for i=1:(length(x)-1)
    dv1=h*F(x(i),y(i),v(i));
    dy1=h*v(i);
    dv2=h*F(x(i)+0.5*h,y(i)+0.5*dy1,v(i)+dv1*0.5);
    dy2=h*(v(i)+dv1*0.5)
    dv3=h*F(x(i)+0.5*h,y(i)+0.5*dy2,v(i)+dv2*0.5);
    dy3=h*(v(i)+dv2*0.5);
    dv4=h*F(x(i)+h,y(i)+dy3,v(i)+dv3);
    dy4=h*(v(i)+dv3);
    dy=(dy1+2*dy2+2*dy3+dy4)/6;
    dv=(dv1+2*dv2+2*dv3+dv4)/6;
    x(i+1)=x(i)+h;
    y(i+1)=y(i)+dy;
    v(i+1)=v(i)+dv;
end
%plot(x,y)
%plot(x,v)


