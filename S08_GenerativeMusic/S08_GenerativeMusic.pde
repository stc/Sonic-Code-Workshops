/* 

Generative music example. Demonstrating how to create melodies and rythms within puredata using simple logic.
Some parameters are sent from PureData to Processing to be able to see the actual values.

It is also using a pgraphics object to draw some lines where background is not erased so drawn entities become 
continuous.


*/


import org.puredata.processing.PureData;
PureData pd;

//  parameters from PUre Data
float note1, note2, tone, decay, maincount;
String reverb = "";

//  a PGraphic object to draw in
PGraphics pg;
int counter;

void setup() {
  size( 800, 600, P3D );
  background(255);
  noStroke();
  
  //  create a PGraphics object, with sketch width and 100 pixels height
  //  we will draw into this to achieve some nice visuals
  pg = createGraphics( width,100 );
  
  //  setup Pd
  pd = new PureData(this, 44100, 0, 2);
  pd.openPatch("Main.pd");
  pd.subscribe("p5-note1");
  pd.subscribe("p5-note2");
  pd.subscribe("p5-tone");
  pd.subscribe("p5-decay");
  pd.subscribe("p5-reverb");
  pd.subscribe("p5-count");
  pd.start();
  pd.sendBang("init");
}

void draw() {
  background(255);
  textSize(20);
  fill(0);
  text("First Melody", width/5, height / 5);
  fill(255,82,128);
  textSize(36);
  text( (int)note1, width/5, height/5 + 40 );
  textSize(20);
  fill(0);
  text("Second Melody", width/ 2+width/6, height / 5);
  fill(255,82,128);
  textSize(36);
  text( (int)note2, width/2 + width/6, height/5 + 40 );
  
  //  we draw into the PGraphics object. notice the "pg" prefix
  //  and the beginDraw() / endDraw() functions
  pg.beginDraw();
  pg.noStroke();
  pg.fill(255,5);
  pg.rect(0,0,pg.width,pg.height);
  pg.strokeWeight(3);
  pg.stroke(255,82,128);
  pg.point( counter + width, 100 - note1 );
  pg.stroke(120, decay, decay);
  pg.point( counter + width, 100 - note2 );
  pg.stroke(255);
  pg.line(counter + width-3,0,counter + width-3,pg.height);
  counter--;
  if(counter<-width) counter+=width;
  pg.endDraw();
  //  draw the pg object to the screen
  image( pg, 0, height/5+60 );
  
  //  draw other info
  fill(220);
  rect(0,height/2 + height/7,width,height/2);
  fill(255);
  textSize(20);
  noStroke();
  text("Tone: ", width/5, height/2+height/5);
  text(tone, width/5 + 80, height/2+height/5);
  rect(width/5 + 160, height/2 + height/5 - 18, tone * 80, 18 );
  
  text("Reverb", width/5,height/2+height/4);
  fill(255,82,128);
  textSize(36);
  text(reverb, width/5, height/2+height/4 + 40);
  fill(255);
  text("All notes: " + (int)maincount, width/5, height/2+height/4+80);
  
  //  connect melodies with text for visual clarity
  stroke(100,80);
  line(width/5, height/5 + 40, counter + width, 100 - note1 + height/5+60);
  line(width/ 2+width/6, height/5 + 40, counter + width, 100 - note2 + height/5+60);
}

void pdPrint(String s) {
  // Handle string s, printed by Pd
  println(s);
}

//  receive values from pd

void receiveFloat(String source, float x) {
  if(source.equals("p5-note1")) {
    note1 = x;
  }else if(source.equals("p5-note2")) {
    note2 = x;
  }else if(source.equals("p5-tone")) {
    tone = x;
  }else if(source.equals("p5-decay")) {
    decay = x;
  }else if(source.equals("p5-count")) {
    maincount = x;
  }
}

void receiveSymbol(String source, String sym) {
  println("y");
  if(source.equals("p5-reverb")) {
    reverb = sym;
  }
}

