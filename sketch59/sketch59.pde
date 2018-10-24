float N=20, STEP, R;

float xarray[][], yarray[][];

Ball ball, balls[];

void setup() {
  size(500, 500);
  STEP = width / N;
  R = STEP/2;
  
  ball = new Ball();
  balls = new Ball[10];
  for (int i=0; i<balls.length; i++) balls[i] = new Ball();
  
  xarray = new float[(int)N][(int)N];
  yarray = new float[(int)N][(int)N];
  
  //noLoop();
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
  
  //noStroke();
  //fill(255, 0, 0, 100);
  
  
  float px = -1, py = -1;
  float x, y, a, d, dx, dy, r;
  for (int i=0; i<N; i++) {
    for (int j=0; j<N; j++) {
      x = i * STEP;
      y = j * STEP;
      
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
      
      xarray[j][i] = x;
      yarray[j][i] = y;
      
      
      
      //ellipse(x, y, 2*R, 2*R);
    }
  }
  
  strokeWeight(2);
  stroke(255, 0, 0);
  for (int i=0; i<xarray.length; i++) {
    for (int j=0; j<yarray.length; j++) {
      if (i > 0) line(xarray[j][i-1], yarray[j][i-1], xarray[j][i], yarray[j][i]);
      if (j > 0) line(xarray[j-1][i], yarray[j-1][i], xarray[j][i], yarray[j][i]);
    }
  }
  
  saveFrame("frames/######.tif");
  
}