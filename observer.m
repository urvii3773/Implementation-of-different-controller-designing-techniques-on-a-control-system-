function sys3=observer(A,B,C,D)
system = ss(A,B,C,D);
rank(obsv(system))

ts=0.1
os=0.02
zeta=sqrt((log(os))^2/(pi^2+(log(os))^2));
omega=4/(zeta*ts);
alpha=5;

p1=-zeta*omega+1i*omega*sqrt(1-zeta^2);
p2=-zeta*omega-1i*omega*sqrt(1-zeta^2);
p3=-alpha*zeta*omega;
p=[p1 p2 p3]

L1= -40;
L2= -60;
L3= -80;
P=[L1 L2 L3]


L = place(A',C',P)'
K = place(A,B,p)
aa= A-L*C-B*K;
bb= L;
cc= K;
dd= D;
[num,den]=ss2tf(aa,bb,cc,dd);
observer_tf=tf(num,den)
sys3=feedback(system*observer_tf,1);