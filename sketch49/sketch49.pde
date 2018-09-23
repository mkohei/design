float phase, d=150, freq;
int cnt;

void setup() {
  size(800, 450);
  
  cnt = 0;
  phase = 0;
  freq = 0;
  
  frameRate(10);
}

void draw() {
  background(0);
  
  translate(0, height/2);
  
  stroke(255);
  strokeWeight(5);
  
  float y, a;
  for (int i=0; i<width; i+= 10) {
    a = map(i, 0, width, 0, TWO_PI);
    y = d*sin(a*freq + phase);
    
    point(i, y);
  }
  //phase -= PI/100;
  
  freq += 0.5;
}