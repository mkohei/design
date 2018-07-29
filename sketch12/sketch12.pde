final float DIVIDER_W=10.0f, DIVIDER_H=5.0f, DIVIDER_Z=1.0f;
final float DZ=100, SIN_WD=100;
final float LOOP=100;
final int INTV_W=1, INTV_H=2;
final int LOOP_Z=10;

final float R=50;

void setup() {
  size(500,500);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  noLoop();
}

void draw() {
  background(0);
  
  //translate(0, height/2);
  
  //stroke(255, 30);
  stroke(200, 100, 100, 20);
  
  /*
  float pz=0, dz;
  for (int j=0 ;j<height; j+=INTV_H) {
    //stroke(map(j, 0, height, 0, 360), 100, 100, 50);
    //
    for (int i=0; i<width; i+=INTV_W) {
      dz = noise(i / (width/DIVIDER_W), j / (height/DIVIDER_H));
      if (i!=0) line(i+1-INTV_W, pz, i, (dz-0.5)*DZ);
      pz = (dz-0.5)*DZ;
    }
  }
  */
  
  /*
  float dz, da, a=0, pz=0, x1, y1, x2, y2, z;
  for (int i=0; i<width; i+=INTV_W) {
    dz = noise(i / (width/DIVIDER_W));
    da = noise((i+100) / (width/DIVIDER_W));
    z = (dz-0.5)*DZ;
    a = (da-0.5)*PI/2;
    x1 = i + R*cos(a);
    x2 = i - R*cos(a);
    y1 = z + R*sin(a);
    y2 = z - R*sin(a);
    line(x1, y1, x2, y2);
    pz = z;
    
    //a += PI/1000;
  }
  */
  
  /*
  float x=0, y=0;
  float dr=2;
  float a;
  for (int l=0; l<LOOP_Z; l++) {
    stroke( map(l, 0, LOOP_Z, 0, 360), 100, 100, 20 );
    translate(0, height/(LOOP_Z+1));
    for (int j=0; j<height; j+=1) {
      x=0; y=0;
      for (int i=0; i<width; i++) {
        //stroke( map(i, 0, width/2, 0, 360), 100, 100, 20);
        a = noise(i / (width/DIVIDER_W), j / (height/DIVIDER_H), l/DIVIDER_Z);
        a = (a - 0.5) * PI;
        
        //line(x, y, x+dr*cos(a), y+dr*sin(a));
        
        x += dr*cos(a);
        y += dr*sin(a);
        point(x,y);
      }
    }
  }
  */
  
  translate(width/2, height/2);
  
  stroke(160, 100, 100, 20);
  float da=2*PI/LOOP_Z;
  float x, y, a;
  for (int l=0; l<LOOP_Z; l++) {
    //stroke(map(l, 0, LOOP_Z, 0, 360), 100, 100, 20);
    print(l);
    for (int j=0; j<height; j++) {
      stroke(map(j, 0, height, 0, 360), 100, 100, 20);
      for(int i=0; i<width; i++) { // r
        //stroke(map(i, 0, width/2, 0, 360), 100, 100, 20);
        a = noise(i / (width/DIVIDER_W), j / (height/DIVIDER_H), l/DIVIDER_Z);
        a = (a - 0.5) * PI/2;
        x = i * cos(da*l + a);
        y = i * sin(da*l + a);
        point(x,y);
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