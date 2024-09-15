clc;
clear;
close all;

%constants
m1=1000;
m2=1;
G=10;

%initial time
t(1)=0;    
%final time
tf=5;
%step size
H=0.0001;
%number of steps
n=(tf-t(1))/H;


%initial values
x1=zeros(1,n);
v1x=zeros(1,n);
y1=zeros(1,n);
v1y=zeros(1,n);
x2=zeros(1,n);
v2x=zeros(1,n);
y2=zeros(1,n);
v2y=zeros(1,n);
t=zeros(1,n);


%initial conditions
x1(1)=30;        
v1x(1)=0;       
y1(1)=20;       
v1y(1)=0;       
x2(1)=10;     
v2x(1)=15;       
y2(1)=10;        
v2y(1)=0;        



%functions
f1=@(t,x1,v1x,y1,v1y,x2,v2x,y2,v2y) v1x;
f2=@(t,x1,v1x,y1,v1y,x2,v2x,y2,v2y) (G*m2*(x2-x1))/(((x2-x1)^2+(y2-y1)^2)^1.5);
f3=@(t,x1,v1x,y1,v1y,x2,v2x,y2,v2y) v1y;
f4=@(t,x1,v1x,y1,v1y,x2,v2x,y2,v2y) (G*m2*(y2-y1))/(((x2-x1)^2+(y2-y1)^2)^1.5);
f5=@(t,x1,v1x,y1,v1y,x2,v2x,y2,v2y) v2x;
f6=@(t,x1,v1x,y1,v1y,x2,v2x,y2,v2y) (G*m1*(x1-x2))/(((x2-x1)^2+(y2-y1)^2)^1.5);
f7=@(t,x1,v1x,y1,v1y,x2,v2x,y2,v2y) v2y;
f8=@(t,x1,v1x,y1,v1y,x2,v2x,y2,v2y) (G*m1*(y1-y2))/(((x2-x1)^2+(y2-y1)^2)^1.5);


for i=1:n
t(i+1)=t(i)+H;




% First Coefficients
k11=H*f1(t(i),x1(i),v1x(i),y1(i),v1y(i),x2(i),v2x(i),y2(i),v2y(i));
k12=H*f2(t(i),x1(i),v1x(i),y1(i),v1y(i),x2(i),v2x(i),y2(i),v2y(i));
k13=H*f3(t(i),x1(i),v1x(i),y1(i),v1y(i),x2(i),v2x(i),y2(i),v2y(i));
k14=H*f4(t(i),x1(i),v1x(i),y1(i),v1y(i),x2(i),v2x(i),y2(i),v2y(i));
k15=H*f5(t(i),x1(i),v1x(i),y1(i),v1y(i),x2(i),v2x(i),y2(i),v2y(i));
k16=H*f6(t(i),x1(i),v1x(i),y1(i),v1y(i),x2(i),v2x(i),y2(i),v2y(i));
k17=H*f7(t(i),x1(i),v1x(i),y1(i),v1y(i),x2(i),v2x(i),y2(i),v2y(i));
k18=H*f8(t(i),x1(i),v1x(i),y1(i),v1y(i),x2(i),v2x(i),y2(i),v2y(i));

% Second Coefficients
k21=H*f1(t(i)+1/2*H,x1(i)+1/2*k11,v1x(i)+1/2*k12,y1(i)+1/2*k13,v1y(i)+1/2*k14,x2(i)+1/2*k15,v2x(i)+1/2*k16,y2(i)+1/2*k17,v2y(i)+1/2*k18);
k22=H*f2(t(i)+1/2*H,x1(i)+1/2*k11,v1x(i)+1/2*k12,y1(i)+1/2*k13,v1y(i)+1/2*k14,x2(i)+1/2*k15,v2x(i)+1/2*k16,y2(i)+1/2*k17,v2y(i)+1/2*k18);
k23=H*f3(t(i)+1/2*H,x1(i)+1/2*k11,v1x(i)+1/2*k12,y1(i)+1/2*k13,v1y(i)+1/2*k14,x2(i)+1/2*k15,v2x(i)+1/2*k16,y2(i)+1/2*k17,v2y(i)+1/2*k18);
k24=H*f4(t(i)+1/2*H,x1(i)+1/2*k11,v1x(i)+1/2*k12,y1(i)+1/2*k13,v1y(i)+1/2*k14,x2(i)+1/2*k15,v2x(i)+1/2*k16,y2(i)+1/2*k17,v2y(i)+1/2*k18);
k25=H*f5(t(i)+1/2*H,x1(i)+1/2*k11,v1x(i)+1/2*k12,y1(i)+1/2*k13,v1y(i)+1/2*k14,x2(i)+1/2*k15,v2x(i)+1/2*k16,y2(i)+1/2*k17,v2y(i)+1/2*k18);
k26=H*f6(t(i)+1/2*H,x1(i)+1/2*k11,v1x(i)+1/2*k12,y1(i)+1/2*k13,v1y(i)+1/2*k14,x2(i)+1/2*k15,v2x(i)+1/2*k16,y2(i)+1/2*k17,v2y(i)+1/2*k18);
k27=H*f7(t(i)+1/2*H,x1(i)+1/2*k11,v1x(i)+1/2*k12,y1(i)+1/2*k13,v1y(i)+1/2*k14,x2(i)+1/2*k15,v2x(i)+1/2*k16,y2(i)+1/2*k17,v2y(i)+1/2*k18);
k28=H*f8(t(i)+1/2*H,x1(i)+1/2*k11,v1x(i)+1/2*k12,y1(i)+1/2*k13,v1y(i)+1/2*k14,x2(i)+1/2*k15,v2x(i)+1/2*k16,y2(i)+1/2*k17,v2y(i)+1/2*k18);

% Third Coefficients
k31=H*f1(t(i)+1/2*H,x1(i)+1/2*k21,v1x(i)+1/2*k22,y1(i)+1/2*k23,v1y(i)+1/2*k24,x2(i)+1/2*k25,v2x(i)+1/2*k26,y2(i)+1/2*k27,v2y(i)+1/2*k28);
k32=H*f2(t(i)+1/2*H,x1(i)+1/2*k21,v1x(i)+1/2*k22,y1(i)+1/2*k23,v1y(i)+1/2*k24,x2(i)+1/2*k25,v2x(i)+1/2*k26,y2(i)+1/2*k27,v2y(i)+1/2*k28);
k33=H*f3(t(i)+1/2*H,x1(i)+1/2*k21,v1x(i)+1/2*k22,y1(i)+1/2*k23,v1y(i)+1/2*k24,x2(i)+1/2*k25,v2x(i)+1/2*k26,y2(i)+1/2*k27,v2y(i)+1/2*k28);
k34=H*f4(t(i)+1/2*H,x1(i)+1/2*k21,v1x(i)+1/2*k22,y1(i)+1/2*k23,v1y(i)+1/2*k24,x2(i)+1/2*k25,v2x(i)+1/2*k26,y2(i)+1/2*k27,v2y(i)+1/2*k28);
k35=H*f5(t(i)+1/2*H,x1(i)+1/2*k21,v1x(i)+1/2*k22,y1(i)+1/2*k23,v1y(i)+1/2*k24,x2(i)+1/2*k25,v2x(i)+1/2*k26,y2(i)+1/2*k27,v2y(i)+1/2*k28);
k36=H*f6(t(i)+1/2*H,x1(i)+1/2*k21,v1x(i)+1/2*k22,y1(i)+1/2*k23,v1y(i)+1/2*k24,x2(i)+1/2*k25,v2x(i)+1/2*k26,y2(i)+1/2*k27,v2y(i)+1/2*k28);
k37=H*f7(t(i)+1/2*H,x1(i)+1/2*k21,v1x(i)+1/2*k22,y1(i)+1/2*k23,v1y(i)+1/2*k24,x2(i)+1/2*k25,v2x(i)+1/2*k26,y2(i)+1/2*k27,v2y(i)+1/2*k28);
k38=H*f8(t(i)+1/2*H,x1(i)+1/2*k21,v1x(i)+1/2*k22,y1(i)+1/2*k23,v1y(i)+1/2*k24,x2(i)+1/2*k25,v2x(i)+1/2*k26,y2(i)+1/2*k27,v2y(i)+1/2*k28);

% Fourth Coefficients
k41=H*f1(t(i)+H,x1(i)+k31,v1x(i)+k32,y1(i)+k33,v1y(i)+k34,x2(i)+k35,v2x(i)+k36,y2(i)+k37,v2y(i)+k38);
k42=H*f2(t(i)+H,x1(i)+k31,v1x(i)+k32,y1(i)+k33,v1y(i)+k34,x2(i)+k35,v2x(i)+k36,y2(i)+k37,v2y(i)+k38);
k43=H*f3(t(i)+H,x1(i)+k31,v1x(i)+k32,y1(i)+k33,v1y(i)+k34,x2(i)+k35,v2x(i)+k36,y2(i)+k37,v2y(i)+k38);
k44=H*f4(t(i)+H,x1(i)+k31,v1x(i)+k32,y1(i)+k33,v1y(i)+k34,x2(i)+k35,v2x(i)+k36,y2(i)+k37,v2y(i)+k38);
k45=H*f5(t(i)+H,x1(i)+k31,v1x(i)+k32,y1(i)+k33,v1y(i)+k34,x2(i)+k35,v2x(i)+k36,y2(i)+k37,v2y(i)+k38);
k46=H*f6(t(i)+H,x1(i)+k31,v1x(i)+k32,y1(i)+k33,v1y(i)+k34,x2(i)+k35,v2x(i)+k36,y2(i)+k37,v2y(i)+k38);
k47=H*f7(t(i)+H,x1(i)+k31,v1x(i)+k32,y1(i)+k33,v1y(i)+k34,x2(i)+k35,v2x(i)+k36,y2(i)+k37,v2y(i)+k38);
k48=H*f8(t(i)+H,x1(i)+k31,v1x(i)+k32,y1(i)+k33,v1y(i)+k34,x2(i)+k35,v2x(i)+k36,y2(i)+k37,v2y(i)+k38);


x1(i+1)=x1(i)+1/6*(k11+2*k21+2*k31+k41);
y1(i+1)=y1(i)+1/6*(k13+2*k23+2*k33+k43);
v1x(i+1)=v1x(i)+1/6*(k12+2*k22+2*k32+k42);
v1y(i+1)=v1y(i)+1/6*(k14+2*k24+2*k34+k44);


x2(i+1)=x2(i)+1/6*(k15+2*k25+2*k35+k45);
y2(i+1)=y2(i)+1/6*(k17+2*k27+2*k37+k47);
v2x(i+1)=v2x(i)+1/6*(k16+2*k26+2*k36+k46);
v2y(i+1)=v2y(i)+1/6*(k18+2*k28+2*k38+k48);

end

subplot(2,1,1)
comet(x1,y1)
grid on
subplot(2,1,2)
comet(y2,x2)
grid on



