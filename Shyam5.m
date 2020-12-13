% COURSE PROJECT
%
%Creater: Shyam Krishna M
% BTech Final year, IIT Palakkad
%
%For Plotting Force Transmissibility Vs (W/Wn)
%let dr be the damping ratio(3 cases considered - dr<1,dr=1,dr>1)
%let fr be the frequency ratio and FT be the Force Transmissibility
clear all;clc;
fr=[0:0.01:3,sqrt(2)];
fr2=fr.^2;
%for dr<1
dr=0;
ts=2*dr*fr;
FT1=fr2.*sqrt((1+ts.^2)./(((1-fr2).^2)+ts.^2));
dr=0.1;
ts=2*dr*fr;
FT2=fr2.*sqrt((1+ts.^2)./(((1-fr2).^2)+ts.^2));
dr=0.2;
ts=2*dr*fr;
FT3=fr2.*sqrt((1+ts.^2)./(((1-fr2).^2)+ts.^2));
dr=0.3;
ts=2*dr*fr;
FT4=fr2.*sqrt((1+ts.^2)./(((1-fr2).^2)+ts.^2));
dr=0.4;
ts=2*dr*fr;
FT5=fr2.*sqrt((1+ts.^2)./(((1-fr2).^2)+ts.^2));
dr=0.6;
ts=2*dr*fr;
FT6=fr2.*sqrt((1+ts.^2)./(((1-fr2).^2)+ts.^2));
dr=0.8;
ts=2*dr*fr;
FT7=fr2.*sqrt((1+ts.^2)./(((1-fr2).^2)+ts.^2));
%for dr=1
dr=1;
ts=2*dr*fr;
FT8=fr2.*sqrt((1+ts.^2)./(((1-fr2).^2)+ts.^2));
%for dr>1
dr=2;
ts=2*dr*fr;
FT9=fr2.*sqrt((1+ts.^2)./(((1-fr2).^2)+ts.^2));

%%
%For the calculation of (W/Wn)max
%for maxima curve
for i=1:1:90
dr=(i/100);
g=2+13*(dr^2)-(144*(dr^4))-(832*(dr^6))+(1024*(dr^8));
h=3+8*(dr^2)-(128*(dr^4))+(128*(dr^6));
p=(18*(dr^4))-(208*(dr^6))-(1920*(dr^8))+(6144*(dr^10))-(4096*(dr^12));
L=sqrt(-1);
r1=8-(16*dr^2)+(((2^(2/3))*h)/(((p/2)+3*sqrt(3)*sqrt((-1)*(dr^6)*g))^(1/3)));
r2=(1/(dr^2))*((p+(6*sqrt(3)*sqrt((-1)*(dr^6)*g)))^(1/3));
r(i)=real(sqrt((r1+r2)/6));
ts=2*dr*r(i);
rs2=(r(i))^2;
FT10(i)=(rs2).*sqrt((1+ts.^2)./(((1-(rs2)).^2)+ts.^2));
end
%%
%plotting all curves
plot(fr(1:end-1),FT1(1:end-1));
hold on
plot(fr(1:end-1),FT2(1:end-1))
plot(fr(1:end-1),FT3(1:end-1))
plot(fr(1:end-1),FT4(1:end-1))
plot(fr(1:end-1),FT5(1:end-1))
plot(fr(1:end-1),FT6(1:end-1))
plot(fr(1:end-1),FT7(1:end-1))
plot(fr(1:end-1),FT8(1:end-1),'--')
plot(fr(1:end-1),FT9(1:end-1),'-.')
plot(fr(end),FT1(end),'r*')
plot(fr(end),FT2(end),'r*')
plot(fr(end),FT3(end),'r*')
plot(fr(end),FT4(end),'r*')
plot(fr(end),FT5(end),'r*')
plot(fr(end),FT6(end),'r*')
plot(fr(end),FT7(end),'r*')
plot(fr(end),FT8(end),'r*')
plot(fr(end),FT9(end),'r*')
plot(r,FT10,'k','LineWidth',2)%maxima curve
set(gca,'xtick',[0:0.2:1.3,sqrt(2),1.6:0.2:3])
xlim([0 3])
ylim([0 8])
title('Force Transmissibility Vs Frequency Ratio(W/Wn)')
xlabel('Frequency Ratio (W/Wn)')
ylabel('FT/kY')
%ylabel('Force Transmissibility')
grid on
legend('\delta=0','\delta=0.1','\delta=0.2','\delta=0.3','\delta=0.4','\delta=0.6','\delta=0.8','\delta=1','\delta=2')
hold off

%%
%---------------------------------------------------------
%Code For using rsq3
% for i=1:1:90
% dr=(i/100);
% g=2+13*(dr^2)-(144*(dr^4))-(832*(dr^6))+(1024*(dr^8));
% h=3+8*(dr^2)-(128*(dr^4))+(128*(dr^6));
% p=(18*(dr^4))-(208*(dr^6))-(1920*(dr^8))+(6144*(dr^10))-(4096*(dr^12));
% L=sqrt(-1);
% r1=(4/3)-((8*dr^2)/3)-((L*(L+sqrt(3))*h))/(6*((p+6*sqrt(3)*sqrt((-1)*(dr^6)*g))^(1/3)));
% r2=(1/(12*(dr^2)))*(1+L*sqrt(3))*((p+(6*sqrt(3)*sqrt((-1)*(dr^6)*g)))^(1/3));
% r(i)=real(sqrt(r1-r2));
% ts=2*dr*r(i);
% rs2=(r(i))^2;
% FT10(i)=(rs2).*sqrt((1+ts.^2)./(((1-(rs2)).^2)+ts.^2));
% end
%%
