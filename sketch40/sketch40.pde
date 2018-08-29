float d = 100;

float MAX_POW = 10, STEP_POW = 0.3;

void setup() {
  size(500,500);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
}

void draw() {
  translate(0, height/2);
  
  background(0);

  float t, a;
  for (int i=0; i<width; i++) {
    t = map(i, 0, width, 0, TWO_PI);
    a = abs(sin(t));
    
    for (float j=0; j<MAX_POW; j+=STEP_POW) {
      stroke( map(j, 0, MAX_POW, 0, 360), 100, 100, 30);
      point(i, d*pow(a, j));
    }
  }
}