% It calculates ODE 2 using Runge-Kutta 4th order method
% Author Minhnha Pham

% ODE 2: dy2/dx2+dy/dx-6y = 0; y(0) = 3; y'(0) = 1
% => system: 
% dy/dx=z
% dz/dx=6y-z with y(0) = 3; z(0) = 1
% The exact solution is y(x)=e^-3x+2e^2x
% y(1) = 14.827899266...




clc;                                               % Clears the screen
clear all;

h=0.1;                                             % step size
x = 0:h:1;                                         % Calculates upto y(1)
y = zeros(1,length(x)); 
z = zeros(1,length(x)); 
y(1) = 3;                                          % initial condition
z(1) = 1;                                          % initial condition
% F_xy = @(t,r) 3.*exp(-t)-0.4*r;                  % change the function as you desire
F_xyz = @(x,y,z) z;                                  % change the function as you desire
G_xyz = @(x,y,z) 6*y-z;   % la 1 dang chuong trinh con rut ngan, 
                            % F_xyz la 1 ham cua xyz, co gia tri la z. Sau nay
                            % goi den F_xyz thi tu dong hieu la z. Tuong tu
                            % voi G_xyz

for i=1:(length(x)-1)                              % calculation loop
    k_1 = h*F_xyz(x(i),y(i),z(i));
    L_1 = h*G_xyz(x(i),y(i),z(i));
    k_2 = h*F_xyz(x(i)+0.5*h,y(i)+0.5*k_1,z(i)+0.5*L_1);
    L_2 = h*G_xyz(x(i)+0.5*h,y(i)+0.5*k_1,z(i)+0.5*L_1);
    k_3 = h*F_xyz((x(i)+0.5*h),(y(i)+0.5*k_2),(z(i)+0.5*L_2));
    L_3 = h*G_xyz((x(i)+0.5*h),(y(i)+0.5*k_2),(z(i)+0.5*L_2));
    k_4 = h*F_xyz((x(i)+h),(y(i)+k_3),(z(i)+L_3)); % Corrected        
    L_4 = h*G_xyz((x(i)+h),(y(i)+k_3),(z(i)+L_3));

    y(i+1) = y(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4);  % main equation
    z(i+1) = z(i) + (1/6)*(L_1+2*L_2+2*L_3+L_4);  % main equation

end
plot(x,y)
y