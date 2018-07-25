float a, r;

void setup() {
  //size(displayWidth, displayHeight);
  size(2048, 1152);
  
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
  strokeWeight(5);
  
  float x, y, t;
  for (int i=0; i<width; i+=5) {
    x = i;
    t = map(i, 0, width, 0, 2*PI * 5/6);
    y = height/2 + 150 * sin(t + r);
    
    point(x,y);
  }
  r += 0.01;
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