class Ball {
  float R = 200, V=PI/1000;
  float x, y, z, azimuth, evelation;
  float da, de;
  
  int cnt;
  
  Ball() {
    // 仰角の極近くは密集するため調整
    azimuth = random(TWO_PI);
    evelation = map(randomGaussian(), -2.5, 2.5, 0, PI);
    
    da = random(-V, V);
    de = random(-V, V);
    
    x = R * sin(evelation) * cos(azimuth);
    y = R * cos(evelation);
    z = R * sin(evelation) * sin(azimuth);
    
    cnt=0;
  }
  
  void draw() {
    //stroke(cnt%360, 100, 100, 1);
    stroke(200, 100, 100, 1);
    strokeWeight(20);
    point(x, y, z);
  }
  
  void move() {
    azimuth += da;
    evelation += de;
    
    x = R * sin(evelation) * cos(azimuth);
    y = R * cos(evelation);
    z = R * sin(evelation) * sin(azimuth);
    
    cnt++;
  }
}