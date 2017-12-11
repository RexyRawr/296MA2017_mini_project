clear
clc
close all
%% bike&user initial conditions/ parameters

M_wheel = 5;                    % mass of wheel [kg]
M_bar = 0.5;                    % mass of bar [kg]
M_pedals = 0.4;                 % mass of pedals [kg]
r = 0.2;                        % radius [m]

I_wheel = M_wheel*r^2/2;        % moment of inertia, wheel
I_bar = M_bar*r^2/3;            % moment of inertia, bar
I_pedals = M_pedals*r^2;        % moment of inertia, pedal
I = I_wheel+I_bar+I_pedals;     % moment of inertia

w_opt=6.2;                      % optimal velocity of the user, radius/s
w_0=2;                          % initial angular velocity, radius/s
w(1)=w_0;                       % array of angular velocity to save the velocity
n=2;
%% Control

w_current=w_0;                  % set initial condition
delta_t=0.1;                    % check force and velocity every one second
t=0;
for i=1:100
    F=random('normal',50,10,1,1);    % generate the new force    
    if F<5                          % force is less than the minimum resistance, meaning the user no longer bike
        break
    else
    R=getresistance(w_current,w_opt,F);
    R_h(n-1)=R;
    a=(F-R)*r/I;
    w_current=w_current+a*delta_t;
    w(n)=w_current;
    n=n+1; 
    t=t+delta_t;
    end
end
%% Plot

mean(w)
figure(1)
plot(0:delta_t:(t+delta_t),w,'r-')
xlabel('time');ylabel('velocity');
figure(2)
plot(0:delta_t:t,R_h,'b-')
xlabel('time');ylabel('resistance');