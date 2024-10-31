%% Processamento Digital de Sinais
% 05/09/2022
% prof Daniel Campos

load sample

%Para reproduzir o áudio
%p = audioplayer(Y,FS);
%play(p)
%Ysub = Y(1:2:end); %tirar metade das amostras
N = 2;
Ysub=downsample(Y,N);
FS_sub = FS/N;

% Crop do sinal (segmentar)
t1 = 1;
t2 = 2.2;
N1 = round(t1*FS_sub);
N2 = round(t2*FS_sub);

YA = Ysub(N1:N2);

% Crop do sinal (segmentar)
t3 = 2;
t4 = 3.2;
N3 = round(t3*FS_sub);
N4 = round(t4*FS_sub);
YB = Ysub(N3:N4);

%Unir os dois segmentos para criar um efeito de "reverb"
Y2 = 0.5*YA+YB;

p = audioplayer(Y2,FS_sub);
play(p)

N = length(Y2);
t = 0:1/FS_sub:(N-1)/FS_sub;
plot(t,Y2,'k')

ylabel('Amplitude do Sinal')
xlabel('Tempo (segundos)')
title('Áudio')
grid on
