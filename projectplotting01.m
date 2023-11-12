function projectplotting01 (C_error, e_error , alpha_error , R, theta_rad, i,C,e,alpha)

figure(1)
theta_rad = linspace(0, 2*pi, 100);
R =  C ./ (1 + e * sin(theta_rad + alpha));
polarplot(theta_rad,R); 
title('Radii vs. Theta');


figure(2)
iter=1:i; 
plot(iter, C_error, 'ro-' , iter, e_error, 'md-' , iter, alpha_error,'rd-');
title('Radii vs. Theta');
xlabel("number of iterations");
ylabel("error");