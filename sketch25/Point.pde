class Point {
  float MAX_V=2.0;
  
  float x, y;
  float vx, vy;
  float cnt;
  
  Point() {
    x = random(width);
    y = random(height);
    vx = random(-MAX_V, MAX_V);
    vy = random(-MAX_V, MAX_V);
    cnt = 0;
  }
  
  void move() {    
    if (x < 0 || x > width) vx = -vx;
    if (y < 0 || y > height) vy = -vy;
    x += vx;
    y += vy;
  }
  
  void draw() {
    noStroke();
    fill(255);
    float r = 10 + this.cnt*2;
    ellipse(x, y, r, r);
  }
}