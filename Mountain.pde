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
  
  Mountain(int _mWidth, int _mHeight, int _x, int _y) {
    fade = createGraphics(width,height, P2D);
    PGMask = createGraphics(width,height, P2D);
    maskShader = loadShader("mask.glsl");
    maskShader.set("mask", PGMask);
    
    mWidth = _mWidth;
    mHeight = _mHeight;
    x = _x;
    y = _y;
  }
  
  void display() {
    //mountain background colour fade
    setGradient(0, 0, width, height, colors.get("white-snow"), colors.get("bottom-mountain"), Y_AXIS, fade);
    //fill(155, 106, 89, 127);
    
    
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
      fade.triangle(x1,y1,x2,y2,x3,y3);
      fade.endDraw();
    }
    //DRAW MASK SHAPE
    PGMask.beginDraw();
    PGMask.beginShape();
    PGMask.fill(255, 0, 0, 255);
    float x1 = x - mWidth/2;
    float y1 = y;
    float x2 = x + mWidth/2;
    float y2 = y;
    float x3 = x;
    float y3 = y - mHeight;
    PGMask.triangle(x1, y1, x2, y2, x3, y3);
    PGMask.stroke (255, 0, 0);
    PGMask.strokeWeight (2);
    
    PGMask.endShape();
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
