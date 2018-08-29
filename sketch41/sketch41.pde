float d=100, l=20;
float freq = 7, linefreq = 3,colorfreq=16;

void setup() {
  size(1000,400);
  
  colorMode(HSB, 360, 100, 100, 100);
  blendMode(ADD);
}

void draw() {
  background(0);
  
  translate(0, height/2);
  
  float t, t2, x1, y1, x2, y2, y, hue;
  for (float x=0; x<width; x+=0.3) {
    t = map(x, 0, width, 0, TWO_PI*freq);
    t2 = t * linefreq;
    hue = map(x, 0, width, 0, 360*colorfreq) % 360;
    y = d * (sin(t) + sin(3*t))/2;
    
    stroke(hue, 100, 100, 100);
    point(x, y);
    
    x1 = x + l*cos(t2);
    y1 = y + l*sin(t2);
    x2 = x + l*cos(t2 + HALF_PI);
    y2 = y + l*cos(t2 + HALF_PI);
    
    line(x1, y1, x2, y2);
  }
}