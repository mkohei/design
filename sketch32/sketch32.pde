ColorBall cb;

void setup() {
  size(500,500);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  cb = new ColorBall();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  
  cb.move1();
  cb.draw();
  
}