class Point {
  final int N = 100;
  final float freq = 2.0;
  final float D = width/freq/4;
  
  float x, y;
  
  Point(float r) {
    float p  = random(N);
    float a = map(p, 0, N, 0, 2*PI*freq);
    x = map(p, 0, N, 0, width);
    y = map(r, 0, 1, -1, 1) * D * sin(a) + randomGaussian()*40;
  }
  
  
}