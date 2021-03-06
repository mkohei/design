class Relation {
  int N=50;
  float MAXD = 50.0;
  
  Ball balls[];
  
  Relation() {
    balls = new Ball[N];
    for (int i=0; i<balls.length; i++) balls[i] = new Ball();
  }
  
  void rel() {
    for (Ball b: balls) {
      b.move();
      //b.draw();
    }
    
    for (Ball b1: balls) {
      for (Ball b2: balls) {
        drawrel(b1.value, b1.x, b1.y, b2.x, b2.y);
      }
    }
  }
  
  void drawrel(int v, float x1, float y1, float x2, float y2) {
    float d = dist(x1, y1, x2, y2);
    if (d < MAXD) {
      //stroke(100, 0, v, 100);
      stroke(v, 100, 100, 10);
      strokeWeight(1);
      line(x1, y1, x2, y2);
    }
  }
}