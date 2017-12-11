function resistance=machine(force, resistance, RPM, RPM_goal);


if abs(RPM-RPM_goal) <1
    resistance=resistance;
    %resistance=force;
elseif abs(RPM-RPM_goal)>2 && RPM>RPM_goal
    resistance=resistance+1;
elseif abs(RPM-RPM_goal)>2 && RPM<RPM_goal
    if resistance<1    %don't let resistance go to zero
        resistance=1;
    else resistance=resistance-1;
    end
end

end