//  a simple button class, modified
//  from Processing's built-in examples

class Button {
  int x, y;
  int size;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false; 
  int w, h; 
  int id; 
  
  Button( int ix, int iy, int isize, color icolor, color ihighlight, int iid ) {
    x = ix;
    y = iy;
    w = isize;
    h = isize;
    size = isize;
    id = iid;
    basecolor = icolor;
    highlightcolor = ihighlight;
    currentcolor = basecolor;
  }
  
  void update() {

    if( over() ) {
      currentcolor = highlightcolor;
    } 
    else {
      currentcolor = basecolor;
    }
  }
  
  int pressed() {
    if( over() ) {
      locked = true;
      return id;
    } 
    else {
      locked = false;
      return -1;
    }    
  }

  boolean over() { 
    if ( mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h ) {
      return true;
    } 
    else {
      return false;
    }
  }
  
  void display() {
    stroke(255);
    fill(currentcolor);
    rect(x, y, size, size);
  }
}
