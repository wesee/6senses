#include <WiFi.h>
#include <Wire.h>
#include <BMA222.h>
#include "SPI.h"

#include <aJSON.h>
#include "M2XStreamClient.h"

char ssid[] = "<ssid>"; //  your network SSID (name)
char pass[] = "<password>"; // your network password (use for WPA, or use as key for WEP)

int status = WL_IDLE_STATUS;

char deviceId[] = "<device id>"; // Feed you want to post to
char m2xKey[] = "<api key>"; // Your M2X access key
char streamName[] = "<stream name>"; // Stream you want to post to

BMA222 mySensor;

WiFiClient client;

M2XStreamClient m2xClient(&client, m2xKey);

void setup() {

  Serial.begin(9600);
  pinMode(RED_LED, OUTPUT); 

  mySensor.begin();
  uint8_t chipID = mySensor.chipID();
  Serial.print("chipID: ");
  Serial.println(chipID);

  delay(10);

  // attempt to connect to Wifi network:
  Serial.print("Attempting to connect to Network named: ");
  // print the network name (SSID);
  Serial.println(ssid); 
  WiFi.begin(ssid, pass); // Use this if your wifi network requires a password
  // WiFi.begin(ssid);    // Use this if your wifi network is unprotected.
  while ( WiFi.status() != WL_CONNECTED) {
    // print dots while we wait to connect
    Serial.print(".");
    delay(300);
  }
  Serial.println("\nConnect success!");
  Serial.println("Waiting for an ip address");

  while (WiFi.localIP() == INADDR_NONE) {
    // print dots while we wait for an ip addresss
    Serial.print(".");
    delay(300);
  }

  Serial.println("\nIP Address obtained");

  // you're connected now, so print out the status  
  printWifiStatus();

}

void loop() {

  // Retrieve the x, y, and z accelerometer data
  float x = mySensor.readXData()/65.0;
  float y = mySensor.readYData()/65.0;
  float  z = mySensor.readZData()/65.0;
  // Display values in serial monitor
  Serial.print("Accel X: ");
  Serial.print(x);
  Serial.print(", Y: ");
  Serial.print(y);
  Serial.print(", Z: ");
  Serial.println(z);

  // Calculate pitch and roll. Find the maximum tilt angle.
  float pitch = atan(x / sqrt(y * y + z * z)) * 180;
  float roll = atan(y / sqrt(x * x + z * z)) * 180;
  float maxTilt = max(abs(roll), abs(pitch)) / 3.14159;
  Serial.print(" maxTilt: ");
  Serial.println(maxTilt);


  // If the maximum tilt is over 20 degrees, then send
  // data to stream
  if (maxTilt > 20) {
    int response = m2xClient.updateStreamValue(deviceId, streamName, maxTilt);
    Serial.print("M2x client response code: ");
    Serial.println(response);

    // Flash red LED if post is successful
    if (response == 202) {
      digitalWrite(RED_LED, HIGH);   // Turn the LED on (HIGH is the voltage level)
      delay(500);                // wait for a half second
      digitalWrite(RED_LED, LOW);
    }
  }



}

void printWifiStatus() {
  // print the SSID of the network you're attached to:
  Serial.print("SSID: ");
  Serial.println(WiFi.SSID());

  // print your WiFi shield's IP address:
  IPAddress ip = WiFi.localIP();
  Serial.print("IP Address: ");
  Serial.println(ip);
}

