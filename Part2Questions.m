%Evan Hanson and Evan Williams
%Project 1
clear
clc
close all
%2.1 Questions
%3: plot the DE direction field
f=@(t,x) exp(-x+1) - 1;
dirfield_2019(f , 0:1:10,.8:.1:2)
xlabel("time (seconds)");
ylabel("Schwarzschild Radii");
title("Slope Field 1")

%9
%analytical solution g(t,x)
g =@(t,x) log(((exp(2)-exp(1))/exp(t))+exp(1));

figure
hold on
AbsError1 = euler2_10(0,2,10,1,f,g);
AbsError01 = euler2_10(0,2,10,0.1,f,g);
AbsError001 = euler2_10(0,2,10,0.01,f,g);
legend("h = 1","h = 0.1","h = 0.01")
title("Euler Approximations")
xlabel("time (seconds)");
ylabel("Schwarzschild Radii");
%10

figure
hold on
t1 = 0:10;
t01 = 0:0.1:10;
t001 = 0:0.01:10;
plot(t1,AbsError1)
plot(t01,AbsError01)
plot(t001,AbsError001)
legend("h = 1","h = 0.1","h = 0.01")
title("Eulers Method Absolute Error")
xlabel("time (seconds)");
ylabel("Absolute Error");
hold off

%11
TotalError1 = totalerror(10,0,1,AbsError1);
fprintf("TotalError1 = %f\n",TotalError1)

TotalError01 = totalerror(10,0,.1,AbsError01);
fprintf("TotalError01 = %f\n",TotalError01)

TotalError001 = totalerror(10,0,.01,AbsError001);
fprintf("TotalError001 = %f\n",TotalError001)

%12

figure
hold off
%N=tn-to/h
%N is number of steps
N = 1:10000;
TotalErrorVector = zeros(1,10000);

for i=1:10000
   TotalErrorVector(i) = totalerror(10,0,10/i,abserror(0,2,10,i,f,g));
end

loglog(N,TotalErrorVector)
title("Total Error vs Number of Steps")
xlabel("Number of Steps")
ylabel("Total Error")
