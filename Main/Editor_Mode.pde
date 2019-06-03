//class for editor mode

//variables 
PImage to_edit; //image to be edited
PImage copy; //copy of to_edit
PImage sample; //sample displayed in editor panel 
ArrayList<Button> edit_buttons; //buttons in mode 3
int[] filters; 
int filterMode;

ArrayList<Sticker> stickers;
PImage dogSticker;

//setup for editor mode to be used in main
void setup_editor(){
  dogSticker = loadImage("puppy.png");
  
  //initializing variables
  edit_buttons = new ArrayList<Button>();
  filters = new int[2]; //first index with store color filter, second stores kernel effects 
                        //you can only apply one of each 
  filterMode = 1;
  
  Button go_to_lib = new Button(675, 12.5, 75, 25, true, "redirectL");
  edit_buttons.add(go_to_lib);
  Button go_to_booth = new Button(18, 12.5, 75, 25, true, "redirectB"); //redirect to editor button 
  edit_buttons.add(go_to_booth);
  Button save = new Button (18, 662, 75, 25, true, "save"); //save button 
  edit_buttons.add(0,save);
  Button cancel = new Button(675, 662, 75, 25, true, "cancel"); // cancel button
  edit_buttons.add(1,cancel);
  
  //color filters
  Button noFilter = new Button (20, 550, 100, 75, true, "noFilter");
  edit_buttons.add(noFilter);
  Button grayFilter = new Button (145, 550, 100, 75, true, "grayFilter");
  edit_buttons.add(grayFilter);
  Button redFilter = new Button (270, 550, 100, 75, true, "redFilter");
  edit_buttons.add(redFilter);
  Button orangeFilter = new Button (395, 550, 100, 75, true, "yellowFilter");
  edit_buttons.add(orangeFilter);
  Button yellowFilter = new Button (520, 550, 100, 75, true, "orangeFilter");
  edit_buttons.add(yellowFilter);
  Button greenFilter = new Button (645, 550, 100, 75, true, "greenFilter");
  edit_buttons.add(greenFilter);
  Button blueFilter = new Button (770, 550, 100, 75, true, "blueFilter");
  edit_buttons.add(blueFilter);
  Button purpleFilter = new Button (895, 550, 100, 75, true, "purpleFilter");
  edit_buttons.add(purpleFilter);
  Button invertFilter = new Button (1020, 550, 100, 75, true, "invertFilter");
  edit_buttons.add(invertFilter);
  
  
  //kernel image processing 
  Button blur = new Button(18, 625, 100, 25, true, "blur");
  edit_buttons.add(blur);
  
  Button dogS = new Button(0, 300, 100, 25, true, "dogS");
  edit_buttons.add(dogS);
  
  stickers = new ArrayList<Sticker>();
  
}

//draw for editor mode to be used in main 
void draw_editor(){
  background(245);
  
  //heading
  heading_settings();
  text("Photo Editor",384,32);
  
  //footer
  footer_settings();
  
  image(copy, 153.5, 115, 461, 346);
  
  for (Button b : edit_buttons) {
    b.display();
  }
  
  for (Sticker s : stickers) {
    if (s.appear) s.display();
  }
  
  textSize(14);
  fill(0);
  text("LIBRARY", 712, 30);
  text("BOOTH", 56, 30);
  textSize(16);
  text("SAVE", 55, 680);
  text("CANCEL", 710, 680);
  
  if (filterMode == 1) editBar();
  //else if (filterMode == 2) kernelBar();
  //else if (filterMode == 3) sliderBar(); 
  //else if (filterMode == 4) stickerBar();
}

void mouseDragged_edit() {
  for (Sticker s : stickers) {
    //println("yee");
    s.drag();
  }
}

void mousePressed_edit() {
  for (Sticker s : stickers) {
    //println("yaa");
    s.press();
  }
}

//mouseClicked method for editor mode to be used in main 
void mouseClicked_editor(){
 // if (stickers.size() > 0) {
   // stickers.get(0).mouseClicked_sticker();
 // }
  
  // going through the buttons
  for (Button b: edit_buttons){
    if (b.shape) { //if rectangular button
      if (mouseX >= b.x && mouseX <= b.x+b.w && mouseY >= b.y && mouseY <= b.y+b.h) {
        if (b.type.equals("redirectL")){
          text_clicked();
          text("LIBRARY", 714, 30);
          mode = 1;
          for (Sticker s : stickers) s.appear = false;
          stickers = new ArrayList<Sticker>();
        }
        if (b.type.equals("redirectB")){
          text_clicked();
          text("BOOTH", 56, 30);
          mode = 2;
          for (Sticker s : stickers) s.appear = false;
          stickers = new ArrayList<Sticker>();
        }
        if (b.type.equals("save")){
          PImage slice = get(153, 115, 461, 346);
          slice.save("Images/IMG"+ (picNum+filenames.length) + ".jpg");
          loadLibrary(); 
          mode = 1;
        }
        if (b.type.equals("cancel")){
          loadLibrary(); 
          mode = 1; 
          for (Sticker s : stickers) s.appear = false;
          stickers = new ArrayList<Sticker>();
        }
        
        if (filterMode == 1){
          if (b.type.equals("noFilter")){
            copy = to_edit.copy();
          }
          if (b.type.equals("grayFilter")){
            grayscale(copy);
          }
          if (b.type.equals("redFilter")) {
            redscale(copy);
          }
          if (b.type.equals("orangeFilter")) {
            orangescale(copy);
          }
          if (b.type.equals("yellowFilter")) {
            yellowscale(copy);
            }
          if (b.type.equals("greenFilter")) {
            greenscale(copy);
          }
          if (b.type.equals("blueFilter")) {
            bluescale(copy);
          }
          if (b.type.equals("purpleFilter")) {
            purplescale(copy);
          }
          if (b.type.equals("invertFilter")) {
            invert(copy);
          }
        }
        
        if (b.type.equals("blur")) {
          copy = to_edit.copy();
          copy = convoluteBlur(copy, blur);
        }
        
        if (b.type.equals("dogS")) {
          Sticker dog = new Sticker(dogSticker, 80, 80);
          stickers.add(dog);
          stickers.get(stickers.size()-1).appear = true;
        }
      }
    }
  }
}

void editBar(){
  for (int i = 0; i < 9; i++){
    PImage sample_copy = sample.copy();
    if (i == 1) grayscale(sample_copy);
    if (i == 2) redscale(sample_copy);
    if (i == 3) orangescale(sample_copy);
    if (i == 4) yellowscale(sample_copy);
    if (i == 5) greenscale(sample_copy);
    if (i == 6) bluescale(sample_copy);
    if (i == 7) purplescale(sample_copy);
    if (i == 8) invert(sample_copy);
    image(sample_copy, i * 125 + 20, 550);
  }
}
