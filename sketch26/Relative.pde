class Relative {
  float limitLen=100;
  int CircleN=10, N=10;
  float MAX_R=100, MAX_V=PI/100;
  
  Point[] points;
  
  Relative() {
    // Point(float cx, float cy, float phase, float r, float va)
    points = new Point[CircleN*N];
    for (int i=0; i<CircleN; i++) {
      float cx=random(width), cy=random(height);
      float r=random(MAX_R*0.5,MAX_R), v=random(MAX_V);
      println(cx, cy, r, v);
      for (int j=0; j<N; j++) {
        points[i*N+j] = new Point(cx, cy, map(j,0,N,0,TWO_PI), r, v);
      }
    }
  }
  
  void dispRelative() {
    //stroke(255);
    noStroke();
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
          //fill( map(fromP.cnt, 0, 20, 0, 360), 100, 100, 30 );
          //ellipse((fromP.x+toP.x)/2, (fromP.y+toP.y)/2, fromP.cnt*1, toP.cnt*1);
          stroke( map(fromP.cnt, 0, 20, 0, 360), 100, 100, 30 );
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