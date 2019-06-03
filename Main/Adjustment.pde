PImage saturate(PImage img, int adj){
  PImage edit = img.copy();
  colorMode(HSB);
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    float img_hue = hue(current_color);
    float img_saturation = saturation(current_color);
    float img_brightness = brightness(current_color);

    if (adj > 70) adj = 70;
    if (adj < -255) adj = -255;
    edit.pixels[i] = color(img_hue, img_saturation + adj, img_brightness);
  }
  edit.updatePixels();
  return edit;
}

PImage brighten(PImage img, int adj){
  PImage edit = img.copy();
  colorMode(HSB);
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    float img_hue = hue(current_color);
    float img_saturation = saturation(current_color);
    float img_brightness = brightness(current_color);
    
    if (adj > 70) adj = 70;
    if (adj < -60) adj = -60;
    edit.pixels[i] = color(img_hue, img_saturation, img_brightness + adj);
  }
  edit.updatePixels();
  return edit;
}

PImage contrast(PImage img, int contrast){
  PImage edit = img.copy();
  edit.loadPixels();
  if (contrast > 128) contrast = 128;
  if (contrast < -128) contrast = -128;
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    
    float factor = (259.0 * (contrast + 255)) / (255 * (259 - contrast)); 
    float newRed = (factor * (red(current_color)   - 128.0) + 128);
    float newBlue = (factor * (blue(current_color)   - 128.0) + 128);
    float newGreen = (factor * (green(current_color)   - 128) + 128);
    
    edit.pixels[i] = color(newRed, newGreen, newBlue);
  }
  edit.updatePixels();
  return edit;
}
