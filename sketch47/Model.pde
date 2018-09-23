class Model {
  float R=100, dR=50, dfreq=10, da=PI/300;
  float x, y, r, a;
  
  Model() {
    
  }
  
  void move() {
    r = R + dR * sin(a * dfreq) + 100 * sin(a * 30);
    x = r * cos(a);
    y = r * sin(a);
    
    a += da;
  }
  
  void draw() {
    stroke(255);
    strokeWeight(5);
    point(x, y);
  }
  
}