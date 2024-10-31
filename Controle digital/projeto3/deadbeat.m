
 r = poly([0.9 0.8 0.35])

 sys = tf([0.05 0.025], [1 -2.05 1.315 -0.252], 0.01)
 sysf = feedback(sys, 1)


 dead = (1/sys) * (tf([1], [1 0 0], 0.01)/ (1 - tf([1], [1 0 0], 0.01)))
 sysn = sys * dead
 
 fechado = feedback(sysn, 1)

 step(fechado)
 hold on
 step(sysf)