clc; clear;

i = 1;
X = zeros;
counter = 0;
Y = 0;

%input values
R1 = input("Enter Radius 1: ");

R2 = input("Enter Radius 2: ");

R3 = input("Enter Radius 3: ");

theta_deg1 = input("Enter Theta 1 in degrees: ");

theta_deg2 = input("Enter Theta 2 in degrees: ");

theta_deg3 = input("Enter Theta 3 in degrees: ");

Stopping_criteria = input("Enter the stopping criterion: ");

%convert from degrees to radians 
theta_rad1 = deg2rad(theta_deg1);
theta_rad2 = deg2rad(theta_deg2);
theta_rad3 = deg2rad(theta_deg3);

%calculations of initial guesses 
e = 0.5;
alpha = (theta_rad1+theta_rad2+theta_rad3)/3;
C = (R1 + R2 +R3)/3;

%input value from the user
z = input('Gauss-Jordan (1), Cramer (2), Elimination (3): ');

% put the values in an array to plot
R = [R1 R2 R3];
theta_rad = [theta_rad1 theta_rad2 theta_rad3];

%loop infintley to perform newton raphson and calculate error by method in
%chosen by user stop when error is the one entered by the user
while (1)
    
    %calculation of the jacobian 
    J = [(R1*e*cos(theta_rad1+alpha)) (R1*sin(theta_rad1+alpha)) (-1); 
        (R2*e*cos(theta_rad2+alpha)) R2*sin(theta_rad2+alpha) (-1); 
        (R3*e*cos(theta_rad3+alpha)) (R3*sin(theta_rad3+alpha)) (-1)];

        u_i = R1 + (R1 * e * sin(theta_rad1 + alpha)) - C;
        v_i = R2 + (R2 * e * sin(theta_rad2 + alpha)) - C;
        w_i = R3 + (R3 * e * sin(theta_rad3 + alpha)) - C;
        
        %matrix of equations 
        F_i = [u_i; v_i; w_i];
    
    %method chosen by the user 
    if (z == 1)
            X = gaussJordanproject(J,F_i);
    end
    if (z == 2)
            X = cramerproject(J,F_i);
    end
     if (z == 3)
            X = naiveguassproject(J,F_i);
     end

     %calculation of new value of alpha, e and C
       alpha_new = alpha-X(1);
       e_new = e-X(2);
       C_new = C-X(3);

      %calculation of error of alpha, e and C and place it in the array
      ea_alpha(i)= abs(((alpha_new-alpha)/alpha_new)*100);
      ea_e(i) = abs(((e_new-e)/e_new)*100);
      ea_C(i) = abs(((C_new-C)/C_new)*100);
        
    %check if error reaches the stopping criteria 
    if ((ea_alpha(i) < Stopping_criteria)&&(ea_e(i) < Stopping_criteria)&&(ea_C(i) < Stopping_criteria))
        break
    end
    
    %assign the new value 
    alpha = alpha_new;
    e = e_new;
    C = C_new;

    i=i+1;

    counter = counter +1;

end


disp("number of loops: ");
disp(counter);
disp("value of alpha in degrees is: ");
d = rad2deg(alpha);
disp(d);
disp("value of e is: ");
disp(e);
disp("value of C is: ");
disp(C);

projectplotting01 (ea_C, ea_e , ea_alpha , R, theta_rad, i,C,e,alpha)

B = input("Do you wish to calculate the angle theta, enter 1 for yes and 0 for no: ");

if (B==1)
    Rad = input ("Enter radius: ");
    Y = predict_theta(Rad, C, e, alpha, Stopping_criteria);
    disp("The angle in degrees is: ");
    disp(Y);
end

if (B==0)
    disp("End of Project");
end 
