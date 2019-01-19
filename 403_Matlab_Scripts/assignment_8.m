%% ECSE 403 - Control - Assignment 8
% Author: Antonios Valkanas

%% Question 2
lambdas = [0.1,0.9];
tfs = [1,10];
figure(1)
index = 1;
for i = 1:2
    for j = 1:2
        lambda = lambdas(i);
        tf = tfs(j);
        A = -1;
        B = 1;
        Q = lambda;
        R = 1-lambda;
        F = 0;
        tSpan = [0 tf];
        nSoln = 100;
        tol = 1e-10;
        P = finiteLqr(tSpan,A,B,Q,R,F,nSoln,tol);
        subplot(2,2,index)
        plot([P.t], [P.S])
        title(['Q1 L = ' num2str(lambda) ', tf = ' num2str(tf)]);
        index = index + 1;
    end
end

%% Question 3
figure(2)
index = 1;
for i = 1:2
    for j = 1:2
        nSoln = 100;
        u = [];
        lambda = lambdas(i);
        tf = tfs(j);
        A = -1;
        B = 1;
        Q = lambda;
        R = 1-lambda;
        F = 0;
        tSpan = [0 tf];
        tol = 1e-10;
        P = finiteLqr(tSpan,A,B,Q,R,F,nSoln,tol);
        subplot(2,2,index)
        k = [P.K];
        x = [P.S];
        for a = 1:nSoln
            u = [u, -1*B*R*k(a)*x(a)];
        end
        plot([P.t], u)
        title(['Q2(i) Optimal u: L = ' num2str(lambda) ', tf = ' num2str(tf)]);
        index = index + 1;
    end
end

figure(3)
index = 1;
for i = 1:2
    for j = 1:2
        nSoln = 100;
        u = [];
        lambda = lambdas(i);
        tf = tfs(j);
        A = -1;
        B = 1;
        Q = lambda;
        R = 1-lambda;
        F = 0;
        tSpan = [0 tf];
        tol = 1e-10;
        P = finiteLqr(tSpan,A,B,Q,R,F,nSoln,tol);
        subplot(2,2,index)
        k = [P.K];
        x = [P.S];
        for a = 1:nSoln
            u = [u, -1*B*R*k(a)*x(a)];
        end
        plot([P.t], x)
        title(['Q2(i) x: L = ' num2str(lambda) ', tf = ' num2str(tf)]);
        index = index + 1;
    end
end

figure(4)
index = 1;
M = [10 100];
for i = 1:2
    for j = 1:2
        nSoln = 100;
        u = [];
        lambda = lambdas(i);
        tf = 10;
        A = -1;
        B = 1;
        Q = lambda;
        R = 1-lambda;
        F = M(j);
        tSpan = [0 tf];
        tol = 1e-10;
        P = finiteLqr(tSpan,A,B,Q,R,F,nSoln,tol);
        subplot(2,2,index)
        plot([P.t], [P.K])
        title(['Q3(ii) L = ' num2str(lambda) ', tf = ' num2str(tf)]);
        index = index + 1;
    end
end