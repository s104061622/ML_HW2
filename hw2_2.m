clc;clear all;close all;
load('r2.mat');

N = 500;
W0 = eye(2);
V0 = 1;
mu = [1 -1];

V = V0 + N;

XM = zeros(2);
for i = 1:N
    XM = XM + ((r2(i) - mu)' * (r2(i) - mu));
end
W =  inv(W0 + XM);

posterior = cell(1,1000);
for i = 1:length(posterior)
    posterior{i} = wishrnd(W,V);
end

lambdaMAP = (V-2-1) * W;

X = zeros(4,length(posterior)); 
for i = 1:length(posterior)
    X(1,i) = posterior{i}(1,1);
    X(2,i) = posterior{i}(1,2);
    X(3,i) = posterior{i}(2,1);
    X(4,i) = posterior{i}(2,2);
end

max = 100;

h = figure(1);
subplot(2,2,1)
histogram(X(1,:),50)
hold on;
plot([lambdaMAP(1,1) lambdaMAP(1,1)],[0 max])
axis([0 5 0 max])
set(h,'Position',[400 20 1200 900])

subplot(2,2,2)
histogram(X(2,:),50)
hold on;
plot([lambdaMAP(1,2) lambdaMAP(1,2)],[0 max])
axis([-0.5 0.5 0 max])

subplot(2,2,3)
histogram(X(3,:),50)
hold on;
plot([lambdaMAP(2,1) lambdaMAP(2,1)],[0 max])
axis([-0.5 0.25 0 max])

subplot(2,2,4)
histogram(X(4,:),50)
hold on;
plot([lambdaMAP(2,2) lambdaMAP(2,2)],[0 max])
axis([0.1 0.5 0 max])