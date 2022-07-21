clear all;
close all;
clc;
%% Exercise 3 Mario Tilocca 914934
load('data3.mat');

%% part a 

x1 = [ones(11,1) log(x)];
the= log(y)'*x1*(inv(x1'*x1));
k1 = exp(the(1));
k2 = the(2);
t = 0:0.25:15;
Y = k1*t.^(k2);

%% part b 

figure(1);
plot(xv,yv, '*b');
grid on
hold on 
plot(x,y, 'om'); % part a plotting 
plot(t,Y, 'k')
legend('training data', 'validation data', 'line fitting');
hold off

% validation data sse calculation 
sse_val = sum((yv - ((xv.^k2)*k1)).^2);

% training data sse and r2 calculation
ytest =  (x.^k2)* k1 ;
sse_train = sum((y-ytest).^2);
sst_t = sum((y-mean(y)).^2);
r2 = 1 - (sse_train/sst_t); 
%% part c 

%starting from 3rd degree polynomial fitting 

p3 = polyfit(x,y,3);
yt3 = polyval(p3,xv);
sse_3 = sum((yv -yt3).^2); 


p2 = polyfit(x,y,2); % second degree polynomial 
yt2 = polyval(p2,xv);
sse_2 = sum((yv -yt2).^2);

p1 = polyfit(x,y,1); % first degree polynomial 
yt1 = polyval(p1,xv);
sse_1 = sum((yv -yt1).^2); 



