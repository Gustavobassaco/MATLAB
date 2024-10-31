%% Processamento Digital de Sinais
% 05/09/2022
% prof Daniel Campos

close all
clc
clear

%% Gravar áudio

Tempo = 5; %5 segundos de gravação
FS = 8000; %Frequência de amostragem em 8 kHz
Nbits = 16; %sinal de 16 bits
Canais = 1; %1 = mono, 2 = stereo
r = audiorecorder(FS, Nbits, Canais); %preparar para gravar
record(r);
pause(Tempo);
stop(r);
Y = getaudiodata(r, 'double'); %guardar em uma variável double

