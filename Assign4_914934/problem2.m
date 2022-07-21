clc;
close all;
clear all;
%% Mario Tilocca 914934

% Task a 
load data1.mat

y = data(:,1);
consumption = data(:,2);
growth = data(:,3);
correlation= xcorr(consumption, growth, 'coeff');
figure(1);
stem(-33:33, correlation);
grid on;
xlabel('years');
ylabel('correlation');
title('cross correlation oil & growth');

%% Task b 
[m,n] = size(consumption) ;
P = 0.70 ;
idx = randperm(m)  ;
TrainingC = consumption(idx(1:round(P*m))) ;
TestingC = consumption(idx(round(P*m)+1:end)) ;

TrainingG = growth(idx(1:round(P*m))) ; 
TestingG = growth(idx(round(P*m)+1:end)) ;




p = polyfit(TrainingC, TrainingG, 1);
y = polyval(p, TestingC);
b = sum((TestingG -y).^2);


%% Task c 

Y = p(1)*linspace(-6, 6, 100)+p(2);

figure(2);
plot(linspace(-6, 6, 100), Y);
hold on;
scatter(TestingC, TestingG, 'k');
scatter(TrainingC, TrainingG, 'm');
grid on;
legend('fitting', 'testing', 'training');

pred_2015 = polyval(polyfit(consumption, growth,2) , -0.5); 