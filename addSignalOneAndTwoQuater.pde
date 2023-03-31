void propagationMode(){ // as addSignalOneAndTwoQuater() in NAOP 

     textSize (100);
     text ( " oscillatorChanged " + oscillatorChanged +  " Change mode q, z, or stop progation with b ", -width-200, -height- 600 );
     text ("signal2 " +nf(signal[2], 0, 2) + "signal3 " +nf(signal[3], 0, 2) + "signal5 " +nf(signal[5], 0, 2), -width-200, -height- 500 );
  
 //    text (" oldSignalToSplit " + oldSplitTime + " splitTime " +  splitTime + " timeLFO " + timeLfo,  -width-200, -height- 400 );
 //    text (" oldSignalToSplit " + nf (oldSignalToSplit, 0, 2) + " signalToSplit " +     nf (signalToSplit, 0, 2) + " timeLFO " + timeLfo,  -width-200, -height- 300 );
//   text (" oldOscillatorChange " + oldOscillatorChange + " oscillatorChange " + oscillatorChange + " j " + nf (phaseKeptAtChange[oscillatorChange]/TWO_PI*360%360, 0, 2), -width-200, -height- 400 );
//   text (" oldOscillatorChange " + (oldOscillatorChange+1)%6 + " oscillatorChange " + (oscillatorChange+1)%6 + " j " + nf (phaseKeptAtChange[(oscillatorChange+1)%6]/TWO_PI*360%360, 0, 2), -width-200, -height- 300 );
   text (" propagationSpeed " + propagationSpeed + " key " + key, -width-200, -height- 200 );
     
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
 
// splitTimeScale(30.0); //  10.0= vitesse de propagation. On change de sens de ROTATION avec q et z.
 // splitTimeLfoScale();  // change de sens de PROPAGATION
  splitIncomingSignal();
  propagation2way();

  mapDataToMotor(); // conversion en netphasei affichage

 for (int k = 0; k < this.nbBalls; k++) 
    {    
   // drawBallGeneral(k, newPosXaddSignal[k] ); 
   // newPosXaddSignal[k]= LFO[k];
    }  
 
 formerFormerKey= formerKey;   
 formerKey=key;
 }

 void propagation2way() {   // le boule d'apres prends la position de la boue d'vant + PI/8
        oscillatorChanged=oscillatorChangingPropagation;
 //  if ( oscillatorChanged==true){ // A essayer
     phaseKeptAtChange[oscillatorChange]= map (signal[3], 0, 1, 0, TWO_PI);
  //    }

   //***  phaseKeptAtChange[oscillatorChange]=newPosXaddSignal[oldOscillatorChange]%TWO_PI;
    //  phaseKeptAtChange[oscillatorChange]=phaseKeptAtChange[oldOscillatorChange];
   //   phaseKeptAtChange[oldOscillatorChange]=               LFO[oscillatorChange];

  
   
   
   /*
    if (doZ==true){ // A essayer

       LFO[oldOscillatorChange] = phaseKeptAtChange[oldOscillatorChange]+QUARTER_PI*1/2 ;  // on ajoute 
       dataMappedForMotor[oldOscillatorChange]= (int) map (LFO[oldOscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       println (" true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);
 
       newPosXaddSignal[oldOscillatorChange]= map (dataMappedForMotor[oldOscillatorChange], 0, numberOfStep, 0, TWO_PI);
     }
     
    if (doZ==false){ 

       LFO[oldOscillatorChange] = phaseKeptAtChange[oldOscillatorChange]-QUARTER_PI*1/2 ;  //
       dataMappedForMotor[oldOscillatorChange]= (int) map (LFO[oldOscillatorChange], 0, TWO_PI, 0, numberOfStep);
       println (" false phaseKeptAtChange[oscillatorChange] ", oldOscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);
 
       newPosXaddSignal[oldOscillatorChange]= map (dataMappedForMotor[oldOscillatorChange], 0, numberOfStep, 0, TWO_PI);
     }

*/
    if (doZ==true){ 

       LFO[oscillatorChange] =LFO[oldOscillatorChange]+QUARTER_PI*1/2 ;  // on ajoute 
       LFO[oscillatorChange] = LFO[oscillatorChange]%TWO_PI;
       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       println (" true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);
 
       newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
     }
     
    if (doZ==false && oscillatorChanged==true){ 

       LFO[oscillatorChange] =LFO[oldOscillatorChange]+QUARTER_PI*1/2 ;  // on ajoute 
     // LFO[oscillatorChange] = phaseKeptAtChange[oscillatorChange]; // LFO[oscillatorChange]+

       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       println (" true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);
      
       newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
       // newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oldOscillatorChange], 0, numberOfStep, 0, TWO_PI);
     }
   
 }
 
 void propagation2wayXP() { 


   //  phaseKeptAtChange[oscillatorChange]=newPosXaddSignal[oldOscillatorChange];
    //  phaseKeptAtChange[oscillatorChange]=phaseKeptAtChange[oldOscillatorChange];
  phaseKeptAtChange[oldOscillatorChange]=               LFO[oscillatorChange];
        
   /*
    if (doZ==true){ 

       LFO[oldOscillatorChange] = phaseKeptAtChange[oldOscillatorChange]+QUARTER_PI*1/2 ;  // on ajoute 
       dataMappedForMotor[oldOscillatorChange]= (int) map (LFO[oldOscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       println (" true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);
 
       newPosXaddSignal[oldOscillatorChange]= map (dataMappedForMotor[oldOscillatorChange], 0, numberOfStep, 0, TWO_PI);
     }
     
    if (doZ==false){ 

       LFO[oldOscillatorChange] = phaseKeptAtChange[oldOscillatorChange]-QUARTER_PI*1/2 ;  //
       dataMappedForMotor[oldOscillatorChange]= (int) map (LFO[oldOscillatorChange], 0, TWO_PI, 0, numberOfStep);
       println (" false phaseKeptAtChange[oscillatorChange] ", oldOscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);
 
       newPosXaddSignal[oldOscillatorChange]= map (dataMappedForMotor[oldOscillatorChange], 0, numberOfStep, 0, TWO_PI);
     }
*/

    if (doZ==true){ 

       LFO[oscillatorChange] =phaseKeptAtChange[oscillatorChange]+QUARTER_PI*1/2 ;  // on ajoute 
       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       println (" true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);
 
       newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
     }
     
    if (doZ==false){ 

       LFO[oscillatorChange] =phaseKeptAtChange[oscillatorChange]+QUARTER_PI*1/2 ;  // on ajoute 
       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       println (" true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);
 
       newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
     }
 }
 
///////////////////// 

void splitTimeLfoScale() {  // change de sens de propagagtion.   ATTENTION dans ce reglage le signalToSplit de propgation est UP continue de 0 à TWO_PI

    lfoPhase[1] = (frameCount / 10.0 * cos (1000 / 500.0)*-1)%TWO_PI;  // continue 0 to TWO_PI;
    lfoPhase[3] = map ((((cos  (frameCount / 30.0))*-1) %2), -1, 1, -TWO_PI, TWO_PI);  // sinusoidale lente
    lfoPhase[2] = map ((((cos  (frameCount / 100.0))*-1) %2), -1, 1, -TWO_PI, TWO_PI); // sinusoidale rapide
    
   

    println (" forme d'onde lfoPhase[1] ", lfoPhase[1], "lfoPhase[2] ", lfoPhase[2], "lfoPhase[3]= signalTosplit ", lfoPhase[3]); 

    oldSignalToSplit=signalToSplit;
     if (doQ==true) {
       signalToSplit = map ( signal[3], 0, 1, -TWO_PI, TWO_PI);
        }
    else  {
    signalToSplit= lfoPhase[3];
    }
    
 
  if (oldSignalToSplit> signalToSplit ) {
  //  key = 'q' ; // when signal goes down --> propagation FRONT SIDE
  doZ=true;
   timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  //  if we have an oscillation as  lfoPhase[3]
    }
  else if (oldSignalToSplit< signalToSplit ) { // on est dans cette configuration avec  signalToSplit= lfoPhase[1]
//   key = 'z';  //  when signal goes down --> propagation BEHIND SIDE 
//   key = 'q' ;  // propagation in on the same way
  doZ=false;
   timeLfo= map (signalToSplit, -TWO_PI, TWO_PI, 0, 1000);  // if we have an oscillation  lfoPhase[3]
 //**   timeLfo= map (signalToSplit, 0, TWO_PI, 0, 1000);  // if we have a continuois from 0 to TWO_PI 
 //   timeLfo= map (signalToSplit, 0, 1, 0, 1000); //  if we have a continuois from 0 to TWO_PI from an other software
 
   }

   int splitTimeLfo= int  (timeLfo%100);   // 100 is the size of the gate trigging the change of the ball 
  if (doQ==true) {
       splitTimeLfo= int  (timeLfo%1000); 
   }
  

   
      println ( " oldSignalToSplit " + oldSignalToSplit + " signalToSplit " + signalToSplit );
      print (" timeLfo "); print ( timeLfo );   print (" splittimeLfo "); println ( splitTimeLfo );


 if (doZ==false){  // case q
  if (oldSplitTimeLfo>splitTimeLfo){

      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
   } 
      oscillatorChange=oscillatorChange%networkSize;
      
  if (oscillatorChange<=0) {
  //    oscillatorChange=0;
      oldOscillatorChange=networkSize-1;
   } 
  }
  
 if (doZ==true){ // case z
  if (  oldSplitTimeLfo>splitTimeLfo){

      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange-1;
   } 
      if (oscillatorChange<=-1) {

      oldOscillatorChange=0;
      oscillatorChange=networkSize-1;
   }
  }  

  if ( oldOscillatorChange!=oscillatorChange )
  {
   oscillatorChanged=true;
  } 
   oldSplitTimeLfo = splitTimeLfo;
             
}

 void splitTimeScale(float propagationSpeed) { 
   

         signal[2] = (0*PI + (frameCount / propagationSpeed) * cos (1000 / 500.0)*-1)%1;
         
    if (doZ==false){  // case q
  if (oldSplitTimeLfo>splitTimeLfo){
 
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
   } 

      oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
    
         oscillatorChange=0;
         oldOscillatorChange=networkSize-1;
   } 
  }
  
    if (doZ==true){ // case z
   if (  oldSplitTimeLfo>splitTimeLfo){

       oldOscillatorChange=oscillatorChange;

      oscillatorChange=oscillatorChange-1;
   } 
      if (oscillatorChange<=-1) {

        oldOscillatorChange=0;

        oscillatorChange=networkSize-1;
   }
  }       
  
       println ( " ***************************************************    SPLIT TIME  timeLfoooooooooo " + " signal[2] " + signal[2] + " oldSplitTime " + oldSplitTime + " splitTime " + splitTime );

   timeLfo = (int ) map (signal[2], 0, 1, 0, 1000); // linear time  to change " oscillator " each 200 ms
 
       println ( " ***************************************************    SPLIT TIME  timeLfoooooooooo " + " timeLfo   " + timeLfo );

   oldSplitTimeLfo=splitTimeLfo;
   splitTimeLfo= int  (timeLfo%100);   
   
}