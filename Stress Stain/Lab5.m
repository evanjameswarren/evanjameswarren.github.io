%function report = processStressStrainCurve(csvFilePath)
clf  % clearing variables and figure to avoid overlap
clc
clear variables
csvFilePath = 'Aluminium Sample.csv';

rawSampleData = readtable(csvFilePath,VariableNamingRule='preserve'); % importing table from csv table



avgDiameter = 3.33*10^(-3);
area = pi*.25*(avgDiameter)^2; % cross section of area for sample in m^2
avgLength = 35*10^(-3);  % length of sample under tension
stress = table2array(rawSampleData(:,2))/area; % pulling data
strain = table2array(rawSampleData(:,1))/avgLength; % pulling data


% ______scrubbing data__________________________________________

[~,breakPoint] = max(abs(diff(stress)));   % finding breakpoint
stress(breakPoint:end) = [];
strain(breakPoint:end) = [];  % ..............
negativeStrain = find(strain<=0);%...........
stress(negativeStrain) = [];  %.........
strain(negativeStrain) = [];   %........
strain = [0;strain]; % zeroing first points
stress = [0;stress];
%____________________________________
%__________Plot____________



plot(strain,stress,'-b')
hold on
grid on
xlabel("Strain")
ylabel("Stress N/m^2")


%__________


[tensileStrength,idx] = max(stress);  % pulling tensile strength and index for textbox
tensileStrain = strain(idx);      % converting indext for textbox
h = tensileStrength; % variables scale for shifting text
w = strain(end); %........ 
axis([-.25*w,w*1.25,-.1*h,h*1.2])
tensileText = [tensileStrain,tensileStrength;tensileStrain-w*0.07,tensileStrength+h*0.08];
plot(tensileText(:,1),tensileText(:,2),"-k")
text(tensileText(2,1),tensileText(2,2)+h*.05,sprintf('\\sigma_{t} = %.2e  Pa', tensileStrength),'FontSize',12)
%^^^ adjusting text plot locations by scaling ^^^learning formating




eyeBalledIndex = 63; % eyeballed index for the modulus!!
% E = stress/strain in linear range
modulus = mean(stress(2:eyeBalledIndex)./strain(2:eyeBalledIndex));
modulusText =[strain(eyeBalledIndex),stress(eyeBalledIndex);strain(eyeBalledIndex)-.1*w,stress(eyeBalledIndex)-.1*h];
plot(modulusText(:,1),modulusText(:,2),'-k')
text(modulusText(2,1)-.12*w,modulusText(2,2)-.05*h,sprintf('E = %.2e Pa',modulus))


hold on


%___________Offset code___________________________-
%
offsetY = linspace(0,tensileStrength,length(stress)); % x as a function of y
offsetX = offsetY./modulus + .002; % x(y)
plot(offsetX,offsetY,"--r")     
nameString = csvFilePath(1:end-4);
title(nameString)


% _________ yield strength_________________- 
offsetIndex = find(strain >=.002);    % index for strain data past .002
offsetArray = modulus*(strain(offsetIndex) - strain(offsetIndex(1))); % mock strain data
error = stress(offsetIndex)-offsetArray;  % difference array
negativeError = find(error<0);   % array values after intersection
yieldStrengthIndex = negativeError(1)-1 + offsetIndex(1);% pulling first value after intersection, offset index by 1 + orginal index shift
yieldStrain = strain(yieldStrengthIndex); 
yieldStrength = stress(yieldStrengthIndex); 


yieldStrengthText = [yieldStrain,yieldStrength;yieldStrain-w*.1,yieldStrength+h*.1];
plot(yieldStrengthText(:,1),yieldStrengthText(:,2),"-k")
text(yieldStrengthText(2,1)-w*.12,yieldStrengthText(2,2)+h*.05,sprintf('\\sigma_{y} = %.2e  Pa',yieldStrength))


toughness = toughness(stress,strain);

text(w*.75,h*.25,sprintf("Toughness = %.2e J/m^{3}",toughness))

perEL = string(strain(end)*100);

text(w*.75,h*.35,sprintf("%%EL = ")+perEL)


% report = sprintf("Yield strength (%s): %.5f", csvFilePath, yieldStrength);
%end












%
% clf  % clearing variables and figure to avoid overlap
% clc
% clear variables

% subplot(3, 1, 1);
%disp(processStressStrainCurve('1020 Cold Worked Steel.csv'))
% subplot(3, 1, 2);
% disp(processStressStrainCurve('1020 Annealed Steel.csv'))
% subplot(3, 1, 3);
% disp(processStressStrainCurve('Brass Sample.csv'))
