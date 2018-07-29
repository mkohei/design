final float R = 300;
final float LineR = 30;


float rot;

void setup() {
  size(1000, 1000, P3D);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  rot=0;
  //noLoop();
}

void draw() {
  translate(width/2, height/2);
  rotateZ(PI/6);
  rotateY(rot/2);
  rot += 0.001;
  
  background(0);
  
  stroke(100, 100, 100, 100);
  //strokeWeight(3);
  
  float radianS=0, radianT=0; // 方位角,天頂角
  float radianU=rot*10, radianV=rot*6;
  float x, y, z;
  //float x1,y1,z1,x2,y2,z2;
  float dx,dy,dz;
  float h;
  while (radianT<PI) {
    h = (map(radianT,0,PI,0,360) + rot*300) % 360;
    stroke( h, 100, 100, 50);
    
    x = R * sin(radianT) * cos(radianS);
    y = R * cos(radianT);
    z = R * sin(radianT) * sin(radianS);
    
    dx = LineR * sin(radianU) * cos(radianV);
    dy = LineR * cos(radianU);
    dz = LineR * sin(radianU) * sin(radianV);
    
    line(x+dx, y+dy, z+dz, x-dx, y-dy, z-dz);
    
    //point(x, y, z);
    
    radianS += 0.01;
    radianT += 0.0005;
    
    radianU += 0.03;
    radianV += 0.03;
  }
  point(0, 0);
  
  
  saveFrame("frames/######.tif");
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