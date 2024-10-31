
clear 
clc
close all
%%

%Carregando Audio
[audio,Fs] = audioread("Som.wav");
TamAudio = length(audio);
TempoAudio = 0:1/Fs:(TamAudio-1)/Fs;
fftAudio = fft(audio);
P2 = abs(fftAudio/TamAudio);
P1 = P2(1:TamAudio/2+1);
P1(2:end-1) = 2*P1(2:end-1);
freqAudio = Fs*(0:(TamAudio/2))/TamAudio;

do = 31.70:33.70;
do_sustenido = 33.65:35.65;
re=35.71:37.71;
re_sustenido=37.89:39.89;
mi=40.20:42.20;
fa=42.65:44.65;
fa_sustenido=45.71:47.71;
sol=48:50;
sol_sustenido=50.91:54.91;
la=54:56;
la_sustenido=57.27:59.27;
si=60.74:62.74;

vetorNotas = [{do},{do_sustenido},{re},{re_sustenido},{mi},{fa},{fa_sustenido},{sol},{sol_sustenido},{la},{la_sustenido},{si}];

valoresAbs = 1:60;
ind=0;
controle = 0;

for oitava = 1 : 5
    for  nota = 1:12
        ind=ind+1;
        valoresAbs(ind) = calculos(nota, oitava, vetorNotas,Fs,audio, controle);
    end
end

    B = valoresAbs;
    C = sort(B,'descend');
    controle = 1;   
    subplot(2,1,1);
    hold all
    plot(freqAudio,P1,'k');

    subplot(2,1,2);
    hold all
    plot(TempoAudio, audio, 'k');
        typeNota = [" C "  " C sustenido"  " D" " D sustenido"...
" E "  " F " " F sustenido " " G " " G sustenido " " A " " A sustenido" " B "];
strfinal(1) = "audio original";
for i = 1:13
    index = find(valoresAbs == C(i));

    oitava = ceil(index(1)/ 12);
    nota = mod(index(1), 12);
    if nota == 0
        nota = 1;
    end

        str =typeNota(nota) + "," + int2str(oitava) + " oitava";
        strfinal(i + 1) = str;
    calculos(nota, oitava, vetorNotas,Fs,audio, controle, i,strfinal);
end

 
function n = calculos(nota, oitava, vetorNotas,Fs,audio, controle, cor, strfinal)

        mult=oitava-1;
        x = cell2mat(vetorNotas(1,nota))*power(2,mult);
        valorInicial = x(1)-1.2*mult;
        valorFinal   = x(3)+1.2*mult;

        filtrado = filtroNota(valorInicial,valorFinal,audio,Fs);
        pot = filtrado.^2;
        n = sum(pot(:));               

        if controle == 1
            plotar(filtrado,Fs, cor, strfinal);
        end      
end
%%
function y = filtroNota(Lcut,Hcut,audio,Fs)

    [A,B,C,D] = butter(4,[Lcut Hcut]/(Fs/2));
    [x1,x2] = ss2sos(A,B,C,D);
    y = filtfilt(x1,x2,audio);
    
end



function plotar(filtrado,Fs, c, strfinal)

        
        cor1 = [0 200 0]/255;
        cor2 = [200 0 0]/255;
        cor3 = [0 0 200]/255;
        cor4 = [0 200 200]/255;
        cor5 = [200 200 0]/255;
        cor6 = [50 200 0]/255;
        cor7 = [200 20 50]/255;
        cor8 = [100 0 200]/255;
        cor9 = [50 20 200]/255;
        cor10 = [60 20 50]/255; 
        cor11 = [100 70 130]/255;
        cor12 = [150 230 20]/255;
        cor13 = [12 220 82]/255;         
        cor = [{cor1}, {cor2}, {cor3}, {cor4},{cor5}, {cor6}, {cor7}, {cor8}, {cor9}, {cor10},{cor11},{cor12},{cor13}];

        tamFilt = length(filtrado);
        tempoFilt = 0:1/Fs:(tamFilt-1)/Fs;
        fftFiltrado = fft(filtrado);
        P2 = abs(fftFiltrado/tamFilt);
        freqs= P2(1:tamFilt/2+1);
        freqs(2:end-1) = 2*freqs(2:end-1);
        freq = Fs*(0:(tamFilt/2))/tamFilt;
        tempo1 = tamFilt/Fs;

        %Espectro de frequência Original x Filtrado
        
        subplot(2,1,1);
        hold all
        plot(freq,freqs,'color',cell2mat(cor(c)));
        xlim([32 987]);
        ylabel('Magnitude (dB)');
        xlabel('Frequências (Hz)');
        xticks([32 65 130 261])
        xticklabels({'C1','C2','C3','C4'})
        title("Frequencias do Áudio com seus principais componentes");
        if(c ==13)
        legend(strfinal(:));
        end
        grid on;
        hold off
        
        %Função do tempo
        subplot(2,1,2);
        hold all
        plot(tempoFilt,filtrado,'color',cell2mat(cor(c)));
        xlim([0 tempo1+(tempo1)*0.20]);
        title("Áudio com seus principais componentes");
        grid on
        hold off
        if(c ==13)
        legend(strfinal(:));
        end
end
     

