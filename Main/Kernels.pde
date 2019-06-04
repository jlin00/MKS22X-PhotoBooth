// all the kernels. all of them
//kernels obtained from the internet

float[][] sharpen = new float[][] { {-1, -1, -1},
                                    {-1, 9, -1},
                                    {-1, -1, -1} };

float[][] edgeEnhance = new float[][] { {0, 0, 0},
                                        {-1, 1, 0},
                                        {0, 0, 0} };

float[][] edgeDetect = new float[][] { {-1, -1, -1},
                                       {-1, 8, -1},
                                       {-1, -1, -1} };

float[][] emboss = new float[][] { {-2, -1, 0},
                                   {-1, 1, 1},
                                   {0, 1, 2} };

float[][] sobelEdge = new float[][] { {-1, -2, -1},
                                      {0, 0, 0},
                                      {1, 2, 1} };
                                      
 float[][] hoznLines = new float[][] { {-2, 4, -2},
                                      {-2, 4, -2},
                                      {-2, 4, -2} };  
                                      
 float[][] vertLines = new float[][] { {-2, -2, -2},
                                      {4, 4, 4},
                                      {-2, -2, -2} };

float multiplier = 1.0/49; //multiplier for blur kernel 
float[][] blur = { {1, 1, 1, 1, 1, 1, 1},
                     {1, 1, 1, 1, 1, 1, 1},
                     {1, 1, 1, 1, 1, 1, 1}, 
                     {1, 1, 1, 1, 1, 1, 1},
                     {1, 1, 1, 1, 1, 1, 1},
                     {1, 1, 1, 1, 1, 1, 1},
                     {1, 1, 1, 1, 1, 1, 1} };   

PImage convolute(PImage orig, float[][] kernel) {
  PImage edit = orig.copy(); //copies over original image
  edit.loadPixels(); //loads pixels 
  
  for (int x = 0; x < orig.width; x++){ //loops through width of image in pixels 
    for (int y = 0; y < orig.height; y++){ //loops through height of image in pixels 
      float sum_r = 0; //rgb components will be a sum of the surrounding kernels 
      float sum_g = 0;
      float sum_b = 0;
      for (int kx = -1; kx <= 1; kx++){ //accesses the pixels surrounding the original pixel 
        for (int ky = -1; ky <= 1; ky++){
          int pos = (y + ky) * orig.width + (x + kx); //position of pixel in 1D pixel array 
          color c; //original color of the pixel 
          try{
            c = orig.pixels[pos];
          }
          catch (ArrayIndexOutOfBoundsException e){ //if edge pixel, set to black 
            //println("stuff");
            c = color(0);
          }
          
          float kernelNum = kernel[kx+1][ky+1]; //maps pixel to kernel 
          
          sum_r += kernelNum * (red(c)); //adds to the sum 
          sum_g += kernelNum * (green(c));
          sum_b += kernelNum * (blue(c));
        }
      }
      edit.pixels[y * orig.width + x] = color(sum_r, sum_g, sum_b); //sets new color of pixel 
    }
  }
  edit.updatePixels(); //updates all the pixels in the image 
  return edit;
}

PImage convoluteBlur(PImage orig, float[][] kernel) {
  PImage edit = orig.copy();
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
            c = color(0);
          }
          
          float kernelNum = kernel[kx+3][ky+3]; 
          
          //since the blur kernel sums up to 49, there needs to be a multiplier to maintain the original brightness
          sum_r += multiplier * kernelNum * (red(c));
          sum_g += multiplier * kernelNum * (green(c));
          sum_b += multiplier * kernelNum * (blue(c));
        }
      }
      edit.pixels[y * orig.width + x] = color(sum_r, sum_g, sum_b);
    }
  }
  edit.updatePixels();
  return edit;
}
