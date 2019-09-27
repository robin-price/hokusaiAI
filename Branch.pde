class Branch implements Element {


  ///////////////////////////////////////////////////////////
  // Variable definitions ///////////////////////////////////
  ///////////////////////////////////////////////////////////
  float windAngle = 0;
  float minX;
  float maxX;
  float minY;
  float maxY;
  String lastSeed;
  int glob_x;
  int glob_y;
  float x;
  float y;
  float angle;
  float angleOffset;
  float length;
  float growth = 1;
  float windForce = 0;
  float blastForce = 0;
  Branch branchA;
  Branch branchB;
  Branch parent;
  PImage hillMask;
  Leaf leaf;
  float scale;
  ///////////////////////////////////////////////////////////
  // Constructor ////////////////////////////////////////////
  ///////////////////////////////////////////////////////////
  Branch(Branch parent, float x, float y, float angleOffset, float length, Leaf leaf, PImage hillMask ) {
    this.parent = parent;
    this.x = x;
    this.y = y;
    this.hillMask = hillMask;
    //boolean draw = false;

    //  glob_x = int(random(0, width));
    //  glob_y = int(random(0, height));
    //  scale = map(y, height, 0, 1, 0.5);
    //  println("A");
    //  color c = hillMask.get(glob_x,glob_y);
    //  if (c == color(0)) {
    //    draw = false;
    //    println("B");
    //  }
    //  println(draw);

    //translate(_x, _y);
    //scale(treeHeight);
    //PGraphics curContext = _curContext;
    this.leaf = leaf;
    
    if (parent != null) {
      angle = parent.angle+angleOffset;
      this.angleOffset = angleOffset;
    } else {
      angle = angleOffset;
      this.angleOffset = -0.2+random(0.4);
    }
    this.length = length;
    float xB = x + sin(angle) * length;
    float yB = y + cos(angle) * length;
    if (length > 10) {
      if (length+random(length*10) > 30)
        branchA = new Branch(this, xB, yB, -0.1-random(0.4) + ((angle % TWO_PI) > PI ? -1/length : +1/length), length*(0.6+random(0.3)), leaf, hillMask);
      if (length+random(length*10) > 30)
        branchB = new Branch(this, xB, yB, 0.1+random(0.4) + ((angle % TWO_PI) > PI ? -1/length : +1/length), length*(0.6+random(0.3)), leaf, hillMask);
      if (branchB != null && branchA == null) {
        branchA = branchB;
        branchB = null;
      }
    }
    minX = min(xB, minX);
    maxX = max(xB, maxX);
    minY = min(yB, minY);
    maxY = max(yB, maxY);
  }


  ///////////////////////////////////////////////////////////
  // Set scale //////////////////////////////////////////////
  ///////////////////////////////////////////////////////////
  void setScale(float scale) {
    length *= scale;
    if (branchA != null) {
      branchA.setScale(scale);
      if (branchB != null)
        branchB.setScale(scale);
    }
  }


  ///////////////////////////////////////////////////////////
  // Update /////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////
  void update() {
    if (parent != null) {
      x = parent.x + sin(parent.angle) * parent.length * parent.growth;
      y = parent.y + cos(parent.angle) * parent.length * parent.growth;
      windForce = parent.windForce * (1.0+5.0/length) + blastForce;
      blastForce = (blastForce + sin(x/2+windAngle)*0.005/length) * 0.98;
      angle = parent.angle + angleOffset + windForce + blastForce;
      growth = min(growth + 0.1*parent.growth, 1);
    } else
      growth = min(growth + 0.1, 1);
    if (branchA != null) {
      branchA.update();
      if (branchB != null)
        branchB.update();
    }
  }


  ///////////////////////////////////////////////////////////
  // Render /////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////
  void display() {

    if (branchA != null) {
      float xB = x;
      float yB = y;
      if (parent != null) {
        xB += (x-parent.x) * 0.4;
        yB += (y-parent.y) * 0.4;
      } else {
        xB += sin(angle+angleOffset) * length * 0.3;
        yB += cos(angle+angleOffset) * length * 0.3;
      }
      // PROCESSING WAY (slow)
      stroke(floor(1100/length));
      strokeWeight(length/5);
      beginShape();
      vertex(x, y);
      bezierVertex(xB, yB, xB, yB, branchA.x, branchA.y);
      endShape();

      //curContext.beginPath();
      //curContext.moveTo(x, y);
      //curContext.bezierCurveTo(xB, yB, xB, yB, branchA.x, branchA.y);
      //int branchColor = floor(1100/length);
      //curContext.strokeStyle = "rgb("+branchColor+","+branchColor+","+branchColor+")";
      //curContext.lineWidth = length/5;
      //curContext.stroke();
      branchA.display();
      if (branchB != null)
        branchB.display();
    } else {
      pushMatrix();
      translate(x, y);
      rotate(-angle);
      //image(leaf.getLeafImage(), -leaf.getLeafImage().width/2, 0);
      popMatrix();
    }
  }
}
