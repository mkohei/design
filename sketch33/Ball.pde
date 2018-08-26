class Ball {
  static final float R=5;
  
  float hue, r, a, cx, cy, va;
  float x, y;
  
  Ball() {}
  Ball(float _r, float _va, float _hue) {
    r = _r;
    a = 0;
    va = _va;
    hue = _hue;
  }
  
  void move(float cx, float cy) {
    a += va;
    x = cx + r * cos(a);
    y = cy + r * sin(a);
  }
  
  void draw(float hue) {
    noStroke();
    fill(hue, 100, 100, 30);
    ellipse(x, y, 2*R, 2*R);
  }
}