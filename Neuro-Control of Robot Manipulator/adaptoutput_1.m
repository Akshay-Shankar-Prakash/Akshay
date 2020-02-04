ts=[0 20]
x0=[0.1 0 0 0 0 0]';
wei=zeros(1,4);
kv=diag(ones(1,2));
[t,x]=ode23('robotadapt',ts,x0,wei);
% [r,f]=robot(ts,x0);
[qd,e]=robout(t,x);
plot(t,qd)


%F=diag(ones(1,50))
%lambda=diag(ones(1,5))
%rho1=qd.. + lam*e.

%rho2=qd. + lam*E
for i=1:length(qd)
    
pi=[sigmf(qd(i,:),[1 0.6324]); sigmf(qd(i,:),[1 0.0975]); sigmf(qd(i,:),[1 0.2785]);  sigmf(qd(i,:),[1 0.5469])]
t=w*pi+r*kv
w=w+0.02*(pi*f)*r'
end
