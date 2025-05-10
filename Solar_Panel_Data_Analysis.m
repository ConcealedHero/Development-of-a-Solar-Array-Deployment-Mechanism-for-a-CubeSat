%{
    Christopher Hernandez
    Development of a Solar Array Deployment Mechanism for a CubeSat
    Solar Panel Data Analysis
    April 2025

    This program parses through the data sets of the stowed, partially
    deployed, and fully deployed configurations. The program sets the start
    time to 0 seconds and parses the original data file into elapsed
    seconds, multiplexer, channel, and voltage. During solar array
    modification the channels were switched between the stowed/partially
    deployed configurations and the fully deployed configurations. This
    issue was resolved by adjusting the indices accordingly. A moving
    average was applied during the plot creation process for smoothing
    purposes.
%}

clc, clear, close all
partiallyDeployedData = readmatrix("Partially Deployed Data.txt"); % 9,315
stowedData = readmatrix("Stowed Data.txt"); % 8,731
fullyDeployedData = readmatrix("Fully Deployed Data.txt"); % 9,423


% Sets a common start point
for jj = 1:length(fullyDeployedData)
    fullyDeployedData(jj,1) = fullyDeployedData(jj,1) - 22.31;
end

for jj = 1:length(partiallyDeployedData)
    partiallyDeployedData(jj,1) = partiallyDeployedData(jj,1) - 3.79;
end

for jj = 1:length(stowedData)
    stowedData(jj,1) = stowedData(jj,1) - 3.79;
end


% Multiplexer 1 - Channel 0
index = 1;
for ii=1:9:length(stowedData)
    % Stowed Data
    sM1C0(index,1) = stowedData(ii,1); % Elapsed time
    sM1C0(index,2) = stowedData(ii,2); % Multiplexer
    sM1C0(index,3) = stowedData(ii,3); % Channel
    sM1C0(index,4) = stowedData(ii,4); % Voltage

    % Partially Deployed Data
    pdM1C0(index,1) = partiallyDeployedData(ii,1); % Elapsed time
    pdM1C0(index,2) = partiallyDeployedData(ii,2); % Multiplexer
    pdM1C0(index,3) = partiallyDeployedData(ii,3); % Channel
    pdM1C0(index,4) = partiallyDeployedData(ii,4); % Voltage
 
    % Fully Deployed Data
    fdM1C0(index,1) = fullyDeployedData(ii,1); % Elapsed time
    fdM1C0(index,2) = fullyDeployedData(ii,2); % Multiplexer
    fdM1C0(index,3) = fullyDeployedData(ii,3); % Channel
    fdM1C0(index,4) = fullyDeployedData(ii,4); % Voltage

    index = index + 1;
end

% Multiplexer 1 - Channel 1
index = 1;
for ii=2:9:length(stowedData)
    % Stowed Data
    sM1C1(index,1) = stowedData(ii,1); % Elapsed time
    sM1C1(index,2) = stowedData(ii,2); % Multiplexer
    sM1C1(index,3) = stowedData(ii,3); % Channel
    sM1C1(index,4) = stowedData(ii,4); % Voltage

    % Partially Deployed Data
    pdM1C1(index,1) = partiallyDeployedData(ii,1); % Elapsed time
    pdM1C1(index,2) = partiallyDeployedData(ii,2); % Multiplexer
    pdM1C1(index,3) = partiallyDeployedData(ii,3); % Channel
    pdM1C1(index,4) = partiallyDeployedData(ii,4); % Voltage
    
    % Fully Deployed Data
    fdM1C1(index,1) = fullyDeployedData(ii,1); % Elapsed time
    fdM1C1(index,2) = fullyDeployedData(ii,2); % Multiplexer
    fdM1C1(index,3) = fullyDeployedData(ii,3); % Channel
    fdM1C1(index,4) = fullyDeployedData(ii,4); % Voltage
    index = index + 1;
end

% Multiplexer 1 - Channel 2
index = 1;
for ii=3:9:length(stowedData)
    % Stowed Data
    sM1C2(index,1) = stowedData(ii,1); % Elapsed time
    sM1C2(index,2) = stowedData(ii,2); % Multiplexer
    sM1C2(index,3) = stowedData(ii,3); % Channel
    sM1C2(index,4) = stowedData(ii,4); % Voltage
   
    % Partially Deployed Data
    pdM1C2(index,1) = partiallyDeployedData(ii,1); % Elapsed time
    pdM1C2(index,2) = partiallyDeployedData(ii,2); % Multiplexer
    pdM1C2(index,3) = partiallyDeployedData(ii,3); % Channel
    pdM1C2(index,4) = partiallyDeployedData(ii,4); % Voltage
  
    % Fully Deployed Data
    fdM1C2(index,1) = fullyDeployedData(ii,1); % Elapsed time
    fdM1C2(index,2) = fullyDeployedData(ii,2); % Multiplexer
    fdM1C2(index,3) = fullyDeployedData(ii,3); % Channel
    fdM1C2(index,4) = fullyDeployedData(ii,4); % Voltage

    index = index + 1;
end

% Multiplexer 1 - Channel 3
index = 1;
for ii=4:9:length(stowedData)
    % Stowed Data
    sM1C3(index,1) = stowedData(ii,1); % Elapsed time
    sM1C3(index,2) = stowedData(ii,2); % Multiplexer
    sM1C3(index,3) = stowedData(ii,3); % Channel
    sM1C3(index,4) = stowedData(ii,4); % Voltage
    
    % Partially Deployed Data
    pdM1C3(index,1) = partiallyDeployedData(ii,1); % Elapsed time
    pdM1C3(index,2) = partiallyDeployedData(ii,2); % Multiplexer
    pdM1C3(index,3) = partiallyDeployedData(ii,3); % Channel
    pdM1C3(index,4) = partiallyDeployedData(ii,4); % Voltage

    % Fully Deployed Data
    fdM1C3(index,1) = fullyDeployedData(ii,1); % Elapsed time
    fdM1C3(index,2) = fullyDeployedData(ii,2); % Multiplexer
    fdM1C3(index,3) = fullyDeployedData(ii,3); % Channel
    fdM1C3(index,4) = fullyDeployedData(ii,4); % Voltage
  
    index = index + 1;
end

% Multiplexer 1 - Channel 4
index = 1;
for ii=5:9:length(stowedData)
    % Stowed Data
    sM1C4(index,1) = stowedData(ii,1); % Elapsed time
    sM1C4(index,2) = stowedData(ii,2); % Multiplexer
    sM1C4(index,3) = stowedData(ii,3); % Channel
    sM1C4(index,4) = stowedData(ii,4); % Voltage
    
    % Partially Deployed Data
    pdM1C4(index,1) = partiallyDeployedData(ii,1); % Elapsed time
    pdM1C4(index,2) = partiallyDeployedData(ii,2); % Multiplexer
    pdM1C4(index,3) = partiallyDeployedData(ii,3); % Channel
    pdM1C4(index,4) = partiallyDeployedData(ii,4); % Voltage

    % Fully Deployed Data
    fdM1C4(index,1) = fullyDeployedData(ii,1); % Elapsed time
    fdM1C4(index,2) = fullyDeployedData(ii,2); % Multiplexer
    fdM1C4(index,3) = fullyDeployedData(ii,3); % Channel
    fdM1C4(index,4) = fullyDeployedData(ii,4); % Voltage
  
    index = index + 1;
end

% Multiplexer 2 - Channel 0
index = 1;
for ii=6:9:length(stowedData)
    % Stowed Data
    sM2C0(index,1) = stowedData(ii,1); % Elapsed time
    sM2C0(index,2) = stowedData(ii,2); % Multiplexer
    sM2C0(index,3) = stowedData(ii,3); % Channel
    sM2C0(index,4) = stowedData(ii,4); % Voltage
    
    % Partially Deployed Data
    pdM2C0(index,1) = partiallyDeployedData(ii,1); % Elapsed time
    pdM2C0(index,2) = partiallyDeployedData(ii,2); % Multiplexer
    pdM2C0(index,3) = partiallyDeployedData(ii,3); % Channel
    pdM2C0(index,4) = partiallyDeployedData(ii,4); % Voltage
  

    % Fully Deployed Data
    fdM2C0(index,1) = fullyDeployedData(ii,1); % Elapsed time
    fdM2C0(index,2) = fullyDeployedData(ii,2); % Multiplexer
    fdM2C0(index,3) = fullyDeployedData(ii,3); % Channel
    fdM2C0(index,4) = fullyDeployedData(ii,4); % Voltage

    index = index + 1; 
end

% Multiplexer 2 - Channel 1
index = 1;
for ii=7:9:length(stowedData)
    % Stowed Data
    sM2C1(index,1) = stowedData(ii,1); % Elapsed time
    sM2C1(index,2) = stowedData(ii,2); % Multiplexer
    sM2C1(index,3) = stowedData(ii,3); % Channel
    sM2C1(index,4) = stowedData(ii,4); % Voltage
    
    % Partially Deployed Data
    pdM2C1(index,1) = partiallyDeployedData(ii,1); % Elapsed time
    pdM2C1(index,2) = partiallyDeployedData(ii,2); % Multiplexer
    pdM2C1(index,3) = partiallyDeployedData(ii,3); % Channel
    pdM2C1(index,4) = partiallyDeployedData(ii,4); % Voltage
  
    % Fully Deployed Data
    fdM2C1(index,1) = fullyDeployedData(ii,1); % Elapsed time
    fdM2C1(index,2) = fullyDeployedData(ii,2); % Multiplexer
    fdM2C1(index,3) = fullyDeployedData(ii,3); % Channel
    fdM2C1(index,4) = fullyDeployedData(ii,4); % Voltage

    index = index + 1;
end

% Multiplexer 2 - Channel 2
index = 1;
for ii=8:9:length(stowedData)
    sM2C2(index,1) = stowedData(ii,1); % Elapsed time
    sM2C2(index,2) = stowedData(ii,2); % Multiplexer
    sM2C2(index,3) = stowedData(ii,3); % Channel
    sM2C2(index,4) = stowedData(ii,4); % Voltage
   
    % Partially Deployed Data
    pdM2C2(index,1) = partiallyDeployedData(ii,1); % Elapsed time
    pdM2C2(index,2) = partiallyDeployedData(ii,2); % Multiplexer
    pdM2C2(index,3) = partiallyDeployedData(ii,3); % Channel
    pdM2C2(index,4) = partiallyDeployedData(ii,4); % Voltage

    % Fully Deployed Data
    fdM2C2(index,1) = fullyDeployedData(ii,1); % Elapsed time
    fdM2C2(index,2) = fullyDeployedData(ii,2); % Multiplexer
    fdM2C2(index,3) = fullyDeployedData(ii,3); % Channel
    fdM2C2(index,4) = fullyDeployedData(ii,4); % Voltage
  
    index = index + 1;
end

% Multiplexer 2 - Channel 3
index = 1;
for ii=9:9:length(stowedData)
    sM2C3(index,1) = stowedData(ii,1); % Elapsed time
    sM2C3(index,2) = stowedData(ii,2); % Multiplexer
    sM2C3(index,3) = stowedData(ii,3); % Channel
    sM2C3(index,4) = stowedData(ii,4); % Voltage
    
    % Partially Deployed Data
    pdM2C3(index,1) = partiallyDeployedData(ii,1); % Elapsed time
    pdM2C3(index,2) = partiallyDeployedData(ii,2); % Multiplexer
    pdM2C3(index,3) = partiallyDeployedData(ii,3); % Channel
    pdM2C3(index,4) = partiallyDeployedData(ii,4); % Voltage

    % Fully Deployed Data
    fdM2C3(index,1) = fullyDeployedData(ii,1); % Elapsed time
    fdM2C3(index,2) = fullyDeployedData(ii,2); % Multiplexer
    fdM2C3(index,3) = fullyDeployedData(ii,3); % Channel
    fdM2C3(index,4) = fullyDeployedData(ii,4); % Voltage
  
    index = index + 1;
end

% Solar Array 1
figure("Name","Voltage Generated by Solar Array 1")
% Solar Panel 7
plot(movmean(sM2C2(:,1),3),movmean(sM2C2(:,4),3)); hold on, grid on, grid minor
plot(movmean(pdM2C2(:,1),3),movmean(pdM2C2(:,4),3))
plot(movmean(fdM1C4(:,1),3),movmean(fdM1C4(:,4),3))
% Solar Panel 8
plot(movmean(sM2C0(:,1),3),movmean(sM2C0(:,4),3))
plot(movmean(pdM2C0(:,1),3),movmean(pdM2C0(:,4),3))
plot(movmean(fdM2C2(:,1),3),movmean(fdM2C2(:,4),3))
title("Voltage Generated by Solar Array 1")
xlabel("Time (s)")
ylabel("Voltage (V)")
legend("Stowed Panel (SP7)","Deployed Panel (SP7)","Fully Deployed Panel (SP7)" ...
    ,"Stowed Panel (SP8)","Deployed Panel (SP8)","Fully Deployed Panel (SP8)", ...
    "Location","southoutside","Orientation","horizontal")


% Solar Array 2
figure("Name","Voltage Generated by Solar Array 2")
% Solar Panel 1
plot(movmean(sM2C1(:,1),3),movmean(sM2C1(:,4),3)); hold on, grid on, grid minor
plot(movmean(pdM2C1(:,1),3),movmean(pdM2C1(:,4),3))
plot(movmean(fdM1C0(:,1),3),movmean(fdM1C0(:,4),3))
% Solar Panel 2
plot(movmean(sM1C4(:,1),3),movmean(sM1C4(:,4),3))
plot(movmean(pdM1C4(:,1),3),movmean(pdM1C4(:,4),3))
plot(movmean(fdM2C0(:,1),3),movmean(fdM2C0(:,4),3))
title("Voltage Generated by Solar Array 2")
xlabel("Time (s)")
ylabel("Voltage (V)")
legend("Stowed Panel (SP1)","Deployed Panel (SP1)","Fully Deployed Panel (SP1)" ...
    ,"Stowed Panel (SP2)","Deployed Panel (SP2)","Fully Deployed Panel (SP2)", ...
    "Location","southoutside","Orientation","horizontal")

% Solar Array 3
figure("Name","Voltage Generated by Solar Array 3")
% Solar Panel 3
plot(movmean(sM1C3(:,1),3),movmean(sM1C3(:,4),3)); hold on, grid on, grid minor
plot(movmean(pdM1C3(:,1),3),movmean(pdM1C3(:,4),3))
plot(movmean(fdM1C3(:,1),3),movmean(fdM1C3(:,4),3))
% Solar Panel 4
plot(movmean(sM1C2(:,1),3),movmean(sM1C2(:,4),3))
plot(movmean(pdM1C2(:,1),3),movmean(pdM1C2(:,4),3))
plot(movmean(fdM1C2(:,1),3),movmean(fdM1C2(:,4),3))
title("Voltage Generated by Solar Array 3")
xlabel("Time (s)")
ylabel("Voltage (V)")
legend("Stowed Panel (SP3)","Deployed Panel (SP3)","Fully Deployed Panel (SP3)" ...
    ,"Stowed Panel (SP4)","Deployed Panel (SP4)","Fully Deployed Panel (SP4)", ...
    "Location","southoutside","Orientation","horizontal")

% Solar Array 4
figure("Name","Voltage Generated by Solar Array 4")
% Solar Panel 5
plot(movmean(sM1C0(:,1),3),movmean(sM1C0(:,4),3)); hold on, grid on, grid minor
plot(movmean(pdM1C0(:,1),3),movmean(pdM1C0(:,4),3))
plot(movmean(fdM1C1(:,1),3),movmean(fdM1C1(:,4),3))
% Solar Panel 6
plot(movmean(sM1C1(:,1),3),movmean(sM1C1(:,4),3))
plot(movmean(pdM1C1(:,1),3),movmean(pdM1C1(:,4),3))
plot(movmean(fdM2C1(:,1),3),movmean(fdM2C1(:,4),3))
title("Voltage Generated by Solar Array 4")
xlabel("Time (s)")
ylabel("Voltage (V)")
legend("Stowed Panel (SP5)","Deployed Panel (SP5)","Fully Deployed Panel (SP5)" ...
    ,"Stowed Panel (SP6)","Deployed Panel (SP6)","Fully Deployed Panel (SP6)", ...
    "Location","southoutside","Orientation","horizontal")

figure("Name","Voltage Generated by Solar Array 5")
% Solar Panel 5
plot(movmean(sM2C3(:,1),5),movmean(sM2C3(:,4),5)); hold on, grid on, grid minor
plot(movmean(fdM2C3(:,1),5),movmean(fdM2C3(:,4),5)); 
title("Voltage Generated by Solar Array 5")
xlabel("Time (s)")
ylabel("Voltage (V)")
legend("Stowed Panel (SP9)","Fully Deployed Panel (SP9)", ...
    "Location","southoutside","Orientation","horizontal")

figure("Name","Voltage Generated by Solar Array 5")
plot(movmean(sM2C3(:,1),5),movmean(sM2C3(:,4),5)); hold on, grid minor, grid on
title("Voltage Generated by Solar Array 5")
xlabel("Time (s)")
ylabel("Voltage (V)")



