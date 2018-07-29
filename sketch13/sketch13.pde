final int INTV_H = 10;


void setup() {
  size(500, 500);
  background(0);
  
  noLoop();
}

void draw() {
  translate(width/2, 0);
  
  stroke(255);
  //fill(0);
  noFill();
  
  float _min=30;
  float d;
  for (int i=0; i<height+1; i+=INTV_H) {
    d = abs(height/2 - i);
    d = pow(d,2);
    d = map(d, 0, pow(height/2,2), _min, height/2);  
    //line(-d, i, d, i);
    
    ellipse(0, i, 2*d, 15);
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