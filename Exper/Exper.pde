ScrollBar bar1; 

void setup() {
  size(1000, 800);
  noStroke();
  
  bar1 = new ScrollBar(0, 50, 100, 16);
}

void draw() {
  background(255);
  
  // Get the position of the img1 scrollbar
  // and convert to a value to display the img1 image 
  
  bar1.update();
  bar1.display();
 
  stroke(0);
}
