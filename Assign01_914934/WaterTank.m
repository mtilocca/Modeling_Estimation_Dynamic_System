clear all;
close all;
clc;
%% constants
E = 0.0001*pi;
g = 9.81;
heq = 1;
F = 0.01*pi;
z = 0.5;
qzm = 0.002;
qum = 0.001; 

%% inflow at equilibrium point heq
outf = (E*sqrt(2*g*heq))/F;
zflow = (z*qzm)/F;
ueqflow = outf-zflow;

%% linearization parameters 
ueq = qum / ueqflow;
j = (2 * (-E) * sqrt(2*g)) /F;
tt = (-ueq * qum)/F - (-0.5 * qzm)/F +j;
%% state space definition of linearized system around equilibrium point heq 

A = [j 0; 0.2 -0.2];
B = [qum/F qzm/F; 0 0];
constantIN = [tt;0];
C = [0 1];
D = zeros(1,2);
constantOUT = [0];

%% Transfer function calculation

sys = ss(A,B,C,D);
[num,den] = ss2tf(A,[B, constantIN],C,[D, constantOUT],1);
H = tf(num,den)  
 

%% simulation 

t = 0:0.1:20;
u1 = ueq + 0.1 * sin(t);
x = rand;
u2 = 0.5 + 0.1 *(x * t - 0.5);
x0 = [1;1];
y = lsim(sys,[u1,u2],t,x0 );
%% plot
figure(1)
plot(t, y)
grid on
title('Water tank system solution');
xlabel('Time [s]');
ylabel('Height of the water [m]'); 
legend('y(t)')


