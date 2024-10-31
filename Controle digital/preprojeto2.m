syms s;

tam = 0.1;

kp = 50
ki = 20
kd = 10

num = [1];
den = [5 25 30];

sys = tf(num, den)

dis = c2d(sys, tam)
r =roots([1 -1.56 0.6065])