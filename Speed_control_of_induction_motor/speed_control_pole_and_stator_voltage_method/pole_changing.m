% speed control using changing number of poles %

clear
clc
r1=0.641; % stator resistance ( ohm )
x1=1.106; % stator reactance ( ohm )
r2= 0.332; % rotor resistance ( ohm )
x2=0.464; % rotor reactance ( ohm )
xm=26.3; % magnetizing reactance ( ohm )
v_ph=460/sqrt(3); % phase voltage ( volt )
f=50; % frequency of supply


for p = 2:2:10
n_s=120*f/p; % synchronous speed
w_s=2*pi*n_s/60;
s = 0 : 0.0001 : 1; % slip
n_m = ( 1 - s ) * n_s; % rotor speed ( RPM )
for i=1:10001

 tl(i)=50; % load torque (N.m)
 t(i) = ( 3* (v_ph^2) * (r2/s(i) ) ) / ( w_s * ( ( (r1+ (r2/s(i)) )^2) + (x1+x2)^2) );
end
plot(n_m,t,'r--','linewidth',2)
hold on
plot(n_m,tl,'g--','linewidth',2)
title({'Induction Motor Performance Curve'},'fontsize',15)
xlabel('Speed (RPM)','fontsize',15)
ylabel('Torque (N.M)','fontsize',15)
legend('Torque-speed')
grid on

hold on
end