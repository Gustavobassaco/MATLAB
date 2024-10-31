clc
clear all
close all

m=5;
b=25;
k=30;

h = sym('h');
k1 = sym('k1');
k2 = sym('k2');
ksym = [k1 k2];
A=[0 1;-k/m -b/m];
B=[0;1/m];
C=[1 0];
sysma=ss(A,B,C,0);
polos1=[-3 -4];
kreg=place(A,B,polos1)
autoreg=eig(A-B*kreg);
Aras=[A-B*ksym B*h;-C 0];
autoraz1=eig(Aras);
polos2=[-7 -9 -10];
autoraz1=[autoraz1(1)==polos2(1);autoraz1(2)==polos2(2);autoraz1(3)==polos2(3)];
kraz=solve(autoraz1(1),autoraz1(2),autoraz1(3));
kraz=[double(kraz.k1(1)) double(kraz.k2(1)) double(kraz.h(1))]

%%

J = 0.01;
b = 0.1;
kg = 0.01;
kt = 0.01;
R = 1;
L = 0.5;

h = sym('h');
k1 = sym('k1');
k2 = sym('k2');
ksym = [k1 k2]; 
A=[-b/J kt/J;-kg/L -R/L];
B=[0;1/L];
C=[1 0];
% cria um espaço de estados
sysma=ss(A,B,C,0); 
polos1=[-10 -12];  % regulação
kreg=place(A,B,polos1) % k de realimentação,  matriz de realimentação
autoreg=eig(A-B*kreg)  % Calcula os autovalores
Aras=[A-B*ksym B*h;-C 0]; % formula correta
autoraz1=eig(Aras); % Calcula os autovalores da matriz Aras
% Define uma nova lista de polos desejados para o rastreamento do sistema
polos2=[-15 -17 -20]; %rastreio
% Cria uma lista de equações simbólicas autoraz1, que relaciona 
% os autovalores de Aras com os polos desejados polos2
autoraz1=[autoraz1(1)==polos2(1);autoraz1(2)==polos2(2);autoraz1(3)==polos2(3)];
% Resolve as equações simbólicas autoraz1 para obter os valores
% de k1, k2 e h que satisfazem os polos desejados
kraz=solve(autoraz1(1),autoraz1(2),autoraz1(3));
% Converte os valores de kraz para números de ponto 
% flutuante usando a função double e armazena-os em
% um vetor com os valores de k1, k2 e h
kraz=[double(kraz.k1(1)) double(kraz.k2(1)) double(kraz.h(1))]
k1 = kraz(1)
k2 = kraz(2)
h = kraz(3)