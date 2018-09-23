class Ball {
  float R=200, V=3.0;
  
  float x, y;
  float vx, vy;
  
  Ball() {
    x = random(width);
    y = random(height);
    vx = random(-V, V);
    vy = random(-V, V);
    
  }
  
  void move() {
    if (x <= 0 || x >= width) vx = -vx;
    if (y <= 0 || y >= height) vy = -vy;
    x += vx;
    y += vy;
  }
  
  void draw() {
    stroke(255);
    strokeWeight(5);
    point(x, y);
    
    stroke(255, 0, 0, 50);
    strokeWeight(R);
    point(x,y);
  }
  
  
}