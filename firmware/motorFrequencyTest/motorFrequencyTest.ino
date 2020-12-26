#include <Wire.h>
#include <Adafruit_MotorShield.h>

Adafruit_MotorShield AFMS = Adafruit_MotorShield();
Adafruit_DCMotor *myMotor = AFMS.getMotor(3);

#define hall 27

unsigned long pTime = 0;
int lastState = 0;
volatile int flag = 0;

unsigned long timerCount = 0;
unsigned long motorSpinTime = 10000;
int mSpeed = 50;
volatile unsigned long pulses = 0;

void IRAM_ATTR isr() {
  flag = 1;
}

void IRAM_ATTR count() {
  pulses++;
  Serial.println(pulses);
}

void setup() {
  // put your setup code here, to run once:
  pinMode(hall, INPUT);
  pTime = micros();
  Serial.begin(115200);
  //attachInterrupt(hall, isr, FALLING);
  AFMS.begin();
  myMotor->setSpeed(50);
  myMotor->run(FORWARD);
  timerCount = millis();
}

void loop() {
  //  // put your main code here, to run repeatedly:
  //  if (flag == 1) {
  //    //Serial.println("Interrupt!");
  //    flag = 0;
  //    unsigned long interruptTime = 0;
  //    interruptTime = micros() - pTime;
  //
  //
  //    int fullRev = interruptTime * 30;
  //    //int hz = 1000000/fullRev;
  //    Serial.println(fullRev);
  //    pTime = micros();
  //  }

  Serial.println(getPeriod());
  mSpeed += 5;
  mSpeed = constrain(50, 0, 255);
  myMotor->setSpeed(0);
  //if(millis() - timerCount > motorSpinTime){
  if (mSpeed > 50) {
    myMotor->run(RELEASE);
    while (1);
  }
  //}
}

int getPeriod() {
  unsigned long sTimer = millis();
  attachInterrupt(hall, count, FALLING);
  while (pulses < 450) {
    
  }
  detachInterrupt(hall);
  pulses = 0;
  unsigned long fTimer = millis() - sTimer;
  unsigned int avgTime = fTimer / 10;
  return avgTime;

}
