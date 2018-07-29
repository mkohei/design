PArc parc;

void setup() {
  size(displayWidth, displayHeight);
  println(displayWidth, displayHeight);
  
  blendMode(ADD);
  colorMode(RGB, 255, 255, 255, 100);
  
  parc = new PArc();
}

void draw() {
  
  background(0);
  
  translate(width/2, height/2);
  
  parc.disp();
  
  
}


class PArc {
  
  float maxR, dR, dS;
  
  PArc() {
    maxR = 200;
    dR = 40;
    dS = PI/2;
  }
  
  void disp() {
    
    noFill();
    stroke(255);
    strokeWeight(5);
    
    int NUM_DA=100, NUM_DR=40;
    
    float da = dS / NUM_DA;
    float x, y, a, r, c;
    for (int j=0; j<NUM_DR; j++) {
      r = map(j, 0, NUM_DR, maxR-dR, maxR);
      c = map(j, 0, NUM_DR, 10, 20);  
      
      stroke(255, c);
      for (int i=0; i<NUM_DA; i++) {
        a = da * i;
        x = r * cos(a);
        y = r * sin(a);
        point(x, y);
      }
    }
  }
  
}