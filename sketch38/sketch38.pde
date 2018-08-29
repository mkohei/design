int step=10;

Line lines[];
LineX lineXs[];

void setup() {
  size(500, 500);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  
  lines = new Line[height/step];
  for (int i=0; i<lines.length; i++) lines[i] = new Line(-i * step);
  lineXs = new LineX[width/step];
  for (int i=0; i<lineXs.length; i++) lineXs[i] = new LineX(-i * step);
  
}

void draw() {
  background(0);
  for (Line line: lines) line.draw();
  for (LineX linex: lineXs) linex.draw();
}