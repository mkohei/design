float R = 200;
float rot;

Ball balls[];

void setup() {
  size(500, 500, P3D);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  balls = new Ball[400];
  for (int i=0; i<balls.length; i++) balls[i] = new Ball();
  
  rot = 0;
  
  background(0);
}

void draw() {
  translate(width/2, height/2);
  
  rotateZ(PI/6);
  rotateY(rot);
  //rot += 0.01;
  
  //background(0);
  
  for (Ball b: balls) {
    b.move();
    b.draw();
  }
}