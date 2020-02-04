function [qd,e]=robout(t,x)
period=2;
amp1=1;
amp2=1;
fact=2*pi/period;
sinf=sin(fact*t)
cosf=cos(fact*t);
qd=[amp1*sinf amp2*cosf];
e=qd-x(:,1:2)
end
