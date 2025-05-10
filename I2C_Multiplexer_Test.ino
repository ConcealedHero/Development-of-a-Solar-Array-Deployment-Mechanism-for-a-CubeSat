  /*
    Christopher Hernandez
    Development of a Solar Array Deployment Mechanism for a CubeSat
    INA219 and PCA9548A Integration Test
    April 2025
    This program tests the INA219 current sensors and the PCA9548A I2C multiplexer.
  */
#include <Wire.h>
#include <Adafruit_INA219.h>

// I2C addresses
#define PCA9548A_1 0x70
#define PCA9548A_2 0x71

Adafruit_INA219 ina219s[2][5];  

// Channel selection
void selectMuxChannel(uint8_t multiplexerChannel, uint8_t multiplexerAddress) {
  if (multiplexerChannel > 7) return;
  Wire.beginTransmission(multiplexerAddress);
  Wire.write(1 << multiplexerChannel);
  Wire.endTransmission();
}

// Checks the connection of the multiplexer and the initialization of the INA219 sensors
void setup() {
  Wire.begin();
  Serial.begin(9600);
  while (!Serial);
  for (int mux = 0; mux < 2; mux++) { // Multiplexer cycling
    uint8_t muxAddr = (mux == 0) ? PCA9548A_1 : PCA9548A_2;
    for (int ch = 0; ch < 5; ch++) { // Channel cycling
      if (mux == 1 && ch == 4) continue; // Skips unused channel
      selectMuxChannel(ch, muxAddr);
      if (!ina219s[mux][ch].begin()) { // Checks if the INA219 was initialized
        Serial.print("INA219 not found on multiplexer ");
        Serial.print(mux + 1);
        Serial.print(" channel ");
        Serial.println(ch);
      } else {
        ina219s[mux][ch].setCalibration_16V_400mA(); // If INA219 is initialized,  the lowest predefined calibration range is used
      }
    }
  }
}

// The MCU cycles through each channel of a multiplexer before cycling to the next multiplexer
void loop() {
  for (int mux = 0; mux < 2; mux++) { // Multiplexer cycling
    uint8_t muxAddr = (mux == 0) ? PCA9548A_1 : PCA9548A_2;
    for (int ch = 0; ch < 5; ch++) { // Channel cycling
      if (mux == 1 && ch == 4) continue; // Skips unused channel
      selectMuxChannel(ch, muxAddr);
      unsigned long timeNow = millis();
      float elapsedSeconds = timeNow / 1000.0; 
      float voltage = ina219s[mux][ch].getBusVoltage_V();
      float current = ina219s[mux][ch].getCurrent_mA();
      float power = ina219s[mux][ch].getPower_mW();

      // CSV format: Elapsed time, multiplexer, channel, voltage, current, and power
      Serial.print(elapsedSeconds, 2); Serial.print(",");
      Serial.print(mux + 1); Serial.print(",");
      Serial.print(ch); Serial.print(",");
      Serial.print(voltage, 3); Serial.print(",");
      Serial.print(current, 3); Serial.print(",");
      Serial.println(power, 3);
      
      delay(300);     
    }  
  }
  delay(1000); 
}
