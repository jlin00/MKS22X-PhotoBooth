PImage orig;
float multiplier = 1.0/49;
float[][] kernel = { {1, 1, 1, 1, 1, 1, 1},
                     {1, 1, 1, 1, 1, 1, 1},
                     {1, 1, 1, 1, 1, 1, 1}, 
                     {1, 1, 1, 1, 1, 1, 1},
                     {1, 1, 1, 1, 1, 1, 1},
                     {1, 1, 1, 1, 1, 1, 1},
                     {1, 1, 1, 1, 1, 1, 1} };


void setup(){
  size(1200,800);
  background(255);
  
  orig = loadImage("monkey.jpeg");
  //edited = loadImage("monkey.jpeg");
}


void draw(){
  orig = convolute();
  image(orig, 50, 50);
}

PImage convolute() {
  orig.loadPixels();
  PImage edit = createImage(orig.width, orig.height, RGB);
  edit.loadPixels();
  
  for (int x = 0; x < orig.width - 3; x++){
    for (int y = 0; y < orig.height - 3; y++){
      float sum_r = 0;
      float sum_g = 0;
      float sum_b = 0;
      for (int kx = -3; kx <= 3; kx++){
        for (int ky = -3; ky <= 3; ky++){
          int pos = (y + ky) * orig.width + (x + kx);
          color c = color(0,0,0);
          if (pos < 0) {
            c = color(0,0,0);
          }
          else {
            c = orig.pixels[pos];
          }
          
          float kernelNum = kernel[kx+3][ky+3];
          
          sum_r += multiplier * kernelNum * (red(c));
          sum_g += multiplier * kernelNum * (green(c));
          sum_b += multiplier * kernelNum * (blue(c));
          
          //edit.pixels[y * orig.width + x] = color(sum_r, sum_g, sum_b);
        }
      }
      edit.pixels[y * orig.width + x] = color(sum_r, sum_g, sum_b);
    }
  }
  edit.updatePixels();
  return edit;
}
