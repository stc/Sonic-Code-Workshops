/* 

Live Capture Input Sonification example

*/

import org.puredata.processing.PureData;
import processing.video.*;
PureData pd;

//  number of sounds that sonify pixels
int NUMSOUNDS = 10;

Capture video;

void setup() {
  size( 800, 600, P3D );
  pd = new PureData(this, 44100, 2, 2);
  pd.openPatch("Main.pd");
  pd.start();
  
  video = new Capture(this,320, 240);
  video.start();  
}

void draw() {
  background(0);
  if (video.available()) {
    video.read();
    image(video, 0, 0, width, height);
    for( int i=0; i< NUMSOUNDS; i++ ) {
      color c = get(width/2, (int)( i / (float)NUMSOUNDS * height ) );
      fill(c);
      noStroke();
      ellipse(width/2, i / (float)NUMSOUNDS * height , 20, 20 );
    
      //  sending each pixel's red value to pd
      pd.sendFloat("n" + i, red(c) );
    }
  }
  stroke(255,82,114);
  line(width/2,0,width/2,height);
}

void pdPrint(String s) {
  println( s );
}
