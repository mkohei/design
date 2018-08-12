class Point {
  final int L=100;
  
  float x, y;
  
  Point(float x0, float y0) {
    float r, a;
    r = random(L);
    a = random(2*PI);
    x = x0 + r*cos(a);
    y = y0 + r*sin(a);
  }
}