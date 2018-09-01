class WaveCircle {
  int N=100;
  float R_MIN=100, R_MAX=150, RD_MAX=30, FREQ_MAX=20;
    
  float r, rd, freq;
  float phase, va;
  
  WaveCircle() {
    //r = random(R_MIN, R_MAX);
    rd = random(RD_MAX);
    r = (R_MAX+R_MIN)/2 + (R_MAX-R_MIN)*abs(randomGaussian());
    freq = round(random(FREQ_MAX));
    
    phase = 0;
    va = random(PI/100);
  }
  
  void draw() {
    strokeWeight(3);
    stroke(255, 100);
    
    float x, y, d, a, px=0, py=0;
    for (int i=0; i<N; i++) {
      a = map(i, 0, N, 0, TWO_PI);
      d = rd * cos(freq * a + phase); 
      x = (r + d) * cos(a);
      y = (r + d) * sin(a);
      
      if (px!=0 && py!=0) {
        //point(x,y);
        line(px, py, x, y);
      } else {
        a = map(N-1, 0, N, 0, TWO_PI);
        d = rd * cos(freq * a + phase); 
        px = (r + d) * cos(a);
        py = (r + d) * sin(a);
      }
      
      px = x;
      py = y;
    }
  }
  
  void move() {
    phase += va;
  }
}