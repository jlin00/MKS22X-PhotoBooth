import processing.video.*;

Capture cam;
int mode;
//1- library, 2- booth, 3- editor

void setup() {
  size(640,550);
  mode = 2;
  String[] cameras = Capture.list();
  loadImage("button.img");
  
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
    
    Button capture = new Button(320.0, 500.0, "button.img", "pic");
    capture.action();
  }
  if (mode == 3){
  }
  
}
