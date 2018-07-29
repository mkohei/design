Whirl whirl;

void setup() {
  size(displayWidth, displayHeight);
  
  colorMode(HSB, 360, 100, 100, 100);
  
  whirl = new Whirl();
  
  //noLoop();
}

void draw() {
  //background(0);
}

void mouseClicked() {
  whirl.disp(mouseX, mouseY);
}



class Whirl {
  final float rectW=200,rectH=80;
  final float da = PI/15, dr = 0.96;
  final int LOOP = 100;
  
  float x, y;
  
  Whirl(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  Whirl() {
  }
  
  void disp() {
    disp(this.x, this.y);
  }
  
  void disp(float x, float y) {
    pushMatrix();
    
    translate(x,y);
    
    noStroke();
    fill(0, 0, 100, 50);
    
    int cnt=0;
    while(cnt < LOOP) {
      
      rect(-rectW/2, rectW, rectW, rectH);
      
      rotate(da);
      scale(dr);
      
      cnt++;
    }
    popMatrix();
  }
}