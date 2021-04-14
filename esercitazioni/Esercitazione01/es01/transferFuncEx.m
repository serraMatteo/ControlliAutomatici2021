clear all
clc

s = tf('s');
H = (s + 5) / (s^2 + 3*s +2);
zeros = zero(H);
poles = pole(H);

% zero pole gain form 

zpk(H)

% ---------------- second Example --------------------
H2 = (2*s + 1) / (s + 4)^2;
U2 = 2 /s^2;
x0 = [ 0 0 ]';

Y2 = H2 * U2;
Y2 = minreal(zpk(Y2));

[ numY, denY] = tfdata(Y2(1), 'v');

[z , p]= residue(numY, denY)