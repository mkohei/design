class MoveCircle {
  static final int N=15;
  static final float MAX_R = Ball.R*N*2;
  
  float cx, cy, hue;
  Ball balls[];
  
  MoveCircle(float hue){
    this.hue = hue;
    
    balls = new Ball[N];
    for (int i=0; i<N; i++) {
      balls[i] = new Ball(
        map(i+1, 0, N, 0, MAX_R),    // r
        //PI/map(i, 0, N, 4, 100),                      // va
        i * PI / 400.0f,
        0                            // hue
      );
    }
  }
  MoveCircle(float _cx, float _cy) {
    this(0);
    cx = _cx;
    cy = _cy;
  }
  
  void move() {
    for (Ball b: balls) {
      b.move(cx, cy);
    }
  }
  
  void draw(float hue) {
    
    /*
    for (Ball b: balls) {
      b.draw(hue);
    }
    */
    
    strokeWeight(3);
    stroke(hue%360, 100, 100, 30);
    for (int i=0; i<balls.length-1; i++) {
      line(balls[i].x, balls[i].y, balls[i+1].x, balls[i+1].y);
    }
    
  }
}