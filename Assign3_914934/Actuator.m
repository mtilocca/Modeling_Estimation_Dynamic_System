clear all;
close all;
clc 
%% Exercise 1 Mario Tilocca 914934
load('data1.mat');
G = polyfit(v,d,1); % part a

figure(1); % part b
plot(v,d, 'o');
grid on
xlabel('Voltage [V]');
ylabel('Sensor Displacement');
legend('data points recorded');

vfit = linspace(0, 100); % part c
dfite = polyval(G, vfit);
figure(2); 
plot(vfit,dfite, 'r');
grid on
xlabel('Voltage [V]');
ylabel('Sensor Displacement');
legend('line fitting');

vr = 75;
d75 = polyval(G,vr); % part d

figure(3); 
plot(v,d, 'o');
hold on
plot(vfit,dfite, 'r');
grid on
xlabel('Voltage [V]');
ylabel('Sensor Displacement');







