class Relative {
  float limitLen=100;
  int N=100;
  
  Point[] points;
  
  Relative() {
    points = new Point[N];
    for (int i=0; i<points.length; i++) points[i] = new Point(); 
  }
  
  void dispRelative() {
    stroke(255);
    for (int j=0; j<points.length; j++) {
      Point fromP = points[j];
      fromP.cnt = 0;
      for (int i=0; i<points.length; i++) {
        Point toP = points[i];
        if ( dist(fromP.x, fromP.y, toP.x, toP.y) < limitLen ) {
          fromP.cnt++;
        }
      }
      for (int i=0; i<points.length; i++) {
        Point toP = points[i];
        if ( dist(fromP.x, fromP.y, toP.x, toP.y) < limitLen ) {
          stroke( map(fromP.cnt, 0, 15, 0, 360), 100, 100, 30 );
          line(fromP.x, fromP.y, toP.x, toP.y);
        }
      }
    }
  }
  
  void dispPoints() {
    for (Point p: points) {
      p.draw();
    }
  }
  void movePoints() {
    for (Point p: points) {
      p.move();
    }
  }
}