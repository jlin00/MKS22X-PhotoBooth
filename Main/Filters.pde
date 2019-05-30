//class for storing different filters for booth mode 

void grayscale(PImage edit) {
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++) {
    color current = edit.pixels[i];
    float red = red(current);
    float green = green(current);
    float blue = blue(current);
    float avg = (red+green+blue)/3;
    color newC = color(avg);
    edit.pixels[i] = newC;
  }
  edit.updatePixels();
}
