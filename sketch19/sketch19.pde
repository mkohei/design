float DIV = 10.0f;
int N = 2;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100, 100);
  blendMode(ADD);

  background(0);
  noLoop();
}

void draw() {
  background(0);
   
  float n, r, M=pow(width/2, 2);
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      n = noise(x/(width/DIV), y/(height/DIV));
      r = pow(y-height/2, 2) + pow(x-width/2, 2);
      n *= (M-r)/M;
      stroke(200, 100, 100, n*100);
      point(x,y);
    }
  }
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      n = noise(x/(width/DIV), y/(height/DIV), 100rukan4);
      r = pow(y-height/2, 2) + pow(x-width/2, 2);
      n *= (M-r)/M;
      stroke(0, 100, 100, n*100);
      point(x,y);
    }
  }

  println("drawd");

}