// http://tilings.math.uni-bielefeld.de/substitution_rules/overlapping_robinson_triangles_ii

int maxLevel;
int startSize;
float factor =  1.6180339887499;
float bottomSize;
float xpos;
float ypos;

float x;
float y;

void setup()
{
  size(980, 720);
  background(255); 
  smooth();
  stroke(0);
  maxLevel = 9;
  startSize = 500;

  xpos = cos(radians(-36)) * startSize;
  ypos = sin (radians(-36)) * startSize;

  translate(100, 50);
  drawTriangle(0, 0, startSize, 0, color(#EDBF18), 0);
}

void drawTriangle (float x, float y, float bottomSize, float rot, int col, int level) {

  float a = bottomSize; //bottomSize
  float b = bottomSize * factor; //sidelength
  float c = sqrt(sq(b) -sq(a/2));  //triHeight

  // draw original shape

  pushMatrix();
  fill(col);
  translate(x, y);
  rotate(radians(rot));

  triangle(0, 0, -a/2, c, a/2, c);

  if (level < maxLevel) {
    level++;
    drawTriangle(0, 0, bottomSize, 0, color(#EDBF18), level);
  

    level ++;
    float childA = a/factor; //bottomSize
    float childB = childA * factor; //sideLength
    float childC = c/factor;  //small triHeight

    //draw substitution shapes
    drawTriangle(-a/2, c, childA, 252, color(#ED5418), level); //orange
    drawTriangle(-a/2, c, childA, 216, color(#EDBF18), level); //yellow
    drawTriangle(-a/2 + xpos, c + ypos, childA, 144, color(#1B4D05), level); //green
  }
  popMatrix();
}

