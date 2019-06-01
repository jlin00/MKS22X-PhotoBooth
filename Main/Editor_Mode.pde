//class for editor mode

//variables 
PImage to_edit; //image to be edited
PImage copy; //copy of to_edit
ArrayList<Button> edit_buttons; //buttons in mode 3
int[] filters; 
ArrayList<Sticker> stickers;

PImage dogSticker;

//setup for editor mode to be used in main
void setup_editor(){
  dogSticker = loadImage("puppy.png");
  
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

  //color filters
  Button grayScale = new Button(0, 600, 100, 25, true, "grayFilter");
  edit_buttons.add(grayScale);
  Button redScale = new Button(100, 600, 100, 25, true, "redFilter");
  edit_buttons.add(redScale);
  Button orangeScale = new Button(200, 600, 100, 40, true, "orangeFilter");
  edit_buttons.add(orangeScale);
  Button yellowScale = new Button(300, 600, 100, 50, true, "yellowFilter");
  edit_buttons.add(yellowScale);
  Button greenScale = new Button(400, 600, 100, 60, true, "greenFilter");
  edit_buttons.add(greenScale);
  Button blueScale = new Button(500, 600, 100, 20, true, "blueFilter");
  edit_buttons.add(blueScale);
  Button purpleScale = new Button(600, 600, 100, 90, true, "purpleFilter");
  edit_buttons.add(purpleScale);
  Button invert = new Button(700, 600, 100, 10, true, "invertFilter");
  edit_buttons.add(invert);
  
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
  
  image(to_edit, 153.5, 115, 461, 346);
  
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
  
  editBar();
}

void mouseDragged_edit() {
  for (Sticker s : stickers) {
    println("yee");
    s.drag();
  }
}

void mousePressed_edit() {
  for (Sticker s : stickers) {
    println("yaa");
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
          for (Sticker s : stickers) {
            s.appear = false;
          }
        }
        if (b.type.equals("redirectB")){
          text_clicked();
          text("BOOTH", 56, 30);
          mode = 2;
          for (Sticker s : stickers) {
            s.appear = false;
          }
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
        if (b.type.equals("grayFilter")) {
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
        if (b.type.equals("blur")) {
          copy = to_edit.copy();
          copy = convoluteBlur(copy, blur);
        }
        
        if (b.type.equals("dogS")) {
          Sticker dog = new Sticker(dogSticker, 80, 80);
          stickers.add(dog);
          stickers.get(0).appear = true;
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
    image(copy, i * 125 + 20, 550, 100, 75);
  }
}
