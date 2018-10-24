float N=20, STEP, R;

Ball ball, balls[];

void setup() {
  size(500, 500);
  STEP = width / N;
  R = STEP/2;
  
  ball = new Ball();
  balls = new Ball[10];
  for (int i=0; i<balls.length; i++) balls[i] = new Ball();
}

void draw() {
  //background(0);
  background(255);
  
  ball.move();
  for (Ball b: balls) {
    b.move();
    //b.draw();
  }
  
  float tarX, tarY;
  //tarX = mouseX;
  //tarY = mouseY;
  tarX = ball.x;
  tarY = ball.y;
  
  noStroke();
  fill(255, 0, 0, 100);
  
  float x, y, a, d, dx, dy, r;
  for (int i=0; i<N; i++) {
    for (int j=0; j<N; j++) {
      x = i * STEP + R;
      y = j * STEP + R;
      
      for (Ball b: balls) {
        tarX = b.x;
        tarY = b.y;
        
        a = atan2(tarY-y, tarX-x);
        d = dist(x, y, tarX, tarY);
        
        r = map(d, 0, width, 40, 0);
        if (r > d) r = d;
        x += r * cos(a);
        y += r * sin(a);
      }
      
      ellipse(x, y, 2*R, 2*R);
    }
  }
  
}