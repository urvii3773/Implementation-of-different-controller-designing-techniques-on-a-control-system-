function sys4=ObserverIntegral(A,B,C,D)
Ahat = [A zeros(3,1); -C 0]
Bhat = [B; 0]
C=[0 C];

system = ss(Ahat,Bhat,C,D);
rank(obsv(system))

ts=0.1
os=0.02
zeta=sqrt((log(os))^2/(pi^2+(log(os))^2));
omega=4/(zeta*ts);
alpha=5;


p1=-zeta*omega+1i*omega*sqrt(1-zeta^2);
p2=-zeta*omega-1i*omega*sqrt(1-zeta^2);
p3=-alpha*zeta*omega;
p=[p1 p2 p3 10*real(p1)];


L1= -10;
L2= -20;
L3= -30;
L4= -40;
P = [L1 L2 L3 L4]


L = place(Ahat',C',P)'
K = place(Ahat,Bhat,p)
aa = Ahat-L*C-Bhat*K;
bb=L;
cc=K;
dd=D;
[num,den]=ss2tf(aa,bb,cc,dd);
observer_tf=tf(num,den)
sys4=feedback(system*observer_tf,1);