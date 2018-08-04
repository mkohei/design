float FREQ_W=1, FREQ_H=1;
final int INTV_W=20, INTV_H=20;
final float MAX_H=255;
final float DIVIDER_W=10.0f, DIVIDER_H=10.0f;
final float D=100;

float rot;

void setup() {
  size(1000, 1000, P3D);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  rot=0;
}


void draw() {
  background(0);
  
  //translate(width/2, height/2);
  translate(0, height/2);
  //rotateX(-PI/4);
  //rotateY(PI/4);
  rot+=0.01;
  
  //stroke(255);
  strokeWeight(1);
  float v;
  for (int j=0; j<height; j+=INTV_H) {
    for (int i=0; i<width; i+=INTV_W) {
      v = getV(i, j);
      
      //strokeWeight(5);
      //point(i, v, j);
      
      stroke( map((i+j)%width,0, width, 0, 360), 100, 100, 20 );
      if (i!=0) line(i-INTV_W, getV(i-INTV_W,j), j, i, v, j);
      if (j!=0) line(i, getV(i, j-INTV_H), j-INTV_H, i, v, j);
    }
    //println(j);
  }
}



float getV(float i, float j) {
  float radianW = map(i, 0, width, 0, 2*PI);
  float radianH = map(j, 0, height, 0, 2*PI);
  //v = map( sin(radianW + radianH), -1, 1, 0, 255);
  float v = map( sin(radianW + rot), -1, 1, 0, MAX_H);
  
  float n = noise(i / (width/DIVIDER_W), j / (height/DIVIDER_H));
  n = (n - 0.5) * D;
  
  return v + n;
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