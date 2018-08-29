class Gen {
  int N=100;
  float v = 1;
  float L = 10;
  
  float a, x, y, vx, vy, pa;
  float hue ;
  
  
  Gen(float h) {
    hue = h;
    
    x = random(width);
    y = random(height);
    
    vx = random(3, 5);
    vy = random(3, 5);
    
    a = PI/3;
  }
  
  void move() {
    //a += (noise(frameCount) - 0.5) * PI/100;
    
    if (x <= 0 || x >= width) vx = -vx;
    if (y <= 0 || y >= height) vy = -vy;
    
    x -= vx;
    y -= vy;
  }
  
  void move(Gen gen) {
    this.vx = gen.vx;
    this.vy = gen.vy;
    this.x = gen.x;
    this.y = gen.y;
  }
  
  void draw() {
    pushMatrix();
    
    translate(x, y);
    a = atan2(-vx, vy);
    rotate(a + PI/4);
    
    strokeWeight(2);
    stroke(hue, 100, 100, 50);
    
    for (int i=0; i<N; i++) {
      point(pow(randomGaussian(),2)*L, pow(randomGaussian(),2)*L );
    }
    
    popMatrix();
  }
  
  
}