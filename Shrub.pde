class Shrub implements Element {

  int x;
  int y;
  float diameter;
  //float yspeed;
  PImage hillMask;
  
  Shrub(PImage hillMask) {
    this.hillMask = hillMask;

  }

  //void ascend() {
  // y = y - yspeed;
  //  x = x+ random(-2,2);
  // }

  void display() {
    int x = int(random (0, 1025));
    int y = int(random (0, 1475));
    
    color c = hillMask.get(x,y);
    if (c == color(0)) {
      pushMatrix();
      translate(x, y);

      fill(000);
      stroke(0);
      
      
      scale(random (0.05, 0.1));
      strokeWeight(1.0);
      bezier (400, 351, 310, 369, 375, 133, 400, 132);

      fill(000);
      stroke(0);
      strokeWeight(1.0);
      bezier(400, 132, 430, 209, 457, 310, 400, 351);
      popMatrix();
    }
  }
}
