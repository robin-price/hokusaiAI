class Hill implements Element {
  Hill() {
  }
  void display() {
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
  }
}