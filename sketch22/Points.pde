class Points{
  float lengthLimit = 60;
  
  final int NUM = 100;
  Point[] points;
  
  float baseHue;
  
  Points(float r, float phase) {
    points = new Point[NUM];
    for (int i=0; i<points.length; i++) {
      points[i] = new Point(r, phase);
    }
    baseHue = map(r, 0, 1, 0, 360);
  }
  Points(float r, float phase, float lengthLimit) {
    this(r, phase);
    this.lengthLimit = lengthLimit;
  }
  
  void makePolygon() {
    // 全ての点に対して、丘の点との距離を計算し
    // lengthLimit以下である点同士で多角形を作る
    for (int j=0; j<points.length; j++) {
      Point fromP = points[j];
      // 近くの点を格納するArrayList
      ArrayList<Point> nearPs = new ArrayList<Point>();
      for (int i=0; i<points.length; i++) {
        Point toP = points[i];
        // fromP, toPの距離を計算
        float d = dist(fromP.x, fromP.y, toP.x, toP.y);
        // lengthLimit以下ならnearPsに追加
        if (d < lengthLimit) nearPs.add(toP);
      }
      
      // draw
      this.draw(nearPs);
    }
  }
  
  void draw(ArrayList<Point> nearPs) {
    noStroke();
    fill(baseHue + random(50), random(80,100), random(60,100), 30);
    
    beginShape();
    for (Point p : nearPs) {
      vertex(p.x, p.y);
    }
    endShape(CLOSE);
  }
  
  void dispPoints() {
    noStroke();
    fill(0, 100, 100, 30);
    for (int i=0; i<points.length; i++) {
      ellipse(points[i].x, points[i].y, 20, 20);
    }
  }
}