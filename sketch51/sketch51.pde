Burashi b;

float x, y;
float r, a;

float dalist[]={PI/100, PI/600}, drlist[]={0.02, 0.08};
Burashi blist[];

void setup() {
  size(500, 500);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  background(0);
  
  blist = new Burashi[dalist.length];
  blist[0] = new Burashi(20, 20, 30.0f);
  blist[1] = new Burashi(50, 280, 100.0f);
  
  noLoop();
}

void draw() {
  //if (mousePressed) b.draw(mouseX, mouseY);
  
  background(0);
  
  translate(width/2, height/2);
  
  for (int i=0; i<dalist.length; i++) {
    for (a=0,r=0; r<dist(0, 0, width/2, height/2); a+=dalist[i],r+=drlist[i]) {
      x = r * cos(a);
      y = r * sin(a);
      
      blist[i].draw(x, y);
    }
    print(i);
  }
}


void keyPressed() {
  if (key==' ') {
    String filename = "" + year() + month() + day() + hour() + minute() + second();
    save("img/" + filename + ".png");
    //save("hoge.png");
    println("saved");
  } else if (key=='r') redraw();
}