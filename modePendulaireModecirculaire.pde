void  modePendulaireModeCirculaire() {
  for (int i = 0; i <networkSize-0; i++) {
   
    pushMatrix();

    // ***************************************DATA TO MANAGE SOUND in Processing USELESS
    j[i]= rev[i]%2; // if j==0 the number of revolution is pair, j==1 -->impair, j==-1--> impair and negative
    if (net.naturalFrequency[i] < 0) {
   //   freqi[i] = constrain( map( net.naturalFrequency[i], 0, -5, 200, 16000 ), freqMin, 12000 );
    } else {
   //   freqi[i]=  constrain( map( net.naturalFrequency[i], 0, 5, 200, 16000 ), freqMin, 12000 );
    }
    //**************** TRANSFORM CIRCULAR PHASE INTO METRO PHASE ********* SET AMPLITUDE
    if (formerKeyMetro == '$'  ) { // || trigFollowSampling == true//&& formerSartKey == 'x'//|| formerKeyMetro == 'J'
     text ( " mapped GENERAL pendular way $ ", 400, 600);
      //  println (" you are in $ et non x ");
          net.phase[i]=net.phase[i]%TWO_PI;
      if (net.phase[i] >= PI ) { 
        metroPhase[i]= map( net.phase[i], 0, TWO_PI, 1.5*PI, -0.5*PI);
  //        metroPhase[i]= map( net.phase[i], 0, TWO_PI, PI/2, -PI/2);

      }
      if (net.phase[i] >= 0 && net.phase[i] < PI ) {
        metroPhase[i]= map( net.phase[i], 0, TWO_PI, -0.5*PI, 1.5*PI);
     //metroPhase[i]= map( net.phase[i], 0, TWO_PI, -PI/2, PI/2);
      }
      if (net.phase[i] <= -PI) { 
        metroPhase[i]= map( net.phase[i], 0, -TWO_PI, 1.5*PI, -0.5*PI);
     //  metroPhase[i]= map( net.phase[i], 0, -TWO_PI, PI/2, -PI/2);

      }  
      if (net.phase[i] < 0  && net.phase[i] > -PI) {   
        metroPhase[i]= map( net.phase[i], 0, -TWO_PI, -0.5*PI, 1.5*PI );
     // metroPhase[i]= map( net.phase[i], 0, -TWO_PI, -0.5*PI/2, PI/2 );

      }

      x = displacement*cos(metroPhase[i]);
      y = displacement*sin(metroPhase[i]);
    } 


    if (formerKeyMetro == '$' && (formerSartKey == 'X' || formerSartKey == 'x' ) ) {  // circular to pendular) //|| formerSartKey == 'w' || formerSartKey == 'W'
    if (keyMode != " truc ")  {  
  text ( " mapped SECOND pendular way $ ", 400, 700);
     

      if (net.phase[i] >= 0 && net.phase[i] <= PI ) {
        metroPhase[i]= map( net.phase[i], 0, PI, -HALF_PI, HALF_PI);
      }

      if (net.phase[i] >= PI  && net.phase[i] <= TWO_PI) {   
        metroPhase[i]= map( net.phase[i], PI, TWO_PI, HALF_PI, -HALF_PI );
      }

      if (net.phase[i] <= 0 && net.phase[i] >= -PI ) {
        metroPhase[i]= map( net.phase[i], 0, -PI, HALF_PI, -HALF_PI);
      }

      if (net.phase[i] >= -PI  && net.phase[i] <= -TWO_PI) {   
        //    metroPhase[i]= map( net.phase[i], -PI, -TWO_PI, -HALF_PI, HALF_PI );
      }

      for (int n = 0; n < (1); n++) {// pendular from -800 to 800
/*
        print (" interPhas "); 
        print (memoryi); 
        print (" "); 
        print (interPhase[memoryi]); 
        print (" interPCia "); 
        print (memoryi); 
        print (" "); 
        print (interPhaseCircular[memoryi]);

        print (" metroPhas "); 
        print (memoryi); 
        print (" "); 
        print (metroPhase[memoryi]); 
        print (" meOldPhas "); 
        print (memoryi); 
        print (" "); 
        print (metroOldPhase[memoryi]);

        print (" net.phase "); 
        print (memoryi); 
        print (" "); 
        print (net.phase[memoryi]); 
        print (" netOphase "); 
        print (memoryi); 
        print (" "); 
        println (net.oldPhase[memoryi]);

        print (" interPhas "); 
        print (oldMemoryi); 
        print (" "); 
        print (interPhase[oldMemoryi]); 
        print (" interPCia "); 
        print (oldMemoryi); 
        print (" "); 
        print (interPhaseCircular[oldMemoryi]);

        print (" metroPhas "); 
        print (oldMemoryi); 
        print (" "); 
        print (metroPhase[oldMemoryi]); 
        print (" meOldPhas "); 
        print (oldMemoryi); 
        print (" "); 
        print (metroOldPhase[oldMemoryi]);

        print (" net.phase "); 
        print (oldMemoryi); 
        print (" "); 
        print (net.phase[oldMemoryi]); 
        print (" netOphase "); 
        print (oldMemoryi); 
        print (" "); 
        println (net.oldPhase[oldMemoryi]);
        */
      }  

      x = displacement*cos(metroPhase[i]);
      y = displacement*sin(metroPhase[i]);
    }
   }

    if ((formerKeyMetro == '$' || formerKeyMetro == '*' || formerKeyMetro == '@'  ) && (formerSartKey == 'w' || formerSartKey == 'W' ) ) {  // circular to pendular) //|| formerSartKey == 'w' || formerSartKey == 'W'
    if (keyMode != " truc " ) {   
    
     text ( " mapped to THIRD pendular way 2$ ", 400, 800);
      if (net.phase[i] <= 0 && net.phase[i] >= -PI ) {   
        metroPhase[i]= (map( net.phase[i], 0, -PI, HALF_PI, -HALF_PI));
      }

      if (net.phase[i] <= -PI && net.phase[i] >= -TWO_PI ) {   
        metroPhase[i]= (map( net.phase[i], -PI, -TWO_PI, -HALF_PI, HALF_PI ));
      }

      if (net.phase[i] >= 0 && net.phase[i] <= PI ) {
        metroPhase[i]= (map( net.phase[i], 0, PI, -HALF_PI, HALF_PI));
      }

      if (net.phase[i] >= PI  && net.phase[i] <= TWO_PI) {   
        metroPhase[i]= (map( net.phase[i], PI, TWO_PI, HALF_PI, -HALF_PI ));
      }


      /*  
       if (net.phase[i] <= 0 && net.phase[i] >= -PI ) {
       metroPhase[i]=abs (map( net.phase[i], 0, -PI, HALF_PI, -HALF_PI));
       }
       */
      if (net.phase[i] >= -PI  && net.phase[i] <= -TWO_PI) {   
        //    metroPhase[i]= map( net.phase[i], -PI, -TWO_PI, -HALF_PI, HALF_PI );
      }

      for (int n = 0; n < (1); n++) {// pendular from -800 to 800
/*
        print (" interPhas "); 
        print (memoryi); 
        print (" "); 
        print (interPhase[memoryi]); 
        print (" interPCia "); 
        print (memoryi); 
        print (" "); 
        print (interPhaseCircular[memoryi]);

        print (" metroPhas "); 
        print (memoryi); 
        print (" "); 
        print (metroPhase[memoryi]); 
        print (" meOldPhas "); 
        print (memoryi); 
        print (" "); 
        print (metroOldPhase[memoryi]);

        print (" net.phase "); 
        print (memoryi); 
        print (" "); 
        print (net.phase[memoryi]); 
        print (" netOphase "); 
        print (memoryi); 
        print (" "); 
        println (net.oldPhase[memoryi]);

        print (" interPhas "); 
        print (oldMemoryi); 
        print (" "); 
        print (interPhase[oldMemoryi]); 
        print (" interPCia "); 
        print (oldMemoryi); 
        print (" "); 
        print (interPhaseCircular[oldMemoryi]);

        print (" metroPhas "); 
        print (oldMemoryi); 
        print (" "); 
        print (metroPhase[oldMemoryi]); 
        print (" meOldPhas "); 
        print (oldMemoryi); 
        print (" "); 
        print (metroOldPhase[oldMemoryi]);

        print (" net.phase "); 
        print (oldMemoryi); 
        print (" "); 
        print (net.phase[oldMemoryi]); 
        print (" netOphase "); 
        print (oldMemoryi); 
        print (" "); 
        println (net.oldPhase[oldMemoryi]);
 */       
      }  

      x = displacement*cos(metroPhase[i]);
      y = displacement*sin(metroPhase[i]);
    }
  }


    if (formerKeyMetro == '£' || formerKeyMetro == '*' ) { //&& formerKeyMetro != 'à' && formerKeyMetro != '$'
 text ( " mapped to GENERAL CIRCULAR way 2$ ", 400, 900);
      x = displacement*cos(net.phase[i]);
      y = displacement*sin(net.phase[i]);
    }

    if (formerKeyMetro == 'J') { //USELLL play sample recorded with s
     text ( " mapped to J CIRCULAR or PENDULAR way 2$ ", 400, 1000);

      x = displacement*cos(net.phase[i]);
      y = displacement*sin(net.phase[i]);
  
    }
    if (formerKeyMetro == 's') { //drive ball with lfo
         text ( " mapped to s CIRCULAR or PENDULAR way 2$ ", 400, 1100);


      //    net.phase[i]=net.phase[i]+LFO[i];
      //     net.phase[i]=LFO[i];
      x = displacement*cos(net.phase[i]);
      y = displacement*sin(net.phase[i]);
    }


    if (formerKeyMetro == '<') { //experimental pattern of phases

      //  abstractPhase[networkSize-0-i]=((net.phase[networkSize-0-i+1])+(TWO_PI/(40+i)*net.phase[networkSize-0-i+1])); // faucille
      //***     abstractPhase[networkSize-2-i]=((net.phase[networkSize-2-i+1])+(TWO_PI/(40+i)*net.phase[networkSize-2-i+1])); // faucille      
      //***     net.phase[networkSize-0-i]= abstractPhase[networkSize-0-i];

    }
 
    //end of experimental pattern of phases 
    if (frameCount%15==0) {
      //   print (" abstractPhase[i]: "); print ( networkSize+1-i);  print ("  ") ; print ( net.phase[networkSize+1-i]);
      //   print (" modPos[i]: "); print ( networkSize+1-i);  print ("  ") ; println ( modPos[networkSize+1-i]);
    }

    translate(-w2, -h2, -1000); // Set the perspective 3D with two fingers on the trackpad
    line (250, 250, 250, 250);  // line showing how ball will behang by the motor's axe.
    fill (123);
    //line (0,0,0,0,0, 11*250+200+250); //axe helping the 3D representation. axe qui relie les pendules
    noFill (); 

  //  sphere(side*3); // this sphere serves as a reference
   

    // Color sphere and Draw them, depending of acceleration or later with "chimera state"
    mapAcceleration[i]= constrain ((int (map (abs(net.acceleration[i] *100), 0, 150, 0, 255))), 0, 255); 
    mapAccelerationinversed[i]= abs (int (map ((net.acceleration[i] *100), -200, 200, 0, 255)));
    //********************************************************* BEGIN GRAPHIC CHIMERA STATE
    colorMode(HSB, TWO_PI, 100, 100);
    noStroke();
    // chimera state
    // mouseXY (); // no effect
    // initializeCoupling(net.coupling, sigma);
    /* 
     for (int k = 0; k < numRows; k++) {
     for (int l = 0; l < numCols; l++) {
     int x = l * gridSize;
     int y = k * gridSize;
     int index = k * numCols + l;
     fill(netG.phase[index], 100, 100);
     rect(x, y, gridSize, gridSize);
     }
     } 
     */
    //********************************************************* END GRAPHIC CHIMERA STATE
    translate (x*1, y*1, 200+(50*5*i));  //*-1 go in clockwise, *1 go in CCW
    colorMode(RGB, 255, 255, 255);
//    fill( mapAccelerationinversed[i], 255, 0 ); // Sepheres are all modulated with the same color. depending of acceleration
      fill( 175, 175, 255 );
    if (keyMode == " trigEventWithAbletonSignal " && formerKeyMetro == '$' ) {

               text (  " lIlIlIlI ", -width/4, -height/4 ) ;  

   // metroPhase[i]= metroPhase[i];     
                       
    println ( " metro " + metroPhase[i]  + " formerKeyMetro " + " " + i + " " + char (formerKeyMetro) ); 

      x = displacement*cos(metroPhase[i]);
      y = displacement*sin(metroPhase[i]);
  
    sphere(side*3);
    sphereDetail( 4*5);
    }


     if (formerKeyMetro !='B' ) { //drive ball with lfo
          if (formerKeyMetro != '<' ) {
             if (formerKeyMetro != '@' ) {
                     if (keyMode != " addSignalOneAndTwo " ) {
                         if (keyMode != " addSignalOneAndTwoBis " ) {
                             if (keyMode != " addSignalOneAndTwoTer " ) {
                               if (keyMode != " followDistribueAddLfoPattern " ) {
                                 if (keyMode != " followDistribueAddLfoPatternControl " ) {
                                    if (formerKeyMetro == '*'  && keyMode == " trigEventWithAbletonSignal " ) {  // keyMode == " trigEventWithAbletonSignal " && 
           
                       text (  " lllllll ", -width/4, -height/4 ) ;           
                       
         println ( net.phase[i]  + " formerKeyMetro " + " " + i + " " + char (formerKeyMetro) ); 
      x = displacement*cos(net.phase[i]);
      y = displacement*sin(net.phase[i]);
  
    sphere(side*3);
    sphereDetail( 4*5);
   //  }
     }
     }
     }
     }
    }
       }
      }
    } 
    
       if (formerKeyMetro == 'B' ) { //drive ball with lfo
     fill( 255, 255, 0 ); // Spheres are all modulated with the same color. depending of acceleration
   //   followLFO();  // better to repare
   //  followLFObis(); // same as below
         println (" formerKeyMetro  ", i, " ",  formerKeyMetro );    

      x = displacement*cos(newPosX[i]);
      y = displacement*sin(newPosX[i]);   
      sphere(side*3);
      sphereDetail( 4*5);
  //    followMovementAll();
  //    displayfollowMovementAll();
      }

         if (keyMode == " addSignalOneAndTwoQuater "  ) { //drive ball with lfo
     fill( mapAccelerationinversed[i], 255, 255 ); // Sepheres are all modulated with the same color. depending of acceleration
     fill (100, 155, 100);
    //  x = displacement*cos(net.phase[i]);
    //  y = displacement*sin(net.phase[i]); 
     x = displacement*cos(newPosXaddSignal[i]);   
     y = displacement*sin(newPosXaddSignal[i]);   
      
//      print (" keyMode ", i, " ",  newPosXaddSignal[i] );    
      sphere(side*3);
      sphereDetail( 4*5);
      }
          
       if (keyMode == " addSignalOneAndTwoTer "  ) { //drive ball with lfo
     fill( mapAccelerationinversed[i], 255, 255 ); // Sepheres are all modulated with the same color. depending of acceleration
     fill (100, 155, 255);
      x = displacement*cos(net.phase[i]);
      y = displacement*sin(net.phase[i]);    
//      print (" keyMode ", i, " ",  newPosXaddSignal[i] );    
      sphere(side*3);
      sphereDetail( 4*5);
      }

         if (keyMode == " addSignalOneAndTwoBis "  ) { //drive ball with lfo
     fill( mapAccelerationinversed[i], 255, 255 ); // Sepheres are all modulated with the same color. depending of acceleration
     fill (255, 0 , 255);
    //  x = displacement*cos(newPosXaddSignal[i]);
    //  y = displacement*sin(newPosXaddSignal[i]); 
       x = displacement*cos(net.phase[i]);
       y = displacement*sin(net.phase[i]);    
//      print (" keyMode ", i, " ",  newPosXaddSignal[i] );    
      sphere(side*3);
      sphereDetail( 4*5);
      }
       
       if (keyMode == " addSignalOneAndTwo "  ) { //drive ball with lfo
     fill( mapAccelerationinversed[i], 255, 255 ); // Sepheres are all modulated with the same color. depending of acceleration
    // fill (100, 255, 255);
    //   net.phase[i]=newPosF[i];
      x = displacement*cos(net.phase[i]);
      y = displacement*sin(net.phase[i]); 

 //     print (" keyMode ", i, " ",  newPosXaddSignal[i] );    
      sphere(side*3);
      sphereDetail( 4*5);
      }
      
       if (keyMode == " samplingModeBis "  ) { //drive ball with lfo
     fill( mapAccelerationinversed[i], 255, 255 ); // Sepheres are all modulated with the same color. depending of acceleration
     fill (100, 110, 120);
     samplingMovementPro();
      x = displacement*cos(net.phase[i]); //);
      y = displacement*sin(net.phase[i]);      // display ball in blue lagub
      print (" keyMode ", i, " ",  newPosXaddSignal[i] );    
      sphere(side*3);
      sphereDetail( 4*5);
      }
    
 if ( keyMode == " null " ) {      
    if ( keyMode == " methodAbleton " ) { //drive ball with lfo   
  
    println ( "****************************** DISPLAY ", keyMode );   
    fill (255, 0, 255);
      x = displacement*cos(phaseAbleton[i]); //);
      y = displacement*sin(phaseAbleton[i]);    
      sphere(side*3);
      sphereDetail( 4*5);
      }
      
    if ( keyMode == " signal " ) { //drive ball with lfo
    println ( "****************************** DISPLAY ", keyMode );    
    fill (100, 100 , 255);
      x = displacement*cos(net.phase[i]);
      y = displacement*sin(net.phase[i]);    
      sphere(side*3);
      sphereDetail( 4*5); 
      }
    if ( keyMode == " followDirectLfo " ) { //drive ball with lfo    
      println ( "****************************** DISPLAY ", keyMode );    
      fill (255, 100 , 255);    
      x = displacement*cos(newPosF[i]);
      y = displacement*sin(newPosF[i]);
      net.phase[i]=newPosF[i];   
      sphere(side*3);
      sphereDetail( 4*5);
      } 
      
    if ( modeStartKeyToFollow == " trigEventWithAbletonSignal " ) { //drive ball with lfo    
      println ( "****************************** DISPLAY ", keyMode );   
       text ( formerKeyMetro, 100,100); 
         println ( " formerKeyMetro "  + formerKeyMetro); 
      fill (100, 255 , 255);    
      x = displacement*cos(net.phase[i]);
      y = displacement*sin(net.phase[i]);    
      sphere(side*3);
      sphereDetail( 4*5); 
      }
      
    if ( modeStartKeyToFollow == " followDistribueAddLfoPattern " ) { //drive ball with lfo
     if ( keyMode != " trigEventWithAbletonSignal " ) {
      println ( "****************************** DISPLAY ", keyMode ); 
      text ( char (formerKeyMetro), 100,100);
      fill (100, 255 , 150);    
      x = displacement*cos(newPosF[i]);
      y = displacement*sin(newPosF[i]);
    //  x = displacement*cos(net.phase[i]);
    //  y = displacement*sin(net.phase[i]);   
      sphere(side*3);
      sphereDetail( 4*5); 
      }
     }

    if ( modeStartKeyToFollow == " followDistribueAddLfoPatternControl " ) { //drive ball with lfo
    
   
      println ( "****************************** DISPLAY ", keyMode, controlTrigLfoPattern ); 
    //  text ( " CRL ", 100,100);
      text ( char (formerKeyMetro) , 100,100);
      fill (127, 127 , 255);    
      x = displacement*cos(newPosF[i]);
      y = displacement*sin(newPosF[i]);    
      sphere(side*3);
      sphereDetail( 4*5); 
      }  


    if ( modeStartKeyToFollow  == " followSignalSampledOppositeWay(frameRatio) " || modeStartKeyToFollow  == " samplingModeInternal " 
      || modeStartKeyToFollow  == " followSignalSampled " ) {
        println ( " display modeStartKeyToFollow " + modeStartKeyToFollow + " " + newPosF[i] + " " + i + " check " +  sampledModifiedChecking[i] );

      text ( char (formerKeyMetro) , 100,100);

      fill (255 /(networkSize-i+1), 255, 255 /(25*(i+1)));    
      x = displacement*cos(newPosF[i]);
      y = displacement*sin(newPosF[i]);   
   //    circle ( 100* cos ( interpolatedAngle[0])+400, 100*sin ( interpolatedAngle[0])+400, 200);
   //    circle ( 100* cos ( interpolatedAngle[1])+400, 100*sin ( interpolatedAngle[1])+400, 200);
      sphere(side*3);
      sphereDetail( 4*5); 
      } 

   }                                                                                                                                                                                                                                                                                                                                                                                                                                    
    popMatrix();
  
  }  
  net.step(); 
  netG.step(); //Does it make any meaning?
  
    } 
   }  