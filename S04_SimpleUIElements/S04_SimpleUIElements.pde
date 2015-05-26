/* 

Building simple UI elements: buttons & sliders
Sonic Instruments Workshop / 2015
(c) stc@binaura.net

*/

//  import PureData
import org.puredata.processing.PureData;
PureData pd;

//  create a slider
Slider slider;

//  create some buttons, we are using an arraylist, to store several objects
//  in one dynamic container
ArrayList< Button > buttons = new ArrayList< Button >();
//  check if any button is pressed already
boolean locked = false;

//--------------------------------------------------------------------------------------------------

void setup() {
  size( 800, 600, P3D );
  
  //  start Pd
  pd = new PureData(this, 44100, 0, 2);
  //  android file search path (data must be copied to sd card). more on this later
  //  pd.openPatch("//sdcard//WS/Main.pd");
  pd.openPatch("Main.pd");
  pd.start();
  
  //  setup the slider (see Slider.pde for contructor parameters)
  slider = new Slider( width / 4, height - 100, width / 2, 30, 2 );
  
  //  define colors for buttons
  color highlightcolor = color( 255, 100, 100 );
  color basecolor = color( 100, 100, 100 );
  
  //  setup the buttons (see Button.pde for constructor parameters)
  buttons.add( new Button( width / 4, 20, 190, basecolor, highlightcolor, 1 ) );
  buttons.add( new Button( width / 2, 20, 190, basecolor, highlightcolor, 2 ) );
  buttons.add( new Button( width / 4, 220, 190, basecolor, highlightcolor, 3 ) );
  buttons.add( new Button( width / 2, 220, 190, basecolor, highlightcolor, 4 ) );
}

//---------------------------------------------------------------------------------------------------

void draw() {
  background( 255 );
  
  //  calling update and display functions of slider
  slider.update();
  slider.display();
  
  //  if no button pressed, iterate over all buttons using a for loop and update them
  if(locked == false) {
    for( Button b : buttons ) {
      b.update();
    }
  }else{
    locked = false;
  }
  
  //  iterate over the buttons and display them
  for( Button b : buttons ) { 
    b.display();
  }
  
  //  display slider value
  fill(0);
  text( slider.getPos(), width - width / 4, height - 100 );
  
  //  send slider value to Pd, controlling the left / right panning 
  //  of outgoing audio
  pd.sendFloat( "panning",slider.getPos() );
}

//----------------------------------------------------------------------------------------------------

void mousePressed(){
    
  //  iterate over buttons, and check which one has been pressed
  //  send corresponding message to Pd upon each buttonpress
  
  for( Button b : buttons ) {
    if( b.pressed() == 1 ) {
      pd.sendBang( "sample1" );
      println( "Sample 1 sent to Pd" );
    }else if( b.pressed() == 2 ) {
      pd.sendBang( "sample2" );
      println( "Sample 2 sent to Pd" );
    }
    else if( b.pressed() == 3 ) {
      pd.sendBang( "sample3" );
      println( "Sample 3 sent to Pd" );
    }
    else if( b.pressed() == 4 ) {
      pd.sendBang( "sample4" );
      println( "Sample 4 sent to Pd" );
    }
  }
}
