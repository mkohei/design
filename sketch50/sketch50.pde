A children[];

void setup() {
  size(500, 500);
  
  children = new A[20];
  for (int i=0; i<children.length; i++) children[i] = new A();
  
  background(0);
}

void draw() {
  //background(255);
  
  translate(width/2, height/2);
  
  for (A a: children) {
    a.move();
    a.draw();
  }
}