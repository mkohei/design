class Lissajous {
  static final float TIME=3000, R=200;
  
  float xfreq, yfreq, xphase, yphase;
  
  int gt=0;
  
  Lissajous(float xf, float yf, float xp) {
    xfreq = xf;
    yfreq = yf;
    xphase = radians(xp);
    yphase = radians(0.0f);
  }
  
  void draw() {
    float x, y, a;
    
    stroke(0);
    strokeWeight(1);
    
    for (int t=0; t<TIME; t++) {
      a = map(t, 0, TIME, 0, TWO_PI);
      x = R * cos(xfreq * a + xphase);
      y = R * sin(yfreq * a + yphase);
      
      point(x, y);
    }
  }
  
  Point step() {
    float x, y, a;
    a = map(gt, 0, TIME, 0, TWO_PI);
    x = R * cos(xfreq * a + xphase);
    y = R * sin(yfreq * a + yphase);  
    
    gt++;
    return new Point(x, y);
  }
  
  Point step(float t) {
    float x, y, a;
    a = map(t, 0, TIME, 0, TWO_PI);
    x = R * cos(xfreq * a + xphase);
    y = R * sin(yfreq * a + yphase);  
    
    //gt++;
    return new Point(x, y);
  }
}


class Point {
  float x, y;
  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
}