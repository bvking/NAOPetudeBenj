void followSignalSampledLPF(int ratioTimeFrame){ // from followSignalLfo
  
  int delayRatio=ratioTimeFrame;

//samplingMovement(2);
  samplingMovementPro();
//  keyReleasedfollowSignal();
  
  println(frameCount + ": " + ( debug ));
//  background(0); 
  
//  rotate(- TWO_PI+ HALF_PI  ); //TO change the beginning of the 0 (cercle trigo) and the cohesion point to - HALF_PI
//  translate(width/2-400, -height/2, -1000);// To set the center of the perspective

  if (!firstFollowingStarted) {
    float angle = diffAngle(PI + (frameCount / 4.0) * cos (1000 / 500.0), 0);

//    print ("angle ");
//    println ( angle );
    
    LFO[2]= map (automation3, 0, 1, 0 , TWO_PI); // signal not used here

//**   phases[0][frameCount % nbMaxDelais]= net.phase[networkSize-1];
//**   phases[0][frameCount % nbMaxDelais]= movementInterpolated;
    float LPF= map (automation9, 0, 1, 0 , TWO_PI); // from Ableton
    phases[0][frameCount % nbMaxDelais]=LPF;
//**   drawBall(0, phases[0][frameCount % nbMaxDelais]); // affiche le point 0. NE PAS AFFICHER SINON IL APPARAIT EN DOUBLE
  }

  float deltaFollow = PI/180;

  for (int i = 1; i <networkSize-1 ; i+=1) {  //
    debug ="Normal follow sampled ";
    //   follow( i-1, i, 20 * i, 0);  // Modifier les deux derniers paramètres : délais et phase
   follow( i-1, i, delayTimeFollowPhase11*frameRatio/ratioTimeFrame, phaseShiftingFollowPhase11);  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6

    //*****   drawBall(i, phaseMapped[i] );
 //  drawBall(i, phases[i][frameCount % nbMaxDelais] );

  }

  /*
   for(int i = 0; i < nbBall; i++) { //Animation brute sans suivi, juste avec une formule
   //drawBall(i, PI + (i * frameCount / 50.0) * cos (frameCount / 500.0) );
   }*/  // A COMPRENDRE

  if (frameCount > nbMaxDelais/10 && firstFollowingLast == true && abs(diffAngle(phases[0][frameCount % nbMaxDelais], phases[nbBall-1][frameCount % nbMaxDelais])) < deltaFollow ) {
    colorMode(RGB, 255, 255, 255);
    fill( 0, 0, 255 );
 //   println("diffangle" + ": " + diffAngle(phases[0][frameCount % nbMaxDelais], phases[nbBall-1][frameCount % nbMaxDelais]));
//    firstFollowingStarted = true;
    debug ="First follow last";
 //   firstFollowingLast = false;
    println (debug);
  }

  if (firstFollowingStarted) {
    colorMode(RGB, 255, 255, 255);
    fill( 255, 0, 0 );
    debug ="firstFollowingStarted";
  //**  follow(nbBall-1, 0, delayTimeFollowPhase11*frameRatio/ratioTimeFrame , phaseShiftingFollowPhase11);  // Modifier les deux derniers paramètres : délais et phase  delayTimeFollowPhase11, 
  //***  drawBall(0, phases[0][frameCount % nbMaxDelais]);
 //   println ("PHASE MAPPED firstFollowing ");
 //   println("diffangle" + ": " + diffAngle(phases[0][frameCount % nbMaxDelais], phases[nbBall-1][frameCount % nbMaxDelais]));
    
  }
  
 
  for (int i = 0; i <  networkSize-0; i+=1) {// networkSize-0
 //    print (net.oldPhase[i]); print (" 12448 ");   println (net.phase[i]); 
 //   net.oldPhase[i]=phaseMapped[i];
   // phaseMapped[i] = phases[i-2][frameCount % nbMaxDelais]; // JUST ADDED
   phaseMapped[i] = phases[i-0][frameCount % nbMaxDelais]; // JUST ADDED
    phaseMapped[i] = phaseMapped[i] + phaseMappedFollow[i]+phasePatternFollow[i];  // JUST ADDED
    phaseMapped[i] = phaseMapped[i]%TWO_PI; 

 
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

   
  // phasePatternToFollow only when a key is pressed

     if (key != '#'  ) {
       
       phasePattern();
            
    for (int i = 0; i < networkSize; i+=1) { 
 

    phasePatternFollow[i] = net.phase[i];
    phaseMapped[i] =  phaseMapped[i] + phasePatternFollow[i]; // phaseMapped[i] +  //phaseMapped[i]+ add offset given by pendularPattern
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
 
 } 
//END phasePatternToFollow only when a key is pressed
 
 send24DatasToTeensy6motors(10, 3, -3, -1);
} 
