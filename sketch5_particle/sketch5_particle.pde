float varX = 15, varY = 15;

float  R = 200; 


void setup() {
  size(displayWidth, displayHeight);
  
  //colorMode(HSB, 360, 100, 100, 100);
  blendMode(ADD);
  
  background(0);
}

void draw() {
  
  strokeWeight(1);
  //stroke(210, 50, 50);
  noFill();
  
  float x, y, dx, dy;
  x = mouseX;
  y = mouseY;
  
  translate(width/2, height/2);
  
  int loopnum = 50;
  float da = 2*PI/loopnum;
  for (int i=0; i<loopnum; i++) {
    
    float h = map(i, 0, loopnum, 0, 360);
    stroke(h, 50, 50);
    
    x = R * cos(da * i);
    y = R * sin(da * i);
    
    dx = varX * pow(randomGaussian(),2);
    dy = varY * pow(randomGaussian(),2);
    
    point(x + dx, y + dy); 
    
  }
  
}


void keyPressed() {
  if (key==' ') {
    String filename = "" 
      + nf(year(), 4, 0) 
      + nf(month(), 2, 0) 
      + nf(day(), 2, 0) 
      + nf(hour(), 2, 0) 
      + nf(minute(), 2, 0)
      + nf(second(), 2, 0);
    save("img/" + filename + ".png");
    //save("hoge.png");
    println("saved");
  }
}