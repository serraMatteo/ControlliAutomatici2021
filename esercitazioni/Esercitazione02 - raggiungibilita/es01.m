clear all
clc

A = [1 3 ; 4 2];
B = [-1 2]';

aut_des = [ -2 -3]; % autovalori desiderati
Mr = ctrb(A,B); % matrice di raggiungibilitĂ 
r = rank(Mr)    % = 2 completamente controllabile 

K = place(A,B,aut_des)  % calcolo con place perchĂ¨ gli autovalori hanno molteplicitĂ  1
Acl = A -B*K;
eig(Acl)