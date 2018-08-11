float R = 100;
float x, y, a;
float x1, x2, y1, y2;

float _r, _a;

void setup() {
  size(500, 500);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  x = 0;
  y = 0;
  a = 0;
  
  _r = 0;
  _a = 0;
  
  background(0);
  
}

void draw() {
  translate(width/2, height/2);
  
  // move
  _r += 0.05;
  _a += radians(1.3);
  x = _r * cos(_a);
  y = _r * sin(_a);
  
  a -= radians(5);
  x1 = x + R/2 * cos(a);
  x2 = x + R/2 * cos(a+PI);
  y1 = y + R/2 * sin(a);
  y2 = y + R/2 * sin(a+PI);
  
  stroke((_r*10)%360, 100, 100, 10);
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