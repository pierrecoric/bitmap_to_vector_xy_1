void analyse() {
  total = 0;
  analyse.loadPixels();
  for(int a = 0; a<analyse.pixels.length; a++)
  {
  float briga = brightness(analyse.pixels[a]); 
  total += briga;
  }
  analyse.updatePixels();  
  total = total / (analyse.pixels.length );
}
  
