%% ECSE 403 - Control - Assignment 9
% Author: Antonios Valkanas

%% Question 5 
%Case 1: IC = [1,1]
x0 = [1,1]';
A = [0 1; -1 2];
B = [0 1]';
F = [-19/20 31/20];
C = [1 0];
D = 0;
syms t;
sys = ss(A,B,C,D,0.1);

% Simulation
t0 = 0;
t1 = 2;
t = t0:0.1:t1;
u = [1 zeros(1,numel(t)-1)];
[y,t] = lsim(sys,u, t,x0);

% Plot
figure
plot(t,y)
title('Discrete System with no feedback with x_0 = [1,1] and T_s = 0.1s')


sys = ss(A-B*F,B,C,D,0.1);

% Simulation
t = t0:0.1:t1;
u = [1 zeros(1,numel(t)-1)];
[y,t] = lsim(sys,u, t,x0);

% Plot
figure
plot(t,y)
title('System with feedback with x_0 = [1,1] and T_s = 0.1s')

% Case 2: IC = [1,-1]
x0 = [1,-1]';
syms t;
sys = ss(A,B,C,D,0.1);

% Simulation
t = t0:0.1:t1;
u = [1 zeros(1,numel(t)-1)];
[y,t] = lsim(sys,u, t,x0);

% Plot
figure
plot(t,y)
title('System with no feedback with x_0 = [1,-1] and T_s = 0.1s')


sys = ss(A-B*F,B,C,D,0.1);

% Simulation
t = t0:0.1:t1;
u = [1 zeros(1,numel(t)-1)];
[y,t] = lsim(sys,u, t,x0);

% Plot
figure
plot(t,y)
title('System with feedback with x_0 = [1,-1] and T_s = 0.1s')