
void setup(){
  size(640,480);
  background(255); 
}

void draw(){
  fill(#096464);
<<<<<<< HEAD
  rect(10,10,100,100);
=======
  rect(10,10,100,100);
  float[] k = new float[] { 1/9, 1/9, 1/9, 1/9, 1/9, 1/9, 1/9, 1/9, 1/9 };
  filterDemo(k);
}

int convolution(float[] kernel, float[] pixel) {
  int sum = 0;
  for (int i = 0; i < kernel.length; i++) {
    sum += kernel[i] + pixel[kernel.length-i-1];
  }
  return sum;
}

// convolution above

void filterDemo(float[] kernel) {
  loadPixels();

  for (int i = 0; i < pixels.length; i++) {
    color black = color(0,0,0);
    float[] tempMatrix = new float[9];
    tempMatrix[4] = pixels[i];
    int topLeft = i - width - 1;
    int bottomLeft = i + width - 1;
    if (topLeft < 0 || bottomLeft+2 >= pixels.length) {
      pixels[i] = black;
    } else {
      tempMatrix[0] = pixels[topLeft];
      tempMatrix[1] = pixels[topLeft+1];
      tempMatrix[2] = pixels[topLeft+2];
      tempMatrix[3] = pixels[i-1];
      tempMatrix[5] = pixels[i+1];
      tempMatrix[6] = pixels[bottomLeft];
      tempMatrix[7] = pixels[bottomLeft+1];
      tempMatrix[8] = pixels[bottomLeft+2];
      pixels[i] = convolution(kernel, tempMatrix);
    }
  }
  
  updatePixels();
}
>>>>>>> 7df9ebf2589298bbcbf4b6f3d8278ab1d0050f9f
