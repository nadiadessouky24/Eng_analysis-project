function x = Cramer_Rule(A, b)
    % Check if the matrix A is square
    [m, n] = size(A);
    if m ~= n
        error('Matrix A must be square.');
    end
    
    % Check if A is non-singular (its determinant is non-zero)
    if det(A) == 0
        error('Matrix A is singular; Cramer''s Rule cannot be applied.');
    end
    
    % Initialize the solution vector
    x = zeros(n, 1);
    
    % Loop through each variable and solve for it using Cramer's Rule
    for i = 1:n
        % Create a temporary matrix by replacing the i-th column with the column vector b
        temp_A = A;
        temp_A(:, i) = b;
        
        % Calculate the determinant of the temporary matrix and divide it by the determinant of A
        x(i) = det(temp_A) / det(A);
    end

end