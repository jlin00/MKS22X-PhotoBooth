//class for booth mode

//variables 
int picNum; //used to name image 
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
  Button save = new Button (700, 662, 75, 25, true, "save"); //save button 
  save.setPopup(false);
  booth_buttons.add(0,save);
}

//draw for booth mode to be used in main 
void draw_booth(){
  background(188,215,255);
  cam.start();
  if (cam.available() == true) {
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
    b.display();
  }
  
  //creates heading 
  text("Photo Booth",384,32);
  textSize(14);
  fill(0);
  text("LIBRARY", 712, 30);
}
