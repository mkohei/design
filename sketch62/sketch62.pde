void setup() {
  size(500, 500);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
 
  background(0);
  
  noLoop();
}

void draw() {
  background(0);
  
  //translate(width/2, height/2);
  
  float dx, dy;
  for (int y=height/2; y<height; y+=5) {
    float stepx = map(y, height/2, height, 5, 10);
    float v = map(y, height/2, height, 3, 7);
    for (int x=0; x<width; x+=stepx*6) {
      dx = randomGaussian() * stepx * 4;
      dy = randomGaussian() * stepx * 4;
      
      drawPoint(x+dx, y+dy, 6, stepx, 2*stepx, (int)random(360), (int)v);
    }
  }
  
  if (mousePressed) drawPoint(mouseX, mouseY, 30, 20, 30, 200, 3);
}

void drawPoint(float x0, float y0, int N, float R, float r, int hue, int v) {
  float a, x, y, da=TWO_PI/N;
  for (int i=0; i<N; i++) {
    a = i * da;
    x = R * cos(a);
    y = R * sin(a);
    
    stroke(hue, 100, 100, v);
    strokeWeight(2*r);
    point(x0+x, y0+y);
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