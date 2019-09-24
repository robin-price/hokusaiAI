class Sky implements Element {
  
  PGraphics skyGraphics;
  
  Sky() {
    skyGraphics = createGraphics(width,height, P2D);
  }
  
  void display() {
  setGradient(0, 0, 1475, 50, colors.get("b0"), colors.get("b1"), Y_AXIS, skyGraphics);
  setGradient(0, 50, 1475, 200, colors.get("b1"), colors.get("b2"), Y_AXIS, skyGraphics);
  setGradient(0, 250, 1475, 300, colors.get("b2"), colors.get("b3"), Y_AXIS, skyGraphics);
  setGradient(0, 550, 1475, 300, colors.get("b3"), colors.get("b3"), Y_AXIS, skyGraphics);
  setGradient(0, 850, 1475, 150,colors.get("b3"), colors.get("b5"), Y_AXIS, skyGraphics);
  setGradient(0, 1000, 1475, 25, colors.get("b0"), colors.get("b1"), Y_AXIS, skyGraphics);
  image(skyGraphics, 0, 0);
  }
  
  //TODO rewrite so varied start stop points for fades and varied colours
}
