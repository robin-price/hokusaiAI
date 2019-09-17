class Leaf {
  PGraphics buffer;
  
  Leaf() {
    buffer = createGraphics(12, 18, P2D);
    buffer.beginDraw();
    buffer.background(#000000, 0);
    buffer.stroke(#5d6800);
    buffer.line(6, 0, 6, 6);
    buffer.noStroke();
    buffer.fill(#749600);
    buffer.beginShape();
    buffer.vertex(6, 6);
    buffer.bezierVertex(0, 12, 0, 12, 6, 18);
    buffer.bezierVertex(12, 12, 12, 12, 6, 6);
    buffer.endShape();
    buffer.fill(#8bb800);
    buffer.beginShape();
    buffer.vertex(6, 9);
    buffer.bezierVertex(0, 13, 0, 13, 6, 18);
    buffer.bezierVertex(12, 13, 12, 13, 6, 9);
    buffer.endShape();
    buffer.stroke(#659000);
    buffer.noFill();
    buffer.bezier(6, 9, 5, 11, 5, 12, 6, 15);
    buffer.endDraw();
  }
  PImage getLeafImage() {
    return buffer.get();
  }
}