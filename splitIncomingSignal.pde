int propagationLevel;
int timeToTrig;
int delayTimeToTrig = 140;

void  splitIncomingSignal() {  // change de sens de propagagtion.   ATTENTION dans ce reglage le signalToSplit de propgation est UP continue de 0 à TWO_PI

    lfoPhase[1] = (frameCount / 10.0 * cos (1000 / 500.0)*-1)%TWO_PI;  // continue 0 to TWO_PI;
    lfoPhase[3] = map ((((cos  (frameCount / 30.0))*-1) %2), -1, 1, -TWO_PI, TWO_PI);  // sinusoidale lente
    lfoPhase[2] = map ((((cos  (frameCount / 100.0))*-1) %2), -1, 1, -TWO_PI, TWO_PI); // sinusoidale rapide
    
   
   // println (" forme d'onde lfoPhase[1] ", lfoPhase[1], "lfoPhase[2] ", lfoPhase[2], "lfoPhase[3]= signalTosplit ", lfoPhase[3]); 

    oldSignalToSplit=signalToSplit;
    
    signalToSplit = map ( signal[5], 0, 1, -TWO_PI, TWO_PI);

 
  if (oldSignalToSplit> signalToSplit ) {
  //  key = 'q' ; // when signal goes down --> propagation FRONT SIDE
 // doZ=true;
  //*** timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  //  if we have an oscillation as  lfoPhase[3]
    }
  else if (oldSignalToSplit< signalToSplit ) { // on est dans cette configuration avec  signalToSplit= lfoPhase[1]
//   key = 'z';  //  when signal goes down --> propagation BEHIND SIDE 
//   key = 'q' ;  // propagation in on the same way
 // doZ=false;
   timeLfo= map (signalToSplit, -TWO_PI, TWO_PI, 0, 1000);  // manage only upSignal
 //**   timeLfo= map (signalToSplit, 0, TWO_PI, 0, 1000);  // if we have a continuois from 0 to TWO_PI 
 //   timeLfo= map (signalToSplit, 0, 1, 0, 1000); //  if we have a continuois from 0 to TWO_PI from an other software
 
   }

     splitTimeLfo= int  (timeLfo%1000); 
      text ( " timeLfo " + timeLfo + "  oscillatorChangingPropagation " +  oscillatorChangingPropagation, 200, 200);
      text (" splittimeLfo "  +  splitTimeLfo +   " oldSplitTimeLfo " + oldSplitTimeLfo,  100, 100);

   
   text (" oldOscillatorChange " + oldOscillatorChange + " oscillatorChange " + oscillatorChange + " j " + nf (phaseKeptAtChange[oscillatorChange]/TWO_PI*360%360, 0, 2), -width-200, -height- 400 );
   text (" oscillatorChangingPropagation " +  oscillatorChangingPropagation  +  nf (phaseKeptAtChange[oldOscillatorChange]/TWO_PI*360%360, 0, 2), -width-200, -height- 300 );
   /*
     if (oldSplitTimeLfo-splitTimeLfo>100){  //100 means if previous signal is upper of 10%
   
      oscillatorChangingPropagation=true;
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
      }
     else  oscillatorChangingPropagation=false;
      oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
      oldOscillatorChange=networkSize-1;
     }
*/

   //   float differenceSignal=  splitTimeLfo + 10 * log ( 1 - 10 pow (-(splitTimeLfo-oldSplitTimeLfo)/10)); 
     //   float RMS = splitTimeLfo/sq
     
      //float differenceSignal=  splitTimeLfo + log10( 1.0 - 10.0 *pow(1-10.0,-(splitTimeLfo-oldSplitTimeLfo)/10.0));
      //     text (" differenceSignal " + differenceSignal ,  -width-200, -height- 800); 

    //  if (splitTimeLfo>0.5){  // 
     if (signalToSplit>0.5 && millis()> timeToTrig+delayTimeToTrig){  // 
     key = 'e'; keyReleased();//
    // phasePattern(); //keyReleased();
       timeToTrig=millis();
         propagationLevel=1;
      oscillatorChangingPropagation=true;
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
      oscillatorChange=oscillatorChange%networkSize;
      }
/*
        if (signalToSplit<0.5 && millis()> timeToTrig+delayTimeToTrig){  // 
        timeToTrig=millis();
        propagationLevel=1;
        oscillatorChangingPropagation=false;
        oscillatorChange=oscillatorChange%networkSize;
        if (oscillatorChange<=0) {
        oldOscillatorChange=networkSize-1;
        }
      }
*/
    
    if (signalToSplit<0.5 && millis()> timeToTrig+delayTimeToTrig){  // 
     key = 'f';  keyPressed();
   //  phasePattern();
     oscillatorChangingPropagation=false;

      oldOscillatorChange=oscillatorChange;
   //   oscillatorChange=oscillatorChange-1;
   if (oscillatorChange<=0) {
     oldOscillatorChange=0;
     oscillatorChange=networkSize-1;

     } 
   }

/*
    if (splitTimeLfo>(oldSplitTimeLfo*1.25)){  // 
      propagationLevel=1;
      oscillatorChangingPropagation=true;
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
      }
   //  else  oscillatorChangingPropagation=false;
      oscillatorChange=oscillatorChange%networkSize;
   if (oscillatorChange<=0) {
      oldOscillatorChange=networkSize-1;
     } 
     
    // textSize (map (signal[5], 0, 1, 0, 100));
     text (" oscillatorChangingPropagation " + oscillatorChangingPropagation ,  -width-200, -height- 800); 

    
     if (oldSplitTimeLfo>(splitTimeLfo*1.25)){ // if previous signal is upper of 15%
      propagationLevel=2;
      oscillatorChangingPropagation=false;
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange-1;
     } 
      //  else  oscillatorChangingPropagation=false;
      if (oscillatorChange<=-1) {
      oldOscillatorChange=0;
      oscillatorChange=networkSize-1;
    }
  */  

    

     oldSplitTimeLfo = splitTimeLfo; 
   
} 
             