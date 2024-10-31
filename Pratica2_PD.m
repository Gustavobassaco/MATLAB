%%
% Aluno : Gustavo Rodrigues Bassaco   RA: 2207206
% Processamento Digital de Sinais

%% Limpando
clear
clc
close all
%% Função de Transferência

num = [1 0 0 0];            % z^3
den = [1 -1.3 0.91 -0.183]; % z^3 -1.3*z^2 + 0.91*Z - 0.183
t = 0: 1: 50;               % vetor tempo

z = tf('z', 1);             % cria uma variável tipo Z
H = [z^3/(z^3 - 1.3*z^2 + 0.91*z - 0.183)]; % Função de Transferência

%% Polos e Zeros
figure     % nova tela
pzmap(H)% função q dada uma função em Z, monstra seus polos e zeros
title('Polos e zeros Função de Transferência.'); %titulo

xlabel('Eixo Real');       % eixo x
ylabel('Eixo Imaginário'); % eixo y
%% Espectro de Frequencia da função de Transferência

[H,W] = freqz(num, den);  % retorna a resposta de frequência complexa
figure % nova tela

% modulo do espectro de frequencia
subplot(2,1,1);
plot(W, abs(H))  % para a amplitude da resposta ao impulso
title('Diagrama de Magnitude 0 a 2pi');
xlabel('frequencia HZ');
ylabel('modulo');

subplot(2, 1, 2);
plot(W, angle(H)) % para a fase da resposta ao impulso
title('Diagrama de Fase');
xlabel('frequencia HZ');
ylabel('rad');


%% Resposta ao Impulso da função de transferencia

[imp_resp, x] = impz(num, den, t); % retorna a resposta ao impulso
figure
stem(t, imp_resp) % plot de grafico discreto
title('Resposta ao impulso da função impz;');
xlabel('tempo');
ylabel('amplitude');

%% resposta ao impulso de forma recursiva
y(1) = 0;
y(2) = 0;
y(3) = 0;
y(4) = 1;

for i = 5: 51
    y(i) = 1.3*y(i - 1) - 0.91*y(i - 2)+ 0.183*y(i - 3); 
end

figure
stem(t, y); % plot te grafico discreto
title('Resposta ao impulso recursiva');
xlabel('tempo');
ylabel('amplitude');

%% Convolução Áudio com resposta ao impulso

FS = 8000;   % frequencia de amostragem do sinal de audio
[X, FS] = audioread("carro-do-ovo.mp3"); % le o audio

convolucao = conv(imp_resp, X); % convolução resposta ao impulso com o áudio

% vetor de tempo para plot de convolução
periodo = 1/FS;
comprimento = (length(convolucao)-1)/FS;
t = 0: periodo: comprimento;

figure                  % nova janela
subplot(2,1,1)          % subplot 1
plot(t,convolucao, 'r') % plot audio convolução
hold on

% vetor de tempo para plot de áudio original
comprimento = (length(X)-1)/FS;
t = 0: periodo: comprimento;

plot(t, X, 'k')         % plot audio original
title('Sinal de Áudio Convoluido com Média Móvel');
xlabel( 't (milissegundos)' );
ylabel( 'X(t)' );
legend({'audio convoluido', 'audio original'})
hold off

Fourier = fft(convolucao);    % transformada de fourier da convolução
tamanho = length(convolucao); % tamanho do vetor convolução

% Espectro de Frequencia do sinal convoluído
P2 = abs(Fourier/tamanho);
Espectro_convolucao = P2(round(1:tamanho/2+1));
Espectro_convolucao(2:end-1) = 2*Espectro_convolucao(2:end-1);

f_conv = FS*(0:(tamanho/2))/tamanho;  % vetor aux

Fourier = fft(X);                     % Trans. Fourier do sinal de audio
tamanho = length(X);                  % tamanho do sinal de audio
f_audio = FS*(0:(tamanho/2))/tamanho; % vetor aux

% Espectro de Frequencia do sinal de audio
P2 = abs(Fourier/tamanho);
Espectro_original = P2(1:tamanho/2+1);
Espectro_original(2:end-1) = 2*Espectro_original(2:end-1);

subplot(2,1,2)                         % subplot 2
plot(f_conv, Espectro_convolucao, 'r') % plot do Espectro da convolução
hold on
plot(f_audio, Espectro_original, 'k')  % plot do Espectro do áudio
title( 'Espectro de amplitude unilateral de X(t)' )
xlabel( 'f (Hz)' )
ylabel( 'Amplitude' )
legend({'audio convoluido', 'audio original'})
hold off

player = audioplayer(convolucao,FS);
play(player); 

%% Raizes Parciais com a função rediduez

[r, p k] = residuez(num, den)
n = 0: 1: 50; 

L = r(1)*p(1).^n + r(2)*p(2).^n + r(3)*p(3).^n;
figure;
stem(L);
title('Resposta ao impulso residuez');
xlabel('tempo');
ylabel('amplitude');



