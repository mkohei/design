int N=1000;
float DIVX=10.0f,DIVY=10.0f;
float D = 100;

float r, a;
float x, y;

void setup() {
  size(600,600);
  
  r = 0;
  a = 0;
  
  background(0);
}

void draw() {
  translate(0, height/2);
  
  // particle line
  stroke(255, 10);
  float x, y;
  float D=randomGaussian() * 30;
  println(D);
  for (int i=0; i<width; i++) {
    y = noise(i/(N/DIVY), frameCount) * D;
    
    point(i, y);
  }
  
}