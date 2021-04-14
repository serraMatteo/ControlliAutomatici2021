% Script di soluzione dell'esercizio 1 del 7 Marzo 2021
clear all; clc; close all;
R = 10;
L = 2e-3;
Ca = 5e-6;

A = [-R/L -1/L ; 1/Ca 0]; 
B = [1/L 0]';
C = [0 1];
D = 0;

G = ss(A,B,C,D); % definisco il sistema 

% metodo 1

s = tf('s');
%... calcolo la trasformata della risposta forzata e antitrasformo

% metodo 2: uso la funzione di trasferimento
H = tf(G);
U = 3/s;
Y = H * U;

Y = zpk(Y); % riscrivo Y nella forma zero e poli

[numY, denY] = tfdata(Y, 'v');
[r,p] = residue(numY, denY);

% plot
tao1 = abs(1/real(p(1)));
tao2 = abs(1/real(p(2)));
taomin  = min(tao1, tao2);
taomax = max(tao1, tao2);

t = [0:taomin/100:10*taomax];

y = r(1)*exp(p(1)*t) + r(2)*exp(p(2)*t) + r(3);

%figure(1)
%step(H * 3) %risposta al gradino unitario del sistema
%hold on
%plot(t,y,'.r');


%Soluzione Domanda 2

U2 = 50 / (s^2 + 25);
x0 = [1 3]';

X = inv(s*eye(2) - A)*x0 + inv(s*eye(2) - A)*B*U2;
X = minreal(zpk(X), 1e-4);

X1 = X(1);

[numX1, denX1] = tfdata(X1, 'v');
[r2, p2] = residue(numX1, denX1);


x1 = 2 * abs(r2(1))*exp(real(p2(1)) * t) .* cos(imag(p2(1))*t + angle(r2(1))) + 2 * abs(r2(3))*cos(imag(p2(3))*t + angle(r2(3)));

%figure(2)
%plot(t,x1)

%figure(3)
%plot(t,2 * abs(r2(3))*cos(imag(p2(3))*t + angle(r2(3))))

% Soluzione Domanda 3

autA = eig(A)

