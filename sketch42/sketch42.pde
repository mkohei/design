int N=100;

WaveCircle wcs[];

void setup() {
  size(500, 500);
  
  wcs = new WaveCircle[N];
  for (int i=0; i<wcs.length; i++) wcs[i] = new WaveCircle();
}

void draw() {
  translate(width/2, height/2);
  
  background(0);
  
  for (WaveCircle wc: wcs) {
    wc.move();
    wc.draw();
  }
}