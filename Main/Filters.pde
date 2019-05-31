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

void redscale(PImage edit) {
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    float new_color = red(current_color);
    edit.pixels[i] = color(new_color, 0, 0);
  }
  edit.updatePixels();
}

void orangescale(PImage edit) {
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    float new_color = red(current_color);
    edit.pixels[i] = color(new_color, new_color / 2, 0);
  }
  edit.updatePixels();
}

void yellowscale(PImage edit) {
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    float new_color = red(current_color);
    edit.pixels[i] = color(new_color, new_color, 0);
  }
  edit.updatePixels();
}

void greenscale(PImage edit) {
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    float new_color = red(current_color);
    edit.pixels[i] = color(0, new_color, 0);
  }
  edit.updatePixels();
}

void bluescale(PImage edit) {
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    float new_color = red(current_color);
    edit.pixels[i] = color(0, 0, new_color);
  }
  edit.updatePixels();
}

void purplescale(PImage edit) {
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    float new_color = red(current_color);
    edit.pixels[i] = color(new_color / 2, 0, new_color / 2);
  }
  edit.updatePixels();
}
