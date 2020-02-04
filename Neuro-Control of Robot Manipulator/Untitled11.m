t=0:0.1:10
x=[0.1 0 0 0 0 0]';
h=0.1;
for i=1:length(t);
[xout,tout]=rk(@robotadapt,h,t(i),x(:,end),0)
x=[x xout];
end