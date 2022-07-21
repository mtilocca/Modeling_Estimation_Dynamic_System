clear all;
close all;
clc
%% Exercise 2 Mario Tilocca 914934
load('data2.mat');

[fitresultA, gofA] = createFit(x, y, u);
[fitresultB, gofB] = createFit(x, y, v);

[gridx, gridy] = meshgrid(0:0.05:1,0:0.05:1);
figure(2);
quiver(gridx, gridy, fitresultA(gridx,gridy), fitresultB(gridx, gridy));
grid on 
axis equal
