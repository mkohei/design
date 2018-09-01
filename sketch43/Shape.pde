class Shape {
  int N=100, iniR=100;
  float MAX_D = 6, MAX_A = PI/100;
  float DIV_I=10.0f, DIV_FRAME=10.0f;
  float da=PI/100;
  
  float xarray[], yarray[], phase;
  float rarray[], aarray[];
  
  Shape() {
    rarray = new float[N];
    aarray = new float[N];
    
    
    phase=0;
    
    float a;
    for (int i=0; i<N; i++) {
      a = map(i, 0, N, 0, TWO_PI);
      aarray[i] = a;
      rarray[i] = iniR;
    }
  }
  
  void move() {
    float a, d;
    for (int i=0; i<N; i++) {
      a = (noise(i/DIV_I, 0, frameCount/DIV_FRAME)-0.5) * MAX_A;
      d = (noise(i/DIV_I, 100, frameCount/DIV_FRAME)-0.5) * MAX_D;
      rarray[i] += d;
      aarray[i] += a;
    }
  }
  
  void draw() {
    //float v = map(cos(frameCount/40.0f), -1, 1, 50, 255);
    //float h = map(cos(frameCount/40.0f), -1, 1, 0, 360);
    float h = (frameCount) % 360;
    float s = (frameCount) % 100;
    float v = (frameCount * 2.0) % 100;
    
    stroke(h, s, 100, 30);
    noFill();
    beginShape();
    float x, y;
    for (int i=0; i<N; i++) {
      x = rarray[i] * cos(aarray[i]);
      y = rarray[i] * sin(aarray[i]);
      vertex(x, y);
    }
    endShape();
  }
}


void keyPressed() {
  if (key==' ') {
    String filename = "" + year() + month() + day() + hour() + minute() + second();
    save("img/" + filename + ".png");
    //save("hoge.png");
    println("saved");
  }
}