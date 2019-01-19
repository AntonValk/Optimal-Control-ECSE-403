%% ECSE 403 - Final Project
% Author: Antonios Valkanas

%% Feedback gain
% Contents:
% Inverted Pendulum state space realization.
% Transfer function from state space.
% Pole-Zero map.
% Root locus.
% Controllability condition check.
% Pole placement such that we roughly get 10% overshoot, 0.9s settling time.


% Optimal Gain for short pole(-54.65, -24, -63.03, -5.56) 
% with parameters:
%         RiseTime: 0.4854
%     SettlingTime: 1.6205
%      SettlingMin: 0.0713
%      SettlingMax: 0.0864
%        Overshoot: 12.3046
%       Undershoot: 0
%             Peak: 0.0864
%         PeakTime: 1.0362


% Optimal Gain for tall pole ( -61.4774  -32.7469 -120.6124  -13.9459)
% with parameters
%         RiseTime: 0.6473
%     SettlingTime: 2.1607
%      SettlingMin: 0.1267
%      SettlingMax: 0.1536
%        Overshoot: 12.3046
%       Undershoot: 0
%             Peak: 0.1536
%         PeakTime: 1.3816

% % Constants in SI units - Taken from Lab Manual.
lp = 2*0.168; % Pole length
mp = 2*0.106; % Pole mass
r = 0.0064; % Gear radius
mc = 0.526; % Cart mass
Km = 0.0077; % Proportionality constant
g = 9.8226; % Gravitational Constant
Ra = 2.6; % Armature resistance
Kg = 3.7; % Proportionality constant
B_ = Kg*Km/r; % Proportionality constant
% 
%Define tf variable
s = tf('s');

% Define state space.
A = [0, 1, 0, 0; 
    0, -B_^2/mc/Ra, -mp*g/mc, 0; 
    0, 0, 0, 1; 
    0, B_^2/mc/lp/Ra, (mc+mp)*g/mc/lp, 0];
B = transpose([0, B_/mc/Ra, 0, -B_/mc/lp/Ra]);
C = [1 0 0 0; 0 0 1 0];
D = [0 0]';
ss_sys = ss(A,B,C,D);
%ss_tf = ss2tf(A,B,C,D)
% Get transfer function from state space.
y = tf(ss_sys)
figure(1)
pzmap(ss_sys)
eig(A);
inv(ctrb(A,B))
% % As we can see y is unstable with 2 non-negative poles.
% figure(2)
% %rlocus(y)
% 
% % Check controllability condition on A.
% Co = ctrb(A,B)
% non_Zero_det = det(Co)
% 
% % A way to fix instability is pole placement.
p = [-20+20i, -20-20i, -1.5 + 2.25i, -1.5 - 2.25i];
K = place(A,B,p)
[b,a] = ss2tf(A-B*K,B,C,D,1);
ss_sys = ss(A-B*K,B,C,D);
%%pzmap(ss_sys)
% y_k = tf(b,a)
% figure(3)
% pzmap(y_k)
% figure(4)
% step(y_k)
% stepinfo(y_k)
y = tf(1/((s-p(3))*(s-p(4))));
stepinfo(y)


%% LQR

% Short bar design
Q = [80 0 0 0;
    0 50 0 0;
    0 0 1000 0;
    0 0 0 20];
R = 0.08;

% Tall bar design
% Define state space.
A = [0, 1, 0, 0; 
    0, -B_^2/mc/Ra, -mp*g/mc, 0; 
    0, 0, 0, 1; 
    0, B_^2/mc/lp/Ra, (mc+mp)*g/mc/lp, 0];
B = transpose([0, B_/mc/Ra, 0, -B_/mc/lp/Ra]);
D = [0 0]';
ss_sys = ss(A,B,C,D);
Q = [80 0 0 0;
    0 50 0 0;
    0 0 1000 0;
    0 0 0 20];
R = 0.15;
K = lqr(A,B,Q,R)
[b,a] = ss2tf(A-B*K,B,C,D,1);
ss_sys = ss(A-B*K,B,C,D);
%%pzmap(ss_sys)
% y_k = tf(b,a)
% figure(3)
% pzmap(y_k)
% figure(4)
% step(y_k)
% stepinfo(y_k)
y = tf(1/((s-p(3))*(s-p(4))));
stepinfo(y)