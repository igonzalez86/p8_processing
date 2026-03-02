PFont font;

void setup() {
  size(1600, 1200);
  font = createFont("OTBrut-RegularMono.ttf", 400);
  background(0);
  textFont(font);
  textAlign(CENTER, CENTER);
  noStroke();
  noLoop();
}

void draw() {
  background(0);

  float centerX = width / 2.0;
  float centerY = height / 2.0;
  int numReps = 26;
  float maxRadius = 700;

  for (int i = 1; i <= numReps; i++) {
    float radiusNorm = i / (float)numReps;   
    float radius = radiusNorm * maxRadius;
    float angle1 = i * 0.25;
    float x1 = centerX + cos(angle1) * radius;
    float y1 = centerY + sin(angle1) * radius;
    setRadialColor(centerX, centerY, x1, y1, radiusNorm);
    pushMatrix();
    translate(x1, y1);
    rotate(angle1 * 0.5);
    text("Brut", 0, 0);
    popMatrix();

    float angle2 = i * 0.25 + PI;
    float x2 = centerX + cos(angle2) * radius;
    float y2 = centerY + sin(angle2) * radius;
    setRadialColor(centerX, centerY, x2, y2, radiusNorm);
    pushMatrix();
    translate(x2, y2);
    rotate(angle2 * 0.5);
    text("Brut", 0, 0);
    popMatrix();
  }

  fill(255);
  text("Brut", centerX, centerY);

  save("brut_output_1600x1200_black.png");
}


void setRadialColor(float cx, float cy, float x, float y, float radiusNorm) {
  float dx = x - cx;
  float dy = y - cy;
  float angle = atan2(dy, dx);
  float aNorm = (angle + PI) / (TWO_PI);

  colorMode(HSB, 360, 100, 100, 255);
  float hue = aNorm * 360.0;
  float sat = 100;
  float bri = 100;

  float alpha = 255 * (1.0 - radiusNorm);

  fill(hue, sat, bri, alpha);
  colorMode(RGB, 255, 255, 255, 255); 
}
