function sys5=LQR(A,B,C,D)
system=ss(A,B,C,D);

Q = [eye(3)]
R = [0.001]

[K,P,e] = lqr(A,B,Q,R)

sys5 = ss(A-B*K,B,C,D);
n=dcgain(sys5);
sys5=sys5*(1/n);