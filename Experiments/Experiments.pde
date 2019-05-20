/*
import processing.video.*;

Capture cam;


void setup() {
  size(640, 480); //default size 

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  cam = new Capture(this, 640, 480);
  cam.start();          
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  pushMatrix();
  scale(-1,1);
  image(cam.get(),-width,0);
  popMatrix();
}
*/