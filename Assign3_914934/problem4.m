clear all;
close all;
clc;
%% Exercise 4 Mario Tilocca 914934
load('data4.mat');
global x y
k = [1 1];
%% part b
ka = fminsearch('computeCost', k);

k1 = linspace(ka(1) -0.2, ka(1) +0.2, 100);
k2 = linspace(ka(2) -0.2, ka(2) +0.2, 100);

values = zeros(length(k1), length(k2)); 

for t = 1:length(k1)
    for z = 1:length(k2)
        values(t,z)= computeCost([k1(t); k2(z)]);
    end 
end
%% part c 
figure(1) 
surf(k1, k2, values');
grid on; 
xlabel('k_1');
ylabel('k_2');












