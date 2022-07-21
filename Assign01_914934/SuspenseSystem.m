clear all;
close all;
clc;
%% Mario Tilocca 914934
%% constants of the system
m1 = 10; 
m2 = 350;
kw = 500000;
ks = 10000;
b = 500;
%% state space model matrices definitions
A = [0 0 0 1; 0 0 1 0; ks/m2 -ks/m2 -b/m2 b/m2; -(kw+ks)/m1 ks/m1 b/m1 -b/m1];
B = [0   0  0  kw/m1]'; 
C = [1 0 0 0; 0 1 0 0];
D = zeros(2,1);
%% initial conditions and transfer functions 
t = 0:0.001:10; 
u = exp(-t).*sin(t);
u = repmat(u, 1,1);
x0 = [0;0;0;0];
sys = ss(A,B,C,D);
[num,den] = ss2tf(A,B,C,D);
num1 = num(1,:);
num2 = num(2,:);
H = tf(num1,den) % we have two transfer function as one is related to Z_1 
H1 = tf(num2, den) % and the other to Z_2
%% simulation
y = lsim(sys,u,t,x0);
x1 = y(:,1);
x2 = y(:,2);
%% plots 
figure(1)
plot(t, x1,  t, x2)
grid on
title('Mass-spring-damper system of a car');
xlabel('Time [s]');
ylabel('Displacement'); 
legend('z_1', 'z_2')

