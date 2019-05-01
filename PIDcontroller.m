function sys7=PIDcontroller(A,B,C,D)
system=ss(A,B,C,D);
s=tf('s');
Kp = 19.5
Ki=8.81
Kd=10.8
PID = Kp + Ki*(1/s) + Kd*(s)
sys7=feedback(system*PID,1);