class Shape2 {
  float DMIN=0.4;
  
  int N, hue;
  float var;
  
  float da, dr;
  
  float a, r, x, y, dx, dy, d;
  
  Shape2() {
    N = 10;
    hue = 340;
    var = 30;
    da = PI/100;
    dr = 0.1;
  }
  Shape2(int n, int h, float v, float _da, float _dr) {
    N = n;
    hue = h;
    var = v;
    da = _da;
    dr = _dr;
  }
  
  void draw() {
    for (a=0,r=0; r<dist(0,0,width/2,height/2); a+=da,r+=dr) {
      x = r * cos(a);
      y = r * sin(a);
      
      for (int i=0; i<N; i++) {
        dx = randomGaussian() * var;
        dy = randomGaussian() * var;
        
        d = dist(0, 0, dx, dy);
        if (d < DMIN) d = DMIN;
        strokeWeight(20/d);
        stroke(random(hue-20, hue+20), random(50,100), random(50,100), random(50,100));
        point(x+dx, y+dy);
      }
    }
  }
}