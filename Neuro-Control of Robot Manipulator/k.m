 tspan = [0 10];
 iniCon = [1;-1]
 [t, y] = ode45(@sys, tspan, iniCon);
