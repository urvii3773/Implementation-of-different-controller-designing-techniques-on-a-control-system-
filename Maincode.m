clear all
close all
clc

%Pole Placement 
b = [250];
a = [1 13.687 35.38 278.36];
[A,B,C,D] = tf2ss(b,a)
sys1=PolePlacement(A,B,C,D)
figure 
step(sys1)

%Pole Placement with Integral Control
b = [250];
a = [1 13.687 35.38 278.36];
[A,B,C,D] = tf2ss(b,a)
sys2=PolePlacementIntegral(A,B,C,D)
figure 
step(sys2)

%Observer-based Controller
b = [250];
a = [1 13.687 35.38 278.36];
[A,B,C,D] = tf2ss(b,a)
sys3=observer(A,B,C,D)
figure
step(sys3)

%Observer-based using Integral Control
b = [250];
a = [1 13.687 35.38 278.36];
[A,B,C,D] = tf2ss(b,a)
sys4=ObserverIntegral(A,B,C,D)
figure
step(sys4)

%Linear Quadratic Regulator(LQR) Control
b = [250];
a = [1 13.687 35.38 278.36];
[A,B,C,D] = tf2ss(b,a)
sys5=LQR(A,B,C,D)
figure
step(sys5)

%Linear Quadratic Regulator(LQR) with Integral Control
b = [250];
a = [1 13.687 35.38 278.36];
[A,B,C,D] = tf2ss(b,a)
sys6=LQRIntegral(A,B,C,D)
figure
step(sys6)

%PID Controller Tuning
b = [250];
a = [1 13.687 35.38 278.36];
[A,B,C,D] = tf2ss(b,a)
sys7=PIDcontroller(A,B,C,D)
figure
step(sys7)