//class for booth mode

//variables 
int picNum; //used to name image 
boolean toBeSaved = false; // keep track of just taken photo
ArrayList<Button> booth_buttons; 

//setup for booth mode to be used in main 
void setup_booth(){
  //initializing variables
  booth_buttons = new ArrayList<Button>();
  
  //buttons to be available in booth mode 
  Button take = new Button(384, 662, 50, false, "take"); //capture button
  booth_buttons.add(take); 
  Button go_to_lib = new Button(675, 12.5, 75, 25, true, "redirectL"); //redirect to library button 
  booth_buttons.add(go_to_lib);
  Button save = new Button (575, 662, 75, 25, true, "save"); //save button 
  save.setPopup(false);
  booth_buttons.add(0,save);
  Button cancel = new Button(675, 662, 75, 25, true, "cancel"); // cancel button
  cancel.setPopup(false);
  booth_buttons.add(1,cancel);
  Button go_to_editor = new Button(18, 12.5, 75, 25, true, "redirectE"); //redirect to editor button 
  go_to_editor.setPopup(false);
  booth_buttons.add(2,go_to_editor);
}

//draw for booth mode to be used in main 
void draw_booth(){
  background(188,215,255);
  cam.start();
  if (cam.available() == true && !toBeSaved) {
    cam.read();
  }
  pushMatrix();
  scale(-1, 1); //flip image on x axis 
  scale(1.2);
  translate(128, 42);
  image(cam.get(), -width, 0);
  popMatrix();
    
  heading_settings();
    
  for (Button b : booth_buttons) {
    if (b.popup){
      b.display();
    }
  }
  
  //creates heading 
  text("Photo Booth",384,32);
  textSize(14);
  fill(0);
  text("LIBRARY", 712, 30);
  if (toBeSaved) {
    textSize(16);
    text("SAVE", 615, 680);
    text("CANCEL", 710, 680);
    textSize(14);
    text("EDITOR", 56, 30);
  }
}

//mouseClicked method for booth to be used in main 
void mouseClicked_booth(){
  for (Button b : booth_buttons) { //loops through booth buttons  
    if (b.shape) { //if rectangular button
      if (mouseX >= b.x && mouseX <= b.x+b.w && mouseY >= b.y && mouseY <= b.y+b.h){
        
        //redirect to library action 
        if (b.type.equals("redirectL")){ 
          text_clicked();
          text("LIBRARY", 714, 30);
          mode = 1;
          loadLibrary();
        }
        
        //save image action 
        if (b.type.equals("save") && b.popup == true){
          PImage slice = get(0, 50, 768, 576); //only saves portion of screen 
          slice.save("Images/IMG" + (picNum + filenames.length) + ".jpg");
          picNum++;
          b.setPopup(false);
          booth_buttons.get(1).setPopup(false);
          booth_buttons.get(2).setPopup(false);
          toBeSaved = false;
        } 
        else if (b.type.equals("cancel") && b.popup == true) {
          b.setPopup(false);
          booth_buttons.get(0).setPopup(false);
          booth_buttons.get(2).setPopup(false);
          toBeSaved = false;
        }
        else if (b.type.equals("redirectE") && b.popup == true){
          b.setPopup(false);
          booth_buttons.get(0).setPopup(false);
          booth_buttons.get(1).setPopup(false);
          toBeSaved = false;
          to_edit = get(0, 50, 768, 576);
          copy = to_edit.copy();
          sample = to_edit.copy();
          sample.resize(100,75);
          mode = 3;
          reset_editor();
        }
      }
    }
    
    else { //if circular button
      float disX = b.x - mouseX;
      float disY = b.y - mouseY;
      if (sqrt(sq(disX) + sq(disY)) < b.d/2){
        
        //capture picture action
        if (b.type.equals("take")){ 
          b.contract();
          booth_buttons.get(0).setPopup(true);
          booth_buttons.get(1).setPopup(true);
          booth_buttons.get(2).setPopup(true);
          b.uncontract();
          fill(255);
          rect(0,50,768,576);
          toBeSaved = true;
        }
      }
    }
  }
}
