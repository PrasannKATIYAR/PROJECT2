clear
clc
r1=0.641; % stator resistance ( ohm )
x1=1.106; % stator reactance ( ohm )
r2= 0.332; % rotor resistance ( ohm )
x2=0.464; % rotor reactance ( ohm )
xm=26.3; % magnetizing reactance ( ohm )
v_ph=460/sqrt(3); % phase voltage ( volt )
n_s=1800; 
w_s=2*pi*n_s/60; 


s = 0 : 0.0001 : 1; % slip
n_m = ( 1 - s ) * n_s; % rotor speed ( RPM )

for i=1:10001
 t(i) = ( 3* (v_ph^2) * (r2/s(i) ) ) / ( w_s * ( ( (r1+ (r2/s(i)) )^2) + (x1+x2)^2) );
 tl(i)=140;
end

for i=1:10001
 t1(i) = ( 3* (v_ph^2) * (2*r2/s(i) ) ) / ( w_s * ( ( (r1+((2*r2/s(i))) )^2) + (x1+x2)^2) );
end
for i=1:10001

 t2(i) = ( 3* (v_ph^2) * (5*r2/s(i) ) ) / ( w_s * ( ( (r1+((5*r2/s(i))) )^2) + (x1+x2)^2) );
end


plot(n_m,t,'r--','linewidth',2)
title({'Induction Motor Performance Curve'},'fontsize',15)
xlabel('Speed (RPM)','fontsize',15)
ylabel('Torque (N-M)','fontsize',15)
legend('original.rot.res','doubles.rot.res','five.rot.res')
grid on
hold on
plot(n_m,t1,'k--','linewidth',2),legend('original.rot.res','doubles.rot.res','five.rot.res')
hold on
plot(n_m,t2,'g--','linewidth',2),legend('original.rot.res','doubles.rot.res','five.rot.res')
hold on
plot(n_m,tl,'b--','lineWidth',2)
