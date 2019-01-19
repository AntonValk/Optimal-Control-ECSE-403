%% ECSE 403: Control - Assignment 7 
% Author: Antonios Valkanas

%% Question 1
% subplot_counter  =  1;                               
% dt  =  0.01;                
% x0  =  1;                
% A  =  -  1;                
% B  =  1;                
% C  =  1;                
% D  =  0;
% lambdas = [1/4 1/2 3/4];
% tfs = [1 10 50];
% for  i  =  1:3 
%     lambda = lambdas(i);
%     for  j  =  1:3
%         tf = tfs(j);
%         t  =  0:0.01:tf;            
%         [K,S,e]  =  lqr(A,B,lambda,1-lambda,0);                
%         H  =  ss(A-B*K,B,C,D);              
%         u  =  -(1/(1-lambda))*K;          
%         [y,  t,  x]  =  lsim(H,0*t,t,x0);
%         subplot(3,3,subplot_counter);
%         axis([0 tf 0 inf])
%         plot(x,t);                
%         title(['Case where \lambda is: '  num2str(lambda)  ', and end time is '  num2str(tf)]);                
%         subplot_counter  =  subplot_counter  +  1;
%     end
% end


%% Question 2
subplot_counter  =  1;                               
dt  =  0.01;                
x0  =  1;                
A  =  -  1;                
B  =  1;                
C  =  1;                
D  =  0;
lambdas = [1/4 1/2 3/4];
tfs = [1 10 50];
for  i  =  1:3 
    lambda = lambdas(i);
    for  j  =  1:3
        tf = tfs(j);
        t  =  0:0.01:tf;            
        [K,S,e]  =  lqr(A,B,0,lambda,0);                
        H  =  ss(A-B*K,B,C,D);              
        u  =  -(1/(lambda))*K;          
        [y,  t,  x]  =  lsim(H,0*t,t,x0);
        subplot(3,3,subplot_counter);
        axis([0 tf 0 inf])
        plot(x,t);                
        title(['Case where \lambda is: '  num2str(lambda)  ', and end time is '  num2str(tf)]);                
        subplot_counter  =  subplot_counter  +  1;
    end
end