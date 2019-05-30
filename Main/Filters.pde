//class for storing different filters for booth mode 

void grayscale(PImage edit) {
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++) {
    color current_color = edit.pixels[i];
    float new_color = red(current_color);
    edit.pixels[i] = color(new_color);
  }
  edit.updatePixels();
}
