# Photo Booth/Editor

The core of our final project is a Photo Booth/Editor created in Processing through the Capture class. Processing provides a unique opportunity for smooth graphics and a Photo Booth/Editor would efficiently use our resources to make a project that is both useful and aesthetic. In our Photo Booth/Editor, users will be able to, of course, take pictures of themselves and edit them afterwards. Features include adding filters in the photo booth and placing stickers in the editor. Additionally, images are able to be stored or deleted. Other features may be implemented depending on our usage of Processing and our ability to change the look of the camera.

## Instructions

<i>(to be updated later on)</i>

## Development Log
<table>
  <th>Log Date</th>
  <th>Description</th>
  <tr>
    <td>5/19/19</td>
    <td>
    Grace: :octocat:
    <br><ul>
      <li>worked on filling in the Main folder by creating new classes</li>
    </ul><br>
    Jackie: :hatched_chick:
    <br><ul>
      <li>created new repository</li>
      <li>formatted the README</li>
      <li>experimented with accessing a folder of images through directory list library</li>  
      <li>experimented with display data from webcam on screen using Capture class</li>
      </ul><br>
    </td>
  </tr>
  <tr>
    <td>5/20/19</td>
    <td>
    Grace: :octocat:
    <br><ul>
      <li>worked on getting to know the webcam and its proportions, along with displaying image on school computers and laptop</li>
      <li>worked on implementing the rest of the empty classes and working on the Button class</li>
      <li>fixed merge issues</li>
    </ul><br>
    Jackie: :hatched_chick:
    <br><ul>
      <li>experimented with displaying all images from a folder on the screen (resizing and translation)</li>
      worked with the Button class and changing the camera size as well as taking pictures</li>
      <li>experimented with listing out file names </li>
      <li>downloaded images for testing purposes
    </ul><br>
      <i> Additional Notes: ran into trouble with school computers and webcam</i>
    </td>
  </tr>
  <tr>
    <td>5/21/19</td>
    <td>
    Grace: :octocat:
    <br><ul>
      <li>created new ButtonClass class, added instance variables and method headers to it</li>
      <li>experimented with mouseClick method in order to use button to take a picture</li>
      <li>edited instance variables in Main</li>
    </ul><br>
    Jackie: :hatched_chick:
    <br><ul>
      <li>experimented with setup (including size of screen, size of capture area)</li>
      <li>worked with Grace to move experimental code into Main class (especially the Capture class)</li>
    </ul><br>
      <i>Note: tried to implement mouseClick method in ButtonClass, which didn't work, will be moved to Main</i>
    </td>
  </tr>
  <tr>
    <td>5/22/19</td>
    <td>
    Grace: :octocat:
    <br><ul>
      <li>studied mouseClick documentation and experimented with it (very frustrating!!!)</li>
    </ul><br>
    Jackie: :hatched_chick:
    <br><ul>
      <li>experimented with pseudocode from Processing tutorials to use mouseClick </li>
      <li>added new instance variables and constructors in ButtonClass, defined two new shapes for buttons</li>
      <li>wrote methods in ButtonClass to check if mouse was over a button and/or clicking a button</li>
    </ul><br>
    </td>
  </tr>
  <tr>
    <td>5/24/19</td>
    <td>
    Grace: :octocat:
    <br><ul>
      <li>implemented an ArrayList of buttons in the Main class </li>
      <li>correctly implemented the Button class using the mouseClicked method and moved Jackie's previous code into the Main</li> class
    </ul><br>
    Jackie: :hatched_chick:
    <br><ul>
      <li>adjusted the setup method, experimented with size and shapes </li>
      <li>wrote a method to take screenshots to be saved in the Images folder</li>
    </ul><br>
    </td>
  </tr>
  <tr>
    <td>5/25/19</td>
    <td>
    Grace: :octocat:
    <br><ul>
      <li> updated formatting of README</li>
    </ul><br>
    Jackie: :hatched_chick:
    <br><ul>
      <li>added contracting effect to capture button to be activated upon mouseClick </li>
      <li>adjusted Booth Mode so that only a portion of the screen is captured and saved</li>
    </ul><br>
    </td>
  </tr>
  <tr>
    <td>5/26/19</td>
    <td>
    Grace: :octocat:
    <br><ul>
      <li>taking a well-deserved break :) </li>
      <li>ha very sick</li>
    </ul><br>
    Jackie: :hatched_chick:
    <br><ul>
      <li>regrouped Buttons from different modes in different ArrayLists </li>
      <li>worked in Library Mode to figure out dimensions for displaying images, also added a header</li>
      <li>read documentation for mouseWheel and added scrolling feature</li>
    </ul><br>
    </td>
  </tr>
  <tr>
    <td>5/27/19</td>
    <td>
    Grace: :octocat:
    <br><ul>
      <li>taking a well-deserved break :) </li>
      <li>still sick</li>
    </ul><br>
    Jackie: :hatched_chick:
    <br><ul>
      <li>started formatting edit mode, edited formats of other two modes </li>
      <li>added new type of button (redirect)</li>
      <li>wrote code so that redirect button functioned</li>
      <li>added more images for demonstration purposes</li>
    </ul><br>
    </td>
  </tr>
  <tr>
    <td>5/28/19</td>
    <td>
    Grace: :octocat:
    <br><ul>
      <li>create new buttons to switch between modes</li>
      <li>froze image in booth mode after capturing</li>
      <li>worked on creating save and cancel button (pair programming)</li>
      <li>worked on skeleton code for transitioning from library to editor</li>
      <li>formatted editor mode</li>
    </ul><br>
    Jackie: :hatched_chick:
    <br><ul>
      <li>modified save and cancel button (pair programming)</li>
      <li>transferred methods from main into new classes devote to the three modes</li>
      <li>fixed issue with scrolling when transitioning from library to editor</li>
      <li>fixed issue with resize in editor mode (formatting)</li>
      <li>added new image samples </li>
    </ul><br>
    </td>
  </tr>
  <tr>
    <td>5/29/19</td>
    <td>
    Grace: :octocat:
    <br><ul>
      <li>read very complicated documentation about kernel image processing</li>
    </ul><br>
    Jackie: :hatched_chick:
    <br><ul>
      <li>read very complicated documentation about kernel image processing</li>
      <li>created a few new buttons in booth and editor mode to facilitate the transition between modes</li>
    </ul><br>
    </td>
  </tr>
  <tr>
    <td>5/30/19</td>
    <td>
    Grace: :octocat:
    <br><ul>
      <li>wrote version of convolution and edited the correct version
      </li>
      <li>wrote greyscale and added to filters class</li>
      <li>experimented with different kernels and filters</li>
      <li>tried to fix blurring to make it less subtle</li>
    </ul><br>
    Jackie: :hatched_chick:
    <br><ul>
      <li>wrote the pseudocode for processing every pixel of an image through kernels (convolute method)</li>
      <li>experimented with different kernels and filters</li>
      <li>wrote color filters such as redscale, greenscale and invert</li>
    </ul><br>
    </td>
  </tr>
  <tr>
    <td>5/31/19</td>
    <td>
    Grace: :octocat:
    <br><ul>
      <li>started to implement stickers to appear</li>
      <li>setup the mouseClicked, mousePressed, and mouseReleased for stickers</li>
    </ul><br>
    Jackie: :hatched_chick:
    <br><ul>
      <li>adjusted and created the edit bar for filters, worked on color filter (filterMode 1)</li>
      <li>worked on implementing buttons for each filter</li>
    </ul><br>
    </td>
  </tr>
  <tr>
    <td>6/1/19</td>
    <td>
    Grace: :octocat:
    <br><ul>
      <li>implemented mouse drag of stickers</li>
      <li>created dog sticker button</li>
      <li>fixed bugs so that multiple stickers could be made with the buttons</li>
      <li>user now able to save pictures with the stickers</li>
    </ul><br>
    Jackie: :hatched_chick:
    <br><ul>
      <li>fixed merge errors</li>
    </ul><br>
    </td>
  </tr>
  <tr>
    <td>6/2/19</td>
    <td>
    Grace: :octocat:
    <br><ul>
      <li>debugged stickers and editor mode</li>
      <li>corrected, updated, and made edits to prototype</li>
    </ul><br>
    Jackie: :hatched_chick:
    <br><ul>
      <li>implemented the clickable edit bar with filters and added a filterMode variable</li>
      <li>eliminated extra code</li>
      <li>added a revert button</li>
      <li>modified color filter methods</li>
      <li>added variables and methods to make edit bar navigable with left and right scroll buttons</li>
      <li>added a kernel filterMode to the edit bar (filterMode 2)</li>
    </ul><br>
    </td>
  </tr>
  <tr>
    <td>6/3/19</td>
    <td>
    Grace: :octocat:
    <br><ul>
      <li>worked on editing prototype and started new UML diagram</li>
    </ul><br>
    Jackie: :hatched_chick:
    <br><ul>
      <i> deadline is almost upon us but diamonds are made under pressure :) </i>
      <li>added new kernels that detect horizontal and vertical lines in image, edited existing kernels</li>
      <li>made kernel filterMode clickable/functional</li>
      <li>added functional buttons to navigate between different filterModes in edit bar</li>
      <li>wrote algorithms to change brightness, saturation and contrast of picture</li>
      <li>wrote a new ScrollBar class to be used in adjustments (filterMode 3), referenced HScrollbar documentation on Processing website</li>
      <li>added scrollbars and read values from these scrollbars to change brightness, saturation and contrast of picture (filterMode 3)</li>
      <li>wrote an apply_adj() function that overlays applied filters and adjustments on the image (as opposed to them being mutually exclusive as they were previously)</li>
      <li>created a new apply and reset button in filterMode 3 related to the apply_adj() function</li>
      <li>removed unnecessary files</li>
      <li>experimented with drawing on a PGraphics buffer, referenced documentation</li>
      <li>added a PGraphics buffer on top of to_edit image (filterMode 6)</li>
      <li>added a clickable color palette for draw mode (filterMode 6), also added a clear button to clear all drawings </li>
      <li>added new frame class and added new photo frame images (code very similar to code for loading images in library)</li>
      <li>displayed photo frames in edit bar (filterMode 5) and added buttons underneath</li>
      <li>made buttons clickable to apply a photoframe</li>
      <li>debugged the left, right scroll buttons in edit bar</li>
    </ul><br>
    </td>
  </tr>
  <tr>
    <td>6/4/19</td>
    <td>
    Grace: :octocat:
    <br><ul>
      <li>finished editing prototype and new UML diagram</li>
      <li>found stickers to add to the panel in editor mode</li>
      <li>successfully implemented the sticker panel for all six stickers</li>
      <li>adjusted size of stickers</li>
      <li>fixed order of frames in the editor panel</li>
      <li>adjusted the placement of stickers when first created</li>
    </ul><br>
    Jackie: :hatched_chick:
    <br><ul>
      <li></li>
      <li></li>
    </ul><br>
    </td>
  </tr>
