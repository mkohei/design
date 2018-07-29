int LOOP_Z=10, LOOP_H=20;
float R=200;
float rot;

float DIVIDER_W = 10.f, DIVIDER_H=1000.0f, DIVIDER_Z=10.0f;
int INTV_W = 1;
float DW=100, DY=100;

void setup() {
  size(1000, 1000, P3D);
  
  colorMode(HSB, 360, 100, 100, 100);
  blendMode(ADD);
  
  rot=0;
}


void draw() {
  translate(width/2, height/2);
  rotateY(rot);
  rot+=0.01;
  
  background(0);
  
  strokeWeight(3);
  stroke(0, 0,100, 20);
  
  float x, y, z, n, da, dy;
  float dt, ds;
  for (int l=1; l<LOOP_Z; l++) {
    stroke( map(l, 1, LOOP_Z, 0, 360), 100, 100, 10);
    dt = map(l, 0, LOOP_Z, 0, PI);
    for (int j=0; j<LOOP_H; j++) {
      for(int i=0; i<width; i+=INTV_W) {
        ds = map(i, 0, width, 0, PI*2);
        
        n = noise(i / (width/DIVIDER_W), j / (height/DIVIDER_H), l/(LOOP_Z/DIVIDER_Z));

        dy = (n-0.5) * DY;
        da = map(n, 0, 1, 0, PI);    
        
        x = R * sin(dt) * cos(ds);
        y = R * cos(dt) + dy;
        z = R * sin(dt) * sin(ds);
        
        point(x,y,z);
      }
    }
  }
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