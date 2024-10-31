%% Atividade 3
%% Gustavo Rodrigues Bassaco   2207206

clear 
clc
close all

%% func_disc(t) = sen 2πt
% A. Ta = 100 ms  -->  T = 0.1s  --> sen(pi/5*n)
Ts = 0.1;  % período
FS = 1/Ts; % frequencia de amostragem
t = 0: 0.001: 2;
n = 0: Ts: 2;
func_continua = sin(2*pi*t);
func_disc = sin((2*pi)*n);
func_alias = sin(22*pi*t);

% frequencias
freqC = fft(func_continua);
freqD = fft(func_disc);
freqA = fft(func_alias);

% deslocando o componente de frequência zero para o centro da matriz.
zC = fftshift(freqC);
zD = fftshift(freqD);
zA = fftshift(freqA);

% tamanho da fft 
lfreqC = length(freqC);
lfreqD = length(freqD);
lfreqA = length(freqA);

% powershift da faixa de frequência centrada em zero 
fC = (-lfreqC/2:lfreqC/2-1)/lfreqC*FS;
fD = (-lfreqD/2:lfreqD/2-1)/lfreqD*FS;
fA = (-lfreqA/2:lfreqA/2-1)/lfreqA*FS;

figure;
stem(n,func_disc, 'r');
hold on;
title("T = 0.1s");
plot(t,func_continua, 'k');
plot(t, func_alias, '--', 'Color',[0.6, 0.6, 0.6]);
legend({'amostragem','senoide continua', 'aliasing: sen(22*pi*t)'})
ylabel('Amplitude')
xlabel('Tempo')
grid on

figure
% frequencia continuo
subplot(3,1,1)
stem(fC,abs(zC),'k')
title('Espectro de Frequencia Continuo TS= 0.1')
legend({'contiuo'})
ylabel('amplitude')
xlabel('frequencias')
xlim([-0.12 0.12])
ylim([0 1100])
grid on

% frequencia aliasing
subplot(3,1,2)
stem(fA,abs(zA),'Color','b')
title('Espectro de Frequencia Aliasing TS= 0.1')
legend({'aliasing'})
ylabel('amplitude')
xlabel('frequencias')
xlim([-0.15 0.15])
ylim([0 1100])
grid on

% frequencia discreto
subplot(3,1,3)
stem(fD,abs(zD),'r')
title('Espectro de Frequencia Discreta TS= 0.1')
legend({'discreto'})
ylabel('amplitude')
xlabel('frequencias')
xlim([-2*pi 2*pi])
ylim([0 11])
grid on


%% B. Ta = 250 ms
Ts = 0.25;
FS = 1/Ts; %frequencia de amostragem
t = 0: 0.01: 4;
n = 0: Ts: 4;

func_continua = sin(2*pi*t);
func_disc = sin(2*pi*n);
func_alias = sin(10*pi*t);

% frequencias
freqC = fft(func_continua);
freqD = fft(func_disc);
freqA = fft(func_alias);

% deslocando o componente de frequência zero para o centro da matriz.
zC = fftshift(freqC);
zD = fftshift(freqD);
zA = fftshift(freqA);

% tamanho da fft 
lfreqC = length(freqC);
lfreqD = length(freqD);
lfreqA = length(freqA);

% powershift da faixa de frequência centrada em zero 
fC = (-lfreqC/2:lfreqC/2-1)/lfreqC*FS;
fD = (-lfreqD/2:lfreqD/2-1)/lfreqD*FS;
fA = (-lfreqA/2:lfreqA/2-1)/lfreqA*FS;

figure;
stem(n,func_disc, 'r');
hold on
plot(t,func_continua, 'k')
title("T = 0.25");

plot(t,func_continua, 'k');
plot(t, func_alias, '--', 'Color',[0.6, 0.6, 0.6]);
legend({'amostragem','senoide continua', 'aliasing: sen(10*pi*t)'})
grid on

figure
% frequencia continuo
subplot(3,1,1)
stem(fC,abs(zC),'k')
title('Espectro de Frequencia Continuo TS= 0.25')
legend({'contiuo'})
ylabel('amplitude')
xlabel('frequencias')
xlim([-0.12 0.12])
ylim([0 250])
grid on

% frequencia aliasing
subplot(3,1,2)
stem(fA,abs(zA),'Color','b')
title('Espectro de Frequencia Aliasing TS= 0.25')
legend({'aliasing'})
ylabel('amplitude')
xlabel('frequencias')
xlim([-0.4 0.4])
ylim([0 250])
grid on

% frequencia discreto
subplot(3,1,3)
stem(fD,abs(zD),'r')
title('Espectro de Frequencia Discreta TS= 0.25')
legend({'discreto'})
ylabel('amplitude')
xlabel('frequencias')
xlim([-2*pi 2*pi])
ylim([0 11])
grid on

%% C. Ta = 500 ms
Ts = 0.5;
FS = 1/Ts; %frequencia de amostragem
t = 0: 0.01: 4;
n = 0: Ts: 4;
func_continua = sin(2*pi*t);
func_disc = sin(2*pi*n);
func_alias = sin(6*pi*t);

% frequencias
freqC = fft(func_continua);
freqD = fft(func_disc);
freqA = fft(func_alias);

% deslocando o componente de frequência zero para o centro da matriz.
zC = fftshift(freqC);
zD = fftshift(freqD);
zA = fftshift(freqA);

% tamanho da fft 
lfreqC = length(freqC);
lfreqD = length(freqD);
lfreqA = length(freqA);

% powershift da faixa de frequência centrada em zero 
fC = (-lfreqC/2:lfreqC/2-1)/lfreqC*FS;
fD = (-lfreqD/2:lfreqD/2-1)/lfreqD*FS;
fA = (-lfreqA/2:lfreqA/2-1)/lfreqA*FS;

figure;
stem(n,func_disc, 'r');
title("T = 0.5s");
ylim([-1 1]);
hold on;
plot(t,func_continua, 'k')
plot(t, func_alias, '--', 'Color',[0.6, 0.6, 0.6]);
legend({'amostragem','senoide continua', 'aliasing: sen(6*pi*t)'})
grid on

figure
% frequencia continuo
subplot(3,1,1)
stem(fC,abs(zC),'k')
title('Espectro de Frequencia Continuo TS= 0.5')
legend({'contiuo'})
ylabel('amplitude')
xlabel('frequencias')
xlim([-0.12 0.12])
ylim([0 250])
grid on

% frequencia aliasing
subplot(3,1,2)
stem(fA,abs(zA),'Color','b')
title('Espectro de Frequencia Aliasing TS= 0.5')
legend({'aliasing'})
ylabel('amplitude')
xlabel('frequencias')
xlim([-0.15 0.15])
ylim([0 250])
grid on

% frequencia discreto
subplot(3,1,3)
stem(fD,abs(zD),'r')
title('Espectro de Frequencia Discreta TS= 0.5')
legend({'discreto'})
ylabel('amplitude')
xlabel('frequencias')
xlim([-2*pi 2*pi])
ylim([0 11])
grid on


%% D. Ta = 750 ms
Ts = 0.75;
FS = 1/Ts; %frequencia de amostragem
t = 0: 0.01: 6;
n = 0: Ts: 6;
func_continua = sin(2*pi*t);
func_disc = sin(2*pi*n);
func_alias = sin(14/3*pi*t);

% frequencias
freqC = fft(func_continua);
freqD = fft(func_disc);
freqA = fft(func_alias);

% deslocando o componente de frequência zero para o centro da matriz.
zC = fftshift(freqC);
zD = fftshift(freqD);
zA = fftshift(freqA);

% tamanho da fft 
lfreqC = length(freqC);
lfreqD = length(freqD);
lfreqA = length(freqA);

% powershift da faixa de frequência centrada em zero 
fC = (-lfreqC/2:lfreqC/2-1)/lfreqC*FS;
fD = (-lfreqD/2:lfreqD/2-1)/lfreqD*FS;
fA = (-lfreqA/2:lfreqA/2-1)/lfreqA*FS;

figure;
stem(n,func_disc, 'r');
title("T = 0.75s");
hold on;
plot(t,func_continua, 'k')
plot(t, func_alias, '--', 'Color',[0.6, 0.6, 0.6]);
legend({'amostragem','senoide continua', 'aliasing: sen(14/3*pi*t)'})
grid on

figure
% frequencia continuo
subplot(3,1,1)
stem(fC,abs(zC),'k')
title('Espectro de Frequencia Continuo TS= 0.75')
legend({'contiuo'})
ylabel('amplitude')
xlabel('frequencias')
xlim([-0.04 0.04])
ylim([0 400])
grid on

% frequencia aliasing
subplot(3,1,2)
stem(fA,abs(zA),'Color','b')
title('Espectro de Frequencia Aliasing TS= 0.75')
legend({'aliasing'})
ylabel('amplitude')
xlabel('frequencias')
xlim([-0.04 0.04])
ylim([0 350])
grid on

% frequencia discreto
subplot(3,1,3)
stem(fD,abs(zD),'r')
title('Espectro de Frequencia Discreta TS= 0.75')
legend({'discreto'})
ylabel('amplitude')
xlabel('frequencias')
xlim([-2*pi 2*pi])
yticks([0:1:6])
grid on


%% E. Ta = 1000 ms
Ts = 1;
FS = 1/Ts; %frequencia de amostragem
t = 0: 0.01: 6;
n = 0: Ts: 6;
func_continua = sin(2*pi*t);
func_disc = sin(2*pi*n);
func_alias = sin(4*pi*t);

% frequencias
freqC = fft(func_continua);
freqD = fft(func_disc);
freqA = fft(func_alias);

% deslocando o componente de frequência zero para o centro da matriz.
zC = fftshift(freqC);
zD = fftshift(freqD);
zA = fftshift(freqA);

% tamanho da fft 
lfreqC = length(freqC);
lfreqD = length(freqD);
lfreqA = length(freqA);

% powershift da faixa de frequência centrada em zero 
fC = (-lfreqC/2:lfreqC/2-1)/lfreqC*FS;
fD = (-lfreqD/2:lfreqD/2-1)/lfreqD*FS;
fA = (-lfreqA/2:lfreqA/2-1)/lfreqA*FS;

figure;
stem(n,func_disc, 'r');
title("T = 1s");
ylim([-1 1]);
hold on;
plot(t,func_continua, 'k')
plot(t, func_alias, '--', 'Color',[0.6, 0.6, 0.6]);
legend({'amostragem','senoide continua', 'aliasing: sen(4*pi*t)'})
grid on

figure
% frequencia continuo
subplot(3,1,1)
stem(fC,abs(zC),'k')
title('Espectro de Frequencia Continuo TS= 1')
legend({'contiuo'})
ylabel('amplitude')
xlabel('frequencias')
xlim([-0.032 0.032])
ylim([0 350])
grid on

% frequencia aliasing
subplot(3,1,2)
stem(fA,abs(zA),'Color','b')
title('Espectro de Frequencia Aliasing TS= 1')
legend({'aliasing'})
ylabel('amplitude')
xlabel('frequencias')
xlim([-0.032 0.032])
ylim([0 350])
grid on

% frequencia discreto
subplot(3,1,3)
stem(fD,abs(zD),'r')
title('Espectro de Frequencia Discreta TS= 1')
legend({'discreto'})
ylabel('amplitude')
xlabel('frequencias')
xlim([-2*pi 2*pi])
ylim([0 7])
grid on


%% F. Ta = 1500 ms
Ts = 1.5;
FS = 1/Ts; %frequencia de amostragem
t = 0: 0.01: 6;
n = 0: Ts: 6;
func_continua = sin(2*pi*t);
func_disc = sin(2*pi*n);
func_alias = sin(10/3*pi*t);

% frequencias
freqC = fft(func_continua);
freqD = fft(func_disc);
freqA = fft(func_alias);

% deslocando o componente de frequência zero para o centro da matriz.
zC = fftshift(freqC);
zD = fftshift(freqD);
zA = fftshift(freqA);

% tamanho da fft 
lfreqC = length(freqC);
lfreqD = length(freqD);
lfreqA = length(freqA);

% powershift da faixa de frequência centrada em zero 
fC = (-lfreqC/2:lfreqC/2-1)/lfreqC*FS;
fD = (-lfreqD/2:lfreqD/2-1)/lfreqD*FS;
fA = (-lfreqA/2:lfreqA/2-1)/lfreqA*FS;

figure;
stem(n,func_disc, 'r');
title("T = 1.5 s");
ylim([-1 1]);
hold on;
plot(t,func_continua, 'k')
plot(t, func_alias, '--', 'Color',[0.6, 0.6, 0.6]);
legend({'amostragem','senoide continua', 'aliasing: sen(10/3*pi*t)'})
grid on

figure
% frequencia continuo
subplot(3,1,1)
stem(fC,abs(zC),'k')
title('Espectro de Frequencia Continuo TS= 1.5')
legend({'contiuo'})
ylabel('amplitude')
xlabel('frequencias')
xlim([-0.02 0.02])
ylim([0 350])
grid on

% frequencia aliasing
subplot(3,1,2)
stem(fA,abs(zA),'Color','b')
title('Espectro de Frequencia Aliasing TS= 1.5')
legend({'aliasing'})
ylabel('amplitude')
xlabel('frequencias')
xlim([-0.02 0.02])
ylim([0 350])
grid on

% frequencia discreto
subplot(3,1,3)
stem(fD,abs(zD),'r')
title('Espectro de Frequencia Discreta TS= 1.5')
legend({'discreto'})
ylabel('amplitude')
xlabel('frequencias')
xlim([-2*pi 2*pi])
ylim([0 11])
grid on


%%
%   De forma teórica, encontre a frequência discreta e demonstre em quais desses
% casos ocorre aliasing? Qual o efeito do aliasing em cada caso (qual é o alias)?
% Para cada caso, determine e esboce o espectro de frequência.




%%
%  2) A partir do sinal de áudio gravado em atividades anteriores, realize uma
% subamostragem de 2, 4, 8 e 16 vezes e determine o espectro de frequência. Qual o
% efeito da subamostragem no espectro de frequência? Efunc_discplique por que isso
% acontece.

%% Audio Original
Tempo = 10;  
FS = 8000;   % frequencia de amostragem do sinal
[Y, FS] = audioread("carro-do-ovo.mp3"); % vetor audio numérico

Fourier = fft(Y); %% fft sinal original
tam = length(Y); %tamanho so sinal original
f_original = FS*(0:(tam/2))/tam; % vetor frequencia sinal original

P2 = abs(Fourier/tam);
Espectro_original = P2(1:tam/2+1);
Espectro_original(2:end-1) = 2*Espectro_original(2:end-1); %espectro de freq original

% encontrando t orinal
comprimento = (length(Y)-1)/FS;
t_original = 0: 1/FS: comprimento;

%% Subamostragem de 2
N = 2;
FS_sub2 = FS/N;
Ysub2 = downsample(Y,N);

Fourier = fft(Ysub2); %% fft sinal sub 2
tam = length(Ysub2); %tamanho do sinal sub 2
f_sub2 = FS_sub2*(0:(tam/2))/tam; % vetor frequencia sinal sub 2

P2 = abs(Fourier/tam);
Espectro_sub2 = P2(1:tam/2+1);
Espectro_sub2(2:end-1) = 2*Espectro_sub2(2:end-1); %espectro de freq sub 2

comprimento = (length(Ysub2)-1)/FS_sub2;
t_sub2 = 0: 1/FS_sub2: comprimento;


%% Subamostragem de 4
N = 4;
FS_sub4 = FS/N;
Ysub4 = downsample(Y,N);

Fourier = fft(Ysub4); %% fft sinal sub 4
tam = length(Ysub4); %tamanho do sinal sub 4
f_sub4 = FS_sub4*(0:(tam/2))/tam; % vetor frequencia sinal sub 4

P2 = abs(Fourier/tam);
Espectro_sub4 = P2(1:tam/2+1);
Espectro_sub4(2:end-1) = 2*Espectro_sub4(2:end-1); %espectro de freq sub 4

comprimento = (length(Ysub4)-1)/FS_sub4;
t_sub4 = 0: 1/FS_sub4: comprimento;


%% Subamostragem de 8
N = 8;
FS_sub8 = FS/N;
Ysub8 = downsample(Y,N);

Fourier = fft(Ysub8); %% fft sinal sub 8
tam = length(Ysub8); %tamanho do sinal sub 8
f_sub8 = FS_sub8*(0:(tam/2))/tam; % vetor frequencia sinal sub 8

P2 = abs(Fourier/tam);
Espectro_sub8 = P2(1:tam/2+1);
Espectro_sub8(2:end-1) = 2*Espectro_sub8(2:end-1); %espectro de freq sub 8

comprimento = (length(Ysub8)-1)/FS_sub8;
t_sub8 = 0: 1/FS_sub8: comprimento;


%% Subamostragem de 16
N = 16;
FS_sub16 = FS/N;
Ysub16 = downsample(Y,N);

Fourier = fft(Ysub16); %% fft sinal sub 16
tam = length(Ysub16); %tamanho sub 16
f_sub16 = FS_sub16*(0:(tam/2))/tam; % vetor frequencia sub 16

P2 = abs(Fourier/tam);
Espectro_sub16 = P2(1:floor(tam/2+1));
Espectro_sub16(2:end-1) = 2*Espectro_sub16(2:end-1); %espectro sub 16

comprimento = (length(Ysub16)-1)/FS_sub16;
t_sub16 = 0: 1/FS_sub16: comprimento;

%% plot subamostragem 2

figure
subplot(2,1,1) 
plot(t_original,Y, 'k');
hold on

plot(t_sub2, Ysub2, 'r')
title('Audio subamostrado em 2')
xlabel( 't (milissegundos)' )
ylabel( 'X(t)' )
legend({'audio original', 'audio subamostrado em 2'})
hold off
subplot(2,1,2);
plot(f_original,Espectro_original, 'k');
axis([0 8500 0 0.006]);
hold on;
plot(f_sub2,Espectro_sub2, 'r');
title( 'Espectro de amplitude subamostragem de 2' );
xlabel( 'f (Hz)' );
ylabel( 'Amplitude' );
legend({'audio original', 'audio subamostrado em 2'});
axis([0 8500 0 0.006]);
hold off;

%% plot subamostragem 4

figure
subplot(2,1,1) 
plot(t_original,Y, 'k');
hold on

plot(t_sub4, Ysub4, 'r')
title('Audio subamostrado em 4')
xlabel( 't (milissegundos)' )
ylabel( 'X(t)' )
legend({'audio original', 'audio subamostrado em 4'})
hold off
subplot(2,1,2);
plot(f_original,Espectro_original, 'k');
axis([0 8500 0 0.006]);
hold on;
plot(f_sub4,Espectro_sub4, 'r');
title( 'Espectro de amplitude subamostragem 4' );
xlabel( 'f (Hz)' );
ylabel( 'Amplitude' );
legend({'audio original', 'audio subamostrado em 4'});
axis([0 8500 0 0.006]);
hold off;

%% plot subamostragem 8

figure
subplot(2,1,1) 
plot(t_original,Y, 'k');
hold on

plot(t_sub8, Ysub8, 'r')
title('Audio subamostrado em 8')
xlabel( 't (milissegundos)' )
ylabel( 'X(t)' )
legend({'audio original', 'audio subamostrado em 8'})
hold off
subplot(2,1,2);
plot(f_original,Espectro_original, 'k');
axis([0 8500 0 0.006]);
hold on;
plot(f_sub8,Espectro_sub8, 'r');
title( 'Espectro de amplitude subamostragem 8' );
xlabel( 'f (Hz)' );
ylabel( 'Amplitude' );
legend({'audio original', 'audio subamostrado em 8'});
axis([0 8500 0 0.006]);
hold off;

%% plot subamostragem 16

figure
subplot(2,1,1) 
plot(t_original,Y, 'k');
hold on

plot(t_sub16, Ysub16, 'r')
title('Audio subamostrado em 16')
xlabel( 't (milissegundos)' )
ylabel( 'X(t)' )
legend({'audio original', 'audio subamostrado em 16'})
hold off
subplot(2,1,2);
plot(f_original,Espectro_original, 'k');
axis([0 8500 0 0.006]);
hold on;
plot(f_sub16,Espectro_sub16, 'r');
title( 'Espectro de amplitude subamostragem 16' );
xlabel( 'f (Hz)' );
ylabel( 'Amplitude' );
legend({'audio original', 'audio subamostrado em 16'});
axis([0 8500 0 0.006]);
hold off;
