class Mountain implements Element {

  float mWidth;
  float mHeight;
  float y;
  float x;

  PImage img;
  PImage imgMask;

  PGraphics fade;
  PGraphics PGMask;

  PShader maskShader;

  Mountain(int mWidth, int mHeight, int x, int y) {
    fade = createGraphics(width, height, P2D);
    PGMask = createGraphics(width, height, P2D);
    maskShader = loadShader("mask.glsl");
    maskShader.set("mask", PGMask);

    this.mWidth = mWidth;
    this.mHeight = mHeight;
    this.x = x;
    this.y = y;
  }

  void display() {
    //mountain background colour fade
    //TODO change to mountain top and mountain bottom
    setGradient(0, 0, width, height, colors.get("white-snow"), colors.get("bottom-mountain"), Y_AXIS, fade);
    //setGradient(0, 0, width, height, colors.get("white-snow"), color(255,0,0), Y_AXIS, fade);
    //fill(155, 106, 89, 127);
    fade.background(255);

    for (int i = 0; i < 100; i++) {
      int x = int(random(0, width));
      int w = int(random(50, 150));
      int h = int(random(300, 500));
      int x1 = x - w/2;
      int y1 = 0;
      int x2 = x + w/2;
      int y2 = 0;
      int x3 = x;
      int y3 = h;
      fade.beginDraw();
      fade.fill(colors.get("white-snow"));
      fade.noStroke();
      fade.triangle(x1, y1, x2, y2, x3, y3);
      fade.endDraw();
    }
    //DRAW MASK SHAPE
    
    
    PGMask.beginDraw();
    PGMask.background(0);
    PGMask.pushMatrix();
    PGMask.beginShape();
    PGMask.fill(255, 255, 0, 255);
    //float x1 = x - mWidth/2;
    //float y1 = y;
    //float x2 = x + mWidth/2;
    //float y2 = y;
    //float x3 = x;
    //float y3 = y - mHeight;
    //PGMask.triangle(x1, y1, x2, y2, x3, y3);
    
    PGMask.stroke (255, 0, 0);
    PGMask.strokeWeight (2);
    PGMask.translate(0, -100);
    PGMask.scale(2.7,3.5);
    
    PGMask.vertex(1.0, 309.0, 794.0, 309.0);
    PGMask.vertex(3.0, 309.0, 108.0, 270.0);
    PGMask.vertex(108.0, 271.0, 152.0, 249.0);
    PGMask.vertex(152.0, 250.0, 205.0, 222.0);
    PGMask.vertex(205.0, 222.0, 328.0, 113.0);
    PGMask.vertex(328.0, 115.0, 337.0, 115.0);
    PGMask.vertex(337.0, 116.0, 351.0, 110.0);
    PGMask.vertex(351.0, 110.0, 359.0, 115.0);
    PGMask.vertex(360.0, 115.0, 365.0, 111.0);
    PGMask.vertex(365.0, 111.0, 375.0, 111.0);
    PGMask.vertex(374.0, 111.0, 426.0, 163.0);
    PGMask.vertex(426.0, 163.0, 438.0, 166.0);
    PGMask.vertex(438.0, 165.0, 481.0, 203.0);
    PGMask.vertex(481.0, 204.0, 548.0, 236.0);
    PGMask.vertex(548.0, 235.0, 601.0, 260.0);
    PGMask.vertex(601.0, 260.0, 618.0, 264.0);
    PGMask.vertex(618.0, 263.0, 794.0, 309.0);
    PGMask.endShape(CLOSE);
    PGMask.popMatrix();
    PGMask.endDraw();
    
    //APPLY MASK TO FADE
    shader(maskShader);
    //DRAW IT
    image(fade, 0, 0, width, height);
    resetShader();

    //    //bottom of mountain colour
    //    beginShape();
    //    fill(155, 106, 89, 127);
    //    vertex(0, 1025);
    //    vertex(560, 410 );
    //    vertex(920, 410 );
    //    vertex(1475, 1024 ); 
    //    noStroke ();
    //    strokeWeight (2);
    //    noLoop();
    //    filter(BLUR, 1);
    //    endShape();
    //
    //    //mountain top
    //    beginShape();
    //    fill(255, 255, 255, 127);
    //    triangle(615, 350, 740, 210, 865, 350 ); 
    //    stroke (0, 0, 0);
    //    strokeWeight (2);
    //    noLoop();
    //    filter(BLUR, 1);
    //    endShape();
  }
}
