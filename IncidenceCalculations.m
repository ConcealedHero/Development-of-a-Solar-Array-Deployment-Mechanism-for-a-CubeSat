%{ 
 Christopher Hernandez
 Development of a Solar Array Deployment Mechanism for a CubeSat
 Effective Irradiance and Power Calculator
 November 2024

 This program calculates effective irradiance based on the incident angle
 and the subsequent power generated by a solar panel.
%} 

clc, clear, close all

%% Variables
G = 1361; % w/m^2
Area = 0.0192; % m^2
Efficiency = 0.15;

% Booleans
closeFigures = 1;

%% One Face
% Calculations
iAngleVector1 = linspace(0,90,91);
GeffMatrix = zeros(2,91);
GeffVector = zeros(1,length(iAngleVector1));
for i=1:length(iAngleVector1)
    GeffMatrix(1,i) = G * cos(deg2rad(iAngleVector1(i))); % Face 1
    GeffMatrix(2,i) = iAngleVector1(i); % Incidence Angle 1
    GeffMatrix(3,i) = GeffMatrix(1,i) * Area * Efficiency; % Power Output
end

% Plots
% Effective irradiance plot
figure("Name","Effective Irradiance vs. Incidence Angle (One Face)")
plot(GeffMatrix(2,:),GeffMatrix(1,:),"LineWidth",2)
title("Effective Irradiance vs. Incidence Angle")
xlabel("Incidence Angle (°)")
ylabel("Effective Irradiance (W/m^2)")
grid on, grid minor

% Power Plot
figure("Name","Power vs. Incidence Angle (One Face)")
plot(GeffMatrix(2,:),GeffMatrix(3,:),"LineWidth",2)
title("Power vs. Incidence Angle")
xlabel("Incidence Angle (°)")
ylabel("Power (W)")
grid on, grid minor

fprintf("One Face\n")
fprintf("Maximum Irradiance (1 Face): %f (W/m^2) \n",max(GeffMatrix(1,:)) )
fprintf("Maximum Power (1 Face): %f (W) \n\n",max(GeffMatrix(3,:)) )

%% Two Faces
% Calculations
iAngleVector1 = linspace(0,90,91);
iAngleVector2 = linspace(90,0,91);
GeffMatrix = zeros(6,91);
for i=1:length(iAngleVector1)
    GeffMatrix(1,i) = G * cos(deg2rad(iAngleVector1(i))); % Face 1 
    GeffMatrix(2,i) = G * cos(deg2rad(iAngleVector2(i))); % Face 2 
    GeffMatrix(3,i) = GeffMatrix(1,i) + GeffMatrix(2,i); % Combined Irradiance
    GeffMatrix(4,i) = iAngleVector1(i); % Incidence Angle 1
    GeffMatrix(5,i) = iAngleVector2(i); % Incidence Angle 2
    GeffMatrix(6,i) = GeffMatrix(3,i) * Area * Efficiency; % Power Output
end

% Plots
% Effective irradiance plot
figure("Name","Effective Irradiance vs. Incidence Angle (Two Faces)")
t = tiledlayout(1,1);
ax1 = axes(t);
plot(ax1,GeffMatrix(4,:),GeffMatrix(3,:),"LineWidth",2)
title("Effective Irradiance vs. Incidence Angle","Units","Normalized","Position",[0.5, 1.05, 0])
xlabel("Incidence Angle (°)")
ylabel("Effective Irradiance (W/m^2)")

ax2 = axes(t);
plot(ax2,GeffMatrix(5,:),GeffMatrix(3,:),"LineWidth",2)
set(gca, "xdir","reverse")
ax2.XAxisLocation = "top";
ax2.YAxisLocation = "right";
ax2.Color = "none";
ax1.Box = "off";
ax2.Box = "off";
grid on, grid minor


% Power Plot
figure("Name","Power vs. Incidence Angle (Two Faces)")
t = tiledlayout(1,1);
ax1 = axes(t);
plot(ax1,GeffMatrix(4,:),GeffMatrix(6,:),"LineWidth",2)
title("Power vs. Incidence Angle","Units","Normalized","Position",[0.5, 1.05, 0])
xlabel("Incidence Angle (°)")
ylabel("Power (W)")

ax2 = axes(t);
plot(ax2,GeffMatrix(4,:),GeffMatrix(6,:),"LineWidth",2)
set(gca, "xdir","reverse")
ax2.XAxisLocation = "top";
ax2.YAxisLocation = "right";
ax2.Color = "none";
ax1.Box = "off";
ax2.Box = "off";
grid on, grid minor

fprintf("Two Faces\n")
fprintf("Maximum Irradiance (2 Faces): %f (W/m^2) \n",max(GeffMatrix(3,:)) )
fprintf("Maximum Power (2 Faces): %f (W) \n\n",max(GeffMatrix(6,:)) )

%% Three Faces
% Calculations
iAngleVector1 = linspace(0,45,91);
iAngleVector2 = linspace(90,45,91);
iAngleVector3 = linspace(90,45,91);
GeffMatrix = zeros(8,91);
matrixPosition = 0;
for i=1:length(iAngleVector1)
    GeffMatrix(1,i) = G * cos(deg2rad(iAngleVector1(i))); % Face 1
    GeffMatrix(2,i) = G * cos(deg2rad(iAngleVector2(i))); % Face 2
    GeffMatrix(3,i) = G * cos(deg2rad(iAngleVector3(i))); % Face 3
    GeffMatrix(4,i) = GeffMatrix(1,i) + GeffMatrix(2,i) + GeffMatrix(3,i); % Combined Irradiance
    GeffMatrix(5,i) = iAngleVector1(i); % Incidence Angle 1
    GeffMatrix(6,i) = iAngleVector2(i); % Incidence Angle 2
    GeffMatrix(7,i) = iAngleVector3(i); % Incidence Angle 3
    GeffMatrix(8,i) = GeffMatrix(4,i) * Area * Efficiency; % Power Output
end

% Plots
% Effective Irradiance Plot
figure("Name","Effective Irradiance vs. Incidence Angle (Three Faces)")
plot(GeffMatrix(7,:),GeffMatrix(4,:),"LineWidth",2)
title("Effective Irradiance vs. Incidence Angle")
xlabel("Incidence Angle (°)")
ylabel("Effective Irradiance (W/m^2)")
grid on, grid minor

% Power Plot
figure("Name","Power vs. Incidence Angle (Three Faces)")
plot(GeffMatrix(7,:),GeffMatrix(8,:),"LineWidth",2)
title("Power vs. Incidence Angle")
xlabel("Incidence Angle (°)")
ylabel("Power (W)")
grid on, grid minor

fprintf("Three Faces\n")
fprintf("Maximum Irradiance (3 Faces): %f (W/m^2)\n",max(GeffMatrix(4,:)) )
fprintf("Maximum Power (3 Faces): %f (W)\n\n",max(GeffMatrix(8,:)) )

if closeFigures == 1
    close all
end
