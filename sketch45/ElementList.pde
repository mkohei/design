class ElementList {
  int N=10;
  
  Element[] eles;
  
  ElementList() {
    eles = new Element[N];
    for (int i=0; i<N; i++) {
      eles[i] = new Element();
    }
  }
  
  void move() {
    for (Element tar: eles) {
      for (Element other: eles) {
        tar.addForce(other);
      }
      tar.move();
    }
  }
  
  void draw() {
    for (Element ele: eles) ele.draw();
  }
}