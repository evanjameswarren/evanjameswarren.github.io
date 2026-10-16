function  solutionMask = Assignment_Iteration(mask)
% This function takes an initial logical (mask) and iterates through the rows
% and columns for assignement zeros, then returns a basic (solutionmask).
% if no assignments are found a min unassigned row loop is scans for open
% columns, if a open column is found, the assignment is made. and rescanned
%________________________________________________________________________________

l = size(mask,1); % square matrix length

    solutionMask = false(l);% Preassigned blank logical solution mask and vectors
    assignedRows = false(l,1);
    assignedCols = false(1,l);
    iterationMask = mask; % Creating changing Iteration copy

%_________________________ASSIGNMENT FAZE_________________________________________
newAssignment = true;
while newAssignment == true

    newAssignment = false;
    for i = 1:l   % Assigning rows
        if assignedRows(i) == false % skip rows already assigned
            iteration = iterationMask(i,:); % Current iteriation Row
            if sum(iteration) == 1 % check if assignemtn is valid
                newAssignment = true;  % trigger change was made
                assignedRows(i) = true; % Assigning Row
                assignedCols =  assignedCols | iteration; % Assigning Column
                solutionMask(i,:) = iteration; % Appending solution row
                iterationMask = iterationMask & (~iteration); % Clearing zero from iteration mask
            end
        end
    end
    if nnz(solutionMask) == l % Assignment faze switch if solution mask is complete
        break
    end

    for i = 1:l % assigning Columns
        if assignedCols(i) == false % skip rows already assigned
            iteration = iterationMask(:,i);% Current iteriation Column
            if sum(iteration) == 1 %Check if assignemtn is valid
                newAssignment = true; %trigger change was made
                assignedCols(i) = true; % Assigning Column
                assignedRows =  assignedRows | iteration; % Assigning Row
                solutionMask(:,i) = iteration; % Appending solution column
                iterationMask = iterationMask & ~iteration(:); % Clearing zero from iteration
            end
        end
    end
    if nnz(solutionMask) == l % Assignment faze switch if solution mask is complete
        break
    elseif ~newAssignment % TIE BREAKERS!!!! <<<<<HARDEST PART
        unassignedRows = find(~assignedRows);  % finding Unassigned Rows after no assignments were made 
        [~,sortedIndex] = sort(sum(iterationMask(unassignedRows,:),2)); % finding order of unassigned  sorting unassigned rows by min number of remaining zeros 
        unassignedRows = unassignedRows(sortedIndex)'; % Sorting unassignedRows min first
        for i = unassignedRows
            openColumn = find(iterationMask(i,:) & ~assignedCols); % finding unassigned Columns corrisponding to zeros unassigned rows
            if ~isempty(openColumn) % if an open column is found
                assignedCols(openColumn(1))=true; % assign open column
                assignedRows(i) = true; % assign Row
                iterationMask = (iterationMask & ~assignedCols) & ~assignedRows; % clear ideration mask
                solutionMask(i,openColumn(1)) = true; % assigned in solution mask
                newAssignment = true; % return to iteration method
                break % break for loop 
            end
        end
    end

end

end