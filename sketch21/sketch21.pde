float x, y, a, d;
float freq = 1.5;

int N=5;
Points pss[];

float ll;

void setup() {
  size(1000, 500);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  //background(0);
  pss = new Points[N+1];
  float r;
  for (int i=0; i<=N; i++) {
    r = map(i, 0, N, 0, 1); 
    pss[i] = new Points(r);
  }
  
  ll=0;
  //noLoop();
}

void draw() {
  background(0);
  
  translate(0, height/2);
  
  pss = new Points[N+1];
  float r;
  for (int i=0; i<=N; i++) {
    r = map(i, 0, N, 0, 1); 
    pss[i] = new Points(r, ll);
    pss[i].makePolygon();
  }
  println(ll);
  ll++;
  
  saveFrame("frames/######.tif");
}



void keyPressed() {
  if (key==' ') {
    String filename = "" + year() + month() + day() + hour() + minute() + second();
    save("img/" + filename + ".png");
    //save("hoge.png");
    println("saved");
  }
  if (key=='r') {
    float r;
    for (int i=0; i<=N; i++) {
      r = map(i, 0, N, 0, 1); 
      pss[i] = new Points(r);
    }
    redraw();
  }
}