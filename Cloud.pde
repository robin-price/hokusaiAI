class Cloud implements Element {

  PGraphics fade;
  PGraphics PGMask;

  PShader maskShader;
  
  Cloud() {
    fade = createGraphics(2000, 20, P2D);
    PGMask = createGraphics(2000, 20, P2D);
    maskShader = loadShader("mask.glsl");
    maskShader.set("mask", PGMask);
  }
  void display() {
    pushStyle();
    //setGradient(0, 0, 2000, 20, colors.get("white-cloud"), colors.get("white-cloud"), Y_AXIS, fade);

    ////use cloud colour, do fades?? cloud-light and cloud-dark
    ////DRAW MASK SHAPE
    
    
    //PGMask.beginDraw();
    //PGMask.background(0, 255, 0, 0);
    //PGMask.pushMatrix();
    //PGMask.beginShape();
    //PGMask.fill(255, 255, 0, 255);
    //PGMask.noStroke();
    
    //PGMask.ellipseMode(CORNER);
    //PGMask.ellipse(0, 0, random(2000), 20);
    

    //PGMask.popMatrix();
    //PGMask.endDraw();
    
    ////APPLY MASK TO FADE
    //shader(maskShader);
    ////DRAW IT
    //noStroke();
    //image(fade, random(4000), random(height/3)+height/3);
    //resetShader();
    //popStyle();
    
    pushStyle();
    fill(255, 255, 255);
    noStroke();
    ellipse(random(4000), random(height/3)+height/3, random(2000), 20);
    popStyle();
  }
}
