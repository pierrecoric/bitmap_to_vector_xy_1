void lines_hor(){
  int totalos = 0;
  //two dimensional array for pixels;
  int[][] pixelos = new int[height/res][width/res];
  for(int a = 0; a < height / res; a ++){
    for(int b = 0; b < width / res; b ++){
      analyse = source.get(b*res,a*res,res,res);
      analyse();
      totalos = total;
      analyse = direction.get(b*res,a*res,res,res);
      analyse();
      if (total >= 200) {
        pixelos[a][b]= totalos;
      }
      else {
        pixelos[a][b]= 255;
      }
      
    }
  }
  
  for(int a = 0; a < height / res; a ++){
    for(int b = 0; b < width / res; b ++){
      amount = (float(pixelos[a][b])/255)*max;
      amount = max - amount;
      pixelos[a][b]=int(amount);
    }
  }
  
  //les lignes
  for(int a = 0; a < height / res; a++){
    for(int i = 0; i < res; i++){
      for(int b = 0; b < width/ res; b++){
        
        //detecter le premier point
        if(pixelos[a][b]>i){
          if(traceBegin == true){
            origin = b;
            traceBegin = false; 
            traceExist = true;
          }
        }
        /////
        if(pixelos[a][b]<=i){
          end = b;
          if(traceExist == true){
            line(origin*res,(a*res)+i,end*res,(a*res)+i);
            line(end*res, (a*res)+i, origin*res, (a*res)+i);
            
            traceExist = false;
            traceBegin = true;
           }
         }
         /////
         ///fin de la ligne
      if(b == (width/res) - 1){
        if(traceExist == true){
          end = b+1;
          line(origin*res,(a*res)+i,end*res,(a*res)+i);
          line(end*res, (a*res)+i, origin*res, (a*res)+i);
          traceExist = false;
          traceBegin = true;
        }
      }
 
      }
    }
  }
}
