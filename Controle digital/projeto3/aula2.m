wn = 1;

eksi = 1/2;

sys = tf(wn^2, [1 2*eksi*wn wn^2]);

step(sys);

num = [1 0.5];

den = [1 -1 0];

sys1 = tf(num, den, 0.01);
figure
rlocus(sys1);
figure
rltool(sys1, SS);