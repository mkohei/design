void setup() {
  size(500,500);
  colorMode(360, 100, 100, 100);
  blendMode(ADD);
}

void draw() {
  translate(width/2, height/2);
  
  //background(0);
  
  float t;
  for (int i=0; i<width; i++) {
    t = map(i, 0, width, -30, 30);
    stroke(0, 0, 100);
    //stroke( map(i, 0, width, 0, 360), 100, 100, 100);
    point(cosh(t), sinh(t));
  }
}


float sinh(float t) {
  return (exp(t) - exp(-t)) / 2.0;
}
float cosh(float t) {
  return (exp(t) + exp(-t)) / 2.0;
}
float tanh(float t) {
  return (exp(t) - exp(-t)) / (exp(t) + exp(-t));
}