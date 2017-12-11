function [w_current]=getvelocity(R_diff,w_current)

global I r
t=0:0.001:0.1;   
w_initial=w_current;

[t,w]=ode45(@rhs,t,w_initial);

w_current=w(numel(t));
    function dwdt=rhs(t,w)
        dwdt = r/I*R_diff*(1-exp(-t/0.085));
    end
end