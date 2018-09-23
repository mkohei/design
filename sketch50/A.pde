class A {
  int N=50;
  float R = 200, da;
  float a1, a2, va1, va2;
  float value, value_a, value_va;
  
  A() {
    da = random(0, PI/2);
    a1 = random(-PI, PI);
    va1 = random(-PI/30, PI/30);
    a2 = random(-PI, PI);
    va2 = random(-PI/30, PI/30);
    value = random(0, 255);
    value_a = random(-PI, PI);
    value_va = random(-PI/30, PI/30);
  }
  
  void move() {
    a1 += va1;
    a2 += va2;
    
    value = (value+1)%255;
    value_a += value_va;
  }
  
  void draw() {
    //stroke(value, 50);
    stroke(127*(sin(value_a)+1), 30);
    strokeWeight(1);
    
    float _a, x0, y0, x1, y1;
    for (int i=0; i<N; i++) {
      _a = a2 + map(i, 0, N, -da, da);
      x0 = R * cos(_a);
      y0 = R * sin(_a);
      x1 = R * cos(a1 + PI);
      y1 = R * sin(a1 + PI);
      line(x0, y0, x1, y1);
    }
  }
}