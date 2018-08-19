int N=500;
Point[] points;

void setup() {
  size(600,600);
  
  colorMode(HSB, 360,100,100,100);
  blendMode(ADD);

  points = new Point[N];
  for (int i=0; i<points.length; i++) {
    points[i] = new Point(i);
  }
  background(0);
}

void draw() {
  stroke(255, 100);
  
  /*
  for (int i=0; i<points.length; i++) {
    points[i].move();
    points[i].draw();
  }
  */
}