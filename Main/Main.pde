import processing.video.*;

Capture cam;
int mode;
String[] filenames;
ArrayList<PImage> libimages;
ArrayList<Button> buttons;

//1- library, 2- booth, 3- editor
void addFiles(String dir){
  String path = sketchPath(dir);
  filenames = listFileNames(path);
  //printArray(filenames);
  //println(path);
}

void setup() {
  size(768,650);
  background(255);
  mode = 2;
  
  buttons = new ArrayList<Button>();
  
  //setup for loading images from directory for library
  addFiles("Images"); //load images from Images directory 
  libimages = new ArrayList<PImage>(); //initialize arraylist
  for (int i = 0; i < filenames.length; i++){
    PImage temp = loadImage("Images/" + filenames[i]); //load each image based on filename
    libimages.add(temp);
  }
  
  //setup for loading cameras 
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  cam = new Capture(this, 640, 480);
 
  Button play = new Button(384, 612, 50, false, "test");
  buttons.add(play);
}

void mouseClicked(){
  for (Button b : buttons) {
    if (b.shape) {
      if (mouseX >= b.x && mouseX <= b.x+b.w && 
              mouseY >= b.y && mouseY <= b.y+b.h){
        if (b.type.equals("test")){
          fill(0);
        }
      }
    } else {
      float disX = b.x - mouseX;
      float disY = b.y - mouseY;
      if (sqrt(sq(disX) + sq(disY)) < b.d/2) {
        if (b.type.equals("test")){
          saveFrame("Images/IMG##.jpg");
        }
      }
    }
  }
}

void draw() {
  
  if (mode == 1){
    background(153);
    for (int i = 0; i < libimages.size(); i++){
      libimages.get(i).resize(100, 80);
      image(libimages.get(i), i * 120, 0);
    }
  }
  if (mode == 2){
     cam.start();
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
  if (mode == 3){
    
  }
  for (Button b : buttons) {
    b.display();
  }
}