void lines_vert(){
  int totalos = 0;
  //two dimensional array for pixels;
  int[][] pixelos = new int[height/res][width/res];
  for(int y = 0; y < height / res; y ++){
    for(int x = 0; x < width / res; x ++){
      analyse = source.get(x*res,y*res,res,res);
      analyse();
      totalos = total;
      analyse = direction.get(x*res,y*res,res,res);
      analyse();
      if (total >= 200) {
        pixelos[y][x]= 255;
      }
      else {
        pixelos[y][x]= totalos;
      }
    }
  }
  
  for(int y = 0; y < height / res; y ++){
    for(int x = 0; x < width / res; x ++){
      amount = (float(pixelos[y][x]) / 255) * max;
      amount = max - amount;
      pixelos[y][x] = int(amount);
    }
  }
  
  //les lignes
  for(int x = 0; x < width / res; x++){
    for(int i = 0; i < res; i++){
      for(int y = 0; y < height/ res; y++){
        
        //detecter le premier point
        if(pixelos[y][x] > i){
          if(traceBegin == true){
            origin = y;
            traceBegin = false; 
            traceExist = true;
          }
        }
        /////
        if(pixelos[y][x] <= i){
          end = y;
          if(traceExist == true){
            line((x * res) + i, origin * res, (x * res) + i, end * res);
            line((x * res) + i, end * res, (x * res) + i, origin * res);
            traceExist = false;
            traceBegin = true;
           }
         }
         /////
         ///fin de la ligne
      if(y == (height / res) - 1){
        if(traceExist == true){
          end = y+1;
          line((x * res) + i, origin * res, (x * res) + i, end * res);
          line((x * res) + i, end * res, (x * res) + i, origin * res);
          traceExist = false;
          traceBegin = true;
        }
      }
 
      }
    }
  }
}
