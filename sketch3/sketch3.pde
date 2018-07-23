float a, r;

void setup() {
  size(displayWidth, displayHeight);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);;
  
  background(0);
  
  //noLoop();
  a = 0;
  r = 0;
}

void draw() {
  
  //noStroke();
  stroke(200, 80, 10);
  fill(200, 80, 10);
  
  float da = 2*PI/100;
  float x, y;
  for (int i=0; i<100; i++) {
    x = r * cos(da * i) + width/2;
    y = r * sin(da * i) + height/2;
    point(x, y);
  }
  r++;
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