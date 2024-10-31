%%
clc
clear
close all
%%

%Xc(t)=sen(2pit)
%senoideC = sin(2*pi*t);

%w = 2*pi;
%FS = 1/TS;
%W  = w/FS;
% alternativa utilizada trocar t -> n
% t = n*TS
passo=0.001; % intervalo de tempo ate chegar no total
tempo_total=3; % tempo total da senoide
%% Ts = 0.100 s
w = 2*pi; %frequencia angular da senoide inicial
TS= 0.1;  %periodo de amostragem
FS = 1/TS; %frequencia de amostragem
wAliasing=22*pi; %frequencia angular da senoide Aliasing

t=0:passo:tempo_total; %periodo continuo
n=0:TS:tempo_total; %periodo discreto

%formulas das senoides
senoideC = sin(w*t);
senoideD = sin(w*n);
senoideA = sin(wAliasing*t);

%frequencias
yC = fft(senoideC);
yD = fft(senoideD);
yA = fft(senoideA);

%reorganiza uma transformada de Fourier X deslocando o componente de frequência zero para o centro da matriz.
zC = fftshift(yC);
zD = fftshift(yD);
zA = fftshift(yA);

%tamanho da fft 
lyC = length(yC);
lyD = length(yD);
lyA = length(yA);

%powershift da faixa de frequência centrada em zero 
fC = (-lyC/2:lyC/2-1)/lyC*FS;
fD = (-lyD/2:lyD/2-1)/lyD*FS;
fA = (-lyA/2:lyA/2-1)/lyA*FS;


figure
% frequencia continuo
subplot(3,1,1)
stem(fC,abs(zC),'r')
title('Frequencia continua TS= 0.1')
legend({'Continuo'})
ylabel('amplitude')
xlabel('Tempo/amostras')
xlim([-0.15 0.15])
yticks([0:250:1500])
grid on
% frequencia aliasing
subplot(3,1,2)
stem(fA,abs(zA),'g')
title('Frequencia continua Aliasing TS= 0.1')
legend({'Continuo Aliasing'})
ylabel('amplitude')
xlabel('Tempo/amostras')
xlim([-0.15 0.15])
yticks([0:250:1500])
grid on
% frequencia discreto
subplot(3,1,3)
stem(fD,abs(zD),'b')
title('Frequencia Discreta TS= 0.1')
legend({'Discreto'})
xlim([-2*pi 2*pi])
ylabel('amplitude')
xlabel('Tempo/amostras')
yticks([0:3:15])
grid on



%plot padrao
figure
plot(t,senoideC,'k')
hold on
stem(n,senoideD,'filled')
hold on
plot(t,senoideA)
title('TS= 0.1')
legend({'Continuo','Discreto','Aliasing'})
ylabel('amplitude')
xlabel('Tempo/amostras')
grid on
yticks([-1:0.1:1])
ylim([-1.1 1.1])



%% Ts = 0.250 s
w = 2*pi; %frequencia angular da senoide inicial
TS= 0.25;  %periodo de amostragem
FS = 1/TS; %frequencia de amostragem
wAliasing=10*pi; %frequencia angular da senoide Aliasing

t=0:passo:tempo_total; %periodo continuo
n=0:TS:tempo_total; %periodo discreto

%formulas das senoides
senoideC = sin(w*t);
senoideD = sin(w*n);
senoideA = sin(wAliasing*t);

%frequencia 
yC = fft(senoideC);
yD = fft(senoideD);
yA = fft(senoideA);

%reorganiza uma transformada de Fourier X deslocando o componente de frequência zero para o centro da matriz.
zC = fftshift(yC);
zD = fftshift(yD);
zA = fftshift(yA);

%tamanho da fft 
lyC = length(yC);
lyD = length(yD);
lyA = length(yA);

%powershift da faixa de frequência centrada em zero 
fC = (-lyC/2:lyC/2-1)/lyC*FS;
fD = (-lyD/2:lyD/2-1)/lyD*FS;
fA = (-lyA/2:lyA/2-1)/lyA*FS;


figure
% frequencia continuo
subplot(3,1,1)
stem(fC,abs(zC),'r')
title('Frequencia continua TS= 0.250')
legend({'Continuo'})
ylabel('amplitude')
xlabel('Tempo/amostras')
xlim([-0.006 0.006])
yticks([0:250:1500])
grid on
% frequencia aliasing
subplot(3,1,2)
stem(fA,abs(zA),'g')
title('Frequencia continua Aliasing TS= 0.250')
legend({'Continuo Aliasing'})
ylabel('amplitude')
xlabel('Tempo/amostras')
xlim([-0.006 0.006])
yticks([0:250:1500])
grid on
% frequencia discreto
subplot(3,1,3)
stem(fD,abs(zD),'b')
title('Frequencia Discreta TS= 0.250')
legend({'Discreto'})
xlim([-2*pi 2*pi])
ylabel('amplitude')
xlabel('Tempo/amostras')
yticks([0:1:6])
grid on

%plot padrao
figure
plot(t,senoideC,'k')
hold on
stem(n,senoideD,'filled')
hold on
plot(t,senoideA)
title('TS= 0.250')
legend({'Continuo','Discreto','Aliasing'})
ylabel('amplitude')
xlabel('Tempo/amostras')
grid on
yticks([-1:0.1:1])
ylim([-1.1 1.1])

%% Ts = 0.500 s
w = 2*pi; %frequencia angular da senoide inicial
TS= 0.5;  %periodo de amostragem
FS = 1/TS; %frequencia de amostragem
wAliasing=6*pi; %frequencia angular da senoide Aliasing

t=0:passo:tempo_total; %periodo continuo
n=0:TS:tempo_total; %periodo discreto

%formulas das senoides
senoideC = sin(w*t);
senoideD = sin(w*n);
senoideA = sin(wAliasing*t);

%frequencia 
yC = fft(senoideC);
yD = fft(senoideD);
yA = fft(senoideA);

%reorganiza uma transformada de Fourier X deslocando o componente de frequência zero para o centro da matriz.
zC = fftshift(yC);
zD = fftshift(yD);
zA = fftshift(yA);

%tamanho da fft 
lyC = length(yC);
lyD = length(yD);
lyA = length(yA);

%powershift da faixa de frequência centrada em zero 
fC = (-lyC/2:lyC/2-1)/lyC*FS;
fD = (-lyD/2:lyD/2-1)/lyD*FS;
fA = (-lyA/2:lyA/2-1)/lyA*FS;


figure
% frequencia continuo
subplot(3,1,1)
stem(fC,abs(zC),'r')
title('Frequencia continua TS= 0.5')
legend({'Continuo'})
ylabel('amplitude')
xlabel('Tempo/amostras')
xlim([-0.008 0.008])
yticks([0:250:1500])
grid on
% frequencia aliasing
subplot(3,1,2)
stem(fA,abs(zA),'g')
title('Frequencia continua Aliasing TS= 0.5')
legend({'Continuo Aliasing'})
ylabel('amplitude')
xlabel('Tempo/amostras')
xlim([-0.008 0.008])
yticks([0:250:1500])
grid on
% frequencia discreto
subplot(3,1,3)
stem(fD,abs(zD),'b')
title('Frequencia Discreta TS= 0.5')
legend({'Discreto'})
xlim([-2*pi 2*pi])
ylabel('amplitude')
xlabel('Tempo/amostras')
%yticks([0:1:6])
grid on

%plot padrao
figure
plot(t,senoideC,'k')
hold on
stem(n,senoideD,'filled')
hold on
plot(t,senoideA)
title('TS= 0.5')
legend({'Continuo','Discreto','Aliasing'})
ylabel('amplitude')
xlabel('Tempo/amostras')
grid on
yticks([-1:0.1:1])
ylim([-1.1 1.1])

%% Ts = 0.750 s
w = 2*pi; %frequencia angular da senoide inicial
TS= 0.75;  %periodo de amostragem
FS = 1/TS; %frequencia de amostragem
wAliasing=(14*pi)/3; %frequencia angular da senoide Aliasing

t=0:passo:tempo_total; %periodo continuo
n=0:TS:tempo_total; %periodo discreto

%formulas das senoides
senoideC = sin(w*t);
senoideD = sin(w*n);
senoideA = sin(wAliasing*t);

%frequencia 
yC = fft(senoideC);
yD = fft(senoideD);
yA = fft(senoideA);

%reorganiza uma transformada de Fourier X deslocando o componente de frequência zero para o centro da matriz.
zC = fftshift(yC);
zD = fftshift(yD);
zA = fftshift(yA);

%tamanho da fft 
lyC = length(yC);
lyD = length(yD);
lyA = length(yA);

%powershift da faixa de frequência centrada em zero 
fC = (-lyC/2:lyC/2-1)/lyC*FS;
fD = (-lyD/2:lyD/2-1)/lyD*FS;
fA = (-lyA/2:lyA/2-1)/lyA*FS;


figure
% frequencia continuo
subplot(3,1,1)
stem(fC,abs(zC),'r')
title('Frequencia continua TS= 0.750')
legend({'Continuo'})
ylabel('amplitude')
xlabel('Tempo/amostras')
xlim([-0.004 0.004])
yticks([0:250:1500])
grid on
% frequencia aliasing
subplot(3,1,2)
stem(fA,abs(zA),'g')
title('Frequencia continua Aliasing TS= 0.750')
legend({'Continuo Aliasing'})
ylabel('amplitude')
xlabel('Tempo/amostras')
xlim([-0.004 0.004])
yticks([0:250:1500])
grid on
% frequencia discreto
subplot(3,1,3)
stem(fD,abs(zD),'b')
title('Frequencia Discreta TS= 0.750')
legend({'Discreto'})
xlim([-2*pi 2*pi])
ylabel('amplitude')
xlabel('Tempo/amostras')
yticks([0:0.5:3])
grid on

%plot padrao
figure
plot(t,senoideC,'k')
hold on
stem(n,senoideD,'filled')
hold on
plot(t,senoideA)
title('TS= 0.750')
legend({'Continuo','Discreto','Aliasing'})
ylabel('amplitude')
xlabel('Tempo/amostras')
grid on
yticks([-1:0.1:1])
ylim([-1.1 1.1])

%% Ts = 1 s
w = 2*pi; %frequencia angular da senoide inicial
TS= 1;  %periodo de amostragem
FS = 1/TS; %frequencia de amostragem
wAliasing=4*pi; %frequencia angular da senoide Aliasing

t=0:passo:tempo_total; %periodo continuo
n=0:TS:tempo_total; %periodo discreto

%formulas das senoides
senoideC = sin(w*t);
senoideD = sin(w*n);
senoideA = sin(wAliasing*t);

%frequencia 
yC = fft(senoideC);
yD = fft(senoideD);
yA = fft(senoideA);

%reorganiza uma transformada de Fourier X deslocando o componente de frequência zero para o centro da matriz.
zC = fftshift(yC);
zD = fftshift(yD);
zA = fftshift(yA);

%tamanho da fft 
lyC = length(yC);
lyD = length(yD);
lyA = length(yA);

%powershift da faixa de frequência centrada em zero 
fC = (-lyC/2:lyC/2-1)/lyC*FS;
fD = (-lyD/2:lyD/2-1)/lyD*FS;
fA = (-lyA/2:lyA/2-1)/lyA*FS;


figure
% frequencia continuo
subplot(3,1,1)
stem(fC,abs(zC),'r')
title('Frequencia continua TS= 1')
legend({'Continuo'})
ylabel('amplitude')
xlabel('Tempo/amostras')
xlim([-0.004 0.004])
yticks([0:250:1500])
grid on
% frequencia aliasing
subplot(3,1,2)
stem(fA,abs(zA),'g')
title('Frequencia continua Aliasing TS= 1')
legend({'Continuo Aliasing'})
ylabel('amplitude')
xlabel('Tempo/amostras')
xlim([-0.004 0.004])
yticks([0:250:1500])
grid on
% frequencia discreto
subplot(3,1,3)
stem(fD,abs(zD),'b')
title('Frequencia Discreta TS= 1')
legend({'Discreto'})
xlim([-2*pi 2*pi])
ylabel('amplitude')
xlabel('Tempo/amostras')
%yticks([0:1:6])
grid on

%plot padrao
figure
plot(t,senoideC,'k')
hold on
stem(n,senoideD,'filled')
hold on
plot(t,senoideA)
title('TS= 1')
legend({'Continuo','Discreto','Aliasing'})
ylabel('amplitude')
xlabel('Tempo/amostras')
grid on
yticks([-1:0.1:1])
ylim([-1.1 1.1])

%% Ts = 1.5 s
w = 2*pi; %frequencia angular da senoide inicial
TS= 1.5;  %periodo de amostragem
FS = 1/TS; %frequencia de amostragem
wAliasing=(10*pi)/3; %frequencia angular da senoide Aliasing

t=0:passo:tempo_total; %periodo continuo
n=0:TS:tempo_total; %periodo discreto

%formulas das senoides
senoideC = sin(w*t);
senoideD = sin(w*n);
senoideA = sin(wAliasing*t);

%frequencia 
yC = fft(senoideC);
yD = fft(senoideD);
yA = fft(senoideA);

%reorganiza uma transformada de Fourier X deslocando o componente de frequência zero para o centro da matriz.
zC = fftshift(yC);
zD = fftshift(yD);
zA = fftshift(yA);

%tamanho da fft 
lyC = length(yC);
lyD = length(yD);
lyA = length(yA);

%powershift da faixa de frequência centrada em zero 
fC = (-lyC/2:lyC/2-1)/lyC*FS;
fD = (-lyD/2:lyD/2-1)/lyD*FS;
fA = (-lyA/2:lyA/2-1)/lyA*FS;


figure
% frequencia continuo
subplot(3,1,1)
stem(fC,abs(zC),'r')
title('Frequencia continua TS= 1.5')
legend({'Continuo'})
ylabel('amplitude')
xlabel('Tempo/amostras')
xlim([-0.002 0.002])
yticks([0:250:1500])
grid on
% frequencia aliasing
subplot(3,1,2)
stem(fA,abs(zA),'g')
title('Frequencia continua Aliasing TS= 1.5')
legend({'Continuo Aliasing'})
ylabel('amplitude')
xlabel('Tempo/amostras')
xlim([-0.002 0.002])
yticks([0:250:1500])
grid on
% frequencia discreto
subplot(3,1,3)
stem(fD,abs(zD),'b')
title('Frequencia Discreta TS= 1.5')
legend({'Discreto'})
xlim([-2*pi 2*pi])
ylabel('amplitude')
xlabel('Tempo/amostras')
%yticks([0:1:6])
grid on

%plot padrao
figure
plot(t,senoideC,'k')
hold on
stem(n,senoideD,'filled')
hold on
plot(t,senoideA)
title('TS= 1.5')
legend({'Continuo','Discreto','Aliasing'})
ylabel('amplitude')
xlabel('Tempo/amostras')
grid on
yticks([-1:0.1:1])
ylim([-1.1 1.1])
%% Gravar audio
Tempo = 5; %5 segundos de gravação
FS = 8000; %Frequência de amostragem em 8 kHz
Nbits = 16; %sinal de 16 bits
Canais = 1; %1 = mono, 2 = stereo
r = audiorecorder(FS, Nbits, Canais); %preparar para gravar
record(r);
pause(Tempo);
stop(r);
Y = getaudiodata(r, 'double'); %guardar em uma variável double
%% Questao 2

p = audioplayer(Y,FS);
%play(p)

%comprimento e tempo do sinal
tamanho = length(Y); %comprimento do sinal
t = 0:1/FS:(tamanho-1)/FS; % tempo do sinal


%% Subamostre o sinal N = 2
N=2; %numero de vezes para a subamostragem 2 4 8 16
Metade = Y(1:2:end); %tira metade das amostras

FSE = FS/tamanho;
YE=downsample(Metade,N);

NE = length(YE);
tE = 0:1/FSE:(NE-1)/FSE;

Fourier = fft(YE);
P2 = abs(Fourier/NE);
Espectro = P2(round(1:NE/2+1));
Espectro(2:end-1) = 2*Espectro(2:end-1);
f = FS*(0:(NE/2))/NE;

figure
plot(tE,YE,'k')
hold on
plot(f,Espectro,'b')
title('Áudio com sub-amostragem N=2')
legend({'Áudio subamostrado','Áudio subamostrado FFT'})
ylabel('Amplitude do Sinal')
xlabel('Tempo (segundos)')
%ylim([-0.15 0.15])
%xlim([-0.1 1.2])
grid on

%% Subamostre o sinal N = 4
N=4; %numero de vezes para a subamostragem 2 4 8 16
Metade = Y(1:2:end); %tira metade das amostras

FSE = FS/tamanho;
YE=downsample(Metade,N);

NE = length(YE);
tE = 0:1/FSE:(NE-1)/FSE;

Fourier = fft(YE);
P2 = abs(Fourier/NE);
Espectro = P2(round(1:NE/2+1));
Espectro(2:end-1) = 2*Espectro(2:end-1);
f = FS*(0:(NE/2))/NE;

figure
plot(tE,YE,'k')
hold on
plot(f,Espectro,'b')
title('Áudio com sub-amostragem N=4')
legend({'Áudio subamostrado','Áudio subamostrado FFT'})
ylabel('Amplitude do Sinal')
xlabel('Tempo (segundos)')
%ylim([-0.15 0.15])
%xlim([-0.1 1.2])
grid on
%% Subamostre o sinal N = 8
N=8; %numero de vezes para a subamostragem 2 4 8 16
Metade = Y(1:2:end); %tira metade das amostras

FSE = FS/tamanho;
YE=downsample(Metade,N);

NE = length(YE);
tE = 0:1/FSE:(NE-1)/FSE;

Fourier = fft(YE);
P2 = abs(Fourier/NE);
Espectro = P2(round(1:NE/2+1));
Espectro(2:end-1) = 2*Espectro(2:end-1);
f = FS*(0:(NE/2))/NE;

figure
plot(tE,YE,'k')
hold on
plot(f,Espectro,'b')
title('Áudio com sub-amostragem N=8')
legend({'Áudio subamostrado','Áudio subamostrado FFT'})
ylabel('Amplitude do Sinal')
xlabel('Tempo (segundos)')
%ylim([-0.15 0.15])
%xlim([-0.1 1.2])
grid on
%% Subamostre o sinal N = 16
N=16; %numero de vezes para a subamostragem 2 4 8 16
Metade = Y(1:2:end); %tira metade das amostras

FSE = FS/tamanho;
YE=downsample(Metade,N);

NE = length(YE);
tE = 0:1/FSE:(NE-1)/FSE;

Fourier = fft(YE);
P2 = abs(Fourier/NE);
Espectro = P2(round(1:NE/2+1));
Espectro(2:end-1) = 2*Espectro(2:end-1);
f = FS*(0:(NE/2))/NE;

figure
plot(tE,YE,'k')
hold on
plot(f,Espectro,'b')
title('Áudio com sub-amostragem N=16')
legend({'Áudio subamostrado','Áudio subamostrado FFT'})
ylabel('Amplitude do Sinal')
xlabel('Tempo (segundos)')
%ylim([-0.15 0.15])
%xlim([-0.1 1.2])
grid on



