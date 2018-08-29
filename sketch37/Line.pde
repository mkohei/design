class Line {
  
  float sy, ey;
  float L;
  
  float y, l, x;
  float base_hue;
  
  Line(float iniy, float _L, float _x, float basey, float _base_hue) {
    L = _L;
    sy = basey-L;
    ey = basey+L;
    y = iniy;
    x = _x;
    base_hue = _base_hue;
  }
  
  void draw() {
    float h = (map(y, 0, height, 0, 360) + base_hue) % 360;
    base_hue = (base_hue + 1) % 360;
    stroke(h, 100, 100, 60);
    
    float a;
    if (sy <= y && y <= ey) {
      a = map(y, sy, ey, -PI/2, PI/2);
      l = L * cos(a);
    } else {
      l = 1;
    }
    line(x-l, y, x+l, y);
    
    y = (y+1)%height;
  }
  
}