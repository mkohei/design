float phase, d=150;
int cnt=0;

void setup() {
  size(800, 450);
  
  phase =0;
}

void draw() {
  translate(0, height/2);
  
  background(0);
  
  stroke(255);
  float y, a;
  for (int i=0; i<width; i+=10) {
    a = map(i, 0, width, 0, TWO_PI);
    y = d*sin(a*3 + phase);
    //point(i, y);
    text("こ", i, y);
  }
  phase -= PI/100;
  
  cnt++;
  if (cnt<200)saveFrame("frames/######.tif");
}