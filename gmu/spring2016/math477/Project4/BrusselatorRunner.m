%brusselator(xl,xr,yb,yt,tb,te,M,N,tsteps,Dp, Dq, C,K)
clear all
clc

%Exmple8.15
%brusselator815(0,20,0,20,0,2000,40,40,200,1,8,4.5,9)

%Problem 8.4.6. Using initial conditions from example 8.4.6, and changin P
%to c and q to K/C. We shoudl be stable if K < 6.7, and unstable if K>6.7
%brusselator846(0,20,0,20,0,2000,40,40,200,1,8,4.5,6.714)


%problem 8.4.6 second version. c = 12, Dp = 5, Dq = 6, 
%K < (1 + 12*sqrt(5/6) )^2 = 142.90890...
brusselator846(0,20,0,20,0,2000,40,40,100,5,6,12,300)