RotLine rt;

void setup() {
  size(500,500);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  rt = new RotLine();
}

void draw() {
  translate(width/2, height/2);
  
  background(0);
  
  rt.move();
  rt.draw();
}