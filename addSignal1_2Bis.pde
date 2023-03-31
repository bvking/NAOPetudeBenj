void addSignalOneAndTwoBis(){
 //   print (formerKeyMetro);
 //   signal2 continue
 //   signal to split sinus
  // lfoPattern(); // if ive is not open  //lfoPattern(); // if Live is not open
    // if you dob't use this, uncomment signal2 in addSignalLfoPattern()
  signal[2] = (0*PI + (frameCount / 300.0) * cos (1000 / 500.0)*-1)%1;

     text ("Change mode q, z, or b ", -width-200, -height- 600 );
     text ("signal2 " + signal[2] +  "signal3 " + signal[3], -width-200, -height- 500 );
     text (" signalToSplit " +     signalToSplit + " timeLFO " + timeLfo,  -width-200, -height- 400 );
     text ( " propagationSpeed " + propagationSpeed + " oscillatorChange " + oscillatorChange, -width-200, -height- 300 );
     text (" oscillatorChange " + oscillatorChange + " oscillatorChanging " + phaseKeptAtChange[oscillatorChanging], -width-200, -height- 200 );


    
   if (key=='q' || key=='b' || key=='z' ) { // q == addsignal
     letter = key;   
     }
     
  switch(letter) {
    case 'q': 
    doQ=true;
    doZ=false;
    break;
    case 'b': 
    doQ=false;
    break;
    case 'z': // change way of propagation
    doZ=true;
    doQ=true;
    break;
    }
 

  splitTimeLfoBis(); 
 
// splitTimeLfoWithAbletonBis(); 
// splitTimeWithAbletonNoteBis(); 
    
  addSignalLfoPatternBis(); 
 
 formerFormerKey= formerKey;   
 formerKey=key;
 }
 
 void addSignalLfoPatternBis()  {
    if (doQ==true ){ // useless in this mode, instead modulate space between phase kept and new phase
  //   pendularPattern(); // offset with lfo oscillator by osillator
  //  phaseFollowLFO[oscillatorChange]= map (signal[2], 0, 1, 0, TWO_PI);    
   }

   if (formerFormerKey  != '#' ) { //  != '#'
     print ("  normal " + frameCount + " lfoPhase[1] " + lfoPhase[1] + " lfoPhase[2] " + lfoPhase[2]);    println (   ); 
       
  int i;
  i= oscillatorChange;
    
  oscillatorChanging= (oscillatorChange-1);
  if (oscillatorChanging<= 0){
  oscillatorChanging= networkSize-1;
  }
 
 //********POURQUOI DIFFERENT AU DEMARRAGE DE lA FONCTION
    signal[2] = (0*PI + (frameCount / 300.0) * cos (1000 / 500.0)*-1)%1;
     
  //   signal[2] = 0.02;
    
   
      LFO[i] =  map (signal[2], 0, 1, 0, TWO_PI);  
      
      
   //    LFO[i] =  map (0.01, 0, 1, 0, TWO_PI);  // CONSTANT

  
    if ( phaseKeptAtChange[oscillatorChanging]<0){   
       LFO[i] =    LFO[i]- phaseKeptAtChange[oscillatorChanging];
       dataMappedForMotor[i]= int (map (LFO[i], 0, -TWO_PI, numberOfStep, 0)); 

       newPosXaddSignal[i]= map (dataMappedForMotor[i], numberOfStep, 0, 0, -TWO_PI);
  }
       
   else { 
       LFO[i] = LFO[i]+ phaseKeptAtChange[oscillatorChanging];

       LFO[i] = LFO[i]%TWO_PI;
       dataMappedForMotor[i]= (int) map (LFO[i], 0, TWO_PI, 0, numberOfStep);

       newPosXaddSignal[i]= map (dataMappedForMotor[i], 0, numberOfStep, 0, TWO_PI);
   
    }
  }

    println (" newPosXaddSignal[oscillatorChange] ",  oscillatorChange, " ",  newPosXaddSignal[oscillatorChange] );
  
//     int j;  
//  j= (networkSize-1);
///  if (j<= 0){
//  j= networkSize;
//  }
       
  if (oscillatorChanged==true )  { 

     phaseKeptAtChange[oscillatorChange]=newPosXaddSignal[oscillatorChange];    //  RECORD on oscillatorChange-1 the postion of oscillatorChange where it has just changed
  
   }

   //**    LFO[j] = phaseKeptAtChange[j]+PI/(15-j);
       LFO[oscillatorChanging] = phaseKeptAtChange[oscillatorChanging]+QUARTER_PI ;  //les redressent de temps en temps
       LFO[oscillatorChanging] = LFO[oscillatorChanging]%TWO_PI;
       dataMappedForMotor[oscillatorChanging]= (int) map (LFO[oscillatorChanging], 0, TWO_PI, 0, numberOfStep);
       println (" phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oscillatorChange]);
 
       newPosXaddSignal[oscillatorChanging]= map (dataMappedForMotor[oscillatorChanging], 0, numberOfStep, 0, TWO_PI);
       
///////////////////// 
mapDataToMotor();

}
  
void  splitTimeLfoBis() {  // signalToSplit = lfoPhase3
 
  lfoPattern();   // signalTosplit come from lfoPattern(). Signal of rotation come from Lfopattern too. Function is at the top 
 
  if (oldSignalToSplit> signalToSplit ) {
  //  key = 'q' ; // when signal goes down --> propagation FRONT SIDE
  timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  // 0 to  
    }
  else if (oldSignalToSplit< signalToSplit ) {
//   key = 'z';  //  when signal goes down --> propagation BEHIND SIDE 
//   key = 'q' ;  // propagation in on the same way
  timeLfo= map (signalToSplit, -TWO_PI, TWO_PI, 0, 1000);  // 0 to
   }
      
   oldSignalToSplit=signalToSplit;

   
  int splitTimeLfo= int  (timeLfo%100);   // 100 is the size of the gate trigging the change of the ball  
   
      println ( " oldSignalToSplit " + oldSignalToSplit + " signalToSplit " + signalToSplit );

      print (" timeLfo "); print ( timeLfo );   print (" splittimeLfo "); println ( splitTimeLfo );


 if (doZ==false){  // case q
  if (oldSplitTimeLfo>splitTimeLfo){
 //     oldMemoryi=memoryi;
 //      memoryi=(memoryi+1);
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
      } 
   //   memoryi=memoryi%12;
      oscillatorChange=oscillatorChange%networkSize;

  }
  
    if (doZ==true){ // case z
//  if (formerDecayTimeLfo>decayTimeLfo){
   if (  oldSplitTimeLfo>splitTimeLfo){
 //   oldMemoryi=memoryi;
 //   memoryi=(memoryi-1);
      oscillatorChange=oscillatorChange-1;
   } 
      if (oscillatorChange<=-1) {
//        memoryi=11;
//        oldMemoryi=2;
        oscillatorChange=networkSize-1;
   }
  }  
  
  if ( oldOscillatorChange!=oscillatorChange )
  {
   oscillatorChanged=true;
  } 
//   formerDecayTimeLfo = decayTimeLfo;
   oldSplitTimeLfo = splitTimeLfo;
             
}

void mapDataToMotor() {

     for (int i = 0; i <  networkSize-0; i+=1) { // la premiere celle du fond i=2,  la derniere celle du devant i=11
 //   drawBall(i, newPosXaddSignal[i] );
  println (" CONVERSION pour AFFICHAGE net.phase[i]=newPosXaddSignal[i ]" + newPosXaddSignal[i]);
   
 //    print( " oldPositionToMotor[i]" ); print ( oldPositionToMotor[i]);
  //  positionToMotor[i]= ((int) map (newPosXaddSignal[i], 0, TWO_PI, 0, numberOfStep)%numberOfStep); //
    positionToMotor[i]= ((int) map (net.phase[i], 0, TWO_PI, 0, numberOfStep)%numberOfStep); //
    
    newPosF[i]=positionToMotor[i]%6400;
    
    
    net.phase[i]=newPosXaddSignal[i]; // to display to screen
    positionToMotor[i]= positionToMotor[i]%6400;
     TrigmodPos[i]=1;
    
    if ( oldPosF[i]>newPosF[i]){
         revLfo[i]++;
         TrigmodPos[i]=0;
     
    }
  /*  
     if ( oldPosF[i]<newPosF[i]){
         revLfo[i]--;
         TrigmodPos[i]=0;
     
    }
*/
     print (" TrigmodPos[i" , TrigmodPos[i] , " newPosF " + newPosF[i]);
     oldPositionToMotor[i]=  positionToMotor[i];
     oldPosF[i]=newPosF[i];
     oldPosX[i]=newPosF[X];

     print (" revolutionLFO "); print ( i); print ("  "); println (revLfo[i]); 
     
     
     text ("count", -1600, height-500 - 75*i);
     text ( revLfo[i], -1400, height-500 - 75*i);
   
    
     }
     text (" restart ALT Z , cf signal2Bis )", -1600, height-300 );  
     text ( signal[2], -400, height-300);
     oscSend();
     assignMotorWithPosition();
     
    for (int i = 0; i < networkSize; i++) {
   //  DataToDueCircularVirtualPosition[i] = DataToDueCircularVirtualPosition[i]+ recordLastDataOfMotorPosition[i];
   }

   send24DatasToTeensy6motors( 10, 3, -3, -1);
  
}
