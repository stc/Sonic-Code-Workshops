/* 

Sonification example
Sonic Instruments Workshop / 2015
(c) stc@binaura.net

*/

//  import PureData
import org.puredata.processing.PureData;
PureData pd;

PImage img;

//  number of sounds that sonify pixels
int NUMSOUNDS = 10;

void setup() {
  size( 800, 600, P3D );
  pd = new PureData(this, 44100, 2, 2);
  pd.openPatch("Main.pd");
  pd.start();
  
  //  load an image from the data folder
  img = loadImage("Yantra.jpg");
}

void draw() {
  background(0);
  imageMode(CENTER);
  image( img, width/2, height/2 );
  
  for( int i=0; i< NUMSOUNDS; i++ ) {
    color c = get(mouseX, (int)( i / (float)NUMSOUNDS * height ) );
    fill(c);
    noStroke();
    ellipse(mouseX, i / (float)NUMSOUNDS * height , 20, 20 );
    
    //  sending each pixel's red value to pd
    pd.sendFloat("n" + i, red(c) );
  }
  stroke(255,82,114);
  line(mouseX,0,mouseX,height);
}

void pdPrint(String s) {
  println( s );
}