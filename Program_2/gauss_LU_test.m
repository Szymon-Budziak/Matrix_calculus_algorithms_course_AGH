rng(101, 'twister')
matrix_size = 1000;
A = randi([0 100], matrix_size, matrix_size);
A = double(A); 

B = randi([0 100], matrix_size, 1);
B = double(B);

% Gram-Schmidt process to make the columns of A linearly independent
for i = 1:size(A, 2)
    for j = 1:(i-1)
        A(:, i) = A(:, i) - (A(:, i)' * A(:, j)) / (A(:, j)' * A(:, j)) * A(:, j);
    end
end

tic;

% Perform LU factorization
[L, U] = lu(A);

% Solve the system LUx = b for x
% First, solve Ly = b for y
y = L \ B;

% Then, solve Ux = y for x
x = U \ y;

elapsedTime = toc;
disp(['Elapsed time: ', num2str(elapsedTime), ' seconds']);
