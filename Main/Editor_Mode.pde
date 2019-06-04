//class for editor mode

//variables 
PImage to_edit; //image to be edited
  PImage copy; //copy of to_edit
  PImage sample; //sample displayed in editor panel, resized version of to_edit 
ArrayList<Button> edit_buttons; //general buttons in editor mode
  int filterMode; //determines which portion of the edit bar is available 
ArrayList<Button> color_buttons; //buttons for filterMode 1
ArrayList<Button> kernel_buttons; //buttons for filterMode 2
  int filter_num; //only one color fitler or kernel filter can be applied
ArrayList<ScrollBar> scroll_buttons; //buttons for filterMode 3
  Button apply, reset; //apply adjustments, reset to default 
  float brightness_level; //the brightness level of the image, by storing this the image may be reset to default later on 
  float saturate_level; //the saturation level of the image
  float contrast_level; //the contrast level of the image
  ScrollBar toDrag; //only one scrollbar can be dragged at a time 
Button[] frame_buttons; //buttons for filterMode 5
ArrayList<Button> draw_buttons; //buttons for filterMode 6
int adjust; //adjusts the images and buttons in the edit bar after left/right scroll buttons are clicked 
  boolean leftmost; //has the panel reached its leftmost point 
  boolean rightmost; //has the panel reached its rightmost point 
PGraphics pg; //drawing buffer to be used in drawing mode 
  color drawcolor; //color of drawing 
Frame[] frames; //array of frames that can be applied to picture 
  PImage[] framePics; //stores the image of the frames
  int frameNum = 11; //only one frame can be applied at a time, this variable serves as each frame's ID
ArrayList<Sticker> stickers; //keeps track of stickers applied to picture 
  PImage[] stickerPics; //stores images of stickers 
  Button[] sticker_buttons; //stores buttons underneath each sticker 
  Sticker toMove; //only one sticker may be dragged at a time 

//setup for editor mode to be used in main
void setup_editor(){
  //initializing variables
  edit_buttons = new ArrayList<Button>();
  color_buttons = new ArrayList<Button>();
  kernel_buttons = new ArrayList<Button>();
  scroll_buttons = new ArrayList<ScrollBar>();
  draw_buttons = new ArrayList<Button>();
  frame_buttons = new Button[12]; //there are 12 frame buttons, 11 frames 
  frames = new Frame[11];
  framePics = new PImage[11];
  filterMode = 1; //always start off in filterMode 1
  leftmost = true; //for navigation bar
  rightmost = false; //for navigation bar 
  pg = createGraphics(461, 346); //creates buffer over to_edit
  drawcolor = color(0); //default draw color is black 
  stickers = new ArrayList<Sticker>(); 
  stickerPics = new PImage[12];
  sticker_buttons = new Button[12];
  
  //picture frames
  String path = sketchPath("Frames"); //loads all the files in the Frames folder 
  String[] framenames = listFileNames(path); //stores all the filenames in Frames folder 
  Button noFrame = new Button(20 + adjust, 550, 100, 75, true, "noFrame"); //first button is no frame
  frame_buttons[11] = noFrame;
  for (int i = 0; i < framenames.length; i++){ //loops through frame filenames 
    String s = framenames[i];
    if (!s.substring(0,1).equals(".")){
      String sub = s.substring(s.indexOf("e")+1, s.indexOf(".")); //frames are numbered 1-11
      int index = Integer.parseInt(sub); //obtains the number of the frame
      PImage temp = loadImage("Frames/" + s); //loads the image of the frame once 
      temp.resize(461,346); //resizes frame to fit perfectly over image 
      framePics[index-1] = temp; //adds image to framePics 
      Frame f = new Frame(s); //creates a new Frame using the framePic
      frames[index-1] = f; //stores frame in array 
      Button b = new Button(index * 125 + 20 + adjust, 550, 100, 75, true, s); //creates a button underneath the framePic in the navigation bar 
      frame_buttons[index-1] = b; //adds button to array 
    }
  }
  
  //stickers
  String path2 = sketchPath("Stickers"); //loads all the files in the Stickers folder 
  String[] stickernames = listFileNames(path2); //stores all the filenames in the Stickers folder 
  for (int i = 0; i < stickernames.length; i++) { //loops through filenmes
    String s = stickernames[i];
    if (!s.substring(0,1).equals(".")){
      String sub = s.substring(s.indexOf("r")+1, s.indexOf(".")); //stickers are numbered 1-12
      int index = Integer.parseInt(sub); //obtains the number of the sticker 
      PImage temp = loadImage("Stickers/" + s); //loads the image of the sticker once 
      temp.resize(80,80); //resizes the size of the sticker 
      stickerPics[index-1] = temp; //adds stickerPic to arrayList
      Button b = new Button((index-1) * 125 + 20 + adjust, 550, 100, 75, true, s); //creates a button underneath the stickerPic in the navigation bar 
      sticker_buttons[index-1] = b; //adds button to array 
    }
  }
  
  //general buttons 
  Button go_to_lib = new Button(675, 12.5, 75, 25, true, "redirectL"); //redirect to library button 
  edit_buttons.add(go_to_lib);
  Button go_to_booth = new Button(18, 12.5, 75, 25, true, "redirectB"); //redirect to booth button 
  edit_buttons.add(go_to_booth);
  Button save = new Button (18, 662, 75, 25, true, "save"); //save button 
  edit_buttons.add(0,save);
  Button cancel = new Button(675, 662, 75, 25, true, "cancel"); // cancel button
  edit_buttons.add(1,cancel);
  Button left = new Button (5, 550, 10, 75, true, "left"); //left scroll button in navigation bar
  left.setPopup(false);
  edit_buttons.add(2, left);
  Button right = new Button (753, 550, 10, 75, true, "right"); //right scroll button in navigation bar 
  edit_buttons.add(3, right);
  
  //edit bar buttons, switch between filterModes 
  Button colorFilters = new Button(20, 505, 100, 25, true, "colorFilters"); //filterMode 1
  edit_buttons.add(colorFilters);
  Button kernelFilters = new Button(145, 505, 100, 25, true, "kernelFilters");  //filterMode 2
  edit_buttons.add(kernelFilters);
  Button adjust = new Button(270, 505, 100, 25, true, "adjust"); //filterMode 3
  edit_buttons.add(adjust);
  Button sticker = new Button(395, 505, 100, 25, true, "sticker"); //filterMode 4
  edit_buttons.add(sticker);
  Button frames = new Button(520, 505, 100, 25, true, "frames"); //filterMode 5
  edit_buttons.add(frames);
  Button drawings = new Button(645, 505, 100, 25, true, "drawing"); //filterMode 6 
  edit_buttons.add(drawings);
  
  //color filters, sample pictures of filter are overlaid over these 
  Button noFilter = new Button (20, 550, 100, 75, true, "noFilter"); //remove color filters 
  color_buttons.add(noFilter);
  kernel_buttons.add(noFilter);
  Button grayFilter = new Button (145, 550, 100, 75, true, "grayFilter"); //apply grayscale
  color_buttons.add(grayFilter);
  Button redFilter = new Button (270, 550, 100, 75, true, "redFilter"); //apply redscale 
  color_buttons.add(redFilter);
  Button orangeFilter = new Button (395, 550, 100, 75, true, "yellowFilter"); //apply yellowscale
  color_buttons.add(orangeFilter);
  Button yellowFilter = new Button (520, 550, 100, 75, true, "orangeFilter"); //apply orangescale
  color_buttons.add(yellowFilter);
  Button greenFilter = new Button (645, 550, 100, 75, true, "greenFilter"); //apply greenscale
  color_buttons.add(greenFilter);
  Button blueFilter = new Button (770, 550, 100, 75, true, "blueFilter"); //apply bluescale
  color_buttons.add(blueFilter);
  Button purpleFilter = new Button (895, 550, 100, 75, true, "purpleFilter"); //apply purplescale
  color_buttons.add(purpleFilter);
  Button invertFilter = new Button (1020, 550, 100, 75, true, "invertFilter"); //apply invert
  color_buttons.add(invertFilter); 
  
  //kernel image processing 
  Button blur = new Button(145, 550, 100, 75, true, "blur"); //apply blur kernel
  kernel_buttons.add(blur);
  Button sharpen = new Button(270, 550, 100, 75, true, "sharpen"); //apply sharpen kernel
  kernel_buttons.add(sharpen);
  Button edgeEnhance = new Button(395, 550, 100, 75, true, "edgeEnhance"); //apply edge enhance  kernel
  kernel_buttons.add(edgeEnhance);
  Button edgeDetect = new Button(520, 550, 100, 75, true, "edgeDetect"); //apply edge detect kernel
  kernel_buttons.add(edgeDetect);
  Button emboss = new Button(645, 550, 100, 75, true, "emboss"); //apply emboss kernel
  kernel_buttons.add(emboss);
  Button sobelEdge = new Button(770, 550, 100, 75, true, "sobelEdge"); //apply sobel edge kernel
  kernel_buttons.add(sobelEdge);
  Button hoznLines = new Button(895, 550, 100, 75, true, "hoznLines"); //apply hozn lines kernel
  kernel_buttons.add(hoznLines);
  Button vertLines = new Button(1020, 550, 100, 75, true, "vertLines"); //apply vert lines kernel
  kernel_buttons.add(vertLines);
  
  //adjustment scrollbars 
  ScrollBar bright_adj = new ScrollBar(150, 550, 500, 10, "brightness"); //scrollbar to adjust brightness level of image
  scroll_buttons.add(bright_adj);
  ScrollBar sat_adj = new ScrollBar(150, 580, 500, 10, "saturation"); //scrollbar to adjust saturation level of image
  scroll_buttons.add(sat_adj);
  ScrollBar cont_adj = new ScrollBar(150, 610, 500, 10, "contrast"); //scrollbar to adjust contrast level of mage 
  scroll_buttons.add(cont_adj);
  apply = new Button (665, 560, 70, 20, true, "apply"); //apply adjustment button 
  reset = new Button (665, 590, 70, 20, true, "reset"); //reset adjustments to default level button 
  
  //color palette buttons 
  Button color1 = new Button(40, 580, 20, false, color(0)); //black
  draw_buttons.add(color1);
  Button color2 = new Button(80, 580, 20, false, color(128)); //gray
  draw_buttons.add(color2);
  Button color3 = new Button(120, 580, 20, false, color(255, 0, 0)); //red
  draw_buttons.add(color3);
  Button color4 = new Button(160, 580, 20, false, color(255, 128, 0));//orange
  draw_buttons.add(color4);
  Button color5 = new Button(200, 580, 20, false, color(255, 255, 0)); //yellow
  draw_buttons.add(color5);
  Button color6 = new Button(240, 580, 20, false, color(128, 255, 0)); //lime green 
  draw_buttons.add(color6);
  Button color7 = new Button(280, 580, 20, false, color(0, 255, 0)); //green 
  draw_buttons.add(color7);
  Button color8 = new Button(320, 580, 20, false, color(0, 255, 128)); //turquoise
  draw_buttons.add(color8);
  Button color9 = new Button(360, 580, 20, false, color(0, 255, 255)); //lightblue 
  draw_buttons.add(color9);
  Button color10 = new Button(400, 580, 20, false, color(0, 128, 255)); //skyblue
  draw_buttons.add(color10);
  Button color11 = new Button(440, 580, 20, false, color(0, 0, 255)); //blue
  draw_buttons.add(color11);
  Button color12 = new Button(480, 580, 20, false, color(127, 0, 255)); //purple 
  draw_buttons.add(color12);
  Button color13 = new Button(520, 580, 20, false, color(255, 0, 255)); //magenta
  draw_buttons.add(color13);
  Button color14 = new Button(560, 580, 20, false, color(255, 0, 127)); //pink
  draw_buttons.add(color14);
  Button color15 = new Button(600, 580, 20, false, color(255)); //white
  draw_buttons.add(color15);
  Button color16 = new Button(640, 580, 20, false, color(0,0)); //erase
  draw_buttons.add(color16);
  Button clear = new Button (666, 571, 70, 20, true, "clear"); //clear all drawings buttons 
  draw_buttons.add(clear);
  
}

//draw for editor mode to be used in main 
void draw_editor(){
  background(245);
  
  //creates a heading for editor mode 
  heading_settings();
  text("Photo Editor",384,32);
  
  //footer
  footer_settings();
  
  image(copy, 153.5, 115, 461, 346); //displays copy of original image, with applied filters
  
  for (Button b : edit_buttons) { //display all the general buttons 
    if (b.popup) b.display();
  }
  
  for (Sticker s : stickers) { //display any applied stickers 
    if (s.appear) s.display();
  }
  
  if (filterMode == 3){ //if filterMode 3, display apply and reset buttons 
    apply.display();
    reset.display();
  }
  
  if (filterMode == 6){ //if filterMode 6, display color palette buttons 
    for (Button b: draw_buttons){
      b.display();
    }
  }
  
  //formatting 
  textSize(14);
  fill(0);
  text("LIBRARY", 712, 30);
  text("BOOTH", 56, 30);
  textSize(16);
  text("SAVE", 55, 680);
  text("CANCEL", 710, 680);
  
  editBar(); //navigation bar 
  
  text("COLOR", 72, 522);
  text("EFFECTS", 197, 522);
  text("ADJUST", 322, 522);
  text("STICKERS", 447, 522);
  text("FRAMES", 572, 522);
  text("DRAW", 697, 522);
  
  //buffer for drawing in filterMode 6
  image(pg, 153.5, 115);
  
  //display any applied photo frames 
  if (frameNum != 11){
    image(framePics[frameNum], 153.5, 115);
  }
}

void mouseDragged_edit() { //if mousedDragged
  if (filterMode != 6){ //stickers can be dragged in any filterMode except 6
    for (Sticker s : stickers){ 
      s.drag();
    }
  }
  if (filterMode == 6){ //if filterMode 6, mouseDrag is used to draw on image 
    pg.beginDraw(); 
    for (int kx = -2; kx <= 2; kx++){ //drawing width is 9 pixels, which is easier to see for the user 
      for (int ky = -2; ky <= 2; ky++){
        pg.set(mouseX + kx - 154, mouseY + ky - 115, drawcolor); //draws onto screen 
      }
    }
    pg.endDraw(); 
  }
}

void mousePressed_edit() { //if mousePressed 
  for (Sticker s : stickers) {
    s.press();
  }
}

void mouseReleased_edit(){ //if mouse is released, there is no designated scrollbar or sticker to be dragged or moved 
  toMove = null;
  toDrag = null;
}

//mouseClicked method for editor mode to be used in main 
void mouseClicked_editor(){ //if mouseClicked 
  
  // going through the buttons
  for (Button b: edit_buttons){ //all edit buttons are clickable regardless of filterMode 
    if (b.shape) { //if rectangular button
      if (mouseX >= b.x && mouseX <= b.x+b.w && mouseY >= b.y && mouseY <= b.y+b.h) { //if over button 
        if (b.type.equals("redirectL")){ //redirect to library 
          text_clicked();
          text("LIBRARY", 714, 30);
          mode = 1;
          for (Sticker s : stickers) s.appear = false;
          stickers = new ArrayList<Sticker>();
        }
        if (b.type.equals("redirectB")){ //redirect to booth 
          text_clicked();
          text("BOOTH", 56, 30);
          mode = 2;
          for (Sticker s : stickers) s.appear = false;
          stickers = new ArrayList<Sticker>();
        }
        if (b.type.equals("save")){ //save edited image and redirect to library 
          PImage slice = get(153, 115, 461, 346);
          slice.save("Images/IMG"+ (picNum+filenames.length) + ".jpg");
          loadLibrary(); //reload library to show new edited image 
          mode = 1;
        }
        if (b.type.equals("cancel")){ //direct to library 
          mode = 1; 
          for (Sticker s : stickers) s.appear = false;
          stickers = new ArrayList<Sticker>();
        }
        if (b.popup && b.type.equals("right")){ //right scroll button 
          adjust = -748; //moves all the buttons and images in edit bar to the left
          for (Button b2: color_buttons){
            b2.shiftX(-748);
          }
          for (Button b3: kernel_buttons){
            b3.shiftX(-748);
          }
          for (Button b4: frame_buttons){
            b4.shiftX(-748);
          }
          for (Button b5: sticker_buttons){
            b5.shiftX(-748);
          }
          edit_buttons.get(2).setPopup(true); //left scroll button is now available
          edit_buttons.get(3).setPopup(false); //right scroll button is no longer available 
          leftmost = false; 
          rightmost = true;
        }
        
        if (b.popup && b.type.equals("left")){ //left scroll button 
          adjust = 0; //reverts all the buttons and images in edit bar to their original position 
          for (Button b2: color_buttons){
            b2.shiftX(748);
          }
          for (Button b3: kernel_buttons){
            b3.shiftX(748);
          }
          for (Button b4: frame_buttons){
            b4.shiftX(748);
          }
          for (Button b5: sticker_buttons){
            b5.shiftX(748);
          } 
          edit_buttons.get(2).setPopup(false); //left scroll button is no longer available 
          edit_buttons.get(3).setPopup(true); //right scroll button is now available 
          leftmost = true;
          rightmost = false;
        }
        //buttons that change filterMode of edit bar
        if (b.type.equals("colorFilters")){
          filterMode = 1;
        }
        if (b.type.equals("kernelFilters")){
          filterMode = 2;
        }
        if (b.type.equals("adjust")){
          filterMode = 3;
        }
        if (b.type.equals("sticker")){
          filterMode = 4;
        }
        if (b.type.equals("frames")){
          filterMode = 5;
        }
        if (b.type.equals("drawing")){
          filterMode = 6;
        }
      }
    }
  }
  
  if (filterMode == 1){ //if in filterMode 1, color_buttons are clickable 
    for (Button b: color_buttons){ //apply color filters 
      if (mouseX >= b.x && mouseY >= b.y && mouseX <= b.x + b.w && mouseY <= b.y + b.h){ //if clicking over button 
        if (b.type.equals("noFilter")){
            copy = to_edit.copy(); //creates a copy of the original image to apply filter to 
            filter_num = 0; //keeps track of which filter is being applied, only one may be applied
            apply_adj(); //overlays all the adjustments made in filterMode 3 to image 
          }
          if (b.type.equals("grayFilter")){
            copy = to_edit.copy();
            filter_num = 1;
            apply_adj();
          }
          if (b.type.equals("redFilter")) {
            copy = to_edit.copy();
            filter_num = 2;
            apply_adj();
          }
          if (b.type.equals("orangeFilter")) {
            copy = to_edit.copy();
            filter_num = 3;
            apply_adj();
          }
          if (b.type.equals("yellowFilter")) {
            copy = to_edit.copy();
            filter_num = 4;
            apply_adj();
          }
          if (b.type.equals("greenFilter")) {
            copy = to_edit.copy();
            filter_num = 5;
            apply_adj();
          }
          if (b.type.equals("blueFilter")) {
            copy = to_edit.copy();
            filter_num = 6;
            apply_adj();
          }
          if (b.type.equals("purpleFilter")) {
            copy = to_edit.copy();
            filter_num = 7;
            apply_adj();
          }
          if (b.type.equals("invertFilter")) {
            copy = to_edit.copy();
            filter_num = 8;
            apply_adj();
          }
      }
    }
  }
  
  if (filterMode == 2){ //if filterMode 2, kernel buttons are clickable 
    for (Button b: kernel_buttons){ //apply kernel filters 
      if (mouseX >= b.x && mouseY >= b.y && mouseX <= b.x + b.w && mouseY <= b.y + b.h){ //if mouse clicking over button 
        if (b.type.equals("noFilter")){ 
          copy = to_edit.copy(); //creates of copy of the original image to apply filter to 
          filter_num = 0; //keeps track of which filter is being applied, only one may be applied
          apply_adj(); //overlays all the adjustments made in filterMode 3 to image 
        }
        if (b.type.equals("blur")){
          copy = to_edit.copy();
          filter_num = 9;
          apply_adj();
        }
        if (b.type.equals("sharpen")){
          copy = to_edit.copy();
          filter_num = 10;
          apply_adj();
        }
        if (b.type.equals("edgeEnhance")){
          copy = to_edit.copy();
          filter_num = 11;
          apply_adj();
        }
        if (b.type.equals("edgeDetect")){
          copy = to_edit.copy();
          filter_num = 12;
          apply_adj();
        }
        if (b.type.equals("emboss")){
          copy = to_edit.copy();
          filter_num = 13;
          apply_adj();
        }
        if (b.type.equals("sobelEdge")){
          copy = to_edit.copy();
          filter_num = 14;
          apply_adj();
        }
        if (b.type.equals("hoznLines")){
          copy = to_edit.copy();
          filter_num = 15;
          apply_adj();
        }
        if (b.type.equals("vertLines")){
          copy = to_edit.copy();
          filter_num = 16;
          apply_adj();
        }
      }
    }
  }
  
  if (filterMode == 3){ //if filterMode three, apply and reset buttons are clickable 
    if (mouseX >= apply.x && mouseY >= apply.y && mouseX <= apply.x + apply.w && mouseY <= apply.y + apply.h){ //if clicking over apply button 
      apply_adj(); //apply all adjustments based on slider values 
    }
    if (mouseX >= reset.x && mouseY >= reset.y && mouseX <= reset.x + reset.w && mouseY <= reset.y + reset.h){ //if clicking over reset button 
      reset_sliders(); //reset sliders to default values 
      apply_adj(); //re-apply adjustments, which basically resets the brightness, saturation and contrast of the image 
    }
  }
  
  if (filterMode == 4) { //if filterMode 4, sticker buttons are clickable 
    for (Button b : sticker_buttons) { //apply stickers to image 
      if (mouseX >= b.x && mouseY >= b.y && mouseX <= b.x + b.w && mouseY <= b.y + b.h){ //if mouse clicking over button 
        if (b.type.equals("sticker1.png")) { //type dependent on filename 
          Sticker one = new Sticker(stickerPics[0], 500, 300); //creates a new sticker 
          stickers.add(one); //adds sticker to list of stickers applied on image 
          stickers.get(stickers.size()-1).appear = true;
        }
        if (b.type.equals("sticker2.png")) {
          Sticker two = new Sticker(stickerPics[1], 400, 150);
          stickers.add(two);
          stickers.get(stickers.size()-1).appear = true;
        }
        if (b.type.equals("sticker3.png")) {
          Sticker three = new Sticker(stickerPics[2], 200, 200);
          stickers.add(three);
          stickers.get(stickers.size()-1).appear = true;
        }
        if (b.type.equals("sticker4.png")) {
          Sticker four = new Sticker(stickerPics[3], 250, 250);
          stickers.add(four);
          stickers.get(stickers.size()-1).appear = true;
        }
        if (b.type.equals("sticker5.png")) {
          Sticker five = new Sticker(stickerPics[4], 300, 300);
          stickers.add(five);
          stickers.get(stickers.size()-1).appear = true;
        }
        if (b.type.equals("sticker6.png")) {
          Sticker six = new Sticker(stickerPics[5], 400, 350);
          stickers.add(six);
          stickers.get(stickers.size()-1).appear = true;
        }
        if (b.type.equals("sticker7.png")) {
          Sticker seven = new Sticker(stickerPics[6], 400, 350);
          stickers.add(seven);
          stickers.get(stickers.size()-1).appear = true;
        }
        if (b.type.equals("sticker8.png")) {
          Sticker eight = new Sticker(stickerPics[7], 400, 350);
          stickers.add(eight);
          stickers.get(stickers.size()-1).appear = true;
        }
        if (b.type.equals("sticker9.png")) {
          Sticker nine = new Sticker(stickerPics[8], 400, 350);
          stickers.add(nine);
          stickers.get(stickers.size()-1).appear = true;
        }
        if (b.type.equals("sticker10.png")) {
          Sticker ten = new Sticker(stickerPics[9], 400, 350);
          stickers.add(ten);
          stickers.get(stickers.size()-1).appear = true;
        }
        if (b.type.equals("sticker11.png")) {
          Sticker eleven = new Sticker(stickerPics[10], 400, 350);
          stickers.add(eleven);
          stickers.get(stickers.size()-1).appear = true;
        }
        if (b.type.equals("sticker12.png")) {
          Sticker twelve = new Sticker(stickerPics[11], 400, 350);
          stickers.add(twelve);
          stickers.get(stickers.size()-1).appear = true;
        }
      }
    }
  }
    
  
  if (filterMode == 5){ //if filterMode 5, frameButtons become clickable 
    for (Button b: frame_buttons){ //apply frames to image 
      if (mouseX >= b.x && mouseY >= b.y && mouseX <= b.x + b.w && mouseY <= b.y + b.h){ //if mouse clicking over button 
        if (b.type.equals("frame1.png")){ //type dependent on filename
          frameNum = 0; //each frame corresponds to a unique frameNum, keeps track of which frame to apply to the image, only one may be applied 
        }
        if (b.type.equals("frame2.png")){
          frameNum = 1;
        }
        if (b.type.equals("frame3.png")){
          frameNum = 2;
        }
        if (b.type.equals("frame4.png")){
          frameNum = 3;
        }
        if (b.type.equals("frame5.png")){
          frameNum = 4;
        }
        if (b.type.equals("frame6.png")){
          frameNum = 5;
        }
        if (b.type.equals("frame7.png")){
          frameNum = 6;
        }
        if (b.type.equals("frame8.png")){
          frameNum = 7;
        }
        if (b.type.equals("frame9.png")){
          frameNum = 8;
        }
        if (b.type.equals("frame10.png")){
          frameNum = 9;
        }
        if (b.type.equals("frame11.png")){
          frameNum = 10;
        }
        if (b.type.equals("noFrame")){
          frameNum = 11;
        }
      }
    }
  }
  
  if (filterMode == 6){ //if filterMode 6, draw and color palette buttons are clickable 
    for (Button b: draw_buttons){ 
      if (b.shape){
        if (mouseX >= b.x && mouseY >= b.y && mouseX <= b.x + b.w && mouseY <= b.y + b.h){ //if mouse clicking over button 
          if (b.type.equals("clear")){ //clear button 
            pg.beginDraw();
            pg.clear(); //clears entire buffer 
            pg.endDraw();
          }
        }
      }
      else{
        float disX = b.x - mouseX;
        float disY = b.y - mouseY;
        if (sqrt(sq(disX) + sq(disY)) < b.d/2){ //if clicked on circular color button 
          drawcolor = b.c; //change the color of the pen 
        }
      }
    }
  }
}

void editBar(){ //what the edit bar displays based on filterMode 
  if (filterMode == 1) { //if filterMode 1, display each sample of image with color filter applied 
    for (int i = 0; i < 9; i++){ //loops through filters
      PImage sample_copy = sample.copy();
      if (i == 1) grayscale(sample_copy); //each number corresponds to a color filter 
      if (i == 2) redscale(sample_copy);
      if (i == 3) yellowscale(sample_copy);
      if (i == 4) orangescale(sample_copy);
      if (i == 5) greenscale(sample_copy);
      if (i == 6) bluescale(sample_copy);
      if (i == 7) purplescale(sample_copy);
      if (i == 8) invert(sample_copy);
      image(sample_copy, i * 125 + 20 + adjust, 550); //displays images 
    }
  }
  else if (filterMode == 2) { //if filterMode 2, display each sample of image with kernel filter applied
    for (int i = 0; i < 9; i++){ //loops through filters 
      PImage sample_copy = sample.copy();
      if (i == 1) sample_copy = convoluteBlur(sample, blur); //each number corresponds to a kernel filter
      if (i == 2) sample_copy = convolute(sample, sharpen);
      if (i == 3) sample_copy = convolute(sample, edgeEnhance);
      if (i == 4) sample_copy = convolute(sample, edgeDetect);
      if (i == 5) sample_copy = convolute(sample, emboss);
      if (i == 6) sample_copy = convolute(sample, sobelEdge);
      if (i == 7) sample_copy = convolute(sample, hoznLines);
      if (i == 8) sample_copy = convolute(sample, vertLines);
      image(sample_copy, i * 125 + 20 + adjust, 550); //displays images 
    }
  }
  else if (filterMode == 3){ //if filterMode 3, display clickable scrollbars
    for (ScrollBar s: scroll_buttons){
      s.display(); //display
      s.update(); //click, read in mouse values
      
      float init_pos = s.bar_x + s.bar_width/2 - s.bar_height/2; //initial position of slider is at 0, middle of scrollbar 
      float value = s.scroll_x - init_pos; //displacement of slider 
      
      if (s.type.equals("brightness")){ 
        if (value < 0) value = (value / (s.bar_width/2)) * 60; //adjusts negative displacement of slider
        else value = (value / (s.bar_width / 2)) * 70; //adjusts positive displacement of slider
        brightness_level = value; //sets variable to reflect displacement 
      }
      if (s.type.equals("saturation")){
        if (value < 0) value = (value / (s.bar_width/2)) * 255;
        else value = (value / (s.bar_width / 2)) * 70;
        saturate_level = value;
      }
      if (s.type.equals("contrast")){
        value = (value / (s.bar_width/2)) * 128;
        contrast_level = value;
      }

    }
    //formatting 
    fill(0);
    text("BRIGHTNESS", 70, 558);
    text("SATURATION", 70, 588);
    text("CONTRAST", 70, 618);
    text("APPLY", 698, 575);
    text("RESET", 698, 605);
  }
  else if (filterMode == 4){ //if filterMode 4, display the images of the sticker 
    for (int i = 0; i < stickerPics.length; i++) {
      image(stickerPics[i], i * 125 + 20 + adjust, 550, 80, 80);
    }
    
  }
  else if (filterMode == 5){ //if filterMode 5, display the images of the frames 
    for (int i = 0; i < framePics.length; i++){
      image(framePics[i], (i + 1) * 125 + 20 + adjust, 550, 100, 75); 
    }
    //formatting 
    fill(255);
    rect(20 + adjust, 550, 100, 75);
    fill(120);
    text("NONE", 70, 591);
    fill(0);
  }
  else if (filterMode == 6){ //if filterMode 6
    //formatting 
    text("CLEAR", 698, 584); 
    text("E", 641, 586);
  }
}

void reset_editor(){ //must be reset everytime new image is being edited 
  reset_sliders(); //reset slider values 
  leftmost = true; //resets scroll
  rightmost = false;
  adjust = 0; //all buttons and images are reset to initial position 
  filterMode = 1; //filterMode reset to 1 
  frameNum = 11; //no frame
  pg.beginDraw(); //clear all drawings 
  pg.clear();
  pg.endDraw();
  stickers.clear(); //delete all applied stickers
  drawcolor = color(0); //resets draw color to black 
  filter_num = 0; //resets to no filter 
}

void apply_adj(){ //overlay all adjsutments to brightness, saturation and contrast on top of chosen filter 
  copy = brighten(to_edit, brightness_level); //apply brightness adjustment 
  copy = saturate(copy, saturate_level); //apply saturation adjustment
  copy = contrast(copy, contrast_level); //apply contrast adjustment
  
  //code for overlaying filters with adjustment, filterNum changes with buttons 
  if (filter_num == 1) grayscale(copy); //each kernel and color filter has a unique filterNum corresponding to it 
  else if (filter_num == 2) redscale(copy);
  else if (filter_num == 3) orangescale(copy);
  else if (filter_num == 4) yellowscale(copy);
  else if (filter_num == 5) greenscale(copy);
  else if (filter_num == 6) bluescale(copy);
  else if (filter_num == 7) purplescale(copy);
  else if (filter_num == 8) invert(copy);
  else if (filter_num == 9) copy = convoluteBlur(copy, blur);
  else if (filter_num == 10) copy = convolute(copy, sharpen);
  else if (filter_num == 11) copy = convolute(copy, edgeEnhance);
  else if (filter_num == 12) copy = convolute(copy, edgeDetect);
  else if (filter_num == 13) copy = convolute(copy, emboss);
  else if (filter_num == 14) copy = convolute(copy, sobelEdge);
  else if (filter_num == 15) copy = convolute(copy, hoznLines);
  else if (filter_num == 16) copy = convolute(copy, vertLines);
}

void reset_sliders(){ //reset values of the scrollBars
  for (ScrollBar s: scroll_buttons){
    float init_pos = s.bar_x + s.bar_width/2 - s.bar_height/2;
    s.scroll_x = init_pos; //reset slider to initial position
  }
  
  brightness_level = 0; //default values 
  saturate_level = 0;
  contrast_level = 0;
}
