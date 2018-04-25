/* 

Granular Field: A 32 channel granular synthesis engine with custom controls. This technique is about
taking apart an existing sound sample into small grains that remain individually controllable fragments. 
Useful for creating sound textures, sound design, rythmic patterns.

*/


import org.puredata.processing.PureData;
PureData pd;

//  variables for display soundwave
float[] soundWave;
PGraphics soundWaveGfx;
int soundLength;
int vDivide;

//  variables for controllers
int playPos;
int poly, ppoly;

// UI
Slider sliderDensity, sliderRandomness, sliderVoices, sliderLength;

void setup() {
  size( 800, 600, P3D );
  vDivide = height / 2 + height / 4;
  background(255);
  
  //  setup Pd //<>//
  pd = new PureData(this, 44100, 0, 2);
  pd.openPatch("Main.pd");
  pd.start();
  
  //  we draw the soundwave only once, into a PGraphics image buffer
  soundWaveGfx = createGraphics(width, vDivide);
  soundLength = pd.arraySize( "P5-buffer");
  soundWave = new float[ soundLength ];
  pd.readArray( soundWave, 0, "P5-buffer", 0, soundLength );
  soundWaveGfx.beginDraw();
  soundWaveGfx.background(220);
  soundWaveGfx.stroke(0);
  for( int i = 0; i < soundLength; i++ ) {
    int xp = int( i / (float)soundLength * width );
    soundWaveGfx.line( xp, height / 2.5, xp, height / 2.5 + soundWave[ i ] * 100 ); 
  }
  soundWaveGfx.endDraw(); //<>//
  
  //  setup sliders
  sliderDensity = new Slider( 10, height - 100, 100, 10, 2, "DENSITY" );
  sliderRandomness = new Slider( 10, height - 80, 100, 10, 2, "RANDOMNESS" );
  sliderVoices = new Slider( 200, height - 100, 100, 10, 2, "VOICES" );
  sliderLength = new Slider( 200, height - 80, 100, 10, 2, "LENGTH" );
}

void draw() {
  background(255);
  image( soundWaveGfx, 0, 0 );
  fill(255,0,0,50);
  float rndOffset = sliderRandomness.getPos();
  rect(playPos -rndOffset * 100, 0, rndOffset * 200, vDivide);
  fill(255,0,0);
  rect( playPos, 0, 2, vDivide);
  
  //  handle sliders
  sliderDensity.update();
  sliderDensity.display();
  sliderRandomness.update();
  sliderRandomness.display();
  sliderVoices.update();
  sliderVoices.display();
  sliderLength.update();
  sliderLength.display();
  
  // send slider values to pd engine  
  pd.sendFloat( "P5-density", sliderDensity.getPos() * 1000 );
  pd.sendFloat( "P5-randomize", sliderRandomness.getPos() );
  poly = (int)( sliderVoices.getPos() * 32 - 5);
  if(poly!=ppoly)pd.sendFloat( "P5-voices", poly );
  ppoly = poly;
  pd.sendFloat( "P5-length", sliderLength.getPos() / 10 );
}

void mousePressed() {
}

void mouseDragged() {
  if(mouseY < vDivide ) {
    playPos = mouseX;
    pd.sendFloat( "P5-pos", mouseX / (float)width );
  }
}

void pdPrint(String s) {
  // Handle string s, printed by Pd //<>//
  println(s);
}