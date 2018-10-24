import geomerative.*;

String text = "BARU";

RFont font;

void setup() {
  size(800, 400);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  RG.init(this);
  font = new RFont("V-GERB(bold).ttf", 200, RFont.CENTER);
  //font = new RFont(); 
  
  RCommand.setSegmentLength(11);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  
  noLoop();
}

void draw() {
  background(0);
  
  translate(width/2, height/2+50);
  
  RGroup grp;
  grp = font.toGroup(text);
  grp = grp.toPolygonGroup();
  RPoint[] pnts = grp.getPoints(); 
  
  stroke(255);
  strokeWeight(1);
  for (int i=0; i<pnts.length; i++) {
    //point(pnts[i].x, pnts[i].y);
    //drawPoint(pnts[i].x, pnts[i].y);
    drawPoint2(pnts[i].x, pnts[i].y);
  }
}


void drawPoint2(float x, float y) {
  strokeWeight(1);
  stroke(255, 50);
  
  int N=200;
  float var=3;
  
  float hue = random(300, 350);
  
  float dx, dy;
  for (int i=0; i<N; i++) {
    dx = pow(randomGaussian()*var, 2);
    dy = pow(randomGaussian()*var, 2);
    
    stroke(hue+random(20), 100, 100, 50);
    
    point(x+dx, y+dy);
  }
}


void drawPoint(float x, float y) {
  int N=30;
  float var=7, MIN=1, MAX=15;
  
  //stroke(255, 30);
  
  
  float d, dx, dy;
  for (int i=0; i<N; i++) {
    d = random(MIN, MAX);
    dx = randomGaussian() * var;
    dy = randomGaussian() * var;
    
    stroke(random(340, 360), 100, 100, 10);
    strokeWeight(d);
    point(x+dx, y+dy);
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