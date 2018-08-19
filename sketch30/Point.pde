class Point {
  int N = 500;
  
  float x, y;
  float vx, vy;
  float n;
  
  Point(float i) {
    x = 0;
    y = i;
    vx = 1;
    vy = 0;
    this.n = i;
  }
  
  void move() {
    vy += map(n, 0, N-1, 0.05, 0.01);
    x += vx;
    y += vy;
  }
  
  void draw() {
    //stroke(255, 50);
    stroke( map(n, 0, N-1, 0, 360), 100, 100, 50);
    point(x,y);
  }
}