close all
clc
clear
%% Gravar áudio original

Tempo = 5; %5 segundos de gravação
FS = 8000; %Frequência de amostragem em 8 kHz
Nbits = 16; %sinal de 16 bits
Canais = 1; %1 = mono, 2 = stereo
r = audiorecorder(FS, Nbits, Canais); %preparar para gravar
record(r);
pause(Tempo);
stop(r);
Y = getaudiodata(r, 'double'); %guardar em uma variável double


%% Gravar audio secundario para questao C
TempoC = 5; %5 segundos de gravação
FSC = 12000; %Frequência de amostragem em 8 kHz
NbitsC = 16; %sinal de 16 bits
CanaisC = 1; %1 = mono, 2 = stereo
rC = audiorecorder(FSC, NbitsC, CanaisC); %preparar para gravar
record(rC);
pause(TempoC);
stop(rC);
YC = getaudiodata(rC, 'double'); %guardar em uma variável double

%% %Para reproduzir o áudio principal

p = audioplayer(Y,FS);
play(p)
%% Para reproduzir o áudio secundario
pC = audioplayer(YC,FSC);
play(pC)
%%
%comprimento e tempo do sinal
N = length(Y); %comprimento do sinal
t = 0:1/FS:(N-1)/FS; % tempo do sinal

       %aspectro de frequencia FFT
P2 = abs(Y/N); 
P1 = P2(1:N/2+1); 
P1(2:end-1)=2*P1(2:end-1);

f = FS*(0:(N/2))/N; 


% audio secundario
NC = length(YC); %comprimento do sinal
tC = 0:1/FSC:(NC-1)/FSC; % tempo do sinal

       %aspectro de frequencia FFT
P2C = abs(YC/NC); 
P1C = P2C(1:NC/2+1); 
P1C(2:end-1)=2*P1C(2:end-1);

fC = FSC*(0:(NC/2))/NC; 

%---------------------------------------------------------------
%---------------------------------------------------------------
%---------------------------------------------------------------
%A)Ruido Branco
X=awgn(Y,40);
FT = fft(X);

NA = length(X); %comprimento do sinal
tA = 0:1/FS:(NA-1)/FS; % tempo do sinal

        %aspectro de frequencia FFT
PA2 = abs(X/NA); 
PA1 = PA2(1:NA/2+1); 
PA1(2:end-1)=2*PA1(2:end-1);

fA = FS*(0:(NA/2))/N; 
%---------------------------------------------------------------
%---------------------------------------------------------------
%---------------------------------------------------------------

%B)clipping

th= 0.05; %amplitude escolhida para cortar
Cli=Y(:,1); %pegar 1 coluna so
Cli=Y;
Cli(Y > th)=th; % se for do tamanho da aplitude requerida ele armazena
Cli(Y < -th)=-th;

NB = length(Cli); %comprimento do sinal
tB = 0:1/FS:(NB-1)/FS; % tempo do sinal

        %aspectro de frequencia FFT
PB2 = abs(Cli/NB); 
PB1 = PB2(1:NB/2+1); 
PB1(2:end-1)=2*PB1(2:end-1);

fB = FS*(0:(NB/2))/N; 


%---------------------------------------------------------------
%---------------------------------------------------------------
%---------------------------------------------------------------

%C)ruido agudo somado com o sinal


NC = length(YC); %comprimento do sinal

Soma=conv(Y,YC);
tC = 0:(length(Soma)-1);


        %aspectro de frequencia FFT
PC2 = abs(Soma/NC); 
PC1 = PC2(1:NC/2+1); 
PC1(2:end-1)=2*PC1(2:end-1);

fC = FSC*(0:(NC/2))/N; 



%---------------------------------------------------------------
%---------------------------------------------------------------
%---------------------------------------------------------------

%D)multiple o sinal de audio por um sinal senoidal

%seno
FSD=50;
tD=0:1/FSD:1-1/FSD;
wD=2;
SenoD=0.5*sin(2*pi*wD*t+0.2);
SenoTD=SenoD';

SaidaD=Y.*SenoTD;

ND = length(SaidaD);

  %aspectro de frequencia FFT
PD2 = abs(SaidaD/ND); 
PD1 = PD2(1:ND/2+1); 
PD1(2:end-1)=2*PD1(2:end-1);

fD = FSD*(0:(ND/2))/N; 



%---------------------------------------------------------------
%---------------------------------------------------------------
%---------------------------------------------------------------

%E)Subamostre o sinal

YE = Y(1:2:end); %tirar metade das amostras
NMetade=2;
FSE = FS/NMetade;
YE=downsample(Y,NMetade);

% Crop do sinal (segmentar)
t1E = 1;
t2E = 2.2;
N1E = round(t1E*FSE);
N2E = round(t2E*FSE);

YAE = YE(N1E:N2E);

% Crop do sinal (segmentar)
t3E = 2;
t4E = 3.2;
N3E = round(t3E*FSE);
N4E = round(t4E*FSE);
YBE = YE(N3E:N4E);

%Unir os dois segmentos para criar um efeito de "reverb"
Y2E = 0.5*(YAE+YBE);

NE = length(Y2E);
tE = 0:1/FSE:(NE-1)/FSE;


        %aspectro de frequencia FFT
PE2 = abs(Y2E/NE); 
PE1 = PE2(1:NE/2+1); 
PE1(2:end-1)=2*PE1(2:end-1);

fE = FSE*(0:(NE/2))/N; 


%---------------------------------------------------------------
%---------------------------------------------------------------
%---------------------------------------------------------------

%F)aplique uma media por meio de uma convolução


vetorF=1/N*ones(N,1);

YF=conv(Y,vetorF,'same');



  %aspectro de frequencia FFT
PF2 = abs(YF/N); 
PF1 = PF2(1:N/2+1); 
PF1(2:end-1)=2*PF1(2:end-1);

fF = FS*(0:(N/2))/N; 



%---------------------------------
%---------------------------------
%plots

%-------Plot sinal original
figure
subplot(2,1,1);
plot(t,Y,'k');
ylabel('Amplitude do Sinal');
xlabel('Tempo (segundos)');
title('Áudio Original');
grid on

subplot(2,1,2);
plot(f,P1,'y');
ylabel('Amplitude do Sinal');
xlabel('Tempo (segundos)');
title('Áudio Original FFT');
grid on


%---------A)Ruido branco plot
figure
subplot(2,1,1);
plot(tA,X,'k');
ylabel('Amplitude do Sinal');
xlabel('Tempo (segundos)');
title('Áudio com Ruido');
grid on

subplot(2,1,2);
plot(fA,PA1,'y');
ylabel('Amplitude do Sinal');
xlabel('Tempo (segundos)');
title('Áudio com Ruido FFT');
grid on


%-----------B)cliping plot

figure
subplot(2,1,1);
plot(tB,Cli,'k');
ylabel('Amplitude do Sinal');
xlabel('Tempo (segundos)');
title('Áudio Clipado');
grid on

subplot(2,1,2);
plot(fB,PB1,'y');
ylabel('Amplitude do Sinal');
xlabel('Tempo (segundos)');
title('Áudio clipado FFT');
grid on

%-----------C)ruido agudo somado com o sinal

figure
subplot(2,1,1);
plot(tC,Soma,'k');
ylabel('Amplitude do Sinal');
xlabel('Tempo (segundos)');
title('Áudio original somado com ruido agudo');
grid on

subplot(2,1,2);
plot(fC,PC1,'y');
ylabel('Amplitude do Sinal');
xlabel('Tempo (segundos)');
title('Áudio original somado com ruido agudo FFT');
grid on

%---------D)multiple o sinal de audio por um sinal senoidal

figure
subplot(2,1,1);
plot(t,SaidaD,'k');
ylabel('Amplitude do Sinal');
xlabel('Tempo (segundos)');
title('Áudio original multiplicado por um sinal senoidal');
grid on

subplot(2,1,2);
plot(fD,PD1,'y');
ylabel('Amplitude do Sinal');
xlabel('Tempo (segundos)');
title('Áudio original multiplicado por um sinal senoidal FFT');
grid on


%--------E)Subamostre o sinal
figure
subplot(2,1,1);
plot(tE,Y2E,'k');
ylabel('Amplitude do Sinal');
xlabel('Tempo (segundos)');
title('Áudio subamostrado');
grid on

subplot(2,1,2);
plot(fE,PE1,'y');
ylabel('Amplitude do Sinal');
xlabel('Tempo (segundos)');
title('Áudio subamostrado FFT');
grid on



%------------F)aplique uma media por meio de uma convolução

figure
subplot(2,1,1);
plot(t,YF,'k');
ylabel('Amplitude do Sinal');
xlabel('Tempo (segundos)');
title('Áudio com media via convolução');
grid on

subplot(2,1,2);
plot(fF,PF1,'y');
ylabel('Amplitude do Sinal');
xlabel('Tempo (segundos)');
title('Áudio com media via convolução FFT');
grid on