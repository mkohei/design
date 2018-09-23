Ball b;

void setup() {
  size(500, 500);
  
  background(0);
  
  b = new Ball();
}

void draw() {
  b.move();
  b.draw();
}