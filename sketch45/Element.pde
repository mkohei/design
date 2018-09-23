class Element {
  float L=30; 
  float fource_k;
  
  float x, y, vx, vy, ax, ay, dir;
  float hue;
  
  Element() {
    x = random(width);
    y = 0;
    
    vx = random(-1, 1);
    vy = random(-1, 1);
    
    
  }

  void addForce(Element other) {
    if (abs(other.x - this.x) > 1) ax += 1 / (other.x - this.x) * 0.01;
    if (abs(other.y - this.y) > 1) ay += 1 / (other.y - this.y) * 0.01;
  }
  
  void move() {
    ax += (width/2 - this.x) * 0.001;
    ay += (0 - this.y) * 0.0001;
    
    vx += ax;
    vy += ay;
    x += vx;
    y += vy;
    ax = 0;
    ay = 0;

  }
  
  void draw() {
    dir = atan2(vx, -vy);  
    float a = dir;
    
    stroke(255, 50);
    line(x+L*cos(a), y+L*sin(a), x+L*cos(a+PI), y+L*sin(a+PI));
  }
  
}