class Line {
  float basehue = 0;
  float cx, y, l;
  
  Line(float iniy) {
    cx = width/2;
    y = iniy;
    
  }
  
  void draw() {
    float h = map(y, 0, height, 0, 360);
    stroke((h+basehue)%360, 100, 100, 100);
    basehue++;
    
    float d = abs(height/2 - y); 
    d = pow(d,2);
    l = map(d, 0, pow(height/2,2), 0, width/2);
    
    line(cx-l, y, cx+l, y);
    
    y = (y+1) % height;
  }
}