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
}

//draw for editor mode to be used in main 
void draw_editor(){
  background(245);
  
  //heading
  heading_settings();
  text("Photo Editor",384,32);
  
  to_edit.resize(picWidth*2, picHeight*2);
  image(to_edit, 290 - (picWidth / 2.0), 300 - (picHeight / 2.0));
}

//mouseClicked method for editor mode to be used in main 
void mouseClicked_editor(){
}
