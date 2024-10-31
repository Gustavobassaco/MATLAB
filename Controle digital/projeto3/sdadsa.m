% regulação sistema massa mola, 

A = [0 1;-6 -5];
B = [0 ;0.2000];
C = [1, 0];
m = 5;
k = 30;
b = 25;
p = [-6 -7]; % onde se quer os polos
K = place(A,B,p)


% rastreamento
h = sym('h');
k1 = sym('k1');
k2 = sym('k2');

ksym = [k1 k2];
Aras = [A-B*ksym B*h;-C 0];

autoraz1 = eig(Aras); %autovalores
polos2 =[-7 -9 -10];
autoraz1 =[autoraz1(1)==polos2(1);autoraz1(2)==polos2(2);autoraz1(3)==polos2(3)];
kraz = solve(autoraz1(1),autoraz1(2), autoraz1(3));

kraz=[double(kraz.k1(1)) double(kraz.k2(1)) double(kraz.h(1))]; %ganhos
k1 = kraz(1);
k2 = kraz(2);
h  = kraz(3);




