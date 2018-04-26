/* 

Web Based Sonification example

*/

import org.puredata.processing.PureData;
PureData pd;

String loc = "Berlin";
String url = "https://api.apixu.com/v1/current.json?key=513d8003c8b348f1a2461629162106&q=" + loc;

JSONObject json;
JSONObject current;

float dir, temp, speed; 

void setup() {
  size( 800, 600, P3D );
  pd = new PureData(this, 44100, 2, 2);
  pd.openPatch("Main.pd");
  pd.start();
  
  json = loadJSONObject(url);
  current = json.getJSONObject("current");
  dir = current.getFloat("wind_degree");
  temp = current.getFloat("temp_c");
  speed = current.getFloat("wind_mph");
}

void draw() {
  background(0);
  background(0);
  textSize(40);
  text(loc, 10, 50);
  text("Wind direction: " + dir + " degrees", 10, 100);
  text("Temperature: " + temp + " celsius", 10, 150);
  text("Speed: " + speed + " mph", 10, 200);
  
  pd.sendFloat("speed", speed );
  pd.sendFloat("temp", temp );
  pd.sendFloat("dir", dir );
}

void pdPrint(String s) {
  println( s );
}
