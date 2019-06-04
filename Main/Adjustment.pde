//static function that modifies the saturation of an image 
PImage saturate(PImage img, float adj){
  PImage edit = img.copy(); //creates a copy of the image 
  colorMode(HSB); //hue, saturation, brightness colorMode 
  edit.loadPixels(); //loads all the pixels 
  if (adj > 70) adj = 70; //adjusts the parameter, values obtained through testing
  if (adj < -255) adj = -255;
  for (int i = 0; i < edit.pixels.length; i++){ //loops through all the pixels 
    color current_color = edit.pixels[i]; //stores original color of pixel 
    float img_hue = hue(current_color); //original hue of pixel, doesn't change 
    float img_saturation = saturation(current_color); //original saturation of pixel, will change
    float img_brightness = brightness(current_color); //original brightness of pixel, doesn't change
    
    edit.pixels[i] = color(img_hue, img_saturation + adj, img_brightness); //sets pixel to new color 
  }
  edit.updatePixels(); //updates all the pixels 
  return edit; //returns copy 
}

//static function that modifies the brightness of an image 
PImage brighten(PImage img, float adj){
  PImage edit = img.copy();
  colorMode(HSB);
  edit.loadPixels();
  if (adj > 70) adj = 70; //adjusts the parameter, values obtained through testing 
  if (adj < -60) adj = -60;
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    float img_hue = hue(current_color);
    float img_saturation = saturation(current_color);
    float img_brightness = brightness(current_color); //only the brightness of the image will be modified 
    
    
    edit.pixels[i] = color(img_hue, img_saturation, img_brightness + adj);
  }
  edit.updatePixels();
  return edit;
}

//static function that modifies the contrast of an image 
PImage contrast(PImage img, float contrast){
  PImage edit = img.copy();
  colorMode(RGB); //red, green, blue colorMode 
  edit.loadPixels();
  if (contrast > 128) contrast = 128; //adjusts the parameter, values obtained through testing
  if (contrast < -128) contrast = -128;
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    
    //the algorithm for this was obtained from online 
    float factor = (259.0 * (contrast + 255)) / (255 * (259 - contrast)); //factor to multiply each rgb component of the color by
    float newRed = (factor * (red(current_color)   - 128.0) + 128);
    float newBlue = (factor * (blue(current_color)   - 128.0) + 128);
    float newGreen = (factor * (green(current_color)   - 128) + 128);
    
    edit.pixels[i] = color(newRed, newGreen, newBlue);
  }
  edit.updatePixels();
  return edit;
}
