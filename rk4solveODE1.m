% It calculates ODE 1 using Runge-Kutta 4th order method
% Author Minhnha Pham

% ODE 1: dx/dt=3/(2*t^2)+x/(2*t) = 0; x(1)=0;
% The exact solution is x(t) = sqrt(t)-1/t





clc;                                               % Clears the screen
clear all;

h=0.001;                                             % step size
t = 1:h:10;                                         % Calculates upto y(1)
x = zeros(1,length(t)); 

x(1) = 0;                                          % initial condition


F_xt = @(t,x) 3/(2*t*t)+x/(2*t);                                  % change the function as you desire
                             % la 1 dang chuong trinh con rut ngan, 
                            % F_xyz la 1 ham cua xyz, co gia tri la z. Sau nay
                            % goi den F_xyz thi tu dong hieu la z. Tuong tu
                            % voi G_xyz
                            % @(variable, variable,..) should be persist
                            % order when you input in program.

for i=1:(length(t)-1)                              % calculation loop
    k_1 = h*F_xt(t(i),x(i));
    
    k_2 = h*F_xt(t(i)+0.5*h,x(i)+0.5*k_1);
    
    k_3 = h*F_xt((t(i)+0.5*h),(x(i)+0.5*k_2));
    
    k_4 = h*F_xt((t(i)+h),(x(i)+k_3));        
    
    x(i+1) = x(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4);  % main equation
    

end
plot(t,x)