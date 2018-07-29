void setup() {

  size(displayWidth, displayHeight, P3D);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  
  rotateY(radians(-10));

  stroke(100);
  fill(255);

  rotateY(radians(90));
  int d = 100;
  for (int i=0; i<10; i++) {
    rect(d*i-500, 0, d, d);
  }
}