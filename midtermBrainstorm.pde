
Building building[];
PerlinWave[] waves = new PerlinWave[10000];
import processing.sound.*;
SinOsc sine;
SinOsc sinePerlin;

float rLight = 120;
float gLight = random(80, 140);
float bLight = 200;
int incrementWaves = 0;
float loudness = 0;
//use grip duration to control frequency of perlin waves (not too many if device is constantly gripped)
long gripDuration = 0; 

void setup() {
  //size(1200, 1000, P3D);
  fullScreen(P3D);
  noiseDetail(8);

  int buildingCount = 12;
  building = new Building[buildingCount];
  //waves = new PerlinWave[incrementWaves];

  for (int i = 0; i < buildingCount; i++) {
    building[i] = new Building(random(50, 200), random(50, 150));
  }

  for (int i = 0; i < waves.length; i++) {
    waves[i] = new PerlinWave();
  }
  sine = new SinOsc(this);
  sinePerlin = new SinOsc(this);

  sine.play();
}


void draw() {
  background(0);
  noStroke();

  sine.amp(map(loudness, 0, 50, 0, 1));
  sine.freq(300);  
  if (mousePressed == true) {
    rLight = 120;
    gLight = random(80, 140);
    bLight = 200;
    loudness += 0.4;
    gripDuration += 1;
  } else {  
    rLight += 1;
    gLight += 1;
    bLight += 1;
    loudness -= .3;
  }

  if (loudness <= 0) {
    loudness = 0;
  }  

  if (loudness >= 20) {
    loudness = 20;
  }  

  println(loudness);

  //ambientLight(255, 255, 255, mouseX, mouseY, 1);

  pointLight(rLight, gLight, bLight, mouseX, mouseY, 1);
  fill(0);

  for (int i = 0; i < building.length; i ++) {
    building[i].display();
    for (int x = 0; x < incrementWaves; x ++) {
      //waves[x].hitBuilding(building[i]);
      waves[x].update(building[i]);
      //waves[x].display();


      //waves[i].update();
      //waves[i].display();
    }
  }
  if (mousePressed && (gripDuration % 18 == 1)) {
    incrementWaves++;
  }

  //println(incrementWaves);


  for ( int i = 0; i < building.length; i++ ) {
    for ( int j = i+1; j < building.length; j++ ) {
      float distance = dist( building[i].xPos, building[i].yPos, building[j].xPos, building[j].yPos );
      if ( distance < 700 ) {
        stroke(rLight, gLight, bLight);
        line( building[i].xPos, building[i].yPos, building[j].xPos, building[j].yPos );
      }
    }
  }

  noFill();
  stroke(255);

  for (int i = 0; i < incrementWaves; i ++) {
    //waves[i].update();
    waves[i].display();
    //for (int x = 0; x < building.length; x ++) {
    //  waves[x].hitBuilding(building[i]);
    //}
    if (waves[i].dead()) {
      //println("hello");
    }
  }
}
