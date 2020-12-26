#include <Arduino.h>

//#include <WiFi.h>
#include <AsyncTCP.h>
#include <ESPAsyncWebServer.h>

AsyncWebServer server(80);

#include <Adafruit_DotStar.h>
#include <SPI.h>         // COMMENT OUT THIS LINE FOR GEMMA OR TRINKET
#include <Wire.h>

#include "image.h"

#define NUMPIXELS 17 // Number of LEDs in strip
#define hall 27
#define motor 4

#define DATAPIN    18
#define CLOCKPIN   19

Adafruit_DotStar strip = Adafruit_DotStar(
                           NUMPIXELS, DATAPIN, CLOCKPIN, DOTSTAR_BRG);

unsigned long timerCount = 0;
unsigned long motorSpinTime = 15000;
volatile int magCount = 0;
volatile int lastMagCount = 0;
volatile int flag = 0;
unsigned long downDelay = 30000;
unsigned long pTime = 0;

int change = 0;
int lastChange = 0;
int line = 0;
int delayMicros = 0;
int imageDisplay = 1;
byte imageBuffer[1020][3] = {{18, 86, 1}, {1, 0, 2}, {0, 1, 0}, {0, 0, 0}, {1, 1, 0}, {0, 0, 0}, {1, 1, 3}, {2, 5, 0}, {31, 139, 2}, {41, 192, 0}, {10, 48, 1}, {0, 0, 0}, {2, 0, 3}, {0, 1, 0}, {1, 0, 0}, {1, 0, 2}, {3, 0, 2}, {3, 23, 0}, {34, 163, 0}, {34, 155, 0}, {5, 20, 1}, {0, 0, 0}, {1, 0, 0}, {0, 0, 0}, {1, 0, 0}, {1, 0, 2}, {0, 0, 0}, {0, 0, 0}, {0, 1, 0}, {20, 83, 2}, {38, 180, 0}, {16, 69, 0}, {1, 0, 0}, {0, 0, 0}, {1, 0, 2}, {0, 0, 0}, {0, 0, 2}, {0, 0, 0}, {1, 1, 1}, {0, 0, 0}, {0, 0, 0}, {10, 50, 0}, {38, 170, 0}, {11, 47, 1}, {1, 0, 4}, {0, 0, 0}, {0, 1, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 2}, {0, 1, 0}, {1, 0, 0}, {0, 0, 2}, {2, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {38, 182, 0}, {19, 87, 0}, {0, 0, 2}, {1, 0, 0}, {0, 1, 0}, {0, 0, 2}, {0, 0, 2}, {1, 0, 0}, {0, 1, 0}, {17, 80, 1}, {37, 174, 0}, {19, 89, 0}, {1, 3, 0}, {0, 1, 0}, {1, 0, 2}, {0, 0, 0}, {0, 1, 0}, {0, 0, 0}, {1, 0, 5}, {24, 123, 0}, {45, 202, 1}, {6, 33, 2}, {1, 0, 0}, {0, 1, 0}, {0, 0, 2}, {0, 0, 0}, {0, 0, 2}, {2, 0, 1}, {1, 0, 0}, {0, 2, 1}, {8, 50, 0}, {46, 220, 0}, {23, 111, 0}, {0, 1, 0}, {0, 1, 0}, {0, 0, 0}, {0, 0, 0}, {0, 2, 1}, {1, 0, 2}, {0, 0, 0}, {1, 1, 1}, {0, 1, 0}, {17, 70, 2}, {48, 227, 1}, {7, 26, 0}, {0, 1, 0}, {0, 0, 0}, {1, 0, 0}, {1, 0, 0}, {0, 0, 4}, {1, 0, 2}, {0, 0, 2}, {0, 1, 0}, {1, 0, 0}, {2, 1, 0}, {1, 0, 2}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {7, 46, 0}, {39, 177, 0}, {23, 111, 0}, {0, 0, 2}, {0, 0, 0}, {0, 0, 0}, {0, 1, 0}, {0, 0, 2}, {0, 0, 2}, {0, 0, 2}, {9, 42, 0}, {45, 197, 1}, {29, 144, 0}, {0, 0, 0}, {1, 1, 0}, {0, 1, 0}, {1, 0, 2}, {0, 0, 0}, {0, 0, 0}, {1, 0, 2}, {17, 90, 0}, {38, 192, 0}, {19, 80, 2}, {1, 0, 0}, {0, 1, 0}, {3, 0, 2}, {0, 1, 0}, {0, 0, 0}, {1, 0, 0}, {0, 1, 0}, {2, 0, 1}, {7, 22, 0}, {32, 157, 1}, {32, 150, 1}, {3, 21, 0}, {1, 0, 2}, {0, 1, 0}, {0, 0, 2}, {1, 1, 0}, {0, 0, 2}, {0, 1, 0}, {1, 0, 0}, {1, 0, 2}, {21, 97, 0}, {33, 164, 0}, {6, 19, 1}, {0, 0, 0}, {1, 0, 4}, {0, 1, 0}, {0, 1, 0}, {0, 0, 0}, {0, 0, 2}, {1, 1, 1}, {0, 0, 0}, {0, 1, 0}, {1, 1, 1}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {1, 0, 2}, {2, 16, 0}, {47, 204, 1}, {19, 90, 0}, {0, 0, 2}, {0, 0, 0}, {1, 0, 2}, {0, 0, 2}, {0, 2, 1}, {1, 0, 0}, {2, 0, 1}, {0, 8, 0}, {29, 142, 0}, {39, 185, 0}, {9, 40, 0}, {1, 0, 0}, {0, 0, 0}, {0, 0, 2}, {0, 1, 0}, {0, 0, 0}, {0, 0, 0}, {10, 48, 1}, {37, 173, 1}, {24, 130, 0}, {2, 9, 2}, {0, 0, 0}, {1, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 2}, {1, 1, 3}, {0, 2, 1}, {4, 9, 2}, {29, 132, 1}, {34, 170, 0}, {7, 22, 1}, {0, 0, 2}, {1, 0, 0}, {1, 0, 0}, {0, 0, 0}, {1, 0, 2}, {0, 0, 0}, {0, 1, 0}, {1, 1, 1}, {27, 138, 0}, {31, 147, 0}, {0, 1, 0}, {0, 0, 0}, {0, 0, 0}, {1, 0, 2}, {1, 1, 1}, {0, 0, 0}, {1, 0, 0}, {0, 1, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {1, 0, 0}, {0, 1, 4}, {6, 36, 0}, {36, 168, 0}, {16, 81, 1}, {1, 0, 0}, {0, 0, 0}, {0, 2, 1}, {1, 0, 0}, {1, 1, 3}, {0, 0, 0}, {1, 0, 0}, {1, 1, 0}, {18, 91, 1}, {37, 174, 0}, {8, 40, 0}, {0, 0, 2}, {0, 2, 1}, {1, 0, 2}, {0, 0, 0}, {3, 0, 0}, {0, 0, 0}, {3, 11, 0}, {36, 162, 1}, {36, 172, 2}, {2, 9, 1}, {0, 0, 0}, {0, 0, 2}, {0, 2, 3}, {1, 0, 0}, {1, 0, 0}, {0, 0, 2}, {0, 1, 0}, {1, 0, 0}, {20, 103, 0}, {47, 223, 0}, {13, 70, 0}, {0, 1, 3}, {0, 0, 0}, {0, 1, 0}, {1, 0, 0}, {0, 0, 2}, {1, 0, 0}, {1, 0, 2}, {3, 14, 0}, {32, 156, 0}, {28, 124, 0}, {0, 4, 0}, {0, 1, 0}, {1, 0, 0}, {1, 0, 0}, {0, 0, 0}, {0, 1, 0}, {1, 1, 1}, {1, 0, 2}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 1, 0}, {1, 0, 0}, {0, 1, 0}, {8, 35, 4}, {47, 235, 0}, {16, 67, 0}, {3, 0, 0}, {0, 0, 0}, {1, 0, 2}, {0, 1, 0}, {0, 1, 0}, {0, 2, 0}, {0, 0, 0}, {0, 0, 0}, {15, 67, 5}, {53, 240, 0}, {14, 60, 0}, {1, 0, 0}, {0, 2, 1}, {0, 0, 0}, {0, 0, 2}, {1, 1, 0}, {1, 0, 4}, {1, 3, 0}, {27, 123, 0}, {40, 189, 1}, {9, 48, 1}, {4, 0, 1}, {0, 0, 0}, {0, 0, 0}, {0, 2, 1}, {1, 0, 0}, {0, 0, 0}, {0, 0, 4}, {1, 0, 0}, {10, 50, 0}, {35, 167, 0}, {22, 98, 0}, {2, 2, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 1, 0}, {2, 0, 1}, {0, 0, 0}, {3, 15, 1}, {43, 198, 0}, {19, 94, 1}, {1, 1, 3}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 1, 2}, {1, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {1, 0, 2}, {2, 1, 0}, {0, 0, 0}, {0, 0, 0}, {10, 46, 2}, {36, 172, 0}, {14, 65, 0}, {2, 0, 3}, {0, 0, 0}, {0, 0, 0}, {2, 1, 0}, {0, 1, 0}, {0, 0, 0}, {0, 0, 2}, {0, 1, 0}, {11, 49, 0}, {36, 169, 0}, {14, 65, 0}, {0, 0, 0}, {0, 0, 0}, {0, 2, 1}, {0, 1, 0}, {0, 1, 0}, {1, 0, 5}, {0, 0, 0}, {16, 78, 3}, {36, 175, 0}, {10, 46, 2}, {1, 0, 0}, {0, 0, 0}, {1, 0, 0}, {0, 0, 2}, {0, 1, 0}, {3, 0, 2}, {0, 1, 0}, {0, 0, 4}, {6, 31, 2}, {46, 205, 0}, {21, 99, 0}, {0, 0, 2}, {1, 0, 0}, {0, 0, 0}, {0, 0, 2}, {0, 0, 0}, {0, 1, 0}, {1, 1, 1}, {7, 34, 0}, {36, 172, 0}, {12, 60, 0}, {0, 0, 2}, {1, 0, 0}, {0, 0, 0}, {0, 1, 0}, {1, 0, 0}, {0, 1, 0}, {0, 0, 2}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 1, 2}, {2, 1, 0}, {0, 0, 0}, {0, 0, 2}, {12, 61, 0}, {42, 198, 0}, {10, 53, 0}, {0, 0, 0}, {0, 0, 2}, {0, 1, 0}, {3, 0, 2}, {0, 0, 2}, {0, 0, 0}, {1, 1, 0}, {0, 0, 2}, {10, 54, 3}, {48, 219, 0}, {13, 56, 0}, {0, 0, 0}, {0, 0, 2}, {0, 0, 0}, {2, 1, 0}, {0, 0, 0}, {0, 0, 0}, {1, 0, 2}, {14, 67, 0}, {51, 235, 1}, {14, 66, 0}, {0, 0, 2}, {0, 0, 0}, {0, 0, 4}, {0, 0, 0}, {0, 0, 0}, {0, 1, 0}, {1, 0, 0}, {1, 0, 0}, {6, 26, 0}, {37, 173, 1}, {15, 76, 0}, {0, 0, 0}, {0, 0, 0}, {1, 0, 0}, {0, 0, 0}, {1, 1, 3}, {0, 0, 2}, {0, 1, 0}, {14, 62, 2}, {44, 203, 0}, {5, 30, 1}, {0, 1, 0}, {2, 0, 3}, {1, 0, 0}, {2, 0, 3}, {0, 0, 2}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {1, 0, 2}, {0, 0, 2}, {0, 0, 2}, {15, 61, 0}, {43, 201, 2}, {12, 55, 1}, {1, 1, 1}, {0, 1, 0}, {0, 0, 0}, {1, 1, 1}, {0, 0, 0}, {0, 1, 0}, {1, 0, 0}, {1, 1, 1}, {10, 60, 0}, {40, 183, 5}, {11, 49, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 1, 0}, {11, 47, 1}, {36, 167, 0}, {14, 71, 0}, {0, 0, 0}, {1, 0, 0}, {1, 0, 0}, {0, 2, 3}, {1, 0, 2}, {0, 2, 0}, {0, 0, 0}, {1, 0, 2}, {12, 50, 0}, {42, 197, 0}, {15, 66, 0}, {0, 1, 0}, {1, 0, 2}, {0, 0, 2}, {0, 1, 0}, {0, 1, 0}, {1, 0, 0}, {0, 0, 4}, {19, 92, 0}, {39, 193, 1}, {9, 37, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {1, 0, 0}, {0, 0, 2}, {1, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 2}, {0, 0, 0}, {0, 0, 2}, {0, 1, 0}, {2, 0, 3}, {0, 1, 0}, {15, 67, 1}, {36, 175, 0}, {9, 53, 0}, {1, 0, 5}, {0, 0, 0}, {1, 0, 0}, {0, 2, 1}, {0, 0, 0}, {0, 0, 0}, {1, 0, 0}, {2, 0, 3}, {18, 76, 0}, {38, 182, 0}, {3, 9, 0}, {0, 1, 0}, {0, 0, 2}, {1, 1, 0}, {1, 0, 0}, {1, 0, 2}, {0, 1, 0}, {3, 0, 0}, {9, 47, 0}, {46, 227, 2}, {21, 91, 2}, {0, 0, 2}, {1, 1, 0}, {0, 0, 0}, {0, 2, 1}, {0, 0, 0}, {0, 0, 0}, {0, 1, 0}, {0, 1, 0}, {12, 52, 0}, {44, 202, 1}, {8, 56, 0}, {0, 0, 0}, {0, 1, 0}, {0, 0, 0}, {1, 0, 0}, {0, 1, 0}, {1, 0, 0}, {0, 0, 0}, {23, 94, 0}, {35, 171, 0}, {4, 17, 0}, {0, 0, 0}, {0, 1, 0}, {0, 0, 0}, {0, 0, 0}, {1, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 2}, {0, 0, 0}, {0, 0, 0}, {0, 0, 2}, {2, 0, 1}, {0, 0, 0}, {0, 0, 0}, {4, 0, 3}, {0, 1, 0}, {13, 53, 3}, {51, 243, 0}, {14, 59, 0}, {3, 0, 0}, {0, 1, 0}, {1, 0, 0}, {0, 0, 2}, {0, 0, 0}, {1, 0, 0}, {0, 1, 0}, {0, 0, 0}, {29, 131, 0}, {31, 155, 0}, {0, 4, 0}, {2, 0, 1}, {0, 1, 4}, {0, 0, 0}, {4, 0, 0}, {0, 1, 0}, {0, 0, 0}, {0, 0, 2}, {8, 24, 0}, {39, 177, 3}, {15, 78, 0}, {0, 0, 0}, {1, 1, 0}, {0, 0, 0}, {0, 0, 2}, {0, 0, 0}, {0, 0, 0}, {0, 1, 0}, {1, 0, 2}, {14, 69, 1}, {37, 174, 0}, {10, 31, 0}, {0, 0, 2}, {1, 1, 3}, {1, 0, 0}, {0, 0, 2}, {0, 1, 0}, {0, 0, 0}, {0, 0, 2}, {27, 118, 0}, {40, 184, 0}, {6, 19, 1}, {0, 1, 2}, {2, 0, 1}, {0, 0, 4}, {0, 0, 2}, {0, 0, 0}, {0, 0, 2}, {1, 0, 0}, {0, 0, 0}, {0, 0, 2}, {0, 1, 0}, {0, 0, 0}, {1, 0, 0}, {1, 0, 0}, {0, 0, 0}, {0, 0, 0}, {1, 1, 1}, {10, 49, 2}, {37, 169, 0}, {14, 70, 0}, {1, 0, 2}, {0, 0, 0}, {0, 0, 2}, {0, 1, 0}, {0, 1, 0}, {1, 0, 0}, {2, 0, 3}, {3, 11, 0}, {39, 184, 1}, {22, 110, 0}, {3, 0, 0}, {0, 0, 0}, {1, 0, 2}, {0, 1, 2}, {0, 0, 0}, {0, 1, 3}, {1, 0, 0}, {0, 1, 0}, {12, 50, 0}, {42, 186, 0}, {13, 66, 0}, {1, 0, 0}, {0, 0, 5}, {0, 0, 0}, {1, 0, 2}, {0, 0, 2}, {4, 0, 0}, {1, 0, 0}, {0, 0, 0}, {22, 91, 0}, {43, 210, 0}, {6, 26, 1}, {0, 0, 0}, {0, 1, 0}, {1, 0, 2}, {0, 0, 0}, {1, 0, 0}, {0, 2, 1}, {0, 5, 0}, {27, 123, 0}, {35, 155, 5}, {4, 19, 0}, {0, 1, 0}, {1, 0, 0}, {0, 0, 0}, {1, 1, 1}, {0, 0, 2}, {0, 0, 0}, {0, 0, 2}, {0, 0, 2}, {0, 0, 0}, {0, 2, 0}, {0, 0, 0}, {2, 0, 3}, {0, 0, 2}, {0, 0, 0}, {0, 1, 0}, {0, 0, 0}, {12, 48, 2}, {43, 221, 1}, {17, 78, 1}, {1, 0, 0}, {0, 0, 0}, {0, 1, 0}, {0, 0, 0}, {0, 0, 0}, {0, 1, 0}, {0, 0, 0}, {6, 21, 0}, {37, 182, 1}, {17, 70, 0}, {0, 0, 0}, {0, 1, 0}, {2, 0, 3}, {0, 0, 4}, {0, 0, 0}, {0, 0, 0}, {0, 1, 0}, {0, 0, 0}, {10, 54, 1}, {47, 211, 2}, {8, 41, 0}, {1, 1, 1}, {0, 1, 0}, {1, 0, 2}, {0, 1, 0}, {0, 0, 0}, {0, 1, 0}, {1, 0, 2}, {1, 1, 0}, {24, 108, 0}, {33, 162, 0}, {4, 28, 2}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 2}, {1, 0, 0}, {0, 0, 0}, {1, 0, 0}, {26, 128, 0}, {39, 182, 2}, {0, 4, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 1, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {2, 0, 3}, {1, 0, 0}, {0, 1, 0}, {0, 0, 2}, {0, 1, 0}, {0, 1, 0}, {1, 0, 0}, {0, 0, 2}, {0, 0, 0}, {9, 39, 1}, {39, 181, 0}, {18, 94, 3}, {1, 0, 0}, {0, 0, 2}, {1, 0, 0}, {0, 0, 0}, {0, 1, 0}, {1, 0, 0}, {0, 0, 2}, {13, 58, 0}, {36, 185, 0}, {6, 29, 3}, {1, 1, 0}, {0, 1, 0}, {0, 0, 2}, {3, 0, 2}, {0, 0, 2}, {1, 0, 2}, {1, 0, 0}, {0, 0, 0}, {16, 84, 1}, {36, 167, 1}, {4, 22, 0}, {0, 1, 0}, {0, 0, 2}, {1, 2, 0}, {1, 0, 2}, {0, 0, 2}, {0, 1, 0}, {0, 0, 2}, {0, 2, 0}, {27, 114, 1}, {35, 171, 1}, {1, 1, 0}, {0, 0, 2}, {2, 0, 1}, {1, 0, 0}, {0, 0, 2}, {0, 2, 0}, {0, 0, 2}, {3, 5, 0}, {31, 134, 3}, {38, 169, 3}, {3, 21, 0}, {1, 0, 0}, {0, 0, 2}, {1, 1, 1}, {0, 0, 2}, {3, 0, 0}, {0, 0, 0}, {0, 0, 0}, {1, 1, 1}, {1, 1, 1}, {0, 0, 0}, {1, 0, 4}, {1, 0, 0}, {0, 0, 0}, {0, 1, 0}, {1, 0, 0}, {0, 0, 0}, {9, 39, 1}, {38, 177, 0}, {31, 143, 0}, {2, 14, 4}, {1, 0, 0}, {0, 0, 0}, {0, 1, 0}, {0, 0, 2}, {0, 1, 0}, {1, 0, 0}, {18, 89, 0}, {46, 213, 0}, {7, 33, 0}, {1, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 2}, {0, 1, 0}, {0, 0, 0}, {0, 1, 0}, {0, 1, 0}, {24, 110, 0}, {41, 197, 0}, {2, 9, 2}, {1, 0, 0}, {0, 0, 2}, {0, 0, 2}, {0, 2, 1}, {0, 0, 0}, {1, 1, 1}, {0, 0, 2}, {2, 7, 0}, {30, 144, 0}, {36, 162, 0}, {5, 16, 2}, {0, 1, 0}, {0, 1, 0}, {1, 0, 0}, {0, 1, 0}, {0, 1, 2}, {0, 2, 1}, {0, 0, 0}, {28, 131, 0}, {32, 163, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 0, 0}, {0, 0, 0}, {0, 1, 0}, {0, 0, 2}, {0, 1, 0}, {1, 0, 0}, {0, 1, 0}, {1, 0, 0}, {1, 0, 0}, {0, 0, 2}, {1, 1, 0}, {31, 149, 0}, {36, 172, 2}, {2, 9, 1}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {1, 0, 0}, {0, 1, 0}, {1, 0, 5}, {20, 96, 0}, {34, 163, 0}, {5, 20, 1}, {0, 0, 2}, {0, 1, 0}, {0, 0, 0}, {2, 0, 3}, {1, 0, 0}, {0, 1, 0}, {1, 0, 2}, {3, 3, 1}, {28, 136, 0}, {33, 154, 0}, {2, 14, 2}, {0, 1, 0}, {0, 0, 0}, {1, 1, 0}, {1, 0, 0}, {0, 1, 0}, {0, 0, 0}, {0, 0, 2}, {0, 2, 0}, {30, 143, 0}, {32, 158, 0}, {0, 1, 0}, {0, 0, 2}, {1, 0, 0}, {0, 0, 0}, {1, 0, 2}, {0, 1, 0}, {0, 0, 0}, {3, 4, 0}, {31, 149, 1}, {30, 143, 0}, {2, 9, 1}, {1, 0, 0}, {0, 0, 2}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {1, 6, 0}, {28, 127, 1}, {39, 183, 0}, {12, 50, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {24, 117, 0}, {41, 195, 1}, {4, 19, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {33, 149, 0}, {33, 149, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {1, 3, 0}, {32, 150, 1}, {30, 143, 0}, {2, 10, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {3, 14, 0}, {36, 169, 0}, {30, 141, 0}, {1, 1, 1}, {0, 0, 0}};

int period = 0;
int      head  = 0, tail = -10; // Index of first 'on' and 'off' pixels
uint32_t color = 0xFF0000;      // 'On' color (starts red)


volatile unsigned long pulses = 0;


int imageNum = 0;

//void IRAM_ATTR getPulse () {
//  flag = 1;
//  magCount++;
//  if (magCount > 20) {
//    if ((color >>= 8) == 0) {       //  Next color (R->G->B) ... past blue now?
//      color = 0xFF0000;
//    }
//    magCount = 0;
//  }
//}

void IRAM_ATTR getPulse () {
  flag = 1;
}

// REPLACE WITH YOUR NETWORK CREDENTIALS
const char* ssid = "YOUR WIFI SSID";
const char* password = "YOUR WIFI PASSWORD";

const char* PARAM_INPUT_1 = "input1";


// HTML web page to handle 3 input fields (input1, input2, input3)
const char index_html[] PROGMEM = R"rawliteral(
<!DOCTYPE HTML><html><head>
  <title>ESP Input Form</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  </head><body>
  <form action="/get">
    input1: <input type="text" name="input1">
    <input type="submit" value="Submit">
  </form>
</body></html>)rawliteral";

void notFound(AsyncWebServerRequest *request) {
  request->send(404, "text/plain", "Not found");
}

void setup() {

  pinMode(motor, OUTPUT);
  pinMode(motor, LOW);
  strip.begin(); // Initialize pins for output
  strip.show();  // Turn all LEDs off ASAP

  for (int x = 0; x < NUMPIXELS; x++) {
    color = 0xFF0000;
    strip.setPixelColor(x, color); // 'On' pixel at head
  }
  strip.show();
   
  strip.clear();
  strip.show();

  Serial.begin(115200);
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  if (WiFi.waitForConnectResult() != WL_CONNECTED) {
    Serial.println("WiFi Failed!");
    return;
  }
  Serial.println();
  Serial.print("IP Address: ");
  Serial.println(WiFi.localIP());

  // Send web page with input fields to client
  server.on("/", HTTP_GET, [](AsyncWebServerRequest * request) {
    request->send_P(200, "text/html", index_html);
  });

  // Send a GET request to <ESP_IP>/get?input1=<inputMessage>
  server.on("/get", HTTP_GET, [] (AsyncWebServerRequest * request) {
    String inputMessage;
    String inputParam;
    // GET input1 value on <ESP_IP>/get?input1=<inputMessage>
    if (request->hasParam(PARAM_INPUT_1)) {
      inputMessage = request->getParam(PARAM_INPUT_1)->value();
      inputParam = PARAM_INPUT_1;
    }
    else {
      inputMessage = "No message sent";
      inputParam = "none";
    }

    Serial.println(inputMessage);
    imageNum = inputMessage.toInt();
    request->send(200, "text/html", "HTTP GET request sent to your ESP on input field ("
                  + inputParam + ") with value: " + inputMessage +
                  "<br><a href=\"/\">Return to Home Page</a>");
  });
  server.onNotFound(notFound);
  server.begin();
  for (int x = 0; x < NUMPIXELS; x++) {
    color = 0xFF0000;
    strip.setPixelColor(x, color); // 'On' pixel at head
  }
  strip.show();
  delay(500);
  strip.clear();
  strip.show();
}

void loop() {
  if (imageNum > 0) {
    attachInterrupt(hall, getPulse, CHANGE);
    Serial.println(imageNum);
    setImage(imageNum);
    timerCount = millis();
    spinDisplay();
    imageNum = 0;
    detachInterrupt(hall);
  }
}

void spinDisplay() {
  digitalWrite(motor, HIGH);
  Serial.println("Spinning up!");
  delay(100);
  timerCount = millis();
  while (millis() - timerCount < motorSpinTime) {
    if (flag == 1) {
      for (int x = 0; x < NUMPIXELS; x++) {
        int scan = 0;
        if (x == 0) {
          scan = x + line;
        }
        else {
          scan = (x * 60) + line;
        }
        strip.setPixelColor(x, imageBuffer[scan][1], imageBuffer[scan][0], imageBuffer[scan][2]);
        //strip.setPixelColor(16 - x, 0, 0, 0);
      }
      line++;
      if (line > 60) {
        line = 0;
      }
      strip.show();
      flag = 0;// Refresh strip
    }
  }
  strip.clear();
  strip.show();
  digitalWrite(motor, LOW);
  delay(500);
}

void setImage(int imageNum) {
  switch (imageNum) {
    case 1:
      for (int i = 0; i < 1020; i++) {
        for (int j = 0; j < 3; j++) {
         // int randcolor = random(3);
         
          imageBuffer[i][j] = swirl2[i][j];
          int sumRGB = swirl2[i][0] + swirl2[i][1] + swirl2[i][2];
          if (sumRGB < 30) {
            imageBuffer[i][j] = 0;
          }
        }
      }
      break;
    case 2:
      for (int i = 0; i < 1020; i++) {
        for (int j = 0; j < 3; j++) {
          imageBuffer[i][j] = twitter[i][j];
          int sumRGB = twitter[i][0] + twitter[i][1] + twitter[i][2];
          if (sumRGB < 30) {
            imageBuffer[i][j] = 0;
          }
        }
      }
      break;
    case 3:
      for (int i = 0; i < 1020; i++) {
        for (int j = 0; j < 3; j++) {
          imageBuffer[i][j] = sh[i][j];
          int sumRGB = sh[i][0] + sh[i][1] + sh[i][2];
          if (sumRGB < 30) {
            imageBuffer[i][j] = 0;
          }
        }
      }
      break;
    case 4:
      for (int i = 0; i < 1020; i++) {
        for (int j = 0; j < 3; j++) {
          imageBuffer[i][j] = youtube[i][j];
          int sumRGB = youtube[i][0] + youtube[i][1] + youtube[i][2];
          if (sumRGB < 30) {
            imageBuffer[i][j] = 0;
          }
        }
      }
      break;
    case 5:
      for (int i = 0; i < 1020; i++) {
        for (int j = 0; j < 3; j++) {

          imageBuffer[i][j] = upvote[i][j];
          int sumRGB = upvote[i][0] + upvote[i][1] + upvote[i][2];
          if (sumRGB < 30) {
            imageBuffer[i][j] = 0;
          }
        }
      }
      break;
      case 6:
      for (int i = 0; i < 1020; i++) {
        for (int j = 0; j < 3; j++) {

          imageBuffer[i][j] = patrons[i][j];
          int sumRGB = patrons[i][0] + patrons[i][1] + patrons[i][2];
          if (sumRGB < 30) {
            imageBuffer[i][j] = 0;
          }
        }
      }
      break;
      case 7:
      for (int i = 0; i < 1020; i++) {
        for (int j = 0; j < 3; j++) {

          imageBuffer[i][j] = redstrip[i][j];
          int sumRGB = redstrip[i][0] + redstrip[i][1] + redstrip[i][2];
          if (sumRGB < 30) {
            imageBuffer[i][j] = 0;
          }
        }
      }
      break;
      case 8:
      for (int i = 0; i < 1020; i++) {
        for (int j = 0; j < 3; j++) {

          imageBuffer[i][j] = rainbow[i][j];
          int sumRGB = rainbow[i][0] + rainbow[i][1] + rainbow[i][2];
          if (sumRGB < 30) {
            imageBuffer[i][j] = 0;
          }
        }
      }
      break;
    default:
      break;
  }
}
