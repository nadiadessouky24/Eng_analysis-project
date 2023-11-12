function x = predict_theta(R, C, e, alpha, tolerance)
    % Function to predict the angle θ for a given radius R using the bisection method.
    
    % Initial interval for bisection method
    theta_lower = 0;  
    theta_upper = 1.74539;   
    
    f = @(theta) C / (1 + e * sin(theta + alpha)) - R;
    
    % Check if the function has different signs at the interval endpoints
    test = f(theta_lower) * f(theta_upper);
    
    if test > 0
            theta_lower = - 1.74539;  
            theta_upper = 0;
            test = f(theta_lower) * f(theta_upper);

            if test > 0
              error("bisection method fails - no sign change");  
            end
    end
    
    % Bisection method to find θ
    while (theta_upper - theta_lower) / 2 > tolerance
        theta_mid = (theta_lower + theta_upper) / 2;
        f_mid = f(theta_mid);
        
        if f_mid == 0
            break;  % Exact root found
        elseif sign(f_mid) == sign(f(theta_lower))
            theta_lower = theta_mid;
        else
            theta_upper = theta_mid;
        end
    end
    
    % The midpoint is the predicted θ in radians
    predicted_theta_radians = (theta_lower + theta_upper) / 2;
    
    % Convert θ from radians to degrees
    predicted_theta = rad2deg(predicted_theta_radians);
    x = rad2deg( predicted_theta_radians);
end
