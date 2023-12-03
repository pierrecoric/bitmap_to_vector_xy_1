//Libraries.
import processing.svg.*;
import java.util.*;

//Declaration of different images.
PImage source;
PImage direction;
PImage analyse;

//Global variable to track the brightness of an area.
int total;

//Res = the size of square defining an area of analyze. 
//The bitmap image is divided in a grid where each cell is res wide and tall, the luminosity of each of these cells is analyzed and replaced by lines.
int res = 10;
//Max = max amount of lines in the area defined by res.
int max = 10;

//Definition of the amount of lines.
float amount;

//Variables to plan the drawing of the lines.
int origin;
int end;
boolean traceBegin = true;
boolean traceExist = false;

//Bitmap file to turn into vector.
String file = "src.jpg";
//File for the direction of the lines. black = vertical, white = horizontal.
String directionFile = "dir.png";

//name for the export
String exportName = "export";

void setup()
{
  background(255);
  //dimensions of the output image
  //has to match the ration of the source
  size(1000,1000);
  source = loadImage("source/" + file);
  //resize the source just in case
  source.resize(width,height);
  direction = loadImage("source/" + directionFile);
  direction.resize(width,height);
  noFill();
  beginRecord(SVG, "exports/" + exportName + ".svg");
  //draw a rectangle around the whole image
  rect(0,0,width,height);
  lines_hor();
  lines_vert();
  endRecord();
}
