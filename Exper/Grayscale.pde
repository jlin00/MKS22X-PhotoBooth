PImage orig;

void draw() {
  orig.loadPixels();
  PImage edit = createImage(orig.width, orig.height, RGB);
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++) {
    color current_color = orig.pixels[i];
    float new_color = red(current_color);
    edit.pixels[i] = color(new_color);
  }
  
  edit.updatePixels();
  image(edit, 50, 50);
}
