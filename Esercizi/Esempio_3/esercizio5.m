clear all
clc

A = [ -299 37; -2416 299];
B = [ 7 57]';
lambda_des = [ -1 -7];
Mr = ctrb(A,B);
rank(Mr)  % 2 -> è raggiungibile
K = place(A, B, lambda_des)