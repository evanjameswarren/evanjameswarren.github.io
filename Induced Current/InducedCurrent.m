clear;clc;clf;

t = linspace(0,3,10000);


meters = 0.0254; % meters per inch conversion

m = .005; % driving force mass kg


id = 1/4; % Magnet inner diameter in inches
od= 1; % magnet outer diameter in inches
Deff = (id+od)*.5; % effective magnetic torque diameter

g = 9.8; % Gravity (meters/s^2)
r = 16.7/1000; % Radius of cylinder design in (meters)
B = 0.7; % magnetic flux density of magnets (Teslas) 
L = .5 * meters; % depth of magnets (meters) (3 inches)

D = Deff*meters; % effective magnetic torque diameter (meters)
M = 3*10^(-6); % moment of inertia of cylinder design (kg/meters^2) *** this is an estimate ** 
N = 20; %  number of wire loops
R = 0.02567*1*N; % resistence in (ohms) of wire 1 ft wire AWG 24 magnet wire * 1.5 per loop * (N) number of loops 


I = @(t) (2*m*g*r/(N*B*D*L))*(1-exp(-t*((N*B*D*L)^2)/(M*R*4)));


Tm = m*g*r; % drive torque
h = 1; % estimated table height
k = ((N*L*B*D)^2)/(4*R); %simplifying constant


y = @(t) (r*Tm/k)*(t+(M/k)*(exp(-t*(k/M))-1)); % fall distance

syms tmax positive
t_max = double(solve(y(tmax)==h,tmax)); % Solving for max time when driving mass hits the ground

subplot(2,1,1)
plot(t,I(t))

xlabel("Seconds")
ylabel("Ampres")
title('$$I(t) = \frac{2mgr}{NBDL}\left(1 - e^{-t\frac{(NBDL)^2}{4MR}}\right)$$', 'Interpreter', 'latex', 'FontSize', 12);
grid on
hold on
plot(t_max,I(t_max),".r")
hold off
k = ((N*L*B*D)^2)/(4*R); %simplifying constant
y = @(t) (r*Tm/k)*(t+(M/k)*(exp(-t*(k/M))-1)); % fall distance

subplot(2,1,2)
plot(t,y(t))

title('$$y(t) = \frac{4mgRr^2}{(NBDL)^2}\left(t + \frac{4MR}{(NBDL)^2}\left(e^{-t\frac{(NLBD)^2}{4RM}} - 1\right)\right)$$', 'Interpreter', 'latex', 'FontSize', 12)
hold on
xlabel("time")
ylabel("Distance Falling")
grid on
plot(t_max,y(t_max),".r")
hold off





