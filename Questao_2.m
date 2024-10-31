% Aluno: Gustavo Rodrigues Bassaco
% RA: 2207206

% Crie um código em Matlab (com comentários explicando todas 
% as etapas) que contenha as seguintes funções (com exemplos): 
% 1) Uma função que gera um sinal trapezoidal com parâmetros 
% A, B, C como mostrado na figura; 
% 2) Uma função que calcula a energia de um sinal.

x = [-2 -1 1 2];
y = [ 0  1 1 0];

% A[1; 1]
% B[2, 0]
% C[0, 1]

figure 
plot(x, y);
axis([-2 2 -1 2]);
title('Função Trapézio');

%%
% Calculando a energia do sinal de aordo com a definição do 
% calculo de energia de um sinal ( soma de cada termo elevado
% ao quadrado.

% sinal: x[n] = 8/3n, num intervalo 1 <= n <= 5 

n = 1:5;
termo = 8*n/3;
Energia = sum(termo.^2)

