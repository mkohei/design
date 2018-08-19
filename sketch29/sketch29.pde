Point[] points;

void setup() {
  size(600,600);
  
  colorMode(HSB, 360, 100, 100, 100);
  blendMode(ADD);
  
  points = new Point[40];
  for (int i=0; i<points.length; i++) points[i] = new Point();
  
  background(0);
}

void draw() {
  for (int i=0; i<points.length; i++) {
    points[i].move();
    points[i].draw();
  }
}