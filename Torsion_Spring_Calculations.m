%{
    Christopher Hernandez
    Development of a Solar Array Deployment Mechanism for a CubeSat
    Torsion Spring Calculator
    March 2025
    
    This program calculates the shear and bending stress of a torsion
    spring.
%}

clc, clear, close all

%% Constants
E = 195*10^9; % Young's Modulus (Pa)
d = 0.35/10^3; % Wire diameter (m)
n = 5; % Number of coils
outerDiameter = 11/10^3; % m
theta = 90; % Deployment angle (Degrees)
m = 0.02268; % Solar panel mass (kg)
L = 100/10^3; % Solar panel length (m)
yieldStrength = 215 * 10^6; % Pa
shearStrength = 0.57 * yieldStrength; % Pa

% Conversions
deg2rad = pi/180;
rad2deg = 180/pi;

theta = theta*deg2rad;


%% Calculations

% Spring Constant
innerDiameter = outerDiameter - 2*d; % m
D = (outerDiameter + innerDiameter)/2 % Mean coil diameter (m)
k = (E*d^4) / (10.8*n*D) % (Nm/rad)
I = (1/3)*m*L^2 % Moment of Inertia (kg/m^2)
w = sqrt(k/I) % rad/s
T = k*theta % Torque (N*m)
t = pi/2/w % s
t2 = sqrt(I/k)*asin(90*deg2rad/theta)

C = D/d;

% Correction factors
kB = (4*C^2 - 1 - 1) / (4*C * (C-1)) 
kWahl = ((4*C - 1) / (4*C - 4)) + 0.615/C % Wahl correction factor
kBerg = (4*C+2)/(4*C-3) % Bergsträsser correction factor

% Stress calculations
shearStress = 16*T*kWahl*D/(pi*d^3)
bendingStress = 32*T*kWahl*D/(pi*d^3)

% Safety factor calculations
bendingSafetyFactor = yieldStrength/bendingStress
shearSafetyFactor = shearStrength/shearStress