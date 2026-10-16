function [pairs_ref, cost_ref] = checkHungarian(A)
% Works with older 2-arg matchpairs. Computes cost explicitly.

finiteA = A(isfinite(A));
if isempty(finiteA), error('Matrix has no finite entries.'); end

B = max(finiteA(:)) + 1e6;           % large finite cap
pairs_ref = matchpairs(A, B);        % 2-input form
cost_ref = sum(A(sub2ind(size(A), pairs_ref(:,1), pairs_ref(:,2))));
end
%dfaf
