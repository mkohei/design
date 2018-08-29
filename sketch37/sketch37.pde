int N=10;

App apps[];

void setup() {
  size(500,500);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  apps = new App[N];
  for (int i=0; i<apps.length; i++) apps[i] = new App(i/(float)N);

}

void draw() {
  background(0);
  
  for (App app: apps) app.draw();
}