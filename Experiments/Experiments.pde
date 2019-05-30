void setup(){
  size(640,480);
  background(255); 
}

void draw(){
  fill(#096464);
  rect(10,10,100,100);
}

int convolution(int[] kernel, int[] pixel) {
  int sum = 0;
  for (int i = 0; i < kernel.length; i++) {
    sum += kernel[i] + pixel[kernel.length-i];
  }
  pixel[4] = sum;
  return sum;
}

// convolution above