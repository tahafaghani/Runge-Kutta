clc;
clear;
close all;

%constants
m1=1.00000;
m2=1.00000;
g=9.8;
L2=.1000;
L1=.1000;
M=2.000;


%initial time
t(1)=0;    
%final time
tf=5;
%step size
H=0.0001;
%number of steps
n=(tf-t(1))/H;

%initial values
teta1=zeros(1,n);
teta1d=zeros(1,n);
teta2=zeros(1,n);
teta2d=zeros(1,n);
x=zeros(1,n);
xd=zeros(1,n);
t=zeros(1,n);
y1=zeros(1,n);
y2=zeros(1,n);
x1=zeros(1,n);
x2=zeros(1,n);


%initial conditions
teta1(1)=-pi/3; 
teta1d(1)=0;
teta2(1)=-pi/2;
teta2d(1)=0;
x1(1)=L1*sin(teta1(1));
y1(1)=-L1*cos(teta1(1));
x2(1)=x1(1)+L2*sin(teta2(1));
y2(1)=y1(1)-L2*cos(teta2(1));
x(1)=0;                 
xd(1)=0;
f=0;
ycart=0;
%functions
f1=@(t,x,xd,teta1,teta1d,teta2,teta2d) xd;
f2=@(t,x,xd,teta1,teta1d,teta2,teta2d) -(f*m1 + f*m2 - f*m2*cos(teta1 - teta2)^2 + L1*m1^2*teta1d^2*sin(teta1) + L1*m2^2*teta1d^2*sin(teta1) + L2*m2^2*teta2d^2*sin(teta2) + g*m1^2*cos(teta1)*sin(teta1) + g*m2^2*cos(teta1)*sin(teta1) + g*m2^2*cos(teta2)*sin(teta2) - L1*m2^2*teta1d^2*sin(teta1 - teta2)*cos(teta2) + L2*m2^2*teta2d^2*sin(teta1 - teta2)*cos(teta1) + 2*L1*m1*m2*teta1d^2*sin(teta1) + L2*m1*m2*teta2d^2*sin(teta2) - g*m2^2*cos(teta1 - teta2)*cos(teta1)*sin(teta2) - g*m2^2*cos(teta1 - teta2)*cos(teta2)*sin(teta1) + 2*g*m1*m2*cos(teta1)*sin(teta1) + g*m1*m2*cos(teta2)*sin(teta2) - L1*m2^2*teta1d^2*cos(teta1 - teta2)^2*sin(teta1) - L2*m2^2*teta2d^2*cos(teta1 - teta2)^2*sin(teta2) + L1*m2^2*teta1d^2*cos(teta1 - teta2)*sin(teta1 - teta2)*cos(teta1) - L2*m2^2*teta2d^2*cos(teta1 - teta2)*sin(teta1 - teta2)*cos(teta2) - L1*m1*m2*teta1d^2*sin(teta1 - teta2)*cos(teta2) + L2*m1*m2*teta2d^2*sin(teta1 - teta2)*cos(teta1) - g*m1*m2*cos(teta1 - teta2)*cos(teta1)*sin(teta2) - g*m1*m2*cos(teta1 - teta2)*cos(teta2)*sin(teta1) - L1*m1*m2*teta1d^2*cos(teta1 - teta2)^2*sin(teta1) + L1*m1*m2*teta1d^2*cos(teta1 - teta2)*sin(teta1 - teta2)*cos(teta1))/(m1^2*cos(teta1)^2 - M*m2 - 2*m1*m2 - M*m1 + m2^2*cos(teta1)^2 + m2^2*cos(teta2)^2 + m2^2*cos(teta1 - teta2)^2 - m1^2 - m2^2 + 2*m1*m2*cos(teta1)^2 + m1*m2*cos(teta2)^2 + M*m2*cos(teta1 - teta2)^2 + m1*m2*cos(teta1 - teta2)^2 - 2*m2^2*cos(teta1 - teta2)*cos(teta1)*cos(teta2) - 2*m1*m2*cos(teta1 - teta2)*cos(teta1)*cos(teta2));
 
f3=@(t,x,xd,teta1,teta1d,teta2,teta2d) teta1d;
f4=@(t,x,xd,teta1,teta1d,teta2,teta2d) (f*m1*cos(teta1) + f*m2*cos(teta1) + g*m1^2*sin(teta1) + g*m2^2*sin(teta1) - f*m2*cos(teta1 - teta2)*cos(teta2) + L2*m2^2*teta2d^2*sin(teta1 - teta2) + M*g*m1*sin(teta1) + M*g*m2*sin(teta1) - g*m2^2*cos(teta1 - teta2)*sin(teta2) + 2*g*m1*m2*sin(teta1) - g*m2^2*cos(teta2)^2*sin(teta1) + L1*m1^2*teta1d^2*cos(teta1)*sin(teta1) + L1*m2^2*teta1d^2*cos(teta1)*sin(teta1) + L2*m2^2*teta2d^2*cos(teta1)*sin(teta2) + g*m2^2*cos(teta1)*cos(teta2)*sin(teta2) + L2*M*m2*teta2d^2*sin(teta1 - teta2) + L1*m2^2*teta1d^2*cos(teta1 - teta2)*sin(teta1 - teta2) - M*g*m2*cos(teta1 - teta2)*sin(teta2) + L2*m1*m2*teta2d^2*sin(teta1 - teta2) - g*m1*m2*cos(teta1 - teta2)*sin(teta2) - L2*m2^2*teta2d^2*sin(teta1 - teta2)*cos(teta2)^2 - g*m1*m2*cos(teta2)^2*sin(teta1) - L1*m2^2*teta1d^2*cos(teta1 - teta2)*cos(teta2)*sin(teta1) - L1*m2^2*teta1d^2*sin(teta1 - teta2)*cos(teta1)*cos(teta2) - L2*m2^2*teta2d^2*cos(teta1 - teta2)*cos(teta2)*sin(teta2) + 2*L1*m1*m2*teta1d^2*cos(teta1)*sin(teta1) + L2*m1*m2*teta2d^2*cos(teta1)*sin(teta2) + g*m1*m2*cos(teta1)*cos(teta2)*sin(teta2) + L1*M*m2*teta1d^2*cos(teta1 - teta2)*sin(teta1 - teta2) + L1*m1*m2*teta1d^2*cos(teta1 - teta2)*sin(teta1 - teta2) - L1*m1*m2*teta1d^2*cos(teta1 - teta2)*cos(teta2)*sin(teta1) - L1*m1*m2*teta1d^2*sin(teta1 - teta2)*cos(teta1)*cos(teta2))/(L1*(m1^2*cos(teta1)^2 - M*m2 - 2*m1*m2 - M*m1 + m2^2*cos(teta1)^2 + m2^2*cos(teta2)^2 + m2^2*cos(teta1 - teta2)^2 - m1^2 - m2^2 + 2*m1*m2*cos(teta1)^2 + m1*m2*cos(teta2)^2 + M*m2*cos(teta1 - teta2)^2 + m1*m2*cos(teta1 - teta2)^2 - 2*m2^2*cos(teta1 - teta2)*cos(teta1)*cos(teta2) - 2*m1*m2*cos(teta1 - teta2)*cos(teta1)*cos(teta2)));
 
f5=@(t,x,xd,teta1,teta1d,teta2,teta2d) teta2d;
f6=@(t,x,xd,teta1,teta1d,teta2,teta2d) -(f*m1*cos(teta1 - teta2)*cos(teta1) - f*m2*cos(teta2) - g*m1^2*sin(teta2) - g*m2^2*sin(teta2) - f*m1*cos(teta2) + f*m2*cos(teta1 - teta2)*cos(teta1) + L1*m1^2*teta1d^2*sin(teta1 - teta2) + L1*m2^2*teta1d^2*sin(teta1 - teta2) - M*g*m1*sin(teta2) - M*g*m2*sin(teta2) + g*m1^2*cos(teta1 - teta2)*sin(teta1) + g*m2^2*cos(teta1 - teta2)*sin(teta1) - 2*g*m1*m2*sin(teta2) + g*m1^2*cos(teta1)^2*sin(teta2) + g*m2^2*cos(teta1)^2*sin(teta2) - L1*m1^2*teta1d^2*cos(teta2)*sin(teta1) - L1*m2^2*teta1d^2*cos(teta2)*sin(teta1) - L2*m2^2*teta2d^2*cos(teta2)*sin(teta2) - g*m1^2*cos(teta1)*cos(teta2)*sin(teta1) - g*m2^2*cos(teta1)*cos(teta2)*sin(teta1) + L1*M*m1*teta1d^2*sin(teta1 - teta2) + L1*M*m2*teta1d^2*sin(teta1 - teta2) + L2*m2^2*teta2d^2*cos(teta1 - teta2)*sin(teta1 - teta2) + M*g*m1*cos(teta1 - teta2)*sin(teta1) + M*g*m2*cos(teta1 - teta2)*sin(teta1) + 2*L1*m1*m2*teta1d^2*sin(teta1 - teta2) + 2*g*m1*m2*cos(teta1 - teta2)*sin(teta1) - L1*m1^2*teta1d^2*sin(teta1 - teta2)*cos(teta1)^2 - L1*m2^2*teta1d^2*sin(teta1 - teta2)*cos(teta1)^2 + 2*g*m1*m2*cos(teta1)^2*sin(teta2) + L1*m1^2*teta1d^2*cos(teta1 - teta2)*cos(teta1)*sin(teta1) + L1*m2^2*teta1d^2*cos(teta1 - teta2)*cos(teta1)*sin(teta1) + L2*m2^2*teta2d^2*cos(teta1 - teta2)*cos(teta1)*sin(teta2) - L2*m2^2*teta2d^2*sin(teta1 - teta2)*cos(teta1)*cos(teta2) - 2*L1*m1*m2*teta1d^2*cos(teta2)*sin(teta1) - L2*m1*m2*teta2d^2*cos(teta2)*sin(teta2) - 2*g*m1*m2*cos(teta1)*cos(teta2)*sin(teta1) + L2*M*m2*teta2d^2*cos(teta1 - teta2)*sin(teta1 - teta2) + L2*m1*m2*teta2d^2*cos(teta1 - teta2)*sin(teta1 - teta2) - 2*L1*m1*m2*teta1d^2*sin(teta1 - teta2)*cos(teta1)^2 + 2*L1*m1*m2*teta1d^2*cos(teta1 - teta2)*cos(teta1)*sin(teta1) + L2*m1*m2*teta2d^2*cos(teta1 - teta2)*cos(teta1)*sin(teta2) - L2*m1*m2*teta2d^2*sin(teta1 - teta2)*cos(teta1)*cos(teta2))/(L2*(m1^2*cos(teta1)^2 - M*m2 - 2*m1*m2 - M*m1 + m2^2*cos(teta1)^2 + m2^2*cos(teta2)^2 + m2^2*cos(teta1 - teta2)^2 - m1^2 - m2^2 + 2*m1*m2*cos(teta1)^2 + m1*m2*cos(teta2)^2 + M*m2*cos(teta1 - teta2)^2 + m1*m2*cos(teta1 - teta2)^2 - 2*m2^2*cos(teta1 - teta2)*cos(teta1)*cos(teta2) - 2*m1*m2*cos(teta1 - teta2)*cos(teta1)*cos(teta2)));
 
for i=1:n
    
%time update
t(i+1)=t(i)+H;

% First Coefficients
k11=H*f1(t(i),x(i),xd(i),teta1(i),teta1d(i),teta2(i),teta2d(i));
k12=H*f2(t(i),x(i),xd(i),teta1(i),teta1d(i),teta2(i),teta2d(i));
k13=H*f3(t(i),x(i),xd(i),teta1(i),teta1d(i),teta2(i),teta2d(i));
k14=H*f4(t(i),x(i),xd(i),teta1(i),teta1d(i),teta2(i),teta2d(i));
k15=H*f5(t(i),x(i),xd(i),teta1(i),teta1d(i),teta2(i),teta2d(i));
k16=H*f6(t(i),x(i),xd(i),teta1(i),teta1d(i),teta2(i),teta2d(i));

% Second Coefficients
k21=H*f1(t(i)+1/2*H,x(i)+1/2*k11,xd(i)+1/2*k12,teta1(i)+1/2*k13,teta1d(i)+1/2*k14,teta2(i)+1/2*k15,teta2d(i)+1/2*k16);
k22=H*f2(t(i)+1/2*H,x(i)+1/2*k11,xd(i)+1/2*k12,teta1(i)+1/2*k13,teta1d(i)+1/2*k14,teta2(i)+1/2*k15,teta2d(i)+1/2*k16);
k23=H*f3(t(i)+1/2*H,x(i)+1/2*k11,xd(i)+1/2*k12,teta1(i)+1/2*k13,teta1d(i)+1/2*k14,teta2(i)+1/2*k15,teta2d(i)+1/2*k16);
k24=H*f4(t(i)+1/2*H,x(i)+1/2*k11,xd(i)+1/2*k12,teta1(i)+1/2*k13,teta1d(i)+1/2*k14,teta2(i)+1/2*k15,teta2d(i)+1/2*k16);
k25=H*f5(t(i)+1/2*H,x(i)+1/2*k11,xd(i)+1/2*k12,teta1(i)+1/2*k13,teta1d(i)+1/2*k14,teta2(i)+1/2*k15,teta2d(i)+1/2*k16);
k26=H*f6(t(i)+1/2*H,x(i)+1/2*k11,xd(i)+1/2*k12,teta1(i)+1/2*k13,teta1d(i)+1/2*k14,teta2(i)+1/2*k15,teta2d(i)+1/2*k16);

% Third Coefficients
k31=H*f1(t(i)+1/2*H,x(i)+1/2*k21,xd(i)+1/2*k22,teta1(i)+1/2*k23,teta1d(i)+1/2*k24,teta2(i)+1/2*k25,teta2d(i)+1/2*k26);
k32=H*f2(t(i)+1/2*H,x(i)+1/2*k21,xd(i)+1/2*k22,teta1(i)+1/2*k23,teta1d(i)+1/2*k24,teta2(i)+1/2*k25,teta2d(i)+1/2*k26);
k33=H*f3(t(i)+1/2*H,x(i)+1/2*k21,xd(i)+1/2*k22,teta1(i)+1/2*k23,teta1d(i)+1/2*k24,teta2(i)+1/2*k25,teta2d(i)+1/2*k26);
k34=H*f4(t(i)+1/2*H,x(i)+1/2*k21,xd(i)+1/2*k22,teta1(i)+1/2*k23,teta1d(i)+1/2*k24,teta2(i)+1/2*k25,teta2d(i)+1/2*k26);
k35=H*f5(t(i)+1/2*H,x(i)+1/2*k21,xd(i)+1/2*k22,teta1(i)+1/2*k23,teta1d(i)+1/2*k24,teta2(i)+1/2*k25,teta2d(i)+1/2*k26);
k36=H*f6(t(i)+1/2*H,x(i)+1/2*k21,xd(i)+1/2*k22,teta1(i)+1/2*k23,teta1d(i)+1/2*k24,teta2(i)+1/2*k25,teta2d(i)+1/2*k26);
% Fourth Coefficients
k41=H*f1(t(i)+H,x(i)+k31,xd(i)+k32,teta1(i)+k33,teta1d(i)+k34,teta2(i)+k35,teta2d(i)+k36);
k42=H*f2(t(i)+H,x(i)+k31,xd(i)+k32,teta1(i)+k33,teta1d(i)+k34,teta2(i)+k35,teta2d(i)+k36);
k43=H*f3(t(i)+H,x(i)+k31,xd(i)+k32,teta1(i)+k33,teta1d(i)+k34,teta2(i)+k35,teta2d(i)+k36);
k44=H*f4(t(i)+H,x(i)+k31,xd(i)+k32,teta1(i)+k33,teta1d(i)+k34,teta2(i)+k35,teta2d(i)+k36);
k45=H*f5(t(i)+H,x(i)+k31,xd(i)+k32,teta1(i)+k33,teta1d(i)+k34,teta2(i)+k35,teta2d(i)+k36);
k46=H*f6(t(i)+H,x(i)+k31,xd(i)+k32,teta1(i)+k33,teta1d(i)+k34,teta2(i)+k35,teta2d(i)+k36);

% Evaluating m1
x(i+1)=x(i)+1/6*(k11+2*k21+2*k31+k41);
xd(i+1)=xd(i)+1/6*(k12+2*k22+2*k32+k42);
teta1(i+1)=teta1(i)+1/6*(k13+2*k23+2*k33+k43);
teta1d(i+1)=teta1d(i)+1/6*(k14+2*k24+2*k34+k44);
teta2(i+1)=teta2(i)+1/6*(k15+2*k25+2*k35+k45);
teta2d(i+1)=teta2d(i)+1/6*(k16+2*k26+2*k36+k46);
x1(i+1)=x(i)+L1*sin(teta1(i));
y1(i+1)=-L1*cos(teta1(i));
x2(i+1)=x1(i)+L2*sin(teta2(i));
y2(i+1)=y1(i)-L2*cos(teta2(i));
end

subplot(3,3,1)
plot(t,y1,'linewidth',3,'color','red')
xlabel('t')
ylabel('y1')
grid on 

subplot(3,3,5)
plot(t,y2,'linewidth',3,'color','yellow')
xlabel('t')
ylabel('y2')
grid on 


subplot(3,3,2)
plot(t,x1,'linewidth',3,'color','red')
xlabel('t')
ylabel('x1')
grid on 


subplot(3,3,4)
plot(x2,y2,'linewidth',3,'color','yellow')
xlabel('x2')
ylabel('y2')
grid on 

subplot(3,3,3)
plot(x1,y1,'linewidth',3,'color','red')
xlabel('x1')
ylabel('y1')
grid on 

subplot(3,3,6)
plot(t,x2,'linewidth',3,'color','yellow')
xlabel('t2')
ylabel('x2')
grid on 

subplot(3,3,7)
plot(t,x,'linewidth',3,'color','green')
xlabel('t')
ylabel('x crane')
grid on 




