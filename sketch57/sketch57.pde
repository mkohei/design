float N=10;
float STEP;

float SW_MIN=1, SW_MAX;

boolean[][] flag;

void setup() {
  size(500, 500);
  
  STEP = width/N;
  SW_MAX=STEP-1;
  
  flag = new boolean[(int)N][(int)N];
  for (int j=0; j<N; j++) {
    for (int i=0; i<N; i++) {
      flag[j][i] = random(1) > 0.5; 
    }
  }
  
  //noLoop();
}

void draw() {
  background(255);
  stroke(0);
  //strokeWeight(5);
  
  float x, y;
  for (int j=0; j<N; j++) {
    y = j * STEP;
    for (int i=0; i<N; i++) {
      x = i * STEP;
      if (flag[j][i]) {
        // 右肩上がり
        strokeWeight(map(mouseX, 0, width, SW_MIN, SW_MAX));
        line(x, y+STEP, x+STEP, y);
      } else {
        // 右肩下がり
        strokeWeight(map(mouseY, 0, height, SW_MIN, SW_MAX));
        line(x, y, x+STEP, y+STEP);
      }
    }
  }
}