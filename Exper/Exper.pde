import java.awt.Color;

PImage orig;
PImage copy;

void setup(){
  size(1200,800);
  background(255);
  
  orig = loadImage("monkey.jpeg");
  copy = saturation(orig, 255);
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
    if (adj > 80) adj = 80;
    if (adj < -255) adj = -255;
    edit.pixels[i] = color(img_hue, img_saturation + adj, img_brightness);
  }
  edit.updatePixels();
  return edit;
}

PImage brightness(PImage img, int adj){
}
