ElementList el;

void setup() {
  size(500,500);
  
  blendMode(ADD);
  //colorMode(HSB, 360, 100, 100, 100);
  
  el = new ElementList();
  
  background(0);
}

void draw() {
  translate(0, height/2);
  
  //background(0);
  
  el.move();
  el.draw();
}