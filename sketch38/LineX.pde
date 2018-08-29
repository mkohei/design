class LineX {
  float basehue = 0;
  float cy, x, l;
  
  LineX(float inix) {
    cy = width/2;
    x = inix;
    
  }
  
  void draw() {
    float h = map(x, 0, width, 0, 360);
    stroke((h+basehue)%360, 100, 100, 100);
    basehue++;
    
    float d = abs(width/2 - x); 
    d = pow(d,2);
    l = map(d, 0, pow(width/2,2), 0, height/2);
    
    line(x, cy-l, x, cy+l);
    
    x = (x+1) % height;
  }
}