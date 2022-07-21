clc;
close all;
clear all;
%% Mario Tilocca 914934

%Task a 

h = tf([1], [1 3 2]);
x = 200;
ts = 1/10;
t = 0:ts:x;
input = idinput(length(t), 'prbs');
output = lsim(h,input,t);

figure(1);
subplot(2,1,1);
plot(output, 'r', 'LineWidth', 1.5);
grid on ;
title('System response');
ylabel('Amplitude');
xlabel('Time');
xlim([0 2000]);
legend('output');

subplot(2,1,2);
plot(input, 'b');
grid on ;
title('Input to the system');
ylabel('Amplitude');
xlabel('Time');
ylim([-1.2 1.2]);
xlim([0 2000]);
legend('input');
%% Task b 

y = 200;
time = 0:0.1:y;
c = xcorr(output, y, 'coeff');
figure(2)
plot(c,  '-g', 'LineWidth', 0.5);
grid on;
title('Autocorrelation signal');
ylabel('Correlation');
xlabel('Time');
xlim([0 400]);
%% Task c 
step = 0.1;
d = iddata(output, input, step);
T = 0:step:10;
cc = cra(d,numel(T)-1,10,0);
[n,m] = impulse(h);
figure(3)
plot(m,n, 'r');
grid on;
hold on;
stem(T, cc*10, 'ok'); 
ylim([-0.1 0.35]);
xlim([0 11]);
legend('Impulse response', 'Estimation Impluse response');
%% Task d 
figure(4);
bode(etfe(d), spa(d), 'k');
legend('efte', 'spa');
grid on;
