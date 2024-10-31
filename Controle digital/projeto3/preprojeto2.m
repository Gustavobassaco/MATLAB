tam = 0.1;

kp = 100;
ki = 30;
kd = 3;

A = [-1 0; 1 0];
B = [1; 0];
C = [1 0;0 1];
D = [0;0];

sys = ss(A, B, C, D);
K = [4 6];
An = A-B*K;

sysmf = ss(An, B, C, D);

t = 0:0.01:5;
[y, t] = lsim(sysmf, zeros(size(t)), t, [50;1000]);
plot(t, y)

step(sysmf)