%{
    Christopher Hernandez
    Development of a Solar Array Deployment Mechanism for a CubeSat
    TEMT6000 Component Test with Noise Reduction
    April 2025

    This program uses MATLAB to log and visualize the plotted ADC values of
    a TEMT6000 sensor. The unprocessed and noise reduced ADC values are
    plotted.
%}

clc, clear, close all

%% Arduino initialization
a = arduino("COM3", "Nano33IoT"); 
lightSensorPin = "A7";

% Variables
delayTime = 0;
testTime = 60;

% Constants
voltageReference = 3.3; 
adcMax = 1023; 

% Animated figure
figure("Name","TEMT6000 Unit Test (Averaged Data)");
line = animatedline;
title("TEMT6000 Light Sensor Unit Test");
xlabel("Time (s)");
ylabel("ADC Value"); 
ylim([0 adcMax]);
grid on, grid minor

% Tables
voltageValue = [];
adcValue = [];
timeValue = [];
averageADCValue = [];
averageTimeValue = [];

% Indexes
samplingIndex = 1;
averageIndex = 1;
sampleSize = 60;
trimIndex = 1;

tic % Start time

%% Main
while true
    % Raw sampling light sensor readings
    rawSamples = zeros(sampleSize, 1);
    for ii=1:sampleSize
        voltageValue(samplingIndex,1) = readVoltage(a, lightSensorPin); % Measured voltage
        adcValue(samplingIndex,1) = round((voltageValue(samplingIndex,1) / voltageReference) * adcMax); % ADC value
        timeValue(samplingIndex,1) = toc;
        rawSamples(ii) = adcValue(samplingIndex,1);
        samplingIndex = samplingIndex + 1; 
    end
    averageTimeValue(averageIndex,1) = toc; % Elapsed time
    
    % Averages the raw sampling light sensor readings
    startIndex = samplingIndex - sampleSize;
    indexRange = startIndex:samplingIndex-1;

    minADCValue = min(adcValue(indexRange));
    maxADCValue = max(adcValue(indexRange)); 

    % Trims minimum and maximum values
    sortedSamples = sort(rawSamples);
    trimmedSamples = sortedSamples(2:end-1); 

    minADCValueTrimmed = min(trimmedSamples);
    maxADCValueTrimmed = max(trimmedSamples);

    averageADCValue(averageIndex, 1) = mean(trimmedSamples);
    ylim([0 max(averageADCValue) + 10])

    % Runs the unit test for a specified amount of time
    if averageTimeValue(averageIndex,1) >= testTime
        break
    end
    
    % Updates animated plot
    addpoints(line, averageTimeValue(averageIndex,1), averageADCValue(averageIndex,1));
    drawnow limitrate;
    
    fprintf("Time (s): %f\n", averageTimeValue(averageIndex,1))
    fprintf("Index Range: %f - %f\n", startIndex, samplingIndex-1)
    fprintf("Average ADC Value: %f\n", averageADCValue(averageIndex,1))
    fprintf("Min ADC value: %f\n", minADCValue)
    fprintf("Min ADC value (Trimmed): %f\n",minADCValueTrimmed)
    fprintf("Max ADC value: %f\n", maxADCValue)
    fprintf("Max ADC value: (Trimmed) %f\n\n", maxADCValueTrimmed)

    averageIndex = averageIndex + 1;  
end

%% Plots
figure("Name","TEMT6000 Unit Test (Raw Data)")
plot(timeValue,adcValue)
title("TEMT6000 Unit Test (Raw Sampling)")
xlabel("Time (s)")
ylabel("ADC Value")
grid on, grid minor

figure("Name","TEMT6000 Unit Test (Averaged Data)")
plot(averageTimeValue,averageADCValue)
title("TEMT6000 Unit Test (Average Sampling)")
xlabel("Time (s)")
ylabel("ADC Value")
grid on, grid minor

figure("Name","TEMT6000 Unit Test")
plot(averageTimeValue,averageADCValue)
title("TEMT6000 Unit Test")
xlabel("Time (s)")
ylabel("ADC Value")
hold on
plot(timeValue,adcValue)
grid on, grid minor
legend("Averaged Data","Raw Data","Location","southoutside","Orientation","Horizontal")
