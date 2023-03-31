void followSignalLfo(int ratioTimeFrame, float signal0to1){  // original   followSignal (decay time with millis)
 // splitTimeLfo();
  splitTime();
  lfoPattern();
//  lfoPhase[2];q
  
if (formerDecayTime>decayTime){
  frameCountBis=frameCountBis+1;
  } 
  formerDecayTime = decayTime;
  decayTime = millis()%100;// incremente frameCountBis+1 each 100 millisecondes
 
  int delayRatio=ratioTimeFrame;
  float signalToFollow=signal0to1;

      keyReleasedfollowSignal();
      float deltaFollow = TWO_PI; // not used
     //here in a previous function we could change the ball followed if the space of phase between phases[0] and phase 9 is more than 360° for example

  //    phases[0][frameCountBis % nbMaxDelais]= net.phase[net.size()-1]-0;

  //    phases[0][frameCountBis % nbMaxDelais]= map (signal[10], 0, 1, 0, TWO_PI);
 //    phases[0][frameCountBis % nbMaxDelais]= map (automation9, 0, 1, 0, TWO_PI);  // receive LPF
     phases[0][frameCountBis % nbMaxDelais]= map (signal0to1, 0, 1, 0, TWO_PI);  // receive LPF
        
        println ( "++++++++++++++++++++++ signal 10 ", phases[0][frameCountBis % nbMaxDelais]);
  //    drawBallOppositeWay(0, phases[0][frameCountBis % nbMaxDelais]); //net.size()-5 affiche le point 0. NE PAS AFFICHER SINON IL APPARAIT EN DOUBLE


    for (int i = 1; i < networkSize; i+=1) { // 1 follow phase 0
//    debug ="Normal follow opp2Way "; print (" iopp2Way 0 "); print (i-1);  print ("  "); println (phases[i-1][frameCountBis % nbMaxDelais]);
 //   print (i);  print ("  "); print (phases[i][frameCountBis % nbMaxDelais]); print (" 0 ");  print ("  "); print (phases[i][frameCountBis % nbMaxDelais]);
//    print (" net.phase 11 ");  print (" =0?  "); println (net.phase[net.size()-1]-0);
    
    //   follow( i-1, i, 20 * i, 0);  // Modifier les deux derniers paramètres : délais et phase
    followOppositeWay( i-1, i+0, delayTimeFollowPhase11*1*frameRatio/ratioTimeFrame, (phaseShiftingFollowPhase11));  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6

    //*****   drawBall(i, phaseMapped[i] );
    drawBallOppositeWay( i, phases[i+0][frameCountBis % nbMaxDelais] );

  }
  
//***  println(frameCount + ": " + ( debug ), " map (signal[10], 0, 1, 0, TWO_PI) ", map (signal[10], 0, 1, 0, TWO_PI), " map (signal[11], 0, 1, 0, TWO_PI) ", map (signal[11], 0, 1, 0, TWO_PI));


 
   for (int i = 2; i < networkSize; i+=1) {// display ball   (nbBall/2)-0; i < nbBall; i++   for (int i = 3; i < net.size()-0; i+=1) {
 //    print (net.oldPhase[i]); print (" 12448 ");   println (net.phase[i]); 
 //   net.oldPhase[i]=phaseMapped[i];
    phaseMapped[i]=phases[i-2][frameCountBis % nbMaxDelais]; // use varaible phaseMapped (to play movement with time delay or phase delay) to well send it in Teensy
  //  phaseMapped[i] =  phaseMapped[i]%TWO_PI; 
  }
 

  if (formerFormerKey == '#' ) {
  
      for (int i = 2; i < networkSize-0; i+=1) { 
        
  ////*****  phaseMappedFollow[i] = phaseMapped[i];
 //   phaseMapped[i] = phaseMappedFollow[i]+phaseMapped[i];
   
    if (phaseMapped[i]<0){
      
    phaseMapped[i] = phaseMappedFollow[i]+phaseMapped[i];
    DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);
  }
       
   else
    phaseMapped[i] = phaseMappedFollow[i]-phaseMapped[i];
    DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep);
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], 0, numberOfStep, 0, TWO_PI);
  }
 }
   
   
    if (formerFormerKey != '#' ) {
    
    if (formerKeyMetro == '*' || formerKeyMetro == '$'  ) {
    //    if (oscillatorChanged==true )  { 
       
       phasePattern();
       lfoPattern();
     
  // for (int i = 2; i < net.size()-0; i+=1) { 
 //     print ("  BEF phaseMapped[i]  ");    println ( phaseMapped[oscillatorChange]  ); 
 //   phaseMappedFollow[oscillatorChange]= map (signal[11], 0, 1, 0, TWO_PI);
 //    phaseMappedFollow[oscillatorChange]= -1*map (0.01, 0, 1, 0, TWO_PI); //CONSTANT  // ADD NOTE
    phaseMappedFollow[oscillatorChange]= map (0.01, 0, 1, 0, TWO_PI); //CONSTANT  // ADD NOTE
    phaseMapped[oscillatorChange] =  phaseMapped[oscillatorChange]+phaseMappedFollow[oscillatorChange];  // add offset given by pendularPattern
    phaseMapped[oscillatorChange] =  phaseMapped[oscillatorChange]%TWO_PI; 
  //**  print ("  signal 11  ");    println ( phaseMapped[oscillatorChange]  ); 
  //***  println ("  phaseMapped[i]  ");    println ( phaseMapped[oscillatorChange]  ); 
    
     for (int i = 2; i < networkSize; i+=1) { 
    if (phaseMapped[i]<0){
   
     DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
     net.oldPhase[i]=phaseMapped[i];
     net.phase[i]= phaseMapped[i];
       }
       
   else
    
     DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep); 
     net.oldPhase[i]=phaseMapped[i];
     net.phase[i]= phaseMapped[i];
 }
   }
  }
 //  }
  
  //******** Lock last oscillator to the lastPhase
  
   if (formerFormerKey  != '#' ) { //  works always
 //   if (formerFormerKey  != 'c' ) { // do not work
 //**    print ("  normalformerFormerKey not equal # " + frameCount + " lfoPhase[1] " + lfoPhase[1] + " lfoPhase[2] " + lfoPhase[2]);    println (   ); 
       
  int i;
  i= oscillatorChange;
    
 
 
   //   LFO[i] = lfoPhase[1]; 
   //   LFO[i] =  map (signal[11], 0, 1, 0, PI/4);
    
 //  LFO[i] = 1* map (0.025, 0, 1, 0, TWO_PI);  // CONSTANT SHIFT BETWEEN OSCILLATOR
 //        
 
    //           LFO[i] =  map (0.025, 0, 1, 0, TWO_PI);  // CONSTANT SHIFT BETWEEN OSCILLATOR

      //     LFO[i] =  map (0.003, 0, 1, 0, TWO_PI);  // CONSTANT SHIFT BETWEEN OSCILLATOR
  
  // to CONTROL OMOTOR
  
 
 // ABOVE LFO on oscillatorChange
 // BELOW MOVE by ODD ?
 /*
   if (LFO[oscillatorChange]<0 && phaseFollowLFO[oscillatorChange]<0 ) {        
       LFO[oscillatorChange] =   phaseFollowLFO[oscillatorChange]-LFO[oscillatorChange]; 
       dataMappedForMotor[oscillatorChange]= int (map (LFO[oscillatorChange], 0, -TWO_PI, numberOfStep, 0)); 

       net.phase[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], numberOfStep, 0, 0, -TWO_PI);
  }
 
       
   else if (LFO[oscillatorChange]>0 && phaseFollowLFO[oscillatorChange]>0 ) {      
       LFO[oscillatorChange] = phaseFollowLFO[oscillatorChange]; // +LFO[oscillatorChange];
       LFO[oscillatorChange] = LFO[oscillatorChange]%TWO_PI;
       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI, 0, numberOfStep);

       net.phase[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
    
    }
 */  
    
  }

//***    println (" newPosXaddoscillatorChange] ",  oscillatorChange, " ",  newPosXaddSignal[oscillatorChange] );


  
  int j;  
  j= (oscillatorChange-1);
  if (j<= -1){
  j= networkSize-1;
  }
  
  int k;  
  k= (j-1);
  if (k<= -1){
  k= networkSize-1;
  }
  
  int l;  
  l= (k-1);
  if (l<= -1){
  l= networkSize-1;
  }
  
  int m;  
  m= (l-1);
  if (m<= -1){
  m= networkSize-1;
  }
      
  if (oscillatorChanged==true )  { 
    int i;
    i= oscillatorChange;
    if ( phaseKeptAtChange[j]<0){   
   //  LFO[i] = LFO[i] - phaseKeptAtChange[j];
    LFO[j] = phaseKeptAtChange[j];
       dataMappedForMotor[j]= int (map (LFO[j], 0, -TWO_PI, numberOfStep, 0)); 

       net.phase[j]= map (dataMappedForMotor[j], numberOfStep, 0, 0, -TWO_PI);
    //   phaseKeptAtChange[j]
  }
       
   else
 
  // LFO[i] = LFO[i]+ phaseKeptAtChange[j];
    LFO[j] = phaseKeptAtChange[j];

       LFO[j] = LFO[j]%TWO_PI;
       dataMappedForMotor[j]= (int) map (LFO[j], 0, TWO_PI, 0, numberOfStep);

       net.phase[j]= map (dataMappedForMotor[j], 0, numberOfStep, 0, TWO_PI);
   
    phaseKeptAtChange[oscillatorChange]=net.phase[oscillatorChange];    //  RECORD on oscillatorChange-1 the postion of oscillatorChange where it has just changed
     
 //    phaseMappedFollow[oscillatorChange]=net.phase[oscillatorChange]; 

  
  
   }
  
   
 //  else key='&';
   
  //**    print (" phaseKeptAtChange[o] ",  oscillatorChange, " ",  phaseKeptAtChange[oscillatorChange] );
      
  //***    println (  " phaseKeptAtChange[k] " , k, " ",  phaseKeptAtChange[k] , " phaseKeptAtChange[j] " , j, " ",  phaseKeptAtChange[j] );
      
  //     LFO[m] = (LFO[m]+map (signal[2], 0, 1, 0, PI/4))%TWO_PI;
  //**     dataMappedForMotor[m]= (int) map (LFO[m], 0, TWO_PI, 0, numberOfStep);
       
   //**    net.phase[m]= map (dataMappedForMotor[m], 0, numberOfStep, 0, TWO_PI);
      
    //   LFO[l] = phaseKeptAtChange[l];
       LFO[l] = LFO[l]%TWO_PI;
       dataMappedForMotor[l]= (int) map (LFO[l], 0, TWO_PI, 0, numberOfStep);
            
       net.phase[l]= map (dataMappedForMotor[l], 0, numberOfStep, 0, TWO_PI);
 
      
//***        LFO[k] = LFO[j]+PI/(15-j)+map (signal[3], 0, 1, 0, TWO_PI);
  //    LFO[k] = phaseKeptAtChange[k]+PI/8;  les redressent de temps en temps
  //***     LFO[k] = LFO[k]%TWO_PI;
  //***     dataMappedForMotor[k]= (int) map (LFO[k], 0, TWO_PI, 0, numberOfStep);
  
  //****        LFO[k] = LFO[j]+PI/(15-k)+map (signal[3], 0, 1, 0, TWO_PI);
  //     LFO[k] = phaseKeptAtChange[k]-PI/8; // ADD SOME SPACE WITH GENERAL ROTATION
 //   LFO[k] = phaseKeptAtChange[k]; //DO NO THING

       LFO[k] = LFO[k]%TWO_PI;
       dataMappedForMotor[k]= (int) map (LFO[k], 0, TWO_PI, 0, numberOfStep);
 
      
       net.phase[k]= map (dataMappedForMotor[k], 0, numberOfStep, 0, TWO_PI);
      
  ///*****     LFO[j] = phaseKeptAtChange[j]+PI/(15-j)+map (signal[3], 0, 1, 0, TWO_PI);
    //**   LFO[j] = phaseKeptAtChange[j]-PI/8;  //ADD SOME SPACE WITH GENERAL ROTATION
  //*** LFO[j] = phaseKeptAtChange[j];  //DO NO THING
       LFO[j] = LFO[j]%TWO_PI;
       dataMappedForMotor[j]= (int) map (LFO[j], 0, TWO_PI, 0, numberOfStep);
  //     println (" phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oscillatorChange]);
       net.phase[j]= map (dataMappedForMotor[j], 0, numberOfStep, 0, TWO_PI);
       
      
  //******** END  Black last oscillator to the lastPhase
 // key ='#'; 
 
   if (keyCode == BACKSPACE ) {
    
      for (int i = 0; i < networkSize-0; i+=1) { 
        println (" ALIGN MTF " );
        
  ////*****  phaseMappedFollow[i] = phaseMapped[i];
  //  phaseMappedFollow[i]=0;
  //  net.phase[i]=0;
    phaseMapped[i] = phases[i-0][frameCountBis % nbMaxDelais]+0; // to aligin ball with the followed one
   
    if (phaseMapped[i]<0){
   
    DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
    net.oldPhase[i]=phaseMapped[i];
    net.phase[i]= phaseMapped[i];
       }
        
   else
    
    DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep);
    net.oldPhase[i]=phaseMapped[i];
    net.phase[i]= phaseMapped[i];
  }
 }
 
     for (int i = 0; i < net.size()-0; i+=1) {  // preset trigger to 1 , to not trig

        trigFollowSignalLfo[i]=1;
        TrigmodPos[i]=trigFollowSignalLfo[i];
  // }
   
             // TEST TRIG AND COUNT
     println (" oldOldPositionToMotor[i] ", oldOldPositionToMotor[i], " oldPositionToMotor[i] ", oldPositionToMotor[i], " dataMappedForMotor[i] ", dataMappedForMotor[i], " trigFollowSignalLfo[i] ", trigFollowSignalLfo[i]);

   
         
     if ( oldPositionToMotor[i]< dataMappedForMotor[i] && oldOldPositionToMotor[i]>oldPositionToMotor[i] && oldOldPositionToMotor[i]> (6400-6400/4) ){ //&& dataMappedForMotor[i]< 6400/8 && oldOldPositionToMotor[i]<6400 && oldPositionToMotor[i]>=0 && oldOldPositionToMotor[i]!= oldPositionToMotor[i]
      if (oldOldPositionToMotor[i]> oldPositionToMotor[i]){
     
     //    revLfo[i]++;
     println (" motor " + i + " pass ");
         trigFollowSignalLfo[i]=0;
       
         countFollowSignalLfo[i]++;
      
         TrigmodPos[i]=trigFollowSignalLfo[i];
      }
      }
   
     }
     
   
   
   
   
   
 
    for (int i = 0; i < net.size()-0; i+=1) {

  //**   oldPositionToMotor[i]= positionToMotor[i];
         oldOldPositionToMotor[i]=oldPositionToMotor[i];
         oldPositionToMotor[i]=  dataMappedForMotor[i];
  //**   positionToMotor[i]= ((int) map (net.phase[i], 0, TWO_PI, 0, numberOfStep)%numberOfStep); //   
     if (net.phase[i]>0){
             dataMappedForMotor[i]= ((int) map (net.phase[i], 0, TWO_PI, 0, numberOfStep)%numberOfStep); //   
     }
   
     else   dataMappedForMotor[i]= ((int) map (net.phase[i], 0, -TWO_PI, numberOfStep, 0)%numberOfStep); //   
   
     }

     for (int i = 0; i <networkSize-0; i+=1) {
        
  //   println ( " " + i +   " net.phase " + net.phase[i] + " dataMappedForMoto " + dataMappedForMotor[i] + " DataToDuePosition[i] " + DataToDueCircularVirtualPosition[i]);
     
    }    
    for (int i = 0; i < networkSize; i++) {
      
        text ("count", -1600, height-500 - 75*i);
        text ( countFollowSignalLfo[i], -1400, height-500 - 75*i);
    
    }   
     oscSend(); 
     
     
//**     print ("  trigFollowSignalLfo ");     showArray(trigFollowSignalLfo);
    print (" countFollowSignalLfo ");     showArray(countFollowSignalLfo);
//    countRevs();
//      printArray(rev);
 
  //   assignMotorWithPosition();
     assignMotorWithDataMapped();
     
    for (int i = 0; i < networkSize; i++) {
     DataToDueCircularVirtualPosition[i] = DataToDueCircularVirtualPosition[i]+ recordLastDataOfMotorPosition[i];
     }
      
    int speedDelta=10;
    int driverOnOff=3;
    int dataToTeensyNoJo=-3; // trig noJoe in Teensy
    
    
  //    SEND 25 DATAS TO TEENSY
    
    String dataMarkedToTeensyNoJo  ="<" // BPM9   

    //  +   DataToDueCircularVirtualPosition[11]+ ","+DataToDueCircularVirtualPosition[10]+","+DataToDueCircularVirtualPosition[9]+","+DataToDueCircularVirtualPosition[8]+","+DataToDueCircularVirtualPosition[7]+","
    //  +   DataToDueCircularVirtualPosition[6]
    +  ","+DataToDueCircularVirtualPosition[5]+","+DataToDueCircularVirtualPosition[4]+","+DataToDueCircularVirtualPosition[3]+","+DataToDueCircularVirtualPosition[2]+","
    +  ","+DataToDueCircularVirtualPosition[2]+","+DataToDueCircularVirtualPosition[1]+","+DataToDueCircularVirtualPosition[0]+","
    + 0+","+0+","+0+","+0+","

      +  (speedDelta) +","+ driverOnOff +","+dataToTeensyNoJo+","
      
 //     + TrigmodPos[11]+","+TrigmodPos[10]+","+TrigmodPos[9]+","+TrigmodPos[8]+","+TrigmodPos[7]+","+TrigmodPos[6]+","+TrigmodPos[5]+","+TrigmodPos[4]+","+TrigmodPos[3]+","+TrigmodPos[2]+","+TrigmodPos[1]+","+TrigmodPos[0]+ ">";  // to manage 12 note

      +0+","+0+","+0+","+0+","+0+","+0+","+0+","+0+","+0+","+0+","+0+">";    

    println(frameCount + ": " +  " FOLLOWSIGNALToTeensyNoJo" + ( dataMarkedToTeensyNoJo ));
  //  encoderReceiveUSBport101.write(dataMarkedToTeensyNoJo);// Send data to Arduino.
   teensyport.write(dataMarkedToTeensyNoJo); // Send data to Teensy. only the movement
//  sendToTeensyTurnOnDriver();
  
}
