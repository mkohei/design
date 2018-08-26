class RotLine {
  int MAX_DEPTH = 10;
  
  RotLine parent,child;
  int depth;
  
  float hue=0;
  float cx, cy;
  float x,y;
  float r=30, a=0, va=PI/100;
  
  RotLine() {
    this(null);
  }
  RotLine(RotLine p) {
    if (p == null) depth = 0;
    else {
      depth = p.depth+1;
      parent = p;
    }
    
    if (depth < MAX_DEPTH) child = new RotLine(this);
    
    va = map(depth, 0, MAX_DEPTH, -1, 3) * PI/100;
  }
  
  
  void move() {
    a += va;
    if (parent != null) {
      this.cx = parent.x;
      this.cy = parent.y;
    }
    x = cx + r*cos(a);
    y = cy + r*sin(a);
    
    if (child != null) child.move();
  }
  
  
  void draw() {
    stroke(hue, 100, 100, 30);
    strokeWeight(5);
    line(cx, cy, x, y);
    if (child != null) child.draw();
  }
  
  
  
}