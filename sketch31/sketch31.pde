float DIVX=1.0f, DIVY=1.0f;

void setup() {
  size(1000,300);
  
  colorMode(HSB, 360, 100, 100, 100);
  blendMode(ADD);
  
  noLoop();
  background(0);
}

void draw() {
  translate(0, height/2);
  
  stroke(200, 100, 100, 20);
  float a, x, y, f, p;
  for (int j=0; j<100; j++) {
    f = noise(j/100.0)*2;
    for (int i=0; i<width; i++) {
      a = map(i, 0, width, 0, 2*PI);
      x = i;
      y = sin(a * f) * 50;
      point(x,y);
    }
  }
  /*
  float y;
  for (int i=0; i<width; i++) {
    println(i);
    for (int j=0; j<height; j++) {
      y = noise(i/(width/DIVX), j/(height/DIVY)) * 100;
      point(i,y);
    }
  }
  */
}



void keyPressed() {
  if (key==' ') {
    String filename = "" + year() + month() + day() + hour() + minute() + second();
    save("img/" + filename + ".png");
    //save("hoge.png");
    println("saved");
  }
}