%{ 
    Christopher Hernandez
    Development of a Solar Array Deployment Mechanism for a CubeSat
    
    November 2024

    This program calculates power losses at the optimal incident angle for
    each degree change in temperature. 

    Cases
    - When simulating one irradiated face, the iAngle should be set to 0°
    and oneFace should be set to 1.
    - When simulating two irradiated faces, the iAngle should be set to 45°
    and twoFace should be set to 2.
    - When simulating three irradiated faces, the iAngle should be set to 45°
    and twoFace should be set to 3.

%} 

clc, clear, close all

%% Variables
G = 1361; % w/m^2
Area = 0.1600; % m^2
Efficiency = 0.15;
lamda = 0.045;
iAngle = 0;

% Booleans
oneFace = 0;
twoFaces = 0;
threeFaces = 1;
closeFigures = 1;

% Calculations
tCellVector = linspace(25,85,61);
pVector = zeros(1,length(tCellVector));
epsilonVector = zeros(1,length(tCellVector));
Geff = G*cos(deg2rad(iAngle));

systemMatrix = zeros(3,length(tCellVector));
for i=1:length(tCellVector)
    epsilonVector(1,i) = lamda*(tCellVector(i) - 25)*Efficiency;
    if oneFace == 1
        pVector(1,i) = Geff * Area * Efficiency * (1 - lamda*(tCellVector(i) - 25));
    elseif twoFaces == 1
        pVector(1,i) = 2 * Geff * Area * Efficiency * (1 - lamda*(tCellVector(i) - 25));
    elseif threeFaces == 1
        pVector(1,i) = 3 * Geff * Area * Efficiency * (1 - lamda*(tCellVector(i) - 25));
    end
end
systemMatrix(1,:) = tCellVector;
systemMatrix(2,:) = pVector;
systemMatrix(3,:) = epsilonVector;

% Plots
figure("Name","Temperature vs. Power")
plot(tCellVector,pVector);
title("Temperature vs. Power")
xlabel("Cell Temperature (°C)")
ylabel("Power (W)")
ylim([0, max(pVector(1,:))])
grid on, grid minor

fprintf("Maximum Power: %f (W)\n\n",max(systemMatrix(2,:)) ) % STC
fprintf("Power +5°C: %f (W)\n\n",max(systemMatrix(2,6))) % 30°C
fprintf("Power +10°C: %f (W)\n\n",max(systemMatrix(2,11))) % 35°C
fprintf("Power +15°C: %f (W)\n\n",max(systemMatrix(2,16))) % 40°C

if closeFigures == 1
    close all
end