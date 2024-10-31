% Aluno: Gustavo Rodrigues Bassaco
% RA: 2207206

%%Crie um código em Matlab (com comentários explicando todas as
% etapas) que gera um gráfico de duas funções senoidais no tempo 
% f(t): 
% 1) Amplitude = 5, deslocamento vertical = 5, frequência = 2 
% ciclos por segundo, defasagem = 30 graus.  

deslocamento1 = 5; % deslocamento vertical
Amplitude1 = 5;    % amplitde
phi1 = pi/6;       % defasagem
freq1 = 2;         % frequendia 2Hz
t = 0:0.02:4;      % eixo do tempo

% senoide 1
p1 = deslocamento1 + Amplitude1*sin(2*pi*freq1*t + phi1);
figure
% plota a senoide 1
plot(t, p1, 'r', 'linew', 2)
title('Senoide 1')
xlabel('Tempo')
ylabel('Valor')

%%
% 2) Amplitude = 15, deslocamento vertical = 0, frequência = 3
% ciclos por segundo, defasagem = 0 graus. O gráfico deve ter 
% pelo menos 3 segundos. 

Amplitude2 = 15;   % Amplitude
freq2 = 3;         % frequencia 3Hz
t = 0:0.02:4;      % eixo do tempo

% senoide 2
p2 = Amplitude2*sin(2*pi*freq2*t +0);

figure
% plota senoide 2
plot(t, p2, 'b', 'linew', 2)
title('Senoide 2')
xlabel('Tempo')
ylabel('Valor')

%% 
% Plotar os dois graficos simultâneos:

figure
hold all
plot(t, p1, 'r', 'linew', 2)
plot(t, p2, 'b', 'linew', 2)
title('Senoide Simultaneas')
xlabel('Tempo')
ylabel('Valor')
legend('Senoide 1', 'Senoide 2')

