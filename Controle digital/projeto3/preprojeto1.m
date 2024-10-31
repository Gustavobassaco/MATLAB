sys = tf (10, [1, 35, 0])
% continuo para discreto
sysd = c2d(sys, 0.1)

pzmap(sysd)
figure
rlocus(sysd)

rltool(sysd)