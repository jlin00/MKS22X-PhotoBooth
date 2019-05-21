import processing.video.*;

Capture cam;
int mode;
//1- library, 2- booth, 3- editor

void setup() {
  size(640,550);
  mode = 1;
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  cam = new Capture(this, 640, 480);
  cam.start();
}

void draw() {
  if (mode == 1){
    
  }
  if (mode == 2){
      if (cam.available() == true) {
    cam.read();
  }
  pushMatrix();
  scale(-1,1);
  image(cam.get(),-width,0);
  popMatrix();
  }
  if (mode == 3){
  }
}
