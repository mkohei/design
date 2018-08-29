App apps[];

void setup() {
  size(500,500);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  apps = new App[10];
  for (int i=0; i<apps.length; i++) apps[i] = new App();
}

void draw() {
  background(0);
  
  for (App app: apps) {
    app.move();
    app.draw();
  }
}