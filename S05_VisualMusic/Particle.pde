//  a moving element, that is controlled by forces
//  when an element reaches the edge of the area, it tells pd to play
//  a sound. the pitch of the sound depends on the index of the element.
//  the index also defines color & size for visual clarity

class Particle {
  PVector vel;
  int eSize;
  PVector loc;
  int id;
  int counter;
  
  Particle(int _id) {
    id = _id;
    counter = 0;
    loc = new PVector( random(diameter)-radius, random(diameter)-radius );
    loc.limit( radius - 50 );
    vel = new PVector( random( -1, 1 ), random( -1, 1 ) );
  }
  
  void update() {
    loc.add(vel);
    PVector v = new PVector( loc.x, loc.y );
    if( dist( v.x, v.y, origin.x, origin.y ) > radius - eSize ) {
      PVector n = new PVector( loc.x, loc.y );
      
      //  avoid too often repeats
      if(counter>30){
        fill(255);
        ellipse(loc.x,loc.y,50,50);
        
        //  start with lower sounds by reversing pitch / id
        float pitch = particles.size()-id;
        //  send a float message to Pd here
        pd.sendFloat( "trigger",  pitch );
        counter = 0;
      }
      n.normalize();
      n.mult( 2 * n.dot( vel ) );
      vel.sub( n );
    }
    counter++;  
  }
  
  void display() {
    fill( map( id, 0, particles.size(), 200, 240), 255, 255 );
    ellipse( loc.x, loc.y, eSize + id*2, eSize + id*2 );
    fill( 255 );
    ellipse( loc.x, loc.y, eSize/2 + id, eSize/2 + id );
  }
  
  void randomDirection() {
    vel = new PVector( random( -1, 1 ), random( -1, 1 ) );
  }
}
