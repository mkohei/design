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
  
  float lineLen=10, lineAngle=0, lineHue=0;
  
  //stroke(255);
  strokeWeight(1);
  float N=30.0f;
  float x, y, r;
  for (int i=0; i<pnts.length-1; i++) {
    for (int t=0; t<N; t++) {
      r = t/N;
      x = pnts[i].x * (1-r) + pnts[i+1].x * r;
      y = pnts[i].y * (1-r) + pnts[i+1].y * r;
      
      stroke(lineHue%360, 100, 100, 30); 
      
      //line(x, y, x+lineLen*cos(lineAngle), y+lineLen*sin(lineAngle));
      line(x+lineLen*cos(lineAngle), y+lineLen*sin(lineAngle), x+lineLen*cos(lineAngle+PI), y+lineLen*sin(lineAngle+PI));
      
      lineAngle-=PI/100;
      lineHue+=1;
      //point(x, y);
    }
    //point(pnts[i].x, pnts[i].y);
    //drawPoint(pnts[i].x, pnts[i].y);
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