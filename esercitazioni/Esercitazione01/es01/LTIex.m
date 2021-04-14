clc
clear all

A = [ 0 1; -2 -3]; 
B = [1 0]';
s = tf('s');
U_s = 2 / s;
x_0 = [2 2]';

Xzi = minreal( zpk( (inv(s*eye(2) - A)) * x_0 ) );
Xzs = minreal(zpk((inv(s*eye(2) - A)) * B * U_s));
X = minreal(zpk((inv(s*eye(2) - A)) * (B * U_s + x_0)));
[numX1, denX1]= tfdata(X(1), 'v');
[numX2, denX2]= tfdata(X(2), 'v');