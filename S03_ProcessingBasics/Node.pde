//  a class, named "Node"
class Node {
  //  a variable to store a colour
  color myColor;
  
  //  constructor
  Node( color c ){
    //  pass the variable we received upon creating this class, from outside
    myColor = c;
  }
  //  a function we can call from outside
  void showCircle( int xpos, int ypos, int xsize, int ysize ){
    noStroke();
    fill( myColor );
    ellipse( xpos, ypos, xsize, ysize );
    fill(255);
    textAlign(CENTER);
    text("i am at " + xpos + " " + ypos, xpos, ypos );
    textAlign(LEFT);
    
    //  we call another function that belong to this class
    changeColor();
  }
  
  //  a function, that changes the colour based on the x value of the mouse
  void changeColor() {
    myColor = color( 200, map( mouseX, 0, width, 0, 255 ), 55 );
  }
}
