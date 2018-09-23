Relation rel;

float a, r, x, y;

void setup() {
  size(500, 500);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  rel = new Relation();
  
  background(0);
}

void draw() {
  translate(width/2, height/2);
  
  x = r * cos(a);
  y = r * sin(a);
  
  rel.rel(x,y);
  
  a += PI/100;
  r += 0.3;
  //rel.rel(mouseX, mouseY);
}


void keyPressed() {
  if (key==' ') {
    String filename = "" + year() + month() + day() + hour() + minute() + second();
    save("img/" + filename + ".png");
    //save("hoge.png");
    println("saved");
  } else if (key=='r') background(0);
}