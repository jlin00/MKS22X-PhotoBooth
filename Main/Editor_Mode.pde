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
  Button go_to_booth = new Button(18, 12.5, 75, 25, true, "redirectB"); //redirect to editor button 
  edit_buttons.add(go_to_booth);
  Button save = new Button (18, 662, 75, 25, true, "save"); //save button 
  edit_buttons.add(0,save);
  Button cancel = new Button(675, 662, 75, 25, true, "cancel"); // cancel button
  edit_buttons.add(1,cancel);
  
  //color filters
  Button grayScale = new Button(0, 600, 100, 25, true, "grayFilter");
  edit_buttons.add(grayScale);
  Button redScale = new Button(100, 600, 100, 25, true, "redFilter");
  edit_buttons.add(redScale);
  Button orangeScale = new Button(200, 600, 100, 25, true, "orangeFilter");
  edit_buttons.add(orangeScale);
  Button yellowScale = new Button(300, 600, 100, 25, true, "yellowFilter");
  edit_buttons.add(yellowScale);
  Button greenScale = new Button(400, 600, 100, 25, true, "greenFilter");
  edit_buttons.add(greenScale);
  Button blueScale = new Button(500, 600, 100, 25, true, "blueFilter");
  edit_buttons.add(blueScale);
  Button purpleScale = new Button(600, 600, 100, 25, true, "purpleFilter");
  edit_buttons.add(purpleScale);
  Button invert = new Button(700, 600, 100, 25, true, "invertFilter");
  edit_buttons.add(invert);

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
  text("GRAYSCALE", 65, 620);
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
          to_edit.save("Images/IMG" + (picNum + filenames.length) + ".jpg");
          loadLibrary(); 
          mode = 1;
        }
        if (b.type.equals("cancel")){
          loadLibrary(); 
          mode = 1; 
        }
        if (b.type.equals("grayFilter")) {
          grayscale(to_edit);
        }
        if (b.type.equals("grayFilter")) {
          grayscale(to_edit);
        }
        if (b.type.equals("redFilter")) {
          redscale(to_edit);
        }
        if (b.type.equals("orangeFilter")) {
          orangescale(to_edit);
        }
        if (b.type.equals("yellowFilter")) {
          yellowscale(to_edit);
        }
        if (b.type.equals("greenFilter")) {
          greenscale(to_edit);
        }
        if (b.type.equals("blueFilter")) {
          bluescale(to_edit);
        }
        if (b.type.equals("purpleFilter")) {
          purplescale(to_edit);
        }
        if (b.type.equals("invertFilter")) {
          invert(to_edit);
        }
      }
    }
  }
}
