class Ball {
  float genRatio=0.01;
  float MAX_NEWVY = 0.5;
  
  float R=30;
  
  
  float x, y;
  float vx, vy;
  float a;
  
  Burashi burashi;
  
  Ball parent, children[];
  
  Ball() {
    x = 0;
    y = height/2;
    vx = 1;
    vy = 0;
    a = 0;
    
    burashi = new Burashi();
  }
  Ball(float x, float y, float vx, float vy, float a) {
    this();
    
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.a = a;
  }
  
  void born() {
    float newvy = random(MAX_NEWVY);
    children = new Ball[2];
    children[0] = new Ball(x, y, vx, vy+newvy, a);
    children[1] = new Ball(x, y, vx, vy-newvy, a);
  }
  
  void draw() {
    if (children==null) {
      /*
      stroke(255);
      strokeWeight(10);
      point(x, y);
      */
      //disp();
      burashi.draw(x, y);
    } else {
      for (Ball b: children) b.draw();
    }
  }
  
  void move() {
    if (children==null) {
      x += vx;
      y += vy;
      
      a += PI/30;
      
      if (random(1) < genRatio) born();
    } else {
      for (Ball b: children) b.move();
    }
  }
  
  void disp() {
    stroke(255, 30);
    
    float x1, x2, y1, y2;
    x1 = x + R*cos(a);
    x2 = x + R*cos(a+PI);
    y1 = y + R*sin(a);
    y2 = y + R*sin(a+PI);
    
    line(x1, y1, x2, y2);
  }
}