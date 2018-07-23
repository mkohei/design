Ball ball;

void setup() {
  size(displayWidth, displayHeight);
  
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);;
  
  background(0);
  ball = new Ball();
}

void draw() {
  //background(255);
  
  ball.disp();
  
}

class Ball {
  
  float x, y;
  float r = 100;
  
  float angle;
  
  Ball() {
    //x = random(r/2, width-r/2);
    //y = random(r/2, height-r/2);
    
    angle = 0;
  }
  
  void move() {
    x = mouseX;
    y = mouseY;
    
    angle += 0.1;
  }
  
  void disp() {
    move();
    
    //noStroke();
    //fill(0, 10);
    //ellipse(x, y, r, r);
    
    stroke(40, 80, 10);
    float x1, x2, y1, y2;
    x1 = x + r/2 * cos(angle);
    x2 = x + r/2 * cos(angle+PI);
    y1 = y + r/2 * sin(angle);
    y2 = y + r/2 * sin(angle+PI);
    line(x1, y1, x2, y2);
  }
}

void keyPressed() {
  if (key==' ') {
    String filename = "" + year() + month() + day() + hour() + minute() + second();
    save("img/" + filename + ".png");
    //save("hoge.png");
    println("saved");
  }
}