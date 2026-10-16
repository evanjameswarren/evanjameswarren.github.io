function [reducedA] = Reduced_Mask(A)
% Input Matrix (A) is reduced by min in each rown and min in each column
% then converted to a logical output (mask)
reducedA = A - min(A,[],2); % subtracting row min
reducedA = reducedA - min(reducedA,[],1);  % subtracting column min
end