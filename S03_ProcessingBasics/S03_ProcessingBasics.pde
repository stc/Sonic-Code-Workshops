/* 

Processing basics: introducing input events, functions, for loop, classes 
Sonic Instruments Workshop / 2015
(c) stc@binaura.net

*/


//---------------------------------------------    Define variables, classes here ---------------------------------------------

//  this is a class, in a separate file (type first, then name)
Node node;

//  a string variable to display different information later (type first, then name)
String textToDisplay;

//---------------------------------------------  This runs once when we start the app -----------------------------------------

void setup() {
  //  using window size of 800 x 600 px, with 3D renderer 
  size( 800, 600, P3D );
  
  //  initialize our info text like this:
  textToDisplay = "click somewhere or push something";
  
  //  make one or more instances from our class like this:
  //  the constructor of Node class receives a colour parameter, we have to pass when creating it
  node = new Node( color( 200,100,55 ) );
}

//---------------------------------------------  This is repeated until we quit -----------------------------------------------

void draw() {
  //  refresh the background with rgb colour
  background( 255 );
  
  //  display our custom class which is named node (notice, in the Node.pde file, we have a function, called "showCircle"
  //  we are calling that method from outside now.
  node.showCircle( mouseX, mouseY, 140, 140 );
  
  //  let's draw one hundred individual rectangles to the bottom of the screen
  //  we can make it, usin a "for" loop
  for( int i = 0; i < 100; i++ ) {
    //  each rectangle's colour will depend on its position in the loop. first is black, last is transparent
    fill( 0, map( i, 0, 100, 255, 0 ) );
    //  first parameter: x position, second parameter: y position. third, fourth: width, height of rectangle
    rect( i * (width / 100), height - 20, 2, 20 );
  }
  
  //  display info text at x:30 y: 30 pixels
  fill(0);
  text( textToDisplay, 30, 30 );  
}

//--------------------------------------------------------  User Interactions ---------------------------------------------------

void mousePressed() {
  textToDisplay = "you pressed the mouse at " + mouseX + ", " + mouseY;
}

void mouseDragged() {
  textToDisplay = "you are dragging the mouse at " + mouseX + ", " + mouseY;
}

void mouseReleased() {
  textToDisplay = "you released the mouse at " + mouseX + ", " + mouseY;
}

void keyPressed() {
  textToDisplay = "you pressed key " + key;
}



