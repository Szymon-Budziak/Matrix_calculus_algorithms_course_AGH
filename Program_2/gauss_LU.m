 % source: https://www.mathworks.com/matlabcentral/answers/43397-performing-gauss-elimination-with-matlab

A = [1 6 7 9; 
     8 4 8 5; 
     0 5 8 1; 
     3 8 3 3];

b = [2; 
     8; 
     9; 
     3];

tic;

% Perform LU factorization
[L, U] = lu(A);

% Solve the system LUx = b for x
x = U \ (L \ b);

elapsedTime = toc;
disp(['Elapsed time: ', num2str(elapsedTime), ' seconds']);

disp(x)
