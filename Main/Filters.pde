//class for storing different filters for booth mode 

void grayscale(PImage edit) { //converts an image to grayscale 
  edit.loadPixels(); //load pixels of image 
  for (int i = 0; i < edit.pixels.length; i++) { //loops through all the pixels of the image 
    color current_color = edit.pixels[i]; //stores the current color of the pixel 
    float new_color = brightness(current_color); //gets the brightness of the pixel 
    edit.pixels[i] = color(new_color); //changes color of the pixel 
  }
  edit.updatePixels(); //updates all the pixels in teh image 
}

void redscale(PImage edit) { //converts an image to redscale 
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    float new_color = brightness(current_color);
    edit.pixels[i] = color(new_color, 0, 0);
  }
  edit.updatePixels();
}

void orangescale(PImage edit) { //converts an image to orangescale 
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    float new_color = brightness(current_color);
    edit.pixels[i] = color(new_color, new_color / 2, 0);
  }
  edit.updatePixels();
}

void yellowscale(PImage edit) { //converts an image to yellowscale 
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    float new_color = brightness(current_color);
    edit.pixels[i] = color(new_color, new_color, 0);
  }
  edit.updatePixels();
}

void greenscale(PImage edit) { //converts an image to greenscale 
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    float new_color = brightness(current_color);
    edit.pixels[i] = color(0, new_color, 0);
  }
  edit.updatePixels();
}

void bluescale(PImage edit) { //converts an image to bluescale 
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    float new_color = brightness(current_color);
    edit.pixels[i] = color(0, 0, new_color);
  }
  edit.updatePixels();
}

void purplescale(PImage edit) { //converts an image to purplescale 
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    float new_color = brightness(current_color);
    edit.pixels[i] = color(new_color / 2.0, 0, new_color / 2.0);
  }
  edit.updatePixels();
}

void invert(PImage edit) { //inverts an imge 
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    float new_color_red = 255 - red(current_color); //color is inverted by subtracting it from 255 
    float new_color_green = 255 - green(current_color);
    float new_color_blue = 255 - blue(current_color);
    edit.pixels[i] = color(new_color_red, new_color_green, new_color_blue);
  }
  edit.updatePixels();
}
