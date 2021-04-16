% Definizione del sistema da controllare 

A = [ 0 1; 900 0];
B = [ 0 -9]';
C = [ 600 0];
D = 0;

S = ss(A, B, C, D);
% funzione di trasferimento di S
H_S = minreal(zpk(tf(S)))
% POLO in -30 e +30 -> instabile

% figure(1);
% step(H_S, 0.1); % diverge

eig(A); % 30 -30

% Progettazione della legge di controllo in retroazione statica dallo stato

Mr = ctrb(A,B); % matrice di raggiungibilità
rankMr = rank(Mr); % 2 --> sistema completamente ragg e controllabile

% il polinomio caratteristico di A - BK = l^2 è 2*0.2*45*l + 45^2
% e posso tradurlo in un vettore [1 18 2025]
pc = [1 2*0.2*45 45^2];
% autovalori desiderati per il controllo
auto_des_controllo = roots(pc); % -9.0 + 44.0908i 
                                % -9.0 - 44.0908i
K = place(A, B, auto_des_controllo);

aut_contr = eig(A - B*K); % controllo che coincidano: OK
% controllo correttezza pulsazione naturale e del damping
damp(auto_des_controllo);

% siccome gli stati non sono misurabili dobbiamo andare a 
% progettare l'osservatore ( Osservatore di Luemberger )

% matrice di osservabilità
Mo = obsv(A,C);
rankMo = rank(Mo); % == 2

% polinomio caratteristico osservatore: po = (l^2 + 100^2)
po = [1 200 10000];
auto_des_oss = roots(po) % -100 e -100
% due autovalori in -100 --> uso acker e non place
Lt =  acker(A', C', auto_des_oss);
L = Lt';

aut_oss = eig(A - L * C); % controllo che coincidano: OK
% progetto costante moltiplicativa del progetto
alpha = 1;