Shape1 s1, s1b;
Shape2 s2;

void setup() {
  size(500, 500);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  noLoop();
  
  // N(方向個数), L(1本の長さ), P(蒔く点数), D(進む距離), MAX_D(結ぶ長さ), hue(色), var(分散:蒔く距離)
  s1 = new Shape1(3, 50, 3, 30, 20, 100, 30, 0);
  s1b = new Shape1(3, 100, 3, 20, 20, 340, 30, 300);
  // N, hue, var, da, dr
  s2 = new Shape2(10, 280, 30, PI/100, 0.03);
}

void draw() {
  translate(width/2, height/2);
  
  background(0);
  
  s2.draw();
  s1.draw();
  //s1b.draw();
}


void keyPressed() {
  if (key==' ') {
    String filename = "" + year() + month() + day() + hour() + minute() + second();
    save("img/" + filename + ".png");
    //save("hoge.png");
    println("saved");
  } else if (key=='r') redraw();
}