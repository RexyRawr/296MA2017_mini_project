function RPM=riderSpeed(alpha,RPM,deltaT);


deltaSpeed=alpha*deltaT; %change in speed over one time period 

rotations=deltaSpeed/(2*pi); %convert to rotations from radians

RPM=RPM+rotations; %new speed in rotations per minute


end