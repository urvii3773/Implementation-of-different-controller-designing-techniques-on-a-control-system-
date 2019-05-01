
function sys6=LQRIntegral(A,B,C,D)
Ahat = [A zeros(3,1); -C 0]
Bhat = [B; 0]
C = [0 C]

system=ss(Ahat,Bhat,C,D);

% LQR 
Q = [eye(4)]
R = [0.001]

[K,P,e] = lqr(Ahat,Bhat,Q,R)

sys6 = ss(Ahat-Bhat*K,Bhat,C,D);
n=dcgain(sys6);
sys6=sys6*(1/n);
step(sys6);