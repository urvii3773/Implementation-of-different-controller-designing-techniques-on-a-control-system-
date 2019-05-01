function sys1=PolePlacement(A,B,C,D)
system = ss(A,B,C,D);
rank(ctrb(system))

ts=0.08
os=0.06
zeta=sqrt((log(os))^2/(pi^2+(log(os))^2));
omega=4/(zeta*ts);
alpha=5

p1=-zeta*omega+1i*omega*sqrt(1-zeta^2);
p2=-zeta*omega-1i*omega*sqrt(1-zeta^2);
p3=-alpha*zeta*omega;
p=[p1 p2 p3]


K = place(A,B,p)
system1 = ss((A-B*K),B,C,D);
d = dcgain(system1);
sys1= system1*(1/d);