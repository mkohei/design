

class App {
  
  int N=10;
  Gen gens[];
  
  App() {
    float hue;
    gens = new Gen[N];
    for (int i=0; i<gens.length; i++) {
      hue = map(i, 0, gens.length, 0, 360);
      gens[i] = new Gen(hue);
    }
  }
  
  void move() {
    for (int i=gens.length-1; i>0; i--) {
      gens[i].move(gens[i-1]);
    }
    gens[0].move();
  }
  
  void draw() {
    for (Gen gen: gens) gen.draw();
  }
  
  
}