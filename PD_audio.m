%% Processamento Digital de Sinais
clear
clc
close all

%% Manipulação inicial do áudio
Tempo = 10;  
FS = 100000;   % frequencia de amostragem do sinal

[Y, FS] = audioread("carro-do-ovo.mp3"); % vetor audio numérico


periodo = 1/FS;
comprimento = (length(Y)-1)/FS;
t = 0: periodo: comprimento;


%% Plot audio
subplot(2,1,1) 
plot(t,Y, 'r')
title('Sinal de Áudio');
xlabel( 't (milissegundos)' );
ylabel( 'X(t)' );

Fourier = fft(Y);
tamanho = length(Y);

P2 = abs(Fourier/tamanho);
Espectro_original = P2(1:tamanho/2+1);
Espectro_original(2:end-1) = 2*Espectro_original(2:end-1);

subplot(2,1,2)
f = FS*(0:(tamanho/2))/tamanho;
plot(f,Espectro_original, 'r'),
title( 'Espectro de amplitude unilateral de X(t)' )
xlabel( 'f (Hz)' )
ylabel( 'Amplitude' )

%% Plot Aaudio + ruido gaussiano branco
figure
subplot(2,1,1) 
w_noise = awgn(Y,20, -5); % ruído branco com relação sinal-ruído de 20 e potência do sinal de -5 dbW 
audio_gw = (Y + w_noise);
plot(t, audio_gw, 'r','DisplayName','Audio Original');
hold on

plot(t,Y, 'k', 'DisplayName','Audio com Ruido');
title('Sinal de Áudio com Ruído Gaussiano Branco');
xlabel( 't (milissegundos)' );
ylabel( 'X(t)' );
hold off

Fourier = fft((Y + w_noise));

P2 = abs(Fourier/tamanho);
Espectro_gaussiano = P2(1:tamanho/2+1);
Espectro_gaussiano(2:end-1) = 2*Espectro_gaussiano(2:end-1);

subplot(2,1,2)
plot(f,Espectro_gaussiano, 'r'),
title( 'Espectro de amplitude unilateral de X(t)' )
xlabel( 'f (Hz)' )
ylabel( 'Amplitude' )


%% Clipagem do Audio
clip = 0.07;
audioclip = Y;
audioclip(Y>clip) = clip;
audioclip(Y<-clip) = -clip;

figure
subplot(2,1,1) 

plot(t,Y, 'k')
hold on

plot(t, audioclip, 'r')
title('Audio Clipado')
xlabel( 't (milissegundos)' )
ylabel( 'X(t)' )
hold off

subplot(2,1,2) 

Fourier = fft(audioclip);
P2 = abs(Fourier/tamanho);
Espectro_clipado = P2(1:tamanho/2+1);
Espectro_clipado(2:end-1) = 2*Espectro_clipado(2:end-1);

plot(f,Espectro_clipado, 'r')
title( 'Espectro de amplitude unilateral de X(t) clipado' )
xlabel( 'f (Hz)' )
ylabel( 'Amplitude' )


%% Sinal multiplicado por um senoide

senoide = sin(linspace(1,50,tamanho)*2*pi);
senoide_audio = 5*senoide.*Y';
figure
subplot(2,1,1)

grafico_audio = plot(t, senoide_audio, 'r','DisplayName','Audio com senoide');

hold on

gafico_audio_gaussiano = plot(t,Y, 'k', 'DisplayName','Audio original');
title('Sinal de Áudio com senoide');
xlabel( 't (milissegundos)' );
ylabel( 'X(t)' );
legend
hold off

Fourier = fft(senoide_audio);
tamanho = length(senoide_audio);

P2 = abs(Fourier/tamanho);
Espectro_senoide = P2(1:tamanho/2+1);
Espectro_senoide(2:end-1) = 2*Espectro_senoide(2:end-1);

subplot(2,1,2)
plot(f,Espectro_senoide, 'r'), 
title( 'Espectro de amplitude unilateral de X(t)' )
xlabel( 'f (Hz)' )
ylabel( 'Amplitude' )

%%  Somar o Audio original com um assobio

[X, FS] = audioread("agudo.mp3"); % vetor audio numérico
Z = Y + X;

figure
subplot(3,2,1) 
plot(t,Y, 'r')

title('Sinal de Áudio Original');
xlabel( 't (milissegundos)' );
ylabel( 'X(t)' );

subplot(3,2,3) 
plot(t,X, 'r')
title('Sinal de Áudio Agudo');
xlabel( 't (milissegundos)' );
ylabel( 'X(t)' );

subplot(3,2,5)
plot(t, Z, 'r')
hold on

plot(t,Y, 'k')
title('Sinal de Áudio somado ao Agudo');
xlabel( 't (milissegundos)' );
ylabel( 'X(t)' );
hold off

subplot(3,2,2)
plot(f,Espectro_original, 'r'), 
title( 'Espectro de amplitude unilateral de X(t)' )
xlabel( 'f (Hz)' )
ylabel( 'Amplitude' )

Fourier = fft(X);

P2 = abs(Fourier/tamanho);
Espectro_agudo = P2(1:tamanho/2+1);
Espectro_agudo(2:end-1) = 2*Espectro_agudo(2:end-1);

subplot(3,2,4)
plot(f,Espectro_agudo, 'r'), 
title( 'Espectro de amplitude unilateral de X(t)' )
xlabel( 'f (Hz)' )
ylabel( 'Amplitude' )

Fourier = fft(Z);

P2 = abs(Fourier/tamanho);
Espectro_orinal_agudo = P2(1:tamanho/2+1);
Espectro_orinal_agudo(2:end-1) = 2*Espectro_orinal_agudo(2:end-1);

subplot(3,2,6)
plot(f,Espectro_orinal_agudo, 'r'),
hold on 

plot(f,Espectro_original, 'k'),
title( 'Espectro de amplitude unilateral de X(t)' )
xlabel( 'f (Hz)' )
ylabel( 'Amplitude' )

%% Subamostragem do áudio

fator = 2;
Ysub = Y(1:fator:end);
N = fator;
FS_sub = FS/N;

Fourier = fft(Ysub);
tamanhosub = length(Ysub);

P2 = abs(Fourier/tamanhosub);
Espectro_subamostrado = P2(1:tamanhosub/2+1);
Espectro_subamostrado(2:end-1) = 2*Espectro_subamostrado(2:end-1);

figure
fsub = FS*(0:(tamanhosub/2))/tamanhosub;

periodosub = 1/FS;
comprimentosub = (length(Ysub)-1)/FS;
tsub = 0: periodosub: comprimentosub;

subplot(2,1,1)
plot(t,Y, 'k')
hold on
plot(tsub, Ysub, 'r')
title('Sinal de Áudio Subamostrado');
xlabel( 't (milissegundos)' );
ylabel( 'X(t)' );
hold off

subplot(2,1,2)
plot(f, Espectro_original, 'k')
hold on
plot(fsub ,Espectro_subamostrado, 'r' )
title( 'Espectro de amplitude unilateral de X(t)' )
xlabel( 'f (Hz)' )
ylabel( 'Amplitude' )
hold off

%% Filtro de média com Convolução

h1 = media_movel(35);
media = conv(h1, Y);

Fourier = fft(media);
tamanho = length(media);

P2 = abs(Fourier/tamanho);
Espectro_media = P2(round(1:tamanho/2+1));
Espectro_media(2:end-1) = 2*Espectro_media(2:end-1);

figure
subplot(2,1,1)

plot(t,Y, 'k')
hold on

periodo = 1/FS;
comprimento = (length(media)-1)/FS;
t = 0: periodo: comprimento;

plot(t, media, 'r')
title('Sinal de Áudio Convoluido com Média Móvel');
xlabel( 't (milissegundos)' );
ylabel( 'X(t)' );
hold off

subplot(2,1,2)
plot(f, Espectro_original, 'k')
hold on

f = FS*(0:(tamanho/2))/tamanho;
plot(f, Espectro_media, 'r')
title( 'Espectro de amplitude unilateral de X(t)' )
xlabel( 'f (Hz)' )
ylabel( 'Amplitude' )
hold off

%% audio
player = audioplayer(audioclip ,FS); 
%player = audioplayer(senoide_audio, FS);
%player = audioplayer(audio_gw, FS);
%player = audioplayer(Y, FS);
%player = audioplayer(X, FS);
%player = audioplayer(Z, FS);
%player = audioplayer(Ysub, FS);
%player = audioplayer(media,FS);

play(player); 

%% Função media movel
function h = media_movel(N)
n = 2*N;
impulse = [1 zeros(1, n)];
h = [zeros(1, n)];
h_aux = [zeros(1, n)];
h(1) = 1/ (N+1);

for i = 2:n
    for j = 1:N
        if j < i
            h_aux(i) = impulse(i) + impulse (i - j);
            h(i) = h(i) + h_aux(i);
        else
            break;         
        end
    end
end 
for i = 2:n
    h(i) = h(i)/(N+1);
end
end

