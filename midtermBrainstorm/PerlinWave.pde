
class PerlinWave {
  float resolution = 260; 
  float rad = 10;
  float x = 1;
  float y = 1;

  float nInt = 5;
  float nAmp = 0.7;
  float t = 0;
  float tChange = .16; 
  int opacity = 1;
  float nVal;
  float redV = 120;
  float greenV = random(80, 140);
  float blueV = 200;
  float clickedX = mouseX;
  float clickedY = mouseY;

  boolean filled = false;

  PerlinWave() {
  }

  void hitBuilding(Building b) {
    float d = dist(this.x, this.y, b.xPos, b.yPos);

    if (d <= 300) {
      x = b.xPos + 300;
      y = b.yPos + 300;
      sinePerlin.play();
    } else {
      sinePerlin.stop();
    }
  }  

  void update(Building b) {
    //Increase the distance out

    float d = dist(this.x, this.y, b.xPos, b.yPos);

    if (d <= 300) {
      x = b.xPos + 300;
      y = b.yPos + 300;
      //rad += 0.01;
      sinePerlin.play();
    } else {
      rad += 1;

      sinePerlin.stop();
    }
  }

  void display() {
    //Set the Stroke Color
    stroke(redV, greenV, blueV);
    beginShape();
    for (float a=0; a<=TWO_PI; a+=TWO_PI/resolution) {

      nVal = map(noise( cos(a)*nInt+1, sin(a)*nInt+1, t ), 0.0, 1.0, nAmp, 1.0); 
      x = mouseX + cos(a)*rad *nVal;
      y = mouseY + sin(a)*rad *nVal;
      //println(x);
      vertex(x, y);
    }
    endShape(CLOSE);

    t += tChange;

    if (rad > 140) {
      redV -= 1;
      greenV -= 1;
      blueV -= 1;
    }
  }


  boolean dead() {
    if (rad > 300) {
      
      return true;
    } else {
      return false;
    }
  }
}
