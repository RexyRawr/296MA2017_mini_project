function [R]=getresistance(w_current,w_opt,F)

R=F-(w_opt-w_current)/w_opt*50;  % the resistance is calculated according to velocity and force, and assuming the resistance can reach the new value in short time
if R<=5              
    R=5;            % the minumum resistance
elseif R>=100
    R=100;          % the maximum resistance of the damper
end

end