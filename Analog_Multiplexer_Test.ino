/*
    Christopher Hernandez
    Development of a Solar Array Deployment Mechanism for a CubeSat
    TEMT6000 Integration Test
    April 2025
    This program tests the TEMT6000 LSA connection to the multiplexer.
*/
  
  const int S0 = A0;
  const int S1 = A1;
  const int S2 = A2;
  const int SIG = A7;

void setup() {
  pinMode(S0, OUTPUT);
  pinMode(S1, OUTPUT);
  pinMode(S2, OUTPUT);

  digitalWrite(S0,0);
  digitalWrite(S1,0);
  digitalWrite(S2,0);

  
  Serial.begin(9600);
  while(!Serial);
}

void loop() {
  // Reads the first light sensor
  digitalWrite(S0,0);
  digitalWrite(S1,0);
  digitalWrite(S2,0);
  delayMicroseconds(10);
  float lightSensor1 = analogRead(SIG);
  Serial.print("Light sensor 1: ");
  Serial.println(lightSensor1);

  // Reads the second light sensor
  digitalWrite(S0,1);
  digitalWrite(S1,0);
  digitalWrite(S2,0);
  delayMicroseconds(10);
  float lightSensor2 = analogRead(SIG);
  Serial.print("Light sensor 2: ");
  Serial.println(lightSensor2);

  // Reads the third light sensor
  digitalWrite(S0,0);
  digitalWrite(S1,1);
  digitalWrite(S2,0);
  delayMicroseconds(10);
  float lightSensor3 = analogRead(SIG);
  Serial.print("Light sensor 3: ");
  Serial.println(lightSensor3);

  // Reads the fourth light sensor
  digitalWrite(S0,1);
  digitalWrite(S1,1);
  digitalWrite(S2,0);
  delayMicroseconds(10);
  float lightSensor4 = analogRead(SIG);
  Serial.print("Light sensor 4: ");
  Serial.println(lightSensor4);

  // Reads the fifth light sensor
  digitalWrite(S0,0);
  digitalWrite(S1,0);
  digitalWrite(S2,1);
  delayMicroseconds(10);
  float lightSensor5 = analogRead(SIG);
  Serial.print("Light sensor 5: ");
  Serial.println(lightSensor5);
  Serial.println();
}
