/* 

Visual music example. Demonstrating how to play polyphonic sound samples of the same sound 
with different pitches. The behaviour of visual elements are triggering the sounds. 

Sonic Instruments Workshop / 2015
(c) stc@binaura.net

*/


import org.puredata.processing.PureData;
PureData pd;

PVector origin;
int diameter;
int radius;
int NUM = 10;
ArrayList< Particle > particles = new ArrayList< Particle >();

void setup() {
  size( 800, 600, P3D );
  background(255);
  //  use hue, saturation & brightness for color parameters
  colorMode( HSB );
  noStroke();
  
  //  setup Pd
  pd = new PureData(this, 44100, 0, 2);
  pd.openPatch("Main.pd");
  pd.start();
  
  //  initialize element size
  diameter = height - 100;
  radius = diameter / 2;
  origin = new PVector( 0, 0);
  
  //  add particles to the arraylist
  for( int i = 0; i < NUM; i++ ) {
    particles.add( new Particle(i) );
    //  add initial direction to each particle
    particles.get(i).randomDirection();
  }
}

void draw() {
  fill( 140, 255, 100, 10 );
  rect( 0, 0, width, height );
  translate( width / 2, height / 2 );
  fill( 180, 0, 0, 30 );
  ellipse( 0, 0, diameter, diameter );
  
  for( Particle p : particles ) {
    p.update();
    p.display();
  }
}

void mousePressed() {
  //  reset
  particles.clear();
  //  add particles to the arraylist
  for( int i = 0; i < NUM; i++ ) {
    particles.add( new Particle(i) );
    //  add initial direction to each particle
    particles.get(i).randomDirection();
  }
}

