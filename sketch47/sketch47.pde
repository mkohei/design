Model m, m2;

void setup() {
  size(500, 500);
  
  m = new Model();
  m2 = new Model();
  
  background(0);
}

void draw() {
  translate(width/2, height/2);
  
  m.move();
  m.draw();
  
  translate(m.x, -m.x);
  m2.move();
  m2.draw();
}