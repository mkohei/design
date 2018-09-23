float R0 = 200;
float x0, y0, a0, da0=PI/100;
float xlist[], ylist[], alist[], rlist[]={50, 50, 50}, dalist[]={PI/100,PI/30, PI/100};

int N = 3;

void setup() {
  size(500, 500);
  
  colorMode(HSB, 360, 100, 100, 100);
  
  xlist = new float[N];
  ylist = new float[N];
  alist = new float[N];
  
  background(0);
}

void draw() {
  //background(0);
  
  translate(width/2, height/2);
  
  // move
  float xbias=0, ybias=0;
  for (int i=0; i<N; i++) {
    if (i==0);
    else {
      xbias = xlist[i-1];
      ybias = ylist[i-1];
    }
    xlist[i] = xbias + rlist[i] * cos(alist[i]);
    ylist[i] = ybias + rlist[i] * sin(alist[i]);
    alist[i] += dalist[i];
  }

  // draw
  stroke(360);
  strokeWeight(5);
  for (int i=0; i<N; i++) {
    // r to color
    //stroke(map(dist(0, 0, xlist[i], ylist[i]), 0, width/2, 0, 360), 100, 100, 100);
    // a to color
    //stroke(map(atan2(xlist[i], ylist[i]), -PI, PI, 0, 360), 100, 100, 100);
    point(xlist[i], ylist[i]);
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