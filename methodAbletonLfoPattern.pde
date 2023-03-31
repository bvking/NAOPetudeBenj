void methodAbleton()  {
   for (int i = 0; i < networkSize; i++) {
     newPosF[i]=phaseAbleton[i]; // to see display phase on screen and count revolution
  
   }
//   countRevsContinue();
  
   for (int i = 0; i < networkSize; i++) {

    phaseAbleton[i]= map (ableton[i], 0, 1, 0, TWO_PI);  // display in main loop
   
    phaseAbleton[networkSize-1]= map (automationLFO[networkSize-1] , 0, 1, 0, TWO_PI);  // display in main loop
   
    phaseAbleton[i]= constrain (phaseAbleton[i], 0, TWO_PI);
// oldPhaseAbleton[i] = phaseAbleton[i];
 
//  ableton[i]= map (ableton[i], 0, TWO_PI, 0, numberOfStep);  
//  DataToDueCircularVirtualPosition[i] = (int) ableton[13-i];
   }
   
     countRevsContinue();
      
      
   for (int i = 0; i < networkSize; i++) {
  //   newPosF[i]=phaseAbleton[i];
 
     oldPosF[i]=newPosF[i];
     net.phase[i]=phaseAbleton[i]; // trig data from arduinoPos to Oscsend

      //*******************************  ASSIGN MOTOR WITH POSITION

      if (rev[i]!=0  && (newPosF[i] >  0) ) { // number of revolution is even and rotation is clock wise   
        pos[i]= int (map (newPosF[i], 0, TWO_PI, 0, numberOfStep))+ (rev[i]*numberOfStep);
      }

      if (rev[i]!=0  && (newPosF[i] <  0)) { // number of revolution is even and rotation is Counter clock wise          // pos[i]= int (map (net.phase[i], 0, -TWO_PI, 0,  numberOfStep))+ (rev[i]*numberOfStep);
        pos[i]= int (map (newPosF[i], 0, -TWO_PI, numberOfStep, 0)) +(rev[i]*numberOfStep);       //   print ("pos "); print (i); print (" ");println (pos[i]);
      }

      if (rev[i]==0 && (newPosF[i] < 0) ) { //  number of revolution is 0 and rotation is counter clock wise 
        pos[i]= int (map (newPosF[i], 0, -TWO_PI, numberOfStep, 0));        
      }         
      if (rev[i]==0 && (newPosF[i] > 0) ) {  //  number of revolution is 0 and rotation is clock wise     
        pos[i]= int (map (newPosF[i], 0, TWO_PI, 0, numberOfStep));                //      print ("pos "); print (i); print (" CW rev=0 ");println (pos[i]);
      }
      DataToDueCircularVirtualPosition[i]= (int) pos[i];
            
    }
  
   send24DatasToTeensy6motors( 7, 3, -3, -1); 

  } 
  
void lfoPattern(){

   if (formerKeyMetro == 'c') {   //followsignalLfo signal 10 et signal 11 from 0 to 1
   
     signal[4] = (0*PI + (frameCount / 300.0) * cos (1000 / 500.0)*-1)%1;
    
     signal[5] = (0*PI + (frameCount / 30.0) * cos (1000 / 500.0)*-1)%1;  // ==> 15 = 8 sec
    
      println (" pattern cccccccc ",   " signal[10] ", signal[10],   " signal[11] ", signal[11]); 
      
    lfoPhase[1] = (0*PI + (frameCount / 25.0) * cos (1000 / 500.0)*-1)%TWO_PI;
    
    lfoPhase[2] = (PI + (frameCount / 10.0) * cos (1000 / 500.0)*-1)%TWO_PI;  // ==> 15 = 8 sec
    
    lfoPhase[3] = map ((((cos  (frameCount / 10.0))*-1) %2), -1, 1, -TWO_PI, TWO_PI);  // sinusoida
 
    signalToSplit= lfoPhase[3];
    
    
    println (" pattern cccccccc ", lfoPhase[1], "lfoPhase[2] ", lfoPhase[2], "lfoPhase[3]= signalTosplit ", lfoPhase[3]); 

  }
  
  else if (formerKeyMetro != 'c') { 
     signal[2] = (0*PI + (frameCount / 300.0) * cos (1000 / 500.0)*-1)%1;
    
     signal[3] = (0*PI + (frameCount / 300.0) * cos (1000 / 500.0)*-1)%1;  // ==> 15 = 8 sec
  
    lfoPhase[1] = (0*PI + (frameCount / 50.0) * cos (1000 / 500.0)*-1)%TWO_PI;
    
    lfoPhase[2] = (PI + (frameCount / 5.0) * cos (1000 / 500.0)*-1)%TWO_PI;  // ==> 15 = 8 sec
 // propagationSpeed
 propagationSpeed=200;
  //  lfoPhase[3] = map (( cos  (frameCount / propagationSpeed) %TWO_PI), 0, 1, 0, TWO_PI);  // sinusoid  //  lfoPhase[3] = map (( cos  (frameCount / 22.0) %TWO_PI), 0, 1, -TWO_PI, TWO_PI);
    
        lfoPhase[3] = map ((((cos  (frameCount / 20.0))*-1) %2), -1, 1, -TWO_PI, TWO_PI);  // sinusoida

    signalToSplit= lfoPhase[3];
    
  //  println (" pattern lfoPhase[1] ", lfoPhase[1], "lfoPhase[2] ", lfoPhase[2], "lfoPhase[3] ", lfoPhase[3]);
     text (" propagationSpeed " + propagationSpeed + " key " + key, -width + 1000, -height- 0 );

    
    }
}

 
