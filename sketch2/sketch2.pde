float D = 50;
float raline = 1;

void setup() {
  size(displayWidth, displayHeight);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  background(0);
  
  //noLoop();
  
}

void draw() {
  
  background(0);
  
  
  for (int k=0; k<20000; k++) {
    
    float i=k;
    
    float iy = i / width;
    float dy = 2*D;
    
    float x, y, angle;
    x = i % width-D;
    y = int(iy)*dy + D + D*sin(PI/100*i);
    angle = map(i%width, 0, width, 0, PI*raline);
    disp(x, y, angle, k%360, i/width);
  }
  
  raline += 10;
  println(raline);
  
}

  
void disp(float x, float y, float angle, int hue, float radtio) {
  stroke(hue, 80, 30);
  float x1, x2, y1, y2;
  x1 = x + D * cos(angle);
  x2 = x + D * cos(angle+PI);
  y1 = y + D * sin(angle);
  y2 = y + D * sin(angle+PI);
  line(x1, y1, x2, y2);
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