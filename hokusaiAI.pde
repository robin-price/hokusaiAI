int Y_AXIS = 1;
int X_AXIS = 2;

int mWidthMin = 600;
int mWidthMax = 1400;
int mHeightMin = 500;
int mHeightMax = 1000;

int mWidth;
int mHeight;
int mX;
int mY;

//import libraries
import java.util.Map;

//global variables
//hashmap for storing named colors
HashMap<String, Integer> colors = new HashMap<String, Integer>();
//string array for storing data from colors text file 
String[] lines;

ArrayList<Element> elements; 
PGraphics hillMask;
boolean reRoll = false;
void setup() {
  //set window size
  size(1475, 900, P2D);
  hillMask = createGraphics(width, height, P2D);
  smooth(8);

  roll();

  //DRAW ONLY ONCE
  noLoop();
}

void chooseColourScheme(int j) {
  //LOAD COLOURS FROM TEXT FILE
  //read in text file
  lines = loadStrings("colors" + Integer.toString(j) + ".txt");
  //loop through textfile and read named colors into hashmap
  for (int i = 0; i < lines.length; i++) {
    String[] pieces = split(lines[i], ' ');
    String name = pieces[0];
    int r = int(pieces[1]);
    int g = int(pieces[2]);
    int b = int(pieces[3]);
    color c = color(r, g, b);
    colors.put(name, c);
    println("loaded " + name + " r = " + r + ", g = " + g + ", b = " + b);
  }
}

void roll() {
  int j = int(random(1, 6));
  chooseColourScheme(j);

  elements = new ArrayList<Element>();

  Sky sky = new Sky();
  elements.add(sky);

  //BACKGROUND CLOUDS
  for (int i = 0; i < 6; i++) {
    Cloud cloud = new Cloud();
    elements.add(cloud);
  }

  //MOUNTAIN 
  mWidth = int(random(mWidthMin, mWidthMax));
  mHeight = int(random(mHeightMin, mHeightMax));
  int mXMin = mWidth/2;
  int mXMax = width - mWidth/2;
  mX = int (random(mXMin, mXMax));
  mY = height;

  Mountain mountain = new Mountain(mWidth, mHeight, mX, mY);
  elements.add(mountain);

  //FOREGROUND CLOUDS
  for (int i = 0; i < 6; i++) {
    Cloud cloud = new Cloud();
    elements.add(cloud);
  }

  //GROUND

  Hill hill = new Hill(hillMask);
  elements.add(hill);

  //SHRUBS
  for (int i = 0; i < 600; i++) {
    Shrub shrub = new Shrub(hillMask);
    elements.add(shrub);
  }

  //PEOPLE
  for (int i=0; i < 40; i++) {
    Person person = new Person(hillMask);
    elements.add(person);
  }

  //tree
  Leaf leaf = new Leaf();
  for (int i=0; i < 2; i++) {
    
      Branch tree = new Branch(null, width/2, height/2, PI, 110, leaf, hillMask);
      elements.add(tree);

  }
}

void draw() {
  if (reRoll) {
    roll();
  }

  background(0, 0);
  for (Element e : elements) {
    e.display();
  }
}

void keyPressed() {
  if (key == 'n') {
    reRoll = true;
    //roll();
  }
  if (key == ' ') {
    redraw();
  }
  if (key == 's') {
    saveFrame("output/frames####.png");
  }
}

void setGradient(int x, int y, float w, float h, color b1, color b2, int axis, PGraphics pg) {
  pg.beginDraw();
  pg.noFill();
  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(b1, b2, inter);
      pg.stroke(c);
      pg.line(x, i, x+w, i);
    }
  }
  pg.endDraw();
}
