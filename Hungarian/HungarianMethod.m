function [solutionMatrix,solutionTotal] = HungarianMethod(squareMatrix)
% Semicompleted Hungarian Method script
% Can Solve 100x100 matrices about 50% of the time 
% 

A = squareMatrix;

l = size(A,1);

reducedA = Reduced_Mask(A);% Initial logical mask

solutionFound = false;

while ~solutionFound % runs until number of assignments is length l
    mask = reducedA == 0 ; % converting reduced matrix to logcial matrix
    solutionMask = Assignment_Iteration(mask); % iteration assigning and tie breaking
    if nnz(solutionMask) == l % checkpoint
        solutionFound = true;
        break
    else
        reducedA = Matrix_Adjustment(reducedA,solutionMask);   % Updating current version of A
    end
    
    
end
solutionMatrix = solutionMask.*A;
solutionTotal = sum(sum(solutionMatrix));



