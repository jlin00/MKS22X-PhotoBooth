//class for editor mode

//variables 
PImage to_edit; //image to be edited 
ArrayList<Button> edit_buttons; //buttons in mode 3

//setup for editor mode to be used in main
void setup_editor(){
  //initializing variables
  edit_buttons = new ArrayList<Button>();
  
  Button go_to_lib = new Button(675, 12.5, 75, 25, true, "redirectL");
  edit_buttons.add(go_to_lib);
}

//draw for editor mode to be used in main 
void draw_editor(){
  background(245);
  
  //heading
  heading_settings();
  text("Photo Editor",384,32);
  
  image(to_edit, 153.5, 115, 461, 346);
  
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
