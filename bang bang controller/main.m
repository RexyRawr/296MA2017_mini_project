%ME 296MA Final Project
%Smart Exercise Controller
%12/4/2017

clear
clc
close all

%intial parameters

RPM=20; %INPUT START SPEED HERE
resistance=getMagnitude; %start with a random resistance
t=0; %start at time zero
RPM_goal=60; %ideal RPMs

time_to_test=200; %%%INPUT TIME INTERVAL HERE
deltaT=1; %time change

figure
hold on

force=getMagnitude; %%initialize a random force for the user

while t<=time_to_test 

%calculate new RPMs of user
alpha=acceleration(force,resistance);
RPM=riderSpeed(alpha, RPM,deltaT);

%change in resistance
resistance=machine(force, resistance, RPM, RPM_goal);

%plot
plot(t,RPM,'r*')
plot(t,resistance,'*b')

t=t+deltaT; %timestep

end

legend('RPM','resistance')
xlabel('time')
ylabel('magnitude')