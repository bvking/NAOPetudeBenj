void printModeAndKey()  {
  if ( key!=':' ) {// formerKey!=':' ||  || key=='ç'
     if (  key<65535) { // if there is no SHIFT but the other key
 //   if (formerKeyMetro != 'J') { // if there is no SHIFT but the other key
      formerKey= key;   
      //     formerKeyCodeAzerty = keyCode;
      //       formerKeyCode = keyCode;
    //  }
    }
  }
  if ( keyCode != 0) {// formerKey!=':' ||  || key=='ç'
    //      formerKey= key;   
    formerKeyCodeAzerty = keyCode;
    formerKeyCode = keyCode;
  }
  print (" KEY  ");    
  print  (key); 
  print (" FORMERKEY "); 
  print (formerKey); 
  print (" formerFormerKey "); 
  print (formerFormerKey); 
  print (" FORMERSTARTKEY ");  
  print (formerSartKey);

  print (" KEY  ");    
  print (char(key)); 
  print (" FORMERKEY "); 
  print (char(formerKey)); 
  print (" formerFormerKey "); 
  print (char(formerFormerKey)); 
  print (" FORMERSTARTKEY ");  
  print (char(formerSartKey));
  print (" formerKeyMetro ");  
  println (char(formerKeyMetro));

  print (" KEYCODE  ");    
  print  (keyCode);   
  print (" char KEYCODE  ");    
  print  (char (keyCode));
  print (" former KEYCODE  ");    
  print  (formerKeyCode);   
  print ("char formerKeyCode  ");    
  print  (char (formerKeyCode)); 
  print (" former KEYCODEAZERTY  ");    
  print  (formerKeyCodeAzerty);   
  print ("char formerKeyCodeAZERTY  ");    
  print (char (formerKeyCodeAzerty)); 
  print (" keyMode ");  
  print (keyMode);
  print (" beatTrigged ");  
  print (beatTrigged);
  print ( " mouseRec ");  println (  mouseRecorded );

   }