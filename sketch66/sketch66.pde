Lissajous l1, l2;

void setup() {
  size(500, 500);
  
  l1 = new Lissajous(2, 5, 45);
  l2 = new Lissajous(7, 1, 23);
  
  noLoop();
}

void draw() {
  background(255);
  
  translate(width/2, height/2);
  
  stroke(0);
  strokeWeight(0);
  
  Point p1, p2;
  for (int t=0; t<Lissajous.TIME; t++) {
    p1 = l1.step(t);
    p2 = l2.step(t);
    
    line(p1.x, p1.y, p2.x, p2.y);

  }
}