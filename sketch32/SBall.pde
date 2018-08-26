class SBall {
  float INIT_MAX_R = 20;
  float DRAW_R = 10;
  
  float r, a, x, y, hue;
  
  SBall() {
    r = random(INIT_MAX_R);
    a = random(TWO_PI);
    hue = random(360);
  }
  
  void ra2xy() {
    x = r * cos(a);
    y = r * sin(a);
  }
  
  void move1() {
    //a += PI / map(r, 0, INIT_MAX_R, 50, 100);
    a += PI / random(0, 100);
  }
  
  void draw() {
    noStroke();
    fill(hue, 100, 100, 30);
    ellipse(x, y, DRAW_R, DRAW_R);
  }
}