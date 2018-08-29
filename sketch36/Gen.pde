class Gen {
  Gen parent;
  ArrayList<Gen> children;
  
  float x, y, v, a;
  int life;
  
  Gen() {
    life = width;
    children = new ArrayList<Gen>();
  }
  
  void move() {
    if (life<0) return;
    life--;
  }
  
  
  
  
}