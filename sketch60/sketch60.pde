int N=300, currentIdx;
float xlist[], ylist[], rlist[];

float MINR=5, MAXR=10;

void setup() {
  size(500, 500);
  
  currentIdx = 0;
  xlist = new float[N];
  ylist = new float[N];
  rlist = new float[N];
  
  xlist[currentIdx] = width/2;
  ylist[currentIdx] = height/2;
  rlist[currentIdx] = random(MINR, MAXR);
  currentIdx++;
  
  background(255);
  
  stroke(50);
  strokeWeight(2*rlist[0]);
  point(xlist[0], ylist[0]);
  
  
  //frameRate(1);
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
  
  // DEBUG
  //fill(230);
  /*
  strokeWeight(10);
  stroke(230);
  point(newx, newy);
  strokeWeight(1);
  line(newx, newy, xlist[minIdx], ylist[minIdx]);
  */
  
  float a = atan2(newy-ylist[minIdx], newx-xlist[minIdx]);
  newx = xlist[minIdx] + (rlist[minIdx]+newr) * cos(a);
  newy = ylist[minIdx] + (rlist[minIdx]+newr) * sin(a);
  
  xlist[currentIdx] = newx;
  ylist[currentIdx] = newy;
  rlist[currentIdx] = newr;
  currentIdx++;
  
  //fill(0);
  stroke(50);
  strokeWeight(2*newr);
  point(newx, newy);
  
  if (currentIdx >= N) noLoop();
}