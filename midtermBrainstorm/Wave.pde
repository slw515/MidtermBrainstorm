
class Wave {
  PVector loc;
  int farOut;
 
  color strokeColor;
 
  Wave() {
    loc = new PVector();
   
    loc.x = mouseX;
    loc.y = mouseY;
   
    //Set the distance out to 1
    farOut = 1;
   
    //Randomize the Stroke Color
    strokeColor = color(random(255), random(255), random(255));
  }
 
  void update() {
    //Increase the distance out
    farOut += 1;
    
    if (farOut > 300) {
      stroke(strokeColor);
    }  
  }
 
  void display() {
    //Set the Stroke Color
    stroke(strokeColor);
   
    //Draw the ellipse
    ellipse(loc.x, loc.y, farOut, farOut);
  }
 
  boolean dead() {
    //Check to see if this is all the way out
    if(farOut > 500) {
      //If so, return true
      return true;
    }
    //If not, return false
    return false;
  }
}
