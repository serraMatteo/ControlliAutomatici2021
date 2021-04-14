clear all
clc

A = [ 0 0 1; 2 -1 2; 0 1 1];
C = [0 0 1];
lambda_des = [0.2 0.4 0.5];

Mo = obsv(A,C);
rank(Mo) % == 3 -> osservabile

L_t = place(A', C',lambda_des);
L_t'