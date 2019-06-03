//class for editor mode

//variables 
PImage to_edit; //image to be edited
PImage copy; //copy of to_edit
PImage sample; //sample displayed in editor panel 
ArrayList<Button> edit_buttons; //buttons in mode 3
ArrayList<Button> color_buttons;
int[] filters; 
int filterMode;
int adjust;
boolean leftmost;
boolean rightmost;

ArrayList<Sticker> stickers;
PImage dogSticker;

//setup for editor mode to be used in main
void setup_editor(){
  dogSticker = loadImage("puppy.png");
  
  //initializing variables
  edit_buttons = new ArrayList<Button>();
  color_buttons = new ArrayList<Button>();
  filters = new int[2]; //first index with store color filter, second stores kernel effects 
                        //you can only apply one of each 
  filterMode = 1;
  leftmost = true; //for navigation bar
  rightmost = false; //for navigation bar 
  
  Button go_to_lib = new Button(675, 12.5, 75, 25, true, "redirectL");
  edit_buttons.add(go_to_lib);
  Button go_to_booth = new Button(18, 12.5, 75, 25, true, "redirectB"); //redirect to editor button 
  edit_buttons.add(go_to_booth);
  Button save = new Button (18, 662, 75, 25, true, "save"); //save button 
  edit_buttons.add(0,save);
  Button cancel = new Button(675, 662, 75, 25, true, "cancel"); // cancel button
  edit_buttons.add(1,cancel);
  Button left = new Button (5, 550, 10, 75, true, "left"); //left arrow button 
  left.setPopup(false);
  edit_buttons.add(2, left);
  Button right = new Button (753, 550, 10, 75, true, "right"); //right arrow button 
  edit_buttons.add(3, right);
  
  //color filters, sample pictures of filter are overlaid over these 
  Button noFilter = new Button (20, 550, 100, 75, true, "noFilter");
  color_buttons.add(noFilter);
  Button grayFilter = new Button (145, 550, 100, 75, true, "grayFilter");
  color_buttons.add(grayFilter);
  Button redFilter = new Button (270, 550, 100, 75, true, "redFilter");
  color_buttons.add(redFilter);
  Button orangeFilter = new Button (395, 550, 100, 75, true, "yellowFilter");
  color_buttons.add(orangeFilter);
  Button yellowFilter = new Button (520, 550, 100, 75, true, "orangeFilter");
  color_buttons.add(yellowFilter);
  Button greenFilter = new Button (645, 550, 100, 75, true, "greenFilter");
  color_buttons.add(greenFilter);
  Button blueFilter = new Button (770, 550, 100, 75, true, "blueFilter");
  color_buttons.add(blueFilter);
  Button purpleFilter = new Button (895, 550, 100, 75, true, "purpleFilter");
  color_buttons.add(purpleFilter);
  Button invertFilter = new Button (1020, 550, 100, 75, true, "invertFilter");
  color_buttons.add(invertFilter);
  
  
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
    if (b.popup) b.display();
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
          stickers = new ArrayList<Sticker>();
        }
        if (b.type.equals("redirectB")){
          text_clicked();
          text("BOOTH", 56, 30);
          mode = 2;
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
        }
        if (b.popup && b.type.equals("right")){
          adjust = -748;
          for (Button b2: color_buttons){
            b2.shiftX(-748);
          }
          edit_buttons.get(2).setPopup(true);
          edit_buttons.get(3).setPopup(false);
          leftmost = false;
          rightmost = true;
        }
        
        if (b.popup && b.type.equals("left")){
          adjust = 0;
          for (Button b2: color_buttons){
            b2.shiftX(748);
          }
          edit_buttons.get(2).setPopup(false);
          edit_buttons.get(3).setPopup(true);
          leftmost = true;
          rightmost = false;
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
  
  if (filterMode == 1){
    for (Button b: color_buttons){
      if (mouseX >= b.x && mouseY >= b.y && mouseX <= b.x + b.w && mouseY <= b.y + b.h){
        if (b.type.equals("noFilter")){
            copy = to_edit.copy();
          }
          if (b.type.equals("grayFilter")){
            copy = to_edit.copy();
            grayscale(copy);
          }
          if (b.type.equals("redFilter")) {
            copy = to_edit.copy();
            redscale(copy);
          }
          if (b.type.equals("orangeFilter")) {
            copy = to_edit.copy();
            orangescale(copy);
          }
          if (b.type.equals("yellowFilter")) {
            copy = to_edit.copy();
            yellowscale(copy);
          }
          if (b.type.equals("greenFilter")) {
            copy = to_edit.copy();
            greenscale(copy);
          }
          if (b.type.equals("blueFilter")) {
            copy = to_edit.copy();
            bluescale(copy);
          }
          if (b.type.equals("purpleFilter")) {
            copy = to_edit.copy();
            purplescale(copy);
          }
          if (b.type.equals("invertFilter")) {
            copy = to_edit.copy();
            invert(copy);
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
    if (i == 3) yellowscale(sample_copy);
    if (i == 4) orangescale(sample_copy);
    if (i == 5) greenscale(sample_copy);
    if (i == 6) bluescale(sample_copy);
    if (i == 7) purplescale(sample_copy);
    if (i == 8) invert(sample_copy);
    image(sample_copy, i * 125 + 20 + adjust, 550);
  }
}
