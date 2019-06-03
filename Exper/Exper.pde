import java.awt.Color;

PImage orig;
PImage copy;

void setup(){
  size(1200,800);
  background(255);
  
  orig = loadImage("monkey.jpeg");
  copy = contrast(orig, -90);
}


void draw(){
  image(orig, 0, 0, 300, 300);
  image(copy, 600, 0, 300, 300);
}

PImage saturation(PImage img, int adj){
  PImage edit = img.copy();
  colorMode(HSB);
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    float img_hue = hue(current_color);
    float img_saturation = saturation(current_color);
    float img_brightness = brightness(current_color);
    
    //float new_saturation = img_saturation + (255 - img_saturation) * 10.0/10;
    if (adj > 70) adj = 70;
    if (adj < -255) adj = -255;
    edit.pixels[i] = color(img_hue, img_saturation + adj, img_brightness);
  }
  edit.updatePixels();
  return edit;
}

PImage brightness(PImage img, int adj){
  PImage edit = img.copy();
  colorMode(HSB);
  edit.loadPixels();
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    float img_hue = hue(current_color);
    float img_saturation = saturation(current_color);
    float img_brightness = brightness(current_color);
    
    //float new_saturation = img_saturation + (255 - img_saturation) * 10.0/10;
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
  for (int i = 0; i < edit.pixels.length; i++){
    color current_color = edit.pixels[i];
    
    float factor = ((259 * (contrast + 255)) / (255 * (259 - contrast)));
    println(factor);
    float newRed = (factor * (red(current_color)   - 128.0) + 128);
    //println(newRed);
    float newBlue = (factor * (blue(current_color)   - 128.0) + 128);
    //println(newBlue);
    float newGreen = (factor * (green(current_color)   - 128) + 128);
    //println(newGreen);
    
    edit.pixels[i] = color(newRed, newGreen, newBlue);
  }
  edit.updatePixels();
  return edit;
}
