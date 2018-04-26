/* 

Data Sonification example

*/

import org.puredata.processing.PureData;
PureData pd;

Table dataPoints;

ArrayList<String> times = new ArrayList<String>();
ArrayList<Float> values = new ArrayList<Float>();


void setup() {
  size( 800, 600, P3D );
  pd = new PureData(this, 44100, 2, 2);
  pd.openPatch("Main.pd");
  pd.start();
  
  dataPoints = loadTable("sea-level.csv", "header");
  
  for (TableRow row : dataPoints.rows()) {
    
    String time = row.getString("Time");
    
    // GMSL = global mean sea level
    float value = row.getFloat("GMSL");
    times.add(time);
    values.add(value);
  }
  
}

void draw() {
  background(0);
  stroke(255,82,114);
  line(mouseX,0,mouseX,height);
  
  float readIndex = map(mouseX,0,width,0,times.size());
  
  noStroke();
  fill(255);
  textSize(40);
  text("GLOBAL SEA LEVEL", 20, 50);
  fill(255,100);
  text(times.get(int(readIndex)), 20, 100);
  text(values.get(int(readIndex)), 20, 150);
  
  stroke(100,100,255);
  for(int i=0; i<values.size()-1;i++) {
    line(map(i,0,values.size(),0,width), height - ( values.get(i) * 5 ), map(i+1,0,values.size(),0,width), height - ( values.get(i+1) * 5 ) );
  }
  
  noStroke();
  fill(100,100,255);
  ellipse(mouseX, height - ( values.get(int(readIndex)) * 5 ), 10, 10);
  
  pd.sendFloat("value", values.get(int(readIndex)) );
}

void pdPrint(String s) {
  println( s );
}
