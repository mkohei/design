MoveCircle mc, mc2[];

void setup() {
  size(500,500);
  
  colorMode(HSB, 360, 100, 100, 100);
  blendMode(ADD);
  
  mc = new MoveCircle(width/2, height/2);
  mc2 = new MoveCircle[MoveCircle.N];
  for (int i=0; i<mc2.length; i++) {
    mc2[i] = new MoveCircle(map(i, 0, mc2.length, 0, 720));
  }
}

void draw() {
  background(0);
  
  mc.move();
  for (int i=0; i<mc2.length; i++) {
    mc2[i].cx = mc.balls[i].x;
    mc2[i].cy = mc.balls[i].y;
  }
  //mc.draw();
  for (MoveCircle m: mc2) {
    m.move();
    m.draw(m.hue);
  }
  
  saveFrame("frames/######.tif");
}