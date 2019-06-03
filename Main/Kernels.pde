// all the kernels. all of them

float[][] sharpen = new float[][] { {0, -1, 0},
                                    {-1, 5, -1},
                                    {0, -1, 0} };

float[][] edgeEnhance = new float[][] { {0, 0, 0},
                                        {-1, 1, 0},
                                        {0, 0, 0} };

float[][] edgeDetect = new float[][] { {0, 1, 0},
                                       {1, -4, 1},
                                       {0, 1, 0} };

float[][] emboss = new float[][] { {-2, -1, 0},
                                   {-1, 1, 1},
                                   {0, 1, 2} };

float[][] sobelEdge = new float[][] { {-1, -2, -1},
                                      {0, 0, 0},
                                      {1, 2, 1} };
                                      
 float[][] hoznLines = new float[][] { {-1, 2, -1},
                                      {-1, 2, -1},
                                      {-1, 2, -1} };  
                                      
 float[][] vertLines = new float[][] { {-1, -1, -1},
                                      {2, 2, 2},
                                      {-1, -1, -1} };                                        

float multiplier = 1.0/49;
float[][] blur = { {1, 1, 1, 1, 1, 1, 1},
                     {1, 1, 1, 1, 1, 1, 1},
                     {1, 1, 1, 1, 1, 1, 1}, 
                     {1, 1, 1, 1, 1, 1, 1},
                     {1, 1, 1, 1, 1, 1, 1},
                     {1, 1, 1, 1, 1, 1, 1},
                     {1, 1, 1, 1, 1, 1, 1} };

PImage convolute(PImage orig, float[][] kernel) {
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
            //println("stuff");
            c = color(0);
          }
          
          float kernelNum = kernel[kx+1][ky+1];
          
          sum_r += kernelNum * (red(c));
          sum_g += kernelNum * (green(c));
          sum_b += kernelNum * (blue(c));
          
          //edit.pixels[y * orig.width + x] = color(sum_r, sum_g, sum_b);
        }
      }
      edit.pixels[y * orig.width + x] = color(sum_r, sum_g, sum_b);
    }
  }
  edit.updatePixels();
  return edit;
}

PImage convoluteBlur(PImage orig, float[][] kernel) {
  orig.loadPixels();
  PImage edit = createImage(orig.width, orig.height, RGB);
  edit.loadPixels();
  
  for (int x = 0; x < orig.width; x++){
    for (int y = 0; y < orig.height; y++){
      float sum_r = 0;
      float sum_g = 0;
      float sum_b = 0;
      for (int kx = -3; kx <= 3; kx++){
        for (int ky = -3; ky <= 3; ky++){
          int pos = (y + ky) * orig.width + (x + kx);
          color c;
          try{
            c = orig.pixels[pos];
          }
          catch (ArrayIndexOutOfBoundsException e){
            //println("stuff");
            c = color(0);
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
