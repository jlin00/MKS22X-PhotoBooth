import processing.video.*;

Capture cam;
int mode;
String[] filenames;
ArrayList<PImage> libimages;
ArrayList<Button> booth_buttons;

//1- library, 2- booth, 3- editor
void addFiles(String dir){
  String path = sketchPath(dir);
  filenames = listFileNames(path);
  //printArray(filenames);
  //println(path);
}

void setup() {
  size(768,650);
  background(0);
  mode = 2;
  
  booth_buttons = new ArrayList<Button>();
  
  //setup for loading images from directory for library
  addFiles("Images"); //load images from Images directory 
  libimages = new ArrayList<PImage>(); //initialize arraylist
  for (int i = 0; i < filenames.length; i++){
    if (!filenames[i].substring(0,1).equals(".")){
      PImage temp = loadImage("Images/" + filenames[i]); //load each image based on filename
      libimages.add(temp);
    }
  }
  
  //setup for loading cameras 
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  cam = new Capture(this, 640, 480);
 
  Button play = new Button(384, 612, 50, false, "take");
  booth_buttons.add(play);
  
  
}

void mousePressed(){
  for (Button b : booth_buttons) {
    if (b.shape) {
      if (mouseX >= b.x && mouseX <= b.x+b.w && 
              mouseY >= b.y && mouseY <= b.y+b.h){
         //code for rectangular button actions
      }
    } else {
      float disX = b.x - mouseX;
      float disY = b.y - mouseY;
      if (sqrt(sq(disX) + sq(disY)) < b.d/2) {
        if (b.type.equals("take")){
          b.contract();
          PImage slice = get(0,0,768,576);
          slice.save("Images/IMG###.jpg");
          b.uncontract();
        }
      }
    }
  }
}

void draw() {
  
  if (mode == 1){
    background(0);
    for (int i = 0; i < libimages.size(); i++){
      println(filenames[i]);
      libimages.get(i).resize(184, 138);
      image(libimages.get(i), i % 4 * 192 + 3, i / 5 * 146 + 50);
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
     translate(128,0);
     image(cam.get(),-width,0);
     popMatrix();
     
   for (Button b : booth_buttons){
     b.display();
   }
  }
  if (mode == 3){
    
  }

}
