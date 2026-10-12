clc;clear;
% A = [37.7	32.9	33.8	37	  35.4
%      43.4	33.1	42.2	34.7  41.8
%      33.3	28.5	38.9	30.4  33.6
%      29.2	26.4	29.6	28.5  31.1
%      0	    0	    0	    0	  0   ];
A = [8	6	4	9
     7	5	6	9
     9	10	11	12
     9	6	8	11];
% A = [72 81 69 88 77 64 90 73  6 85;   % r1 -> c9 (6)
%        7 66 75 83 91 68 79 88 72 64;   % r2 -> c1 (7)
%       70 92 84  5 76 89 63 81 90 72;   % r3 -> c4 (5)
%       68 79 87 73 92 66 85 74 80  8;   % r4 -> c10 (8)
%       71 86 77 88 90  4 69 83 75 82;   % r5 -> c6 (4)
%       65 78  6 81 73 92 88 70 84 76;   % r6 -> c3 (6)
%       90 74 82 69 85 77 71  3 88 79;   % r7 -> c8 (3)
%       83  5 76 90 68 81 74 69 86 92;   % r8 -> c2 (5)
%       79 88 91 72 84 66  7 75 80 87;   % r9 -> c7 (7)
%       76 73 85 78  6 90 82 71 89 74];  % r10-> c5 (6)
% A = [ 72  15  88  34  67  91  53  24  76  59  42  83;
%   61  73  14  92  48  36  85  57  33  79  26  68;
%   45  81  63  27  90  38  74  52  19  86  71  29;
%   58  47  72  13  84  66  31  95  41  22  77  54;
%   39  64  55  80  21  87  46  70  60  32  93  18;
%   83  28  49  71  35  20  90  44  62  97  16  75;
%   26  59  91  53  78  42  12  88  51  34  69  81;
%   67  25  38  86  29  58  73  17  94  45  52  33;
%   54  93  22  68  47  79  28  63  15  82  36  70;
%   41  60  85  23  66  31  57  75  40  18  92  50;
%   32  74  45  90  16  55  67  21  83  46  27  96;
%   88  35  58  44  52  26  80  39  72  30  95  14];
A = [   71  23  90  62  44  88  33  97  59  11  85  37  64  19  73  46  82  25  68  53;
        29  74  16  85  41  56  70  38  92  21  66  48  79  35  50  94  27  83  12  60;
        52  34  81  27  68  45  19  77  54  87  28  95  43  65  32  99  22  63  71  16;
        39  96  24  55  73  18  88  30  67  59  11  84  91  46  36  65  75  40  52  93;
        65  17  48  78  25  91  44  71  15  83  58  36  62  20  87  33  74  54  68  29;
        47  90  13  80  37  52  94  61  42  24  70  49  63  28  86  16  31  81  59  75;
        56  20  69  93  34  76  29  85  18  40  57  83  26  92  47  14  95  32  61  66;
        12  58  35  72  51  89  46  27  93  22  41  64  80  30  96  50  77  25  84  16;
        70  38  21  87  32  67  26  49  79  35  62  97  23  88  43  60  15  54  19  92;
        25  61  33  90  54  31  45  68  24  80  29  73  42  71  57  22  85  39  93  66;
        63  44  19  64  86  23  81  37  53  95  34  26  69  78  49  16  91  55  32  72;
        41  68  30  52  79  17  70  33  85  60  27  91  36  81  24  58  46  97  19  75;
        36  82  47  19  89  43  61  72  26  50  94  31  77  65  18  84  23  92  40  67;
        15  54  25  86  42  30  92  59  33  63  37  71  55  98  20  66  44  81  48  73;
        85  27  74  21  67  35  93  24  80  45  62  49  96  28  84  51  25  76  32  59;
        19  70  53  40  60  82  38  64  91  17  56  93  30  77  41  68  26  92  34  75;
        50  28  84  36  69  25  58  43  66  31  72  38  61  79  22  94  49  88  15  96;
        77  31  65  57  22  49  90  18  70  38  83  46  24  60  35  71  44  20  98  63;
        33  89  16  74  27  71  48  53  91  23  64  85  32  47  81  28  76  50  42  94;
        60  45  20  68  30  87  33  79  25  62  92  37  57  43  66  35  83  29  73  18];

% A = [ -2   9   5   3;
%        4  -1   6   8;
%        7   2  -4   5;
%        3   6   1  -3;
%       -5   8   4   7;
%        9   0  -2   6];
% A = [5  7  6;
%       3  8  -12;
%       9  4  5;
%       1 10  3];


%____________SPECIAL CASES ADJUSTMENTS_____________

if min(A(:)) < 0 %          negative values      
    A = A - min(A(:));
end

[r,c] = size(A);
if r ~= c
    l = max(r,c);
    copy = zeros(l);
    copy(1:r,1:c) = A;
    A = copy;
else
    l = length(A);
    copy = A;   
end
    



show = false ; % showstep switch

if min(A(:)) < 0
    copy = copy - min(A(:));

end













%_________________________REDUCTION FAZE_________________________________


rmin = min(copy, [], 2); % subtracting row min
copy = copy - rmin;



cmin = min(copy);% subracting colum min
copy = copy - cmin;

ShowStep("Row min Reduction",copy,show)

ShowStep("Column min Reduciton",copy,show)

% Assigning 

fullAssignment = 0;  % while loop switch
numAdjustments = 0;
numScans = 0;


while fullAssignment == 0
    mask = copy == 0;
    iterationMask = mask;
    solutionMask = false(l);
    ShowStep("Mask",mask,show)
    assignedRows = false(l,1); % preassigned logical arrays
    assignedCols= false(1,l); 

    newAssignment = true;
    while newAssignment == true
        numScans = numScans + 1;
        reverse = 1;
        if mod(numScans,2)==0 
            reverse = -1;
        end
        newAssignment = false;   
        for i = 1:reverse:l   % Assigning rows
          if assignedRows(i) == false
            disp("size")
            disp(size(iterationMask))

            iteration = iterationMask(i,:);
            if sum(iteration) == 1
                newAssignment = true;
                assignedRows(i) = true;
                assignedCols = assignedCols | iteration; % bitflip on (and/or)
                solutionMask(i,:) = iteration;
                iterationMask = iterationMask & (~iteration(:));
            end
          end
        end
        if sum(assignedRows) == l % switch if Rows were fully assigned
            fullAssignment = 1;
            break
        end


        for i = 1:l         % assigning Columns
            if assignedCols(i) ==false
                iteration = mask(:,i);
                if sum(iteration) == 1
                    newAssignment = true;
                    assignedCols(i) = true;
                    assignedRows = assignedRows | iteration;
                    solutionMask(:,i) = iteration;
                    iterationMask = iterationMask & ~iteration(:);
                end
            end
        end
    end

    ShowStep("Assigned Rows",assignedRows,show)
    ShowStep("Assigned Columns",assignedCols,show)

    if sum(assignedCols) == l % while loop killswitch
        fullAssignment = 1;
        break
    end

    % _______________________ADJUSTMENT FAZE _______________

    numAdjustments = numAdjustments+1; % counter

    ShowStep("Current Solution Mask",solutionMask,show)
    
    highLightMask = true(l);
    ShowStep("New Mask",highLightMask,show)
    

    highlightRowsIndex_1 = ~assignedRows;

    highLightMask = highLightMask & (highlightRowsIndex_1); % turning off assinged rows
    ShowStep("Hightlighted Rows 1x ",highLightMask,show)
    

    highlightedRows = mask(highlightRowsIndex_1,:); % row contents from mask
    
    highlightColIndex = any(highlightedRows,1); % colum higlight idex

    highLightMask = highLightMask | highlightColIndex;  % turning on 

    ShowStep("Highlighted Colums",highLightMask,show)

    highlightedCols = mask(:,highlightColIndex); % highlighted Column mask contents
    
    highlightRowsIndex_2 = any(solutionMask & highlightColIndex,2);

   
    highLightMask = highLightMask | highlightRowsIndex_2; % second row highlight

    ShowStep("Highlighted Rows 2x",highLightMask,show)

    dashMask = false(l);

    dashMask = dashMask | (~all(highLightMask,2));
    
    thetaAddMask = dashMask  & highlightColIndex;
    
    dashMask = dashMask | highlightColIndex;

    ShowStep("Dash Mask",dashMask,show)

    ShowStep("Theta Add Mask",thetaAddMask,show)

    thetaSubMask = ~dashMask; 
    ShowStep("Theta Sub Mask",thetaSubMask,show)

    thetaCopy = copy .* thetaSubMask;

    ShowStep("Theta Copy",thetaCopy,show)

    theta = min(min(thetaCopy(thetaCopy>0)));
    ShowStep("Theta Value",theta,show)
    try
        copy = copy - thetaSubMask.*theta + thetaAddMask.*theta;
    catch exception
        copy = copy - thetaSubMask.*theta;
    end
 
    ShowStep("Adjusted Matrix",copy,show)    

end

ShowStep("Solution Mask", solutionMask,1)
ShowStep("Number of matrix Adjustments",numAdjustments,1)

finalMatrix = solutionMask.*A;
ShowStep("Solution Matrix",finalMatrix,1)

solution = sum(finalMatrix*ones(l,1))

