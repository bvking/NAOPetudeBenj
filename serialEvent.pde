void serialEvent(Serial encoderReceiveUSBport14101) { // receive 2 datas splited with , and the last is send with println

  // read the serial buffer:
  String myString = encoderReceiveUSBport14101.readStringUntil('\n');

  // if you got any bytes other than the linefeed:
  myString = trim(myString);

  // split the string at the commas
  // and convert the sections into integers:
  int values[] = int(split(myString, ','));
  // GOOD
/*
   if (values.length > 0) {// v1 de 0 a 4000
     
    v0 = (int) map (values[0], 0, 4000, 0, 800)%800;
    v1 = (int) map (values[1], 0, 4000, 0, 800)%800;
    v2 = (int) map (values[2], 0, 4000, 0, 800)%800;
    v3 = (int) map (values[3], 0, 4000, 0, 800)%800;
    v4 = (int) map (values[4], 0, 4000, 0, 800)%800;
    v5 = (int) map (values[5], 0, 4000, 0, 800)%800;
 
      
}
*/
   
  
  //  oldEncodeur[0]= encodeur[0];
    

 


   if (values.length > 0) {// v1 de 0 a 4000

   encodeur[0] = (int) map (values[0], 0, 4000, 0, 800)%800;
   encodeur[1] = (int) map (values[1], 0, 4000, 0, 800)%800;
   encodeur[2] = (int) map (values[2], 0, 4000, 0, 800)%800;
   encodeur[3] = (int) map (values[3], 0, 4000, 0, 800)%800;
   encodeur[4] = (int) map (values[4], 0, 4000, 0, 800)%800;
   encodeur[5] = (int) map (values[5], 0, 4000, 0, 800)%800;
    
 }
 //  printArray(encodeur);  
 // showArray(encodeur); 
}