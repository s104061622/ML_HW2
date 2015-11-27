clc;clear all;close all;
load('O.mat');
N = length(O);
m1 = length(find(O(1:50) == 0));
m2 = length(find(O(:) == 0));
mu1 = linspace(0,1,50);
mu2 = linspace(0,1,100);
likelihood1 = factorial(N) *  mu1.^m1 .* (1-mu1).^(50-m1) / (factorial(m1) * factorial(50-m1));
likelihood2 = factorial(N) *  mu2.^m2 .* (1-mu2).^(N-m2) / (factorial(m2) * factorial(N-m2));
prior1 = betapdf(mu1,0.1,0.1);
prior2 = betapdf(mu2,0.1,0.1);
posterior1 = likelihood1 .* prior1;
posterior2 = likelihood2 .* prior2;

subplot(3,1,1)
plot(mu1,prior1);
subplot(3,1,2), plot(mu1,posterior1);
subplot(3,1,3), plot(mu2,posterior2);
