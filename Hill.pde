class Hill implements Element {
  PGraphics hillMask;
  Hill(PGraphics hillMask) {
    this.hillMask = hillMask;
  }
  void display() {
    /*
    beginShape();
     fill(147, 187, 195);
     vertex(-400, 1024);
     quadraticVertex(random (1875), random (300), 1875, 1024);
     vertex(1124, 1575);
     vertex(0, 1575);
     stroke (166, 192, 181);
     strokeWeight (4);
     filter(BLUR, 1);
     endShape(CLOSE);
     */
    pushStyle();
    strokeWeight(2);
    smooth(2);
    //use hill
    fill(147, 187, 195);
    beginShape();
    vertex(0.0, 934.0, 156.0, 931.0);
    vertex(156.0, 931.0, 421.0, 909.0);
    vertex(421.0, 909.0, 708.0, 855.0);
    vertex(705.0, 855.0, 915.0, 784.0);
    vertex(914.0, 784.0, 1118.0, 641.0);
    vertex(1118.0, 641.0, 1259.0, 520.0);
    vertex(1259.0, 522.0, 1338.0, 469.0);
    vertex(1409.0, 437.0, 1449.0, 429.0);
    vertex(1447.0, 429.0, 1474.0, 428.0);
    endShape(CLOSE);
    popStyle();
    //and again as a mask for other things
    hillMask.beginDraw();
    hillMask.beginShape();
    hillMask.background(255);
    hillMask.fill(0);
    hillMask.vertex(0.0, 934.0, 156.0, 931.0);
    hillMask.vertex(156.0, 931.0, 421.0, 909.0);
    hillMask.vertex(421.0, 909.0, 708.0, 855.0);
    hillMask.vertex(705.0, 855.0, 915.0, 784.0);
    hillMask.vertex(914.0, 784.0, 1118.0, 641.0);
    hillMask.vertex(1118.0, 641.0, 1259.0, 520.0);
    hillMask.vertex(1259.0, 522.0, 1338.0, 469.0);
    hillMask.vertex(1409.0, 437.0, 1449.0, 429.0);
    hillMask.vertex(1447.0, 429.0, 1474.0, 428.0);
    hillMask.endShape(CLOSE);
    hillMask.endDraw();
  }
}
