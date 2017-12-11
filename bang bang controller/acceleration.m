function alpha=acceleration(force,resistance)

m_pedal=1;
m_bar=1;
m_wheel=1;

r=1; %radius of wheel and pedal

I_pedal=m_pedal*r^2;
I_bar=(1/3)*m_bar*r^2;
I_wheel=(1/4)*m_wheel*r^2;

I=I_pedal+I_bar+I_wheel;

netForce=force-resistance;
alpha=netForce/I;

end