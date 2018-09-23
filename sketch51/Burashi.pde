class Burashi {
  float DMIN = 0.4;
  
  int N, hue;
  float var;
  
  Burashi() {
    N = 10;
    var = 30;
    hue = 340;
  }
  
  Burashi(int n, int h, float v) {
    N=n;
    hue = h;
    var = v;
  }
  
  void draw(float x, float y) {
    float d, dx, dy;
    for (int i=0; i<N; i++) {
      dx = randomGaussian() * var;
      dy = randomGaussian() * var;

      d = dist(0, 0, dx, dy);
      if (d < DMIN) d = DMIN;
      strokeWeight(20/d);
      //strokeWeight(1/random(DMIN, 1));
      stroke( random(hue-20, hue+20), random(50, 100), random(50, 100), random(50, 100));
      
      point(x+dx, y+dy);
    }
    
    
  }
  
}