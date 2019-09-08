class Building { 
  float xRandom, yRandom;
  float xPos = random(0, height);
  float yPos = random(0, width);
  Building(float randomizerX, float randomizerY) {
    xRandom = randomizerX;
    yRandom = randomizerY;
  }

  void display() {
    pushMatrix();
    translate(xPos + xRandom, yPos + yRandom);
    rotateX(-PI); 
    rotateY(PI); 
    noStroke();
    fill(255);
    box(200);
    popMatrix();
  }
  
}
