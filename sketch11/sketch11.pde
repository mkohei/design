final float ratioVPX=0.7, ratioVPY=0.5;
final float MIN_L = 50;

void setup() {
  size(1000,500);
}

void draw() {
  background(0);
  
  // 消失点
  float vpx=width*ratioVPX, vpy=height*ratioVPY;
  
  //
  noFill();
  //stroke(255);
  stroke(100);
  strokeWeight(1);
  float L=width, rate_expand=1.4, rate_wh = float(height)/float(width);
  float x=0,y=0;
  while (L>MIN_L) {
    fill(map(L, MIN_L, width, 100, 200)); 
    x = vpx-L*ratioVPX;
    y = vpy-L*rate_wh*ratioVPY;
    rect(x, y, L, L*rate_wh);
    
    L /= rate_expand;
  }
  
  
  //
  //stroke(255);
  stroke(100);
  line(0,0,vpx,vpy);
  line(0,height,vpx,vpy);
  line(width,0,vpx,vpy);
  line(width,height,vpx,vpy); 
  
  
  // 
  float rate_ob=0.7, RL;
  L=width;
  fill(0);
  while (L>MIN_L) {
    RL = L/10;
    x = vpx - L*ratioVPX * rate_ob;
    y = vpy - RL*rate_wh*ratioVPY*rate_ob;
    //y = vpy;
    
    rect(x, y, L/10, L/10);
    
    L /= rate_expand;
  }
}