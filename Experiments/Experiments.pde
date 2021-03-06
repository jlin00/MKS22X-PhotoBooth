PImage orig;
float multiplier = 1.0;
/*
float[][] kernel = { {0, -1, 0},
                     {-1, 5, -1},
                     {0, -1, 0}};
                     */

                     /*
float[][] kernel =  { {0, 0, 0},
                     {0, 1, 0},
                     {0, 0, 0}};
                     */
                     

void setup(){
  size(1200,800);
  background(255);
  
  orig = loadImage("twitter.jpeg");
  
}


void draw(){
  orig.loadPixels();
  PImage edit = createImage(orig.width, orig.height, RGB);
  edit.loadPixels();
  
  for (int x = 0; x < orig.width; x++){
    for (int y = 0; y < orig.height; y++){
      float sum_r = 0;
      float sum_g = 0;
      float sum_b = 0;
      for (int kx = -1; kx <= 1; kx++){
        for (int ky = -1; ky <= 1; ky++){
          int pos = (y + ky) * orig.width + (x + kx);
          color c;
          try{
            c = orig.pixels[pos];
          }
          catch (ArrayIndexOutOfBoundsException e){
            c = color(0);
            println("EXCEPTION");
          }
          
          float kernelNum = kernel[kx+1][ky+1];
          
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
  image(edit, 50, 50);
  noLoop();
}
