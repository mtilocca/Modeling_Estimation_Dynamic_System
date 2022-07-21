clear all;
close all;
clc
%% Mario Tilocca 914934
%% Constants of the RLC circuit 
R1 = 4;
R2 = 2;
R3 = 3;
L = 1.6;
C = 0.25;
%% solving the system with the function rhs and ode45

init = [15; 2]; %initial conditions 
E = @(t) (sin(t)); % input
time = [0 20];  % simulation time

% with y_1 = I_1 and y_2 = q, we have dy(1) = dI_1/dt and dy(2) = I_3  in
% the rhs function 
diffEQ = @(t,y) rhs(t, y,  E, R1, R2, R3, L, C);


[t,y] = ode45(diffEQ, time, init);


%% plots 
figure(1)
plot( t, y(:,1),'k', t, y(:,2), 'b');
title('RLC circuit solution');
xlabel('time');
ylabel('Current I_1, Charge q, Input sin(t)');

hold on 
fplot(E, time, 'm');
legend('I_1', 'q', 'E');
grid on
hold off


