Shape shape;

void setup() {
  size(500, 500);
  
  shape = new Shape();
  
  //blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  background(0);
  
  //noLoop();
}

void draw() {
  translate(width/2, height/2);
  
  shape.move();
  shape.draw();
}