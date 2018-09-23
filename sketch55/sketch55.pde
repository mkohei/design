Ball b;

void setup() {
  size(500,500);
  
  b = new Ball();
}

void draw() {
  background(0);
  
  b.move();
  b.draw();
}