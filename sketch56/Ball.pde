class Ball {
  float V=3;
  
  int MAXH = 360;
  
  float x, y, vx, vy;
  int value;
  
  Ball() {
    x = random(Relation.W);
    y = random(Relation.H);
    vx = random(-V, V);
    vy = random(-V, V);
    
    //value = (int)random(100);
    value = (int)random(MAXH);
  }
  
  void draw() {
    stroke(100, 100, 100, 100);
    strokeWeight(10);
    point(x, y);
  }
  
  void move() {
    if (x<=0 || x>=Relation.W) vx = -vx;
    if (y<=0 || y>=Relation.H) vy = -vy;
    
    x += vx;
    y += vy;
    
    value = (value+1)%MAXH;
    //println(value);
  }
}