/*
    Christopher Hernandez
    Development of a Solar Array Deployment Mechanism for a CubeSat
    NEMA 11 Integration Test
    This program tests whether the NEMA 11 motor could rotate CW and CCW.
*/

const int stepPin = 10;
const int dirPin = 9;
const int stepsPerRevolution = 200;

/*
  Current draw test
           Step-dir pins
  Motor 4: 8-7, 0.275 amps
  Motor 3: 10-9, 0.340 amps
  Motor 2: 6-5, 0.330 amps
  Motor 1: 4-3, 0.355 amps
*/

void setup() {
  pinMode(stepPin, OUTPUT);
  pinMode(dirPin, OUTPUT);
}

void loop() {
  digitalWrite(dirPin, HIGH);
  for(int x=0; x < 4 * stepsPerRevolution; x++){
    digitalWrite(stepPin, HIGH);
    delayMicroseconds(1000);
    digitalWrite(stepPin, LOW);
    delayMicroseconds(1000);
  }
  delay(1000);

  digitalWrite(dirPin, LOW);
  for(int x=0; x < 4 * stepsPerRevolution; x++){
    digitalWrite(stepPin, HIGH);
    delayMicroseconds(1000);
    digitalWrite(stepPin, LOW);
    delayMicroseconds(1000);
  }
  delay(1000);
}
