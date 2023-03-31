void followSignalSampled(int ratioTimeFrame){
  rotate (-PI/2-PI);
  text ( " followSignalSampled ", 400, 400 );
  rotate (PI/2+PI);
 
  int delayRatio=ratioTimeFrame;

//samplingMovement(2);
  samplingMovementPro();
  keyReleasedfollowSignal();
  
  println(frameCount + ": " + ( debug ));

  if (!firstFollowingStarted) {
    float angle = diffAngle(PI + (frameCount / 4.0) * cos (1000 / 500.0), 0);
    LFO[2]= map (automation3, 0, 1, 0 , TWO_PI); // signal not used here
  }
  float deltaFollow = PI/180;


 
//**   drawBall(0, phases[0][frameCount % nbMaxDelais]); // affiche le point 0. NE PAS AFFICHER SINON IL APPARAIT EN DOUBLE


  


// ***** MAP movementInterpolated IN good WAY**********
/*
       if (movementInterpolated<0) {
 
    DataToDueCircularVirtualPosition[0]= int (map (movementInterpolated, 0, -TWO_PI, numberOfStep, 0)); 
    net.oldPhase[0]=net.phase[0];
   //*** net.phase[0]= map (DataToDueCircularVirtualPosition[0], numberOfStep, 0, 0, -TWO_PI);
   movementInterpolated = map (DataToDueCircularVirtualPosition[0], numberOfStep, 0, 0, -TWO_PI);
  
  //  net.phase[0]= net.phase[0]%TWO_PI;
     print (" movInter <0 "); print (2);  print ("  "); print ( net.phase[0]);
//   phaseMapped[i] = net.phase[i];
   //  movementInterpolated = net.phase[0];

//    phaseMapped[i]= TWO_PI- (phases[i-2][frameCountBis % nbMaxDelais]); // use varaible phaseMapped (to play movement with time delay or phase delay) to well send it in Teensy
  //  phaseMapped[i] =  phaseMapped[i]%TWO_PI; 
   // drawBallOppositeWay(  i, phases[i+0][frameCountBis % nbMaxDelais] );
    print ("  movInter<0  "); print (2); print ( " ");   println (  movementInterpolated  ); 
}
   
 
  else  {
  
    DataToDueCircularVirtualPosition[0]= (int) map (movementInterpolated, 0, TWO_PI, 0, numberOfStep);
    net.oldPhase[0]=net.phase[0];
   // net.phase[0]= map (DataToDueCircularVirtualPosition[0], 0, numberOfStep, 0, TWO_PI);
    movementInterpolated= map (DataToDueCircularVirtualPosition[0], 0, numberOfStep, 0, TWO_PI);

  //  net.phase[0]= net.phase[0]%TWO_PI;
   // movementInterpolated = net.phase[0];
    print (" movInter>0 "); print (2);  print ("  "); println ( movementInterpolated);
} 

   //  phases[0][frameCount % nbMaxDelais]=  net.phase[0]; //movementInterpolated;
  phases[0][frameCount % nbMaxDelais]=  movementInterpolated;

  drawBall(0, phases[0][frameCount % nbMaxDelais] );
*/
 // ***** MAP movementInterpolated IN good WAY**********
   phases[0][frameCount % nbMaxDelais]=  movementInterpolated;



   for (int i = 1; i <11 ; i+=1) {  //
    debug ="Normal follow sampled frameMode";
   //    follow( i-1, i, 20 * 0, 0);  // Modifier les deux derniers paramètres : délais et phase
    follow( i-1, i, delayTimeFollowPhase11*frameRatio/ratioTimeFrame, phaseShiftingFollowPhase11);  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6

    //*****   drawBall(i, phaseMapped[i] );
   //drawBall(i, phases[i][frameCount % nbMaxDelais] );

  }

 
  for (int i = 0; i <  networkSize-0; i+=1) {// networkSize-0

    phaseMapped[i]=phases[i-0][frameCount % nbMaxDelais]; // use varaible phaseMapped (to play movement with time delay or phase delay) to well send it in Teensy
 
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

 

 
  if (formerFormerKey == '#' || formerKeyMetro == 'J') {
    
      for (int i = 0; i < networkSize-0; i+=1) { 
        
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
 
 
    if (formerFormerKey != '#' ) {
    if (formerKeyMetro == 'J' ) {
     phasePattern();
     
    for (int i = 0; i < networkSize-0; i+=1) { 
   //   print ("  BEF phaseMapped[i]  ");    println ( phaseMapped[i]  ); 
    phaseMappedFollow[i]= net.phase[i];
    phaseMapped[i] =  phaseMapped[i]+phaseMappedFollow[i];  // add offset given by pendularPattern
    phaseMapped[i] =  phaseMapped[i]%TWO_PI; 
   // print ("  phaseMapped[i]  ");    println ( phaseMapped[i]  ); 
   
    if (phaseMapped[i]<0){
   
     DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
   //  net.oldPhase[i]=phaseMapped[i];
    net.oldPhase[i]= net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);
    net.phase[i]= phaseMapped[i];
       }
       
   else
    
    DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep); 
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= phaseMapped[i];
       net.phase[i]= map (DataToDueCircularVirtualPosition[i], 0, numberOfStep, 0, TWO_PI);


   }
  }


 }
 
 
  sendToTeensyTurnOnDriver();
  }  

} 
