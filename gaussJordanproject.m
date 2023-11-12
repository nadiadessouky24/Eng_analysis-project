function X = gaussJordan(A, B)
    [m,n] = size(A);

    % Augment the matrix [A | B]
    AugmentedMatrix = [A, B];

    % Perform forward elimination
    for i = 1:m
        % Find the pivot element
        pivot = AugmentedMatrix(i, i);

        % Divide the current row by the pivot element to make it 1
        AugmentedMatrix(i, :) = AugmentedMatrix(i, :) / pivot;

        % Eliminate other rows
        for j = 1:m
            if i ~= j
                factor = AugmentedMatrix(j, i);
                AugmentedMatrix(j, :) = AugmentedMatrix(j, :) - factor * AugmentedMatrix(i, :);
            end
        end
    end

    % Extract the solution
    X = AugmentedMatrix(:,end);
end

