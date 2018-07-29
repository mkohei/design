final float DIVIDER = 1.0f;
final int EQ_INTV = 15;
final float FLOAT_ZERO = 0.3;

float[] noises;

void setup() {
  size(500, 500);
  
  colorMode(HSB, 255, 100, 100, 100);
  
  noises = new float[height*width];
  
  noLoop();
}

void draw() {
  background(0);
  
  loadPixels();
  
  int idx;
  
  // set noise
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      idx = y*width + x;
      noises[idx] = noise(x/(width/DIVIDER), y/(height/DIVIDER));
    }
  }
  
  // normalize [min,max]->[0,1]
  float _min=min(noises), _max=max(noises);
  for(int i=0; i<noises.length; i++) {
    noises[i] = map(noises[i], _min, _max, 0, 1);
    //pixels[i] = color(noises[i]*255);
  }
  
  // color intv
  float z, r, basis, r_diff;
  for (int i=0; i<noises.length; i++) {
    noises[i] = noises[i] + frameCount/10000.0f;
    if (noises[i] > 1.0) noises[i] = 0.0;
    z = map(noises[i], 0, 1, 0, 255);
    // 等高線 - 余り0でなく、バッファを持たせる
    basis = int((z + 0.5) / EQ_INTV);
    r_diff = abs(z/EQ_INTV - basis);
    
    if (r_diff < FLOAT_ZERO) {
      pixels[i] = color(z, 100, 100);
    }
  }
  
  updatePixels();
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