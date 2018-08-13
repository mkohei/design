class Point {
  float cnt;
  
  float cx, cy, angle, r, va;
  float x, y;
  
  Point(float cx, float cy, float phase, float r, float va) {
    this.cx = cx;
    this.cy = cy;
    this.angle = phase;
    this.r = r;
    this.va = va;
  }
  
  void move() {
    angle += va;
    x = cx + r * cos(angle);
    y = cy + r * sin(angle);
  }
  
  void draw() {
    noStroke();
    fill(255);
    float r = 10 + this.cnt*2;
    ellipse(x, y, r, r);
  }
}