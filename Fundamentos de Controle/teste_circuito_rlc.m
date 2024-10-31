%%
clear
clc
close all
%%
num = [1 0];
den = [2 5 3];
t = 0: 0.001: 10;

[y, x, t] = impulse(num, den, t);
plot(t, y)

