float phase;

Points ps;

void setup() {
  size(1000, 500);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  phase = 0;  
}

void draw() {
  background(0);
  translate(0, height/2);
  
  int N = 100;
  float r = map(frameCount%N, 0, N, 0, 2*PI);
  r = sin(r)/2 + 0.5;
  ps = new Points(r, phase);
  phase -= radians(3);
  
  ps.makePolygon();
  
  saveFrame("frames/######.tif");
  println(frameCount);
}



void keyPressed() {
  if (key==' ') {
    String filename = "" + year() + month() + day() + hour() + minute() + second();
    save("img/" + filename + ".png");
    //save("hoge.png");
    println("saved");
  }
}