function [new_copy] = Matrix_Adjustment(copy, solutionMask)
% This function requires the input of most current version of the Reduced Matrix
% (copy) and the final solution mask of the reduced matrix (solutionMask).
% *****SOLUTION mask must be have the maximum number of assignements.
% Otherwise the function will break***

l = size(copy,1); 

mask = copy == 0; % creating logical mask of zero locations

assignedRows = any(solutionMask,2); % pulling Assigned Rows

unassignedMask = mask.* ~solutionMask; % creating unassigned mask
 

highLightMask = false(l); % setting preseting highlight mask

highLightRows =  logical(~assignedRows); % initial Starting Rows to highlight

adjustmentComplete = false; % kill switch for highlights complete
while adjustmentComplete == false

    % unassigned zersos in mask (must be logical for column indexing)
    highLightCols =  any(unassignedMask(highLightRows,:),1); % intital highlighting unassigned zero columns in highlighted Rows

    highLightRows_2 = any(highLightRows | solutionMask(:,highLightCols),2);% appending new rows to highlight
    if highLightRows_2 == highLightRows % verify if new rows were highlighted
        adjustmentComplete = true; % End while loop
    end
    highLightRows = highLightRows_2;% Updating highlighted Rows
end

highLightMask = (highLightMask | highLightRows) | highLightCols; % Highlighting

dashRows = ~all(highLightMask,2); % Cutting Rows not highlighted

dashCols = all(highLightMask,1); % Cutting  Columns highlighted

thetaSubMask = (highLightMask & ~dashRows) &  ~dashCols;  % pulling section to subtract Theta

thetaCopy = copy .* thetaSubMask; % A Copy values not highlighted

theta = min(min(thetaCopy(thetaCopy>0))); % pulling Theta value

thetaAddMask = highLightMask & dashRows; % pulling section to add Theta

new_copy = copy - thetaSubMask.*theta + thetaAddMask.*theta; % Altering Copy for output 
end