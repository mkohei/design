class Shape1 {
  int N, L, P;
  float DIV1=10.0, DIV2=1.0;
  float D, MAX_D;
  
  int hue;
  float var = 20;
  
  float seed;
  
  
  float cx, cy;
  
  Shape1() {
    N = 5;
    L = 40;
    P = 3;
    D = 40;
    MAX_D = 20;
    
    hue = 250;
    var = 20;
    
    seed = 0;
    
    cx = 0;
    cy = 0;
  }
  Shape1(int n, int l, int p, int d, int maxd, int h, int v, float s) {
    this();
    
    N=n;
    L=l;
    P=p;
    D=d;
    MAX_D = maxd;
    hue = h;
    var = v;
    seed = s;
  }
  
  void draw() {
    
    ArrayList<Point> points;
    for (int i=0; i<N; i++) {
      float dx=0, dy=0;
      
      points = new ArrayList<Point>();
      for (int l=0; l<L; l++) {
        dx += D*(noise(seed+0, i/(float)(N/DIV1), l/(float)(L/DIV2)) - 0.5);
        dy += D*(noise(seed+500, i/(float)(N/DIV1), l/(float)(L/DIV2)) - 0.5);
        
        for (int p=0; p<P; p++) {
          points.add(new Point(cx + dx + randomGaussian()*var, cy + dy + randomGaussian()*var));
        }
        
        strokeWeight(5);
        stroke(255);
        point(cx+dx, cy+dy);
        
      }
      disp(points);
    }
  }
  
  void disp(ArrayList<Point> points) {    
    for (Point fromP: points) {
      beginShape();
      
      noStroke();
      fill(random(hue-20,hue+20), random(50,100), random(50,100), random(20,100)); 
      for (Point toP: points) {
        if (fromP.dist2Point(toP) < MAX_D) vertex(toP.x, toP.y);
      }
      endShape();
    }
  }
}





class Point {
  float x, y;
  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
  float dist2Point(Point p) {
    return dist(this.x, this.y, p.x, p.y);
  }
}