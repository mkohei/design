void setup() {
  size(1000, 1000);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  
  fill(255);
  
  float r=100;
  for(int i=0; i<10; i++) {
    
    ellipse(0, r, r, r);
    
    rotate(PI/8);
    scale(0.9);
  }

  
}