class Cloud implements Element {
  Cloud() {
  }
  void display() {
    beginShape();
    noStroke();
    fill(255, 255, 255);
    ellipse(random(4000), random(height/3)+height/3, random(2000), 20);
    endShape(CLOSE); 
  }
}