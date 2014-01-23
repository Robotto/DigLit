/*
loads all pictures from 3 folders
goes fullscreen
awaits keypress '1' '2' or '3' and cycles between the pics from the 3 folders

COMBINED WITH:

Grenscreen!
*/


int myWidth=800; //displayWidth
int myHeight=600; //displayHeight
/*
int myWidth=640; //displayWidth
int myHeight=480; //displayHeight
*/


int dragonCounter=0;
int treeCounter=0;
int rocketCounter=0;

PImage[] dragons;
PImage[] trees;
PImage[] rockets;

int numDragonPics; 
int numTreePics;
int numRocketPics;

PImage current_bg;
boolean keypressed=false; 

/*
 *
 * GREENSCREEN VARIABLES:
 *
 */

import processing.video.*;

int numPixels;
int[] imgPixels;

float redfactor=1.7;
float bluefactor=1.5;
Capture video;

void setup(){

  // Change size to 320 x 240 if too slow at 640 x 480
  size(myWidth,myHeight, P2D);
  
  imgPixels = new int[width * height];
  
  video = new Capture(this, width, height);
  numPixels = video.width * video.height;
  
//String dragon_path="C:/Users/bob/Desktop/COMBO/dragons/";
//String tree_path="C:/Users/bob/Desktop/COMBO/trees/";
//String rocket_path="C:/Users/bob/Desktop/COMBO/rockets/";

//DAMN! there's a sketchPath method! :D
String dragon_path = sketchPath("dragons");
String tree_path = sketchPath("trees");
String rocket_path = sketchPath("rockets");

File dragon_dir = new File(dragon_path);
File tree_dir = new File(tree_path);
File rocket_dir = new File(rocket_path);
  
numDragonPics=dragon_dir.list().length;
numTreePics=tree_dir.list().length;
numRocketPics=rocket_dir.list().length;

print(numDragonPics);  
print(" Files in dragons folder: ");
println(dragon_dir.list());

print(numTreePics);
print(" Files in trees folder: ");
println(tree_dir.list());

print(numRocketPics);
print(" Files in rockets folder: ");
println(rocket_dir.list());

dragons = new PImage[numDragonPics];
trees = new PImage[numTreePics];
rockets = new PImage[numRocketPics];

//cycle and load files:
for(int i=0;i<numDragonPics;i++) 
  {
    println("Loading " + dragon_path + dragon_dir.list()[i]);
    dragons[i]=loadImage(dragon_path + dragon_dir.list()[i]);
    dragons[i].resize(myWidth,myHeight);
  }
     
for(int i=0;i<numTreePics;i++) 
  {
    println("Loading " + tree_path + tree_dir.list()[i]);
    trees[i]=loadImage(tree_path + tree_dir.list()[i]);
    trees[i].resize(myWidth,myHeight);
  }
 
for(int i=0;i<numRocketPics;i++) 
  {
    println("Loading " + rocket_path + rocket_dir.list()[i]);
    rockets[i]=loadImage(rocket_path + rocket_dir.list()[i]);
    rockets[i].resize(myWidth,myHeight);
  }
  
 //MORE GREENSCREEN MAGIC:
 video.start(); 
 loadPixels(); 
 
}

void draw() 
{ 
    if (video.available()) 
    {
      video.read(); // Read a new video frame
      video.loadPixels(); // Make the pixels of video available
  
      for (int i = 0; i < numPixels; i++) 
        { // For each pixel in the video frame...
        
          color currColor = video.pixels[i];
      
          float currR = red(currColor);
          float currG = green(currColor);
          float currB = blue(currColor);
      
          float adjR=currR*redfactor;
          float adjB=currB*bluefactor;
           
          //check:
          if(adjR>currG & adjB>currG) pixels[i] = video.pixels[i]; 
          else pixels[i] = imgPixels[i];
        }
      updatePixels(); // Notify that the pixels[] array has changed
    }
    
  if(keypressed)
  {
    background(current_bg);
    current_bg.loadPixels();
    arraycopy(current_bg.pixels, imgPixels);
    keypressed=false;
  }
}

void keyPressed() {
  if (key == '1') current_bg = dragons[dragonCounter++];
  else if (key == '2') current_bg = trees[treeCounter++];
  else if (key == '3') current_bg = rockets[rocketCounter++];

  if(dragonCounter>numDragonPics-1) dragonCounter=0;
  if(treeCounter>numTreePics-1) treeCounter=0;
  if(rocketCounter>numRocketPics-1) rocketCounter=0;

  if(key=='r') redfactor-=0.01;
  if(key=='R') redfactor+=0.01;
  
  if(key=='b') bluefactor-=0.01;
  if(key=='B') bluefactor+=0.01;
  
  print("Red: ");
  print(redfactor);
  print(" Blue: ");
  println(bluefactor);
    
  keypressed=true;
}
/*
boolean sketchFullScreen() {
  return true;
}
*/
