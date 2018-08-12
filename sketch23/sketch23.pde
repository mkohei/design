float iniv = 100;

float x, y;
float vx, vy;

int i;

Points[] pss;

void setup() {
  size(700,700);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  vx = random(-iniv,iniv);
  vy = random(-iniv,iniv);
  x=width/2;
  y=height/2;
  //frameRate(2);
  pss = new Points[10];
  for (int i=0; i<pss.length; i++) {
    pss[i] = new Points(x,y);
  }
  i = 0;
  background(0);
}

void draw() {
  //translate(width/2, height/2);
  background(0);
  
  // move
  x += vx;
  y += vy;
  if (x < 0 || x > width)  vx *= -1;
  if (y < 0 || y > height) vy *= -1;
  
  pss[i] = new Points(x,y);
  i = (i+1)%pss.length;
  
  for (int i=0; i<pss.length; i++) pss[i].makePolygon();
  
}