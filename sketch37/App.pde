class App {
  int step=10;
  float MAX_L = 100;
  
  
  float hue;
  
  Line lines[];
  
  App(float n) {
    float L = random(MAX_L*0.5, MAX_L);
    float x = random(width);
    float basey = random(L, height-L);
    
    hue = 360*n;
    
    lines = new Line[height/step];
    for (int i=0; i<lines.length; i++) {
      lines[i] = new Line(-i * step, L, x, basey, hue);
    }
  }
  
  void draw() {
    for (Line line: lines) line.draw();
  }
}