void followDistribueAddLfoPatternLPF(){
  /*
   lfoPattern();
  // automation9 = LPF in Ableton Live
   for (int i = 2; i <  networkSize-0; i+=1) {// networkSize-0

    phaseMapped[i]= map (automation9, 0, 1, 0, TWO_PI); // use varaible phaseMapped (to play movement with time delay or phase delay) to well send it in Teensy  lfoPhase[2]
//    phaseMapped[i]= lfoPhase[2];
    if (phaseMapped[i]<0){
   
    DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);
       }
       
   else
    
    DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep);
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], 0, numberOfStep, 0, TWO_PI);
  }
  for (int i = 2; i < (networkSize-0); i+=1){
    print (" degrees "); print (i);  print (" "); println (degrees (net.phase[i]));
 }
 
 //**** AddABleton  
 
   for (int i = 2; i < networkSize; i+=1) { 

    phaseMapped[i] = phaseMapped[i] + phaseMappedFollow[i]+phasePatternFollow[i];  //phaseMapped[i]+ add offset given by pendularPattern
    phaseMapped[i] = phaseMapped[i]%TWO_PI; 
    
   
    if (phaseMapped[i]<0){
   
     DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
 
    net.oldPhase[i]= net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);
 
       }
       
   else
    
    DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep); 
    net.oldPhase[i]=net.phase[i];

    net.phase[i]= map (DataToDueCircularVirtualPosition[i], 0, numberOfStep, 0, TWO_PI);

  }
 
 // phasePatternToFollow only when a key is pressed

     if (key != '#'  ) {
       
       phasePattern();
            
    for (int i = 2; i < networkSize; i+=1) { 
      print ("  BEFphasePattern phasePattern[i]  ");    print ( phaseMapped[i]  ); 

    phasePatternFollow[i] = net.phase[i];
    phaseMapped[i] =  phaseMapped[i] + phasePatternFollow[i]; // phaseMapped[i] +  //phaseMapped[i]+ add offset given by pendularPattern
    phaseMapped[i] = phaseMapped[i]%TWO_PI; 
    
      print ("  phasePatternFollow  ");    println ( phasePatternFollow[i] ); 
   
   
    if (phaseMapped[i]<0){
   
     DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
   
    net.oldPhase[i]= net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);

       }
       
   else
    
    DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep); 
    net.oldPhase[i]=net.phase[i];

    net.phase[i]= map (DataToDueCircularVirtualPosition[i], 0, numberOfStep, 0, TWO_PI);

  }
 
 } 

  sendToTeensyTurnOnDriver();
  
} 

//  if (formerFormerKey == '#'  || formerKeyMetro == '$'  || formerKeyMetro == '*' ||  formerKeyMetro == '@') { // || formerKeyMetro == '*'
  /* 
      for (int i = 2; i < networkSize-0; i+=1) { 
        
  ////*****  phaseMappedFollow[i] = phaseMapped[i];
 //   phaseMapped[i] = phaseMappedFollow[i]+phaseMapped[i];
   
    if (phaseMapped[i]<0 ){ //&& phaseMappedFollow[i]<0
      
    phaseMapped[i] = phaseMappedFollow[i]-phaseMapped[i];
    DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);
  }
       
    if (phaseMapped[i]>0 ){ // && phaseMappedFollow[i]>0
    phaseMapped[i] = phaseMappedFollow[i]+phaseMapped[i];
    DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep);
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], 0, numberOfStep, 0, TWO_PI);
  }
*/
 }
 
 
 // add ableton to follow
  /*   
    for (int i = 2; i < 3; i+=1) { 
      print ("  BEFlfoPhase[2] phaseMapped[i]  ");    println ( phaseMapped[i]  ); 
 //   phaseMappedFollow[i]= map (signal[2], 0, 1, 0, TWO_PI)+(i+1)*PI/10;
     phaseMappedFollow[i]=   map (ableton[10], 0, 1, 0, TWO_PI); // +(i+1)*PI/10  + map (ableton[4], 0, 1, 0, TWO_PI)*PI/10
   //   phaseMappedFollow[i]= net.phase[i];
    phaseMapped[i] = phaseMapped[i]+ phaseMappedFollow[i]+phasePatternFollow[i];  //phaseMapped[i]+ add offset given by pendularPattern
    phaseMapped[i] = phaseMapped[i]%TWO_PI; 
      print ("  ableton[10]  ");    println ( ableton[10]  ); 
   
    print ("  phaseMapped[i]  ");    println ( phaseMapped[i]  ); 
   
    if (phaseMapped[i]<0){
   
     DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
   //  net.oldPhase[i]=phaseMapped[i];
    net.oldPhase[i]= net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);
 //**    net.phase[i]= phaseMapped[i];
       }
       
   else
    
    DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep); 
    net.oldPhase[i]=net.phase[i];
 //**   net.phase[i]= phaseMapped[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], 0, numberOfStep, 0, TWO_PI);

  }
  
     for (int i = 3; i < 4; i+=1) { 
      print ("  BEFlfoPhase[2] phaseMapped[i]  ");    println ( phaseMapped[i]  ); 
 //   phaseMappedFollow[i]= map (signal[2], 0, 1, 0, TWO_PI)+(i+1)*PI/10;
     phaseMappedFollow[i]=   map (ableton[9], 0, 1, 0, TWO_PI); // +(i+1)*PI/10  + map (ableton[4], 0, 1, 0, TWO_PI)*PI/10
   //   phaseMappedFollow[i]= net.phase[i];
    phaseMapped[i] = phaseMapped[i]+ phaseMappedFollow[i]+phasePatternFollow[i];  //phaseMapped[i]+ add offset given by pendularPattern
    phaseMapped[i] =  phaseMapped[i]%TWO_PI; 
      print ("  ableton[9]  ");    println ( ableton[9]  ); 
   
    print ("  phaseMapped[i]  ");    println ( phaseMapped[i]  ); 
   
    if (phaseMapped[i]<0){
   
     DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
   //  net.oldPhase[i]=phaseMapped[i];
    net.oldPhase[i]= net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);
 //**    net.phase[i]= phaseMapped[i];
       }
       
   else
    
    DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep); 
    net.oldPhase[i]=net.phase[i];
 //**   net.phase[i]= phaseMapped[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], 0, numberOfStep, 0, TWO_PI);

  }
 */