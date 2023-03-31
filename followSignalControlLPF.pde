void followDistribueAddLfoPatternControlLPF(){
  
  lfoPattern();
   for (int i = 2; i <  net.size()-0; i+=1) {// net.size()-0
 //    print (net.oldPhase[i]); print (" 12448 ");   println (net.phase[i]); 
 //   net.oldPhase[i]=phaseMapped[i];
 //   phaseMapped[i]= map (signal[2], 0, 1, 0, TWO_PI); // use varaible phaseMapped (to play movement with time delay or phase delay) to well send it in Teensy  lfoPhase[2]
  phaseMapped[i]= map (automation9, 0, 1, 0, TWO_PI);
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
  for (int i = 2; i < (net.size()-0); i+=1){
    print (" degrees "); print (i);  print (" "); println (degrees (net.phase[i]));
 }
   
  if (formerFormerKey == '#'  || formerKeyMetro == '$'  || formerKeyMetro == '*' ||  formerKeyMetro == '@') { // || formerKeyMetro == '*'
    
      for (int i = 2; i < net.size()-0; i+=1) { 
        
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
 }
 
 
  // phasePatternToFollow only when a key is pressed

 //    if (formerFormerKey != '#'  ) {
   
    if (Key != '#'  ) {
       
       phasePattern();
            
    for (int i = 2; i < net.size(); i+=1) { 
      print ("  BEFphasePattern phasePattern[i]  ");    print ( phaseMapped[i]  ); 

    phasePatternFollow[i] = net.phase[i];
  //  phaseMapped[i] = phaseMapped[i] + phasePatternFollow[i];  //phaseMapped[i]+ add offset given by pendularPattern
    phaseMapped[i] = phaseMapped[i]%TWO_PI; 
    
      print ("  phasePatternFollow  ");    println ( phasePatternFollow[i] ); 
   
   
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

 } 
//END AddphasePatternToFollow only when a key is pressed

// Begin take off phase after 1000 ms
  
/*
       if (millis()>=controlTrigLfoPattern+2000  ) { // controlTrigLfoPattern
    
       println ("  controlTrigLfoPatternIN  ", controlTrigLfoPattern);
    
    phasePattern();
            
    for (int i = 2; i < net.size(); i+=1) { 
//      print ("  BEFphasePattern phasePattern[i]  ");    print ( phaseMapped[i]  ); 

    phasePatternFollow[i] = phaseMapped[i];
    phaseMapped[i] = phaseMapped[i] - phasePatternFollow[i];  //phaseMapped[i]+ add offset given by pendularPattern
    phaseMapped[i] = phaseMapped[i]%TWO_PI; 
    
//      print ("  phasePatternFollow  ");    println ( phasePatternFollow[i] ); 
   
   
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
}  
 */
  sendToTeensyTurnOnDriver();
 }  
} 
