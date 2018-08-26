class ColorBall {
  
  int N = 40;
  
  SBall[] SBalls;
  
  ColorBall() {
    SBalls = new SBall[N];
    for (int i=0; i<SBalls.length; i++) {
      SBalls[i] = new SBall();
    }
  }
  
  void move1() {
    for (SBall sball : SBalls) {
      sball.move1();
    }
  }
  
  void draw() {
    for (SBall sball : SBalls) {
      sball.ra2xy();
      sball.draw();
    }
  }
}