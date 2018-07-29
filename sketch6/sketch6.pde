float varX = 20, varY = 20;
float varX1 = 5, varY1 = 5;

float  R = 200; 


void setup() {
  size(displayWidth, displayHeight);
  
  //colorMode(HSB, 360, 100, 100, 100);
  blendMode(ADD);
  
  background(0);
}

void draw() {
  
  strokeWeight(1);
  stroke(210, 50, 50);
  noFill();
  
  float x, y, dx, dy;
  x = mouseX;
  y = mouseY;
  
  //translate(width/2, height/2);
  
  int loopnum = 50;
  for (int i=0; i<loopnum; i++) {
    
    x = mouseX;
    y = mouseY;
    
    dx = varX * randomGaussian();
    dy = varY * randomGaussian();
    point(x + dx, y + dy);
    
    dx = varX1 * randomGaussian();
    dy = varY1* randomGaussian();
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