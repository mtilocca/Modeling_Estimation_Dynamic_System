clear all;
close all;
clc
%% Mario Tilocca 914934
% constants used for the cruise control Simulink model 

cr = 0.01;
rho = 1.3;
cd = 0.32;
A = 2.4;
g = 9.8;
a1 = 40;
a2 = 25;
a3 = 16;
a4 = 12;
a5 = 10;
tm = 190;
wm = 420;
beta = 0.4;
m = 800;

%u = 0.9844;%part c
angle = deg2rad(5);% part c 
u = 0.7 ; %part b/c
%angle = deg2rad(0); %part b  

% (un)comment line 22, 23 , 24 and/or 25 for executing the 
%simulation of part a and b or c accordingly 
