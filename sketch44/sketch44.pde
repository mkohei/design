float DIV_X = 100.0f, DIV_FC = 10.0f;
float D=3;

float yarray[];

void setup() {
  size(500, 500);
  
  yarray = new float[width];
  
  background(0);
}

void draw() {
  //background(0);
  
  translate(0, height/2);
  
  stroke(255, 100);
  for (int x=0; x<width; x++) {
    // move
    yarray[x] += (noise(x / DIV_X, frameCount / DIV_FC) - 0.5) * D;
    
    // draw
    point(x, yarray[x]);
    
  }
}