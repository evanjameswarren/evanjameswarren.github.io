clc

clear
%__________________________________
% Adjustment section_______________

normSwitch = 0; % normal up (1), normal down (0)

syms x y z

symsSurface = sqrt(x^2 + y^2);

symsField = [x^2-y^2,x*y-4,0];

surfNorm = [-diff(symsSurface,x),-diff(symsSurface,y),1];
%_____________________________________

if normSwitch
    n = 1;
else 
    n = -1;
end

%____________________________________

% Grid settings_______________________
gridX = linspace(-10,10,21); 
gridY = linspace(-10,10,21); 
gridZ = linspace(-2,10,13); 

[X,Y,Z] = meshgrid(gridX,gridY,gridZ);

sz = 5; % stepsize for vector field

%______________________________________
% Figure settings
figure 
grid on
axis equal
xlabel("X axis");
ylabel("Y axis");
zlabel("Z axis");
title("COOL STUFF")
view(3) 
axis([-10,10,-10,10,-2,10]);
hold on

%_______________________________________
 
%__________________________________Syms to Arrays________________

[surfX,surfY] = meshgrid([-5:5]);

surface = matlabFunction(symsSurface);
surface = surface(surfX,surfY);

P =  matlabFunction(symsField(1),"Vars",{x,y,z});

Q =  matlabFunction(symsField(2),"Vars",{x,y,z});

R =  matlabFunction(symsField(3),"Vars",{x,y,z});

normX = matlabFunction(surfNorm(1),"Vars",{x,y});

normY = matlabFunction(surfNorm(2),"Vars",{x,y});


 % Unitize

%_______________Plotting_______________

surf(surfX,surfY,surface);
colormap("winter")
vectorX = X(1:sz:numel(X));
vectorY = Y(1:sz:numel(Y));
vectorZ = Z(1:sz:numel(Z));
P = P(vectorX,vectorY,vectorZ);
Q = Q(vectorX,vectorY,vectorZ);
R = zeros(size(Q));      %R(vectorX,vectorY,vectorZ);
scaler = 1;
quiver3(vectorX,vectorY,vectorZ,scaler*P,scaler*Q,scaler*R,2,"Color","red")
quiver3(surfX,surfY,surface,n.*normX(surfX,surfY),n.*normY(surfX,surfY),(n).*ones(size(surface)),"Color","green")

textBoxText = {"Vector Field = "+char(symsField(1)),"Surface Function = "+ char(symsSurface)};
textBox = [ .75 .75 .2 .2 ]; % Textbox location [% from left, % from bottom, % width, % tall]
annotation("textbox",textBox,'String',textBoxText,'FitBoxToText',"on");

hold off

