void setup() {
  size(500,500);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  //noLoop();
}


void draw() {
  background(0);
  translate(width/2, height/2);
  
  stroke(0, 0, 100, 20);
  
  float x, y, n;
  for(int j=0; j<720; j++) {
    stroke(random(360), 100, 100, 20);
    for (int i=0; i<width; i++) {
      n = noise(j/(360/10.0f), i/(width/10.0f), (frameCount%1000)/(1000/1000.0f));
      x = i * cos(radians(j + n*100));
      y = i * sin(radians(j + n*100));
      point(x,y);
    }
  }
  saveFrame("frames/######.tif");
  println(frameCount);
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