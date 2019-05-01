function sys2=PolePlacementIntegral(A,B,C,D)
Ahat = [A zeros(3,1); -C 0]
Bhat = [B; 0]
C=[0 C];
system = ss(Ahat,Bhat,C,D);
rank(ctrb(system))

ts=0.08
os=0.06
zeta=sqrt((log(os))^2/(pi^2+(log(os))^2));
omega=4/(zeta*ts);
alpha=5

p1=-zeta*omega+1i*omega*sqrt(1-zeta^2);
p2=-zeta*omega-1i*omega*sqrt(1-zeta^2);
p3=-alpha*zeta*omega;
p=[p1 p2 p3 10*real(p1)];

K = place(Ahat,Bhat,p)
system1 = ss((Ahat-Bhat*K),Bhat,C,D);
d = dcgain(system1);
sys2= system1*(1/d);