clear
clc
r1=0.641; % stator resistance ( ohm )
x1=1.106; % stator reactance ( ohm )
r2= 0.332; % rotor resistance ( ohm )
x2=0.464; % rotor reactance ( ohm )
xm=26.3; % magnetizing reactance ( ohm )
v_ph=460/sqrt(3); % phase voltage ( volt )
n_s=1800; %(RPM)
w_s=2*pi*n_s/60; %(rad/sec)

s=-1:0.0001:2;

n_m=(1-s)*n_s;

for i=1:30001
t(i)=( 3*(v_ph^2)*(r2/s(i)) )/(w_s*((r1 +(r2/s(i))^2) +((x1+x2)^2)));
% Torque ( N-m )
end

plot(n_m,t,'r--','lineWidth',2)
title({'Induction Motor Performance Curve'} ,'fontsize',15)
xlabel('Speed(RPM)','fontsize',15)
ylabel('Torque(N,M)','fontsize',15)
legend('Torque-Speed')
grid on