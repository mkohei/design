Relative rel;

void setup() {
  size(600,600);
  colorMode(HSB,360,100,100,100);
  blendMode(ADD);
  
  rel = new Relative();
}

void draw() {
  background(0);
  rel.movePoints();
  //rel.dispPoints();
  rel.dispRelative();
  
  //saveFrame("frames/######.tif");
}