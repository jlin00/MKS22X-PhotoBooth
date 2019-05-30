PImage orig;

void draw() {
  orig.loadPixels();
  PImage edit = createImage(orig.width, orig.height, RGB);
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++) {
    color current = orig.pixels[i];
    float red = red(current);
    float green = green(current);
    float blue = blue(current);
    float avg = (red+green+blue)/3;
    color newC = color(avg);
    edit.pixels[i] = newC;
  }
  
  edit.updatePixels();
  image(edit, 50, 50);
}
