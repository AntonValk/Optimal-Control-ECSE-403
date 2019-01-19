%% ECSE 403: Assignment 6 MATLAB Questions.
% Author: Antonios Valkanas
%% 2.(iii)
% Before Feedback
A = [0 1; -4 4];
B = transpose([0 1]);
C = [1 6];
D = 0;
x0 = transpose([1 1]);

syms t;
sys = ss(A,B,C,D);

% Simulation
t0 = 0;
t1 = 5;
t = t0:0.01:t1;
u = [1 zeros(1,numel(t)-1)];
[y,t] = lsim(sys,u, t,x0);

% Plot
figure
plot(t,y)
title('Question 2.(iii) - System with no feedback')
xlabel('Time')
ylabel('y')
grid on

% Feedback
K = [1 6];
 
% Simulation
t0 = 0;
t1 = 5;
t = t0:0.01:t1;
u = [1 zeros(1,numel(t)-1)];
sys = ss(A-B*K,B,C,D);
[y,t] = lsim(sys,u,t,x0);

% Plot
figure
plot(t,y)
title('Question 2.(iii) - System with pole placement feedback')
xlabel('Time')
ylabel('y')
grid on

%% 2.(v)
% Before Feedback
A = [0 1; -4 4];
B = transpose([0 1]);
C = [1 6];
D = 0;
x0 = transpose([1 1]);
L = transpose([0 1]);

syms t;
sys = ss(A-L*C,B,C,D);

% Simulation
t0 = 0;
t1 = 5;
t = t0:0.01:t1;
u = [1 zeros(1,numel(t)-1)];
[y,t] = lsim(sys,u, t,x0);

% Plot
figure
plot(t,y)
title('Question 2.(v)(a) - True System Dynamics for x = [1,1]^T')
xlabel('Time')
ylabel('y')
grid on

t0 = 0;
t1 = 5;
t = t0:0.01:t1;
x0 = transpose([0 0]);
u = [1 zeros(1,numel(t)-1)];
[yb,t] = lsim(sys,u, t,x0);

% Plot
figure
plot(t,yb)
title('Question 2.(v)(b) - True System Dynamics for x = [0,0]^T')
xlabel('Time')
ylabel('y')
grid on

% Plot
figure
plot(t,y - yb)
title('Question 2.(v)(c) - Difference between results in (a) and (b)')
xlabel('Time')
ylabel('y')
grid on

%% 2.(vi)
A = [0 1; -4 4];
B = transpose([0 1]);
C = [1 6];
D = 0;
x0 = transpose([1 1]);
K = [1 6];
L = transpose([0 1]);
K0 = 1;

syms t;
sys = ss(A-B*K-L*C,B,C,D);

% Simulation
t0 = 0;
t1 = 10;
t = t0:0.01:t1;
u = K0*[1 ones(1,numel(t)-1)];
[y,t] = lsim(sys,u, t,x0);

% Plot
figure
plot(t,y)
title('Question 2.(v)(a) K_0 = 1 and r(t) = step(t)')
xlabel('Time')
ylabel('y')
grid on

% Change K value
K0 = 2;
syms t;
% Simulation
t0 = 0;
t1 = 10;
T = t0:0.01:t1;
%u = K0*[1 ones(1,numel(t)-1)];
[u,T] = gensig('sin',1);
[y,T] = lsim(sys,u,T,x0);

% Plot
figure
plot(T,y)
title('Question 2.(v)(b) K_0 = 2 and r(t) = sin(t)')
xlabel('Time')
ylabel('y')
grid on
