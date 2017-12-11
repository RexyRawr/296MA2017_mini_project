clear
clc
close all
%% bike&user initial conditions/ parameters

global I r
M_wheel = 5;                    % mass of wheel [kg]
M_bar = 0.5;                    % mass of bar [kg]
M_pedals = 0.4;                 % mass of pedals [kg]
r = 0.2;                        % radius [m]

I_wheel = M_wheel*r^2/2;        % moment of inertia, wheel
I_bar = M_bar*r^2/3;            % moment of inertia, bar
I_pedals = M_pedals*r^2;        % moment of inertia, pedal
I = I_wheel+I_bar+I_pedals;     % moment of inertia

w_opt=6.2;                      % radius/s
w_0=3;                          % initial angular velocity
w(1)=w_0;                       % array of angular velocity
n=2;
M=50;                        % mean of user's force
Var=10;
%% Control

w_current=w_0;                  % set initial condition
R=2;
F=50;

for i=1:1000                              
    if F>=5 && abs(w_opt-w_current)>0.2
        R_old=R;
        R=F-(w_opt-w_current)/w_opt*M;
        if R>100
            R=100;
        elseif R<10
            R=10;
        end
        R_diff=R-R_old;
        w_current=getvelocity(R_diff,w_current);    % calculate the new velocity
        w(n)=w_current;                             % save the velocity
        R_h(n-1)=R;
        n=n+1;
    elseif F>=5 && abs(w_opt-w_current)<=0.2
        R_old=R;
        R=F;
        if R>100                                    % maximum resistance
            R=100;
        elseif R<10                                 % minimum resistance
            R=10;
        end
        R_diff=R-R_old;
        w_current=getvelocity(R_diff,w_current);    % calculate the new velocity
        w(n)=w_current;                             % save the velocity
        R_h(n-1)=R;
        n=n+1;
    elseif F<5
        break
    end
    F=random('normal',M,Var,1,1); 
end
%% Plot

mean(w)
figure(1)
plot(0:0.1:(n-2)/10,w,'r-')
figure(2)
plot(0:0.1:(n-3)/10,R_h,'b-')