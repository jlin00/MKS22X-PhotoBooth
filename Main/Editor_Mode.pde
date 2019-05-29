//class for editor mode

//variables 
PImage to_edit; //image to be edited 
int picWidth;
int picHeight;
ArrayList<Button> edit_buttons; //buttons in mode 3

//setup for editor mode to be used in main
void setup_editor(){
  //initializing variables
  edit_buttons = new ArrayList<Button>();
  
  Button goToLib = new Button(675, 12.5, 75, 25, true, "redirectL");
  edit_buttons.add(goToLib);
}

//draw for editor mode to be used in main 
void draw_editor(){
  background(245);
  
  //heading
  heading_settings();
  text("Photo Editor",384,32);
  
  to_edit.resize(picWidth*2, picHeight*2);
  image(to_edit, 290 - (picWidth / 2.0), 300 - (picHeight / 2.0));
  
  for (Button b : edit_buttons) {
    b.display();
  }
  
  textSize(14);
  fill(0);
  text("LIBRARY", 712, 30);
}

//mouseClicked method for editor mode to be used in main 
void mouseClicked_editor(){
  for (Button b: edit_buttons){
    if (b.shape) { //if rectangular button
      if (mouseX >= b.x && mouseX <= b.x+b.w && mouseY >= b.y && mouseY <= b.y+b.h) {
        if (b.type.equals("redirectL")){
          text_clicked();
          text("LIBRARY", 714, 30);
          mode = 1;
        } 
      }
    }
  }
}
