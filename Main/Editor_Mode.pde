//class for editor mode

//variables 
PImage to_edit; //image to be edited
PImage copy; //copy of to_edit
ArrayList<Button> edit_buttons; //buttons in mode 3
int[] filters; 

//setup for editor mode to be used in main
void setup_editor(){
  //initializing variables
  edit_buttons = new ArrayList<Button>();
  filters = new int[2]; //first index with store color filter, second stores kernel effects 
                        //you can only apply one of each 
  
  Button go_to_lib = new Button(675, 12.5, 75, 25, true, "redirectL");
  edit_buttons.add(go_to_lib);
  Button go_to_booth = new Button(18, 12.5, 75, 25, true, "redirectB"); //redirect to editor button 
  edit_buttons.add(go_to_booth);
  Button save = new Button (18, 662, 75, 25, true, "save"); //save button 
  edit_buttons.add(0,save);
  Button cancel = new Button(675, 662, 75, 25, true, "cancel"); // cancel button
  edit_buttons.add(1,cancel);
}

//draw for editor mode to be used in main 
void draw_editor(){
  background(245);
  
  //heading
  heading_settings();
  text("Photo Editor",384,32);
  
  //footer
  footer_settings();
  
  image(to_edit, 153.5, 115, 461, 346);
  
  for (Button b : edit_buttons) {
    b.display();
  }
  
  textSize(14);
  fill(0);
  text("LIBRARY", 712, 30);
  text("BOOTH", 56, 30);
  textSize(16);
  text("SAVE", 55, 680);
  text("CANCEL", 710, 680);
  
  editBar();
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
        if (b.type.equals("redirectB")){
          text_clicked();
          text("BOOTH", 56, 30);
          mode = 2;
        }
        if (b.type.equals("save")){
          copy.save("Images/IMG" + (picNum + filenames.length) + ".jpg");
          loadLibrary(); 
          mode = 1;
        }
        if (b.type.equals("cancel")){
          loadLibrary(); 
          mode = 1; 
        }
      }
    }
  }
}

void editBar(){
  for (int i = 0; i < 8; i++){
    copy = to_edit.copy();
    if (i == 0) grayscale(copy);
    if (i == 1) redscale(copy);
    if (i == 2) orangescale(copy);
    if (i == 3) yellowscale(copy);
    if (i == 4) greenscale(copy);
    if (i == 5) bluescale(copy);
    if (i == 6) purplescale(copy);
    if (i == 7) invert(copy);
    image(copy, i * 120, 500, 100, 75);
  }
}
