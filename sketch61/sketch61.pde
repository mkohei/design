int N=300, currentIdx;
float xlist[], ylist[], rlist[];

float MINR=5, MAXR=10;

Burashi burashi;

void setup() {
  size(500, 500);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  currentIdx = 0;
  xlist = new float[N];
  ylist = new float[N];
  rlist = new float[N];
  
  burashi = new Burashi(20, 200, 10); // N, hue, var
  
  xlist[currentIdx] = width/2;
  ylist[currentIdx] = height/2;
  rlist[currentIdx] = random(MINR, MAXR);
  currentIdx++;
  
  background(0);
  
  drawPoint(xlist[0], ylist[0], rlist[0]);
}

void draw() {
  float newx=random(width), newy=random(height), newr=random(MINR, MAXR);
  
  float minD=dist(0, 0, width, height)*100, d;
  int minIdx=-1;
  for (int i=0; i<currentIdx; i++) {
    d = dist(newx, newy, xlist[i], ylist[i]);
    if (d < minD) {
      minD = d;
      minIdx = i;
    }
  }
  
  float a = atan2(newy-ylist[minIdx], newx-xlist[minIdx]);
  newx = xlist[minIdx] + (rlist[minIdx]+newr) * cos(a);
  newy = ylist[minIdx] + (rlist[minIdx]+newr) * sin(a);
  
  xlist[currentIdx] = newx;
  ylist[currentIdx] = newy;
  rlist[currentIdx] = newr;
  currentIdx++;
  
  //drawPoint(newx, newy, newr);
  d = dist(width/2,height/2,newx,newy);
  float h = map(d, 0, width/2, 0, 360);
  //float h = 200;
  float n = map(d, 0, width/2, 50, 5);
  float v = map(d, 0, width/2, 10, 2);
  v = 10;
  println(d, h, n);
  
  //burashi = new Burashi((int)n, (int)h, v);
  burashi.draw(newx, newy);
  
  if (currentIdx >= N) noLoop();
  
  //if (mousePressed) burashi.draw(mouseX, mouseY);
}


void drawPoint(float x, float y, float r) {
  stroke(50);
  strokeWeight(2*r);
  point(x, y);
}

void keyPressed() {
  if (key==' ') {
    String filename = "" + year() + month() + day() + hour() + minute() + second();
    save("img/" + filename + ".png");
    //save("hoge.png");
    println("saved");
  }
}