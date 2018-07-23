Line dLine;

void setup() {
  size(displayWidth, displayHeight);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);;
  
  background(0);
  
  noLoop();
  
  dLine = new Line();
}

void draw() {
  /*
  float _frameCount = frameCount / 2;
  
  float iy = _frameCount / width;
  float dy = 100;
  
  dLine.x = _frameCount % width;
  dLine.y = iy*dy + 50*sin(PI/100*frameCount) + 50;
  dLine.angle = map(frameCount%1000, 0, PI, 0, 1000);
  dLine.disp(frameCount);
  */
  
  
  for (int i=0; i<100000; i++) {
    
    
    float _frameCount = i / 2;
  
    float iy = _frameCount / width;
    float dy = 100;
    
    dLine.x = _frameCount % width;
    dLine.y = int(iy)*dy + 50;//+ 50*sin(PI/100*i) ;
    float da = map(i%width, 0, width, 0, PI/4);
    dLine.angle = da;
    //dLine.angle = map(i%1000, 0, 1000, 0, PI);// + random(-PI/10, PI/10);
    //dLine.angle = map(i%1000, 0, PI, 0, 1000) + noise(i/20.0f);
    //dLine.angle = map(i%1000, 0, i%100+10, 0, PI);
    dLine.disp(i);
  }
  
}

class Line {
  float x, y;
  float r=100;
  
  float angle=radians(40);
  
  Line() {
  }
  
  void disp(float i) {
    stroke(i%360, 80, 30);
    float x1, x2, y1, y2;
    x1 = x + r/2 * cos(angle);
    x2 = x + r/2 * cos(angle+PI);
    y1 = y + r/2 * sin(angle);
    y2 = y + r/2 * sin(angle+PI);
    line(x1, y1, x2, y2);
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