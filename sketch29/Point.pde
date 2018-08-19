class Point {
  float vratio = 0.01;
  
  float x, y;
  float vx, vy;
  
  Point(){
    x = random(width);
    y = random(height);
    
    vx = 0;
    vy = 0;
  }
  
  void move() {
    float dx=mouseX-x, dy=mouseY-y; 
    vx = dx * vratio;// * abs(width-dx);
    vy = dy * vratio;// * abs(height-dy);
    
    x+=vx;
    y+=vy;
  }
  
  void draw() {
    stroke(200, 100, 100, 10);
    point(x, y);
  }
}