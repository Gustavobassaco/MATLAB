h = [0.5 0.5];
x = [-2 0 2 4 4 8 4];

convolucao = conv (x, h)
figure();
plot(convolucao);
