wn = 1

eksi = 1/2;

sys = tf(wn^2, [1 2*eksi*wn wn^2])

step(sys);