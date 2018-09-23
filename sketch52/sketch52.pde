Relation rel;

int cnt=0;

void setup() {
  size(500, 500);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  rel = new Relation();
  
  background(0);
  //background(360);
}

void draw() {
  //background(0);
  
  rel.rel();
  
  if (cnt<1000)saveFrame("frames/######.tif");
  cnt++;
}