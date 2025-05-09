/*
  Christopher Hernandez
  Development of a Solar Array Deployment Mechanism for a CubeSat
  TEMT6000 Unit Test
  April 2025
  This program measures the ADC values of the TEMT6000 based on the ambient light level.
*/

#define lightSensor1 A7
void setup() {
  pinMode(lightSensor1, INPUT);
  Serial.begin(9600);
}

void loop() {
  int lightValue = analogRead(lightSensor);
  Serial.println(lightSensor);
  delay(1000);
}
