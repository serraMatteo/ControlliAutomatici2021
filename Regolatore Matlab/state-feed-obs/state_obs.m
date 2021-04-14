clear all
clc

% A = [ 0 1; -1 2]; sistema instabile
A = [-0.8 -1; 1 0];
B = [0 1]';
C = [0 1];
D = 0;

S = ss(A, B, C, D);

H = tf(S);

eigA = eig(A);   % instabile per la prima scelta di A, oscillanti per la seconda

Mo = obsv(A, C);

rankMo = rank(Mo); % == 2 -> completamente osservabile

%calcolo i guadagni L
Lt = place(A', C', [-10 -20]);
L = Lt'; % -199 -32 come da slide



