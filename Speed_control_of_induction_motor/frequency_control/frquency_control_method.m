clear
clc
r1=0; % stator resistance ( ohm )
x1=1.14; % stator reactance ( ohm )
r2= 0.38; % rotor resistance ( ohm )
x2=1.71; % rotor reactance ( ohm )
xm=33.2; % magnetizing reactance ( ohm )
v_ph=460/sqrt(3); % phase voltage ( volt )
n_bs=1800;   % base synchronus speed (rpm)
w_bs=2*pi*n_bs/60;  % base synchronus speed(rad/sec)


s = 0 : 0.0001 : 1;    % slip

for B= 1:0.25:2

for i=1:10001

n_m=B*(1-s)*n_bs;

t(i) = ( 3* (v_ph^2) * (r2/s(i) ) ) / (B*w_bs * ( ( (r1+ (r2/s(i)) )^2) + (B*(x1+x2))^2) );
end
 
plot(n_m,t,'r--','linewidth',2)
title({'Induction Motor Torque Speed Curve Using Frequency Control Curve'},'fontsize',15)
xlabel('Speed (RPM)','fontsize',15)
ylabel('Torque (N-M)','fontsize',15)
legend('Torque_Speed')
hold on
grid on

B
B*n_bs
f=B*n_bs
end

