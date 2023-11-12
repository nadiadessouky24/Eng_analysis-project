function X = naiveguassproject(A,b)
% This performs naive Gauss elimination
n = length(b) ;% number of equations
% Phase #1 forward elimination
for k =1:n-1 % Outer loop over the pivot equations
    for i = k+1:n % loop to eliminate what is below eqn k
        factor = A(i,k)/A(k,k);
        for j = k+1:n
            A(i,j)= A(i,j)-factor*A(k,j);
        end
        b(i)=b(i)-factor*b(k);
    end
end
%pahase #2 back substitution
X(n)=b(n)/A(n,n); % the lasdt unkown
for i = n-1:-1:1 %backward loop over rows
    my_sum = b(i);
    for j=i+1:n %sum
        my_sum = my_sum-A(i,j)*X(j);
    end
    X(i)= my_sum/A(i,i);
end