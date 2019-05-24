import processing.video.*;

Capture cam;


void setup() {
  size(765,650); //default size 

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
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
  scale(1.2);
  translate(126,0);
  image(cam.get(),-width,0);
  popMatrix();
}



String[] filenames;
PImage[] images;

void addFiles(){
  String path = sketchPath("Images");
  filenames = listFileNames(path);
  println(path);
}

/*
void setup(){
  size(640, 480);
  addFiles();
  images = new PImage[filenames.length]; //make Arraylist
  for (int i = 0; i < filenames.length; i++){
    images[i] = loadImage("Images/"+filenames[i]);
  }
}

void draw(){
  for (int i = 0; i < images.length; i++){
    PImage temp = images[i];
    float percent = 100.0 / temp.width;
    temp.resize((int)(percent * temp.width), (int)(percent * temp.height));
    image(images[i], i * 120, 0); 
  }
}
*/