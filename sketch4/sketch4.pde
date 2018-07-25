
int N = 10000;
int cnt;
SnowBall[] snowballs;
float rot = 0;

float centerR = 100;
int interv = 15;


void setup() {
  size(displayWidth, displayHeight, P3D);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100);
  
  //Ss = new Sphere2center[N];
  snowballs = new SnowBall[N];
  for (int i=0; i<N; i++) {
    //Ss[i] = new Sphere2center();
    snowballs[i] = new SnowBall();
  }
  
  cnt = 0;
  
}

void draw() {
  background(0);
  
  translate(width/2, height/2);
  rotateX(radians(30));
  
  rot+=0.005;
  rotateY(rot);
  
  stroke(255, 30);
  //fill(255, 30);
  noFill();
  //sphere(centerR);
  
  
  
  for (int i=0; i<interv; i++) {
    if (snowballs[i+cnt].dead) {
      snowballs[i+cnt].dead = false;
    } else {
      snowballs[i+cnt].reset();
    }
  }
  
  
  for (int i=0; i<N; i++) {
    snowballs[i].disp();
  }
  cnt = (cnt+interv)%(N-interv);
}


class SnowBall {
  float maxR_XZ = 150;
  float ballR = 5;
  float x, y, z;
  boolean dead;
  
  SnowBall() {
    reset();
    dead = true;
  }
  
  void reset() {
    float s = random(2*PI);
    float iniR = random(maxR_XZ);
    
    y = -150;
    x = iniR * cos(s);
    z = iniR * sin(s);
  }
  
  void disp() {
    if (dead) return;
    y += 0.5;
    
    //noStroke();
    //fill(0, 0, 255, 100);
    int h = 360 - int(inHeightRatio()*360 + cnt/10) % 360;
    if (isInSphere()) stroke(h, 80, 80);
    else stroke(0, 0, 30);
    strokeWeight(ballR);
    noFill();
    
    pushMatrix();
    translate(x, y, z);
    //sphere(ballR);
    point(x, y, z);
    popMatrix();
  }
  
  boolean isInSphere() {
    return pow(x,2)+pow(y,2)+pow(z,2)<pow(centerR/2,2);
  }
  
  
  float inHeightRatio() {
    return map(y, -centerR, centerR, 0, 1);
  }
}



void keyPressed() {
  if (key==' ') {
    String filename = "" 
      + nf(year(), 4, 0) 
      + nf(month(), 2, 0) 
      + nf(day(), 2, 0) 
      + nf(hour(), 2, 0) 
      + nf(minute(), 2, 0)
      + nf(second(), 2, 0);
    save("img/" + filename + ".png");
    //save("hoge.png");
    println("saved");
  }
}