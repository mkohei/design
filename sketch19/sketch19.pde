float DIV = 10.0f;
int N = 2;

void setup() {
  size(500, 500, P3D);
  colorMode(HSB, 360, 100, 100, 100);
  blendMode(ADD);

  background(0);
  //noLoop();
}


  

void draw() {
  background(0);
  
  //rotateY(-radians(30));
  rotateX(radians(40));
  
  int N=30;
  
  float x, y, a, r;
  for (int i=0; i<N; i++) {
    /*
    x = random(width);
    y = random(height);
    */
    /*
    x = map(i, 0, N-1, width*0.1, width*0.9);
    y = height/2 + 100*sin( map(i, 0, N-1, 0, 2*PI));
    */
    /*
    a = map(i, 0, N-1, 0, 5*PI);
    x = map(i, 0, N-1, width*0.1, width*0.9) + 100*cos(a);
    y = height/2 + 100*sin(a);
    */
    a = map(i, 0, N, 0, 21*PI/4);
    r = map(i, 0, N, 0, 200);
    x = width/2 + r * cos(a);
    y = height/2 + r * sin(a);
    disp(map(i, 0, N, 150, 200), x, y, map(i, 0, N, 100, 150));
    print("*");
  }
  

}


void disp(float seed, float x0, float y0, float L) {
  //float L = 100;
  
  pushMatrix();
  translate(x0-L/2, y0-L/2);
  
  /*
  stroke(L, 100, 100, 100);
  noFill();
  ellipse(L/2, L/2, L, L);
  */
  
  float n, r, M=pow(L/2, 2);
  for (int y=0; y<L; y++) {
    for (int x=0; x<L; x++) {
      n = noise(x/(L/DIV), y/(L/DIV), L);
      r = pow(y-L/2, 2) + pow(x-L/2, 2);
      n *= (M-r)/M;
      stroke(seed, 100, 100, n*100);
      point(x,y);
    }
  }
  
  popMatrix();
}




void keyPressed() {
  if (key==' ') {
    String filename = "" 
      + nf(year(), 4, 0) 
      + nf(month(), 2, 0) 
      + nf(day(), 2, 0) 
      + nf(hour(), 2, 0) 
      + nf(minute(), 2, 0)
      + nf(second(), 2, 0);
    save("img/" + filename + ".png");
    //save("hoge.png");
    println("saved");
  }
}