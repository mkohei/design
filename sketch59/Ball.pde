class Ball {
  float V = 5;
  float x, y, vx, vy;
  
  Ball() {
    x = random(width);
    y = random(height);
    vx = random(-V, V);
    vy = random(-V, V);
  }
  
  void move() {
    if (x <= 0 || x >= width) vx = -vx;
    if (y <= 0 || y >=height) vy = -vy;
    x += vx;
    y += vy;
  }
  
  void draw() {
    noStroke();
    fill(0, 0, 255, 100);
    ellipse(x, y, 30, 30);
  }
  
}