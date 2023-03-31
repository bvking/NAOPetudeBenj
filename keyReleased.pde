void keyReleased() {
    if (keyCode == ALT){
    moveKeys[8]=false;
   }
   recordFrame();
   textSize (100);


     if (keyCode == LEFT) {  
         if (key!='#') { 
     if ( keyMode == " phasePattern " || modeStartKeyToFollow == " followDistribueAddLfoPattern "
       || modeStartKeyToFollow == " trigEventWithAbletonSignal " || keyMode == " trigEventWithAbletonSignal "
      ){
      oscillatorBlocked++;
      oscillatorBlocked%=networkSize;

      }
      key='#'; // to trig only once

      }
   }
     if (keyCode == RIGHT) {  
        if (key!='#') {  

      if ( keyMode == " phasePattern " || modeStartKeyToFollow == " followDistribueAddLfoPattern "
       || modeStartKeyToFollow == " trigEventWithAbletonSignal " || keyMode == " trigEventWithAbletonSignal "
      ){
      oscillatorBlocked--;
      if (oscillatorBlocked < 0) { 
      oscillatorBlocked=networkSize-1;    
      }
      key='#'; // to trig only once

         }
      }
   }


    if (keyCode == LEFT && keyMode == " addSignalOneAndTwoQuater ") {  
    println( " LEFT INCREASE decay to splitIncomingSignal ")  ; 
     delayTimeToTrig= delayTimeToTrig-20;
      if (delayTimeToTrig<=0) {
        delayTimeToTrig=200;
     }
  
    text ( " delayTimeToTrig " + delayTimeToTrig, width/8, height-800 );
    key= '#'; // to trig once keyPressedLFO
  }

     if (keyCode == RIGHT && keyMode == " addSignalOneAndTwoQuater ") { 
    delayTimeToTrig= delayTimeToTrig+20;
    delayTimeToTrig=delayTimeToTrig%200;
    text ( " delayTimeToTrig " + delayTimeToTrig, width/8, height-800 );
    key= '#'; // to trig once keyPressedLFO
  }
   
    if (formerKeyMetro == 'B')  {

      if (keyCode == CONTROL) {
         oscillatorChange++;
         oscillatorChange=oscillatorChange%12;
      if (oscillatorChange<=0) {
         oscillatorChange=2;
     }
         keyCode =SHIFT; // to trig once keyPressedLFO
  }

     if (keyCode == LEFT) {  
    println( " LEFT INCREASE decay offseft shiftFollowMov ")  ; 
 //   decayshiftFollowMov=decayshiftFollowMov+50;
    decayshiftFollowMov+=1;
    decayshiftFollowMov=decayshiftFollowMov%200;
  
    println ("d= timeOffsetRatio: "); 
    println ( decayshiftFollowMov);
    textSize (100);


    keyCode=SHIFT; // to trig once keyPressedLFO
  }

     if (keyCode == RIGHT) { 

    println( " right INCREASE decay offseft shiftFollowMov")  ; 
     decayshiftFollowMov=decayshiftFollowMov-1;  
      println ("d= timeOffsetRatio: "); 
    println ( decayshiftFollowMov);
    textSize (100);
    text (" decayshiftFollowMov  ",  200,200);
    text ( decayshiftFollowMov,  200,300);
   keyCode=SHIFT; // to trig once keyPressedLFO
  }
  
   if (keyCode == UP) {
     println(" lfoPhase phase shifting"); 
        println(" lfoPhase INCREASE phase shifting"); 
           println(" lfoPhase INCREASE phase shifting"); //
    phaseShiftingFollowPhase11= phaseShiftingFollowPhase11+QUARTER_PI/8;
    phaseShiftingFollowPhase11=phaseShiftingFollowPhase11%PI;
    phaseShiftingFollowLFO= phaseShiftingFollowLFO+QUARTER_PI/8;  
    phaseShiftingFollowLFO= phaseShiftingFollowLFO%PI;
    
 /*       
  if (phaseShiftingFollowPhase11>=8*QUARTER_PI/2) { 
      phaseShiftingFollowPhase11=-phaseShiftingFollowPhase11;
    } 
    */
   
    print ("phaseShiftingFollowPhase11 Ratio ");
    println (degrees (phaseShiftingFollowLFO));
    key= '#';
  }
  
    if (keyCode == DOWN) {
     println(" lfoPhase DECREASE phase shifting"); //
      println(" lfoPhase DECREASE phase shifting"); //
       println(" lfoPhase DECREASE phase shifting"); //
     phaseShiftingFollowLFO= 0;   
     phaseShiftingFollowPhase11= phaseShiftingFollowPhase11-QUARTER_PI/8;
 //   phaseShiftingFollowPhase11= phaseShiftingFollowPhase11%(8*QUARTER_PI/2);   
   /*     
  if (phaseShiftingFollowPhase11<=-8*QUARTER_PI/2) { 
      phaseShiftingFollowPhase11=-phaseShiftingFollowPhase11;
    }   
    print ("phaseShiftingFollowPhase11 Ratio ");
    println (degrees (phaseShiftingFollowPhase11));
    */
    keyCode = SHIFT;
  }
  
   
  
 } 
 
 

  if (formerKeyMetro == 'J' || keyMode == " null ")  {
    
  
    if (keyCode == LEFT) {
      
  //   float timeReleased= (millis()/5)%1000;
    println(" followSignal right INCREASE timeOffset ")  ; // Incremente together without changing phases
    delayTimeFollowPhase11=delayTimeFollowPhase11+1;
    delayTimeFollowPhase11=delayTimeFollowPhase11%65;  
    print ("delayTimeFollowPhase11: ");
    println (delayTimeFollowPhase11);
    if ( delayTimeFollowPhase11<=0 && delayTimeFollowPhase11>=0){
      trigLfo=0;
       }
     else if (delayTimeFollowPhase11>0){   trigLfo=1;   }
      keyCode = SHIFT;
  }
  
  if (keyCode == RIGHT) {
    println(" right INCREASE timeOffset ")  ; // Incremente together without changing phases
    delayTimeFollowPhase11=delayTimeFollowPhase11-1;
    if (delayTimeFollowPhase11<0) {
      delayTimeFollowPhase11=60;
       }
 //   delayTimeFollowPhase11=delayTimeFollowPhase11%61;
    print ("delayTimeFollowPhase11: ");
    println (delayTimeFollowPhase11);
      if ( delayTimeFollowPhase11<=0 && delayTimeFollowPhase11>=0){
      trigLfo=0;
       }
     else if (delayTimeFollowPhase11>0){ trigLfo=1;  }    // 
    keyCode = SHIFT;
  }

  if (keyCode == UP) {
     println(" left INCREASE phase shifting"); //
    phaseShiftingFollowPhase11= phaseShiftingFollowPhase11+QUARTER_PI/8;
    phaseShiftingFollowPhase11= phaseShiftingFollowPhase11%(8*QUARTER_PI/2);   
        
  if (phaseShiftingFollowPhase11>=8*QUARTER_PI/2) { 
      phaseShiftingFollowPhase11=-phaseShiftingFollowPhase11;
    }   
    print ("phaseShiftingFollowPhase11 Ratio ");
    println (degrees (phaseShiftingFollowPhase11));
    keyCode = SHIFT;
  }
  
    if (keyCode == DOWN) {
     println(" left INCREASE phase shifting"); //
    phaseShiftingFollowPhase11= phaseShiftingFollowPhase11-QUARTER_PI/8;
    phaseShiftingFollowPhase11= phaseShiftingFollowPhase11%(8*QUARTER_PI/2);   
        
  if (phaseShiftingFollowPhase11<=-8*QUARTER_PI/2) { 
      phaseShiftingFollowPhase11=-phaseShiftingFollowPhase11;
    }   
    print ("phaseShiftingFollowPhase11 Ratio ");
    println (degrees (phaseShiftingFollowPhase11));
    keyCode = SHIFT;
  }
  
  
  
  } 
  // Choose TimeSpace of Sampling with Sculdy Sampling Method


  // ADJUST DATA TO CONTROL MOTOR with TEENSYJO

  if (key == '?'&& millis()>=millisRatio+1000  ) { //&& frameCount%10==0
    speedDelta-= 1;
    if ( speedDelta<=2) {
      speedDelta=1;
    }
    print(speedDelta);  
    println ("slow down acceleration in Teensy Duino == PCTer0");
    millisRatio=millis();
  }

  if (key == '.' && millis()>=millisRatio+1000 ) { //&& frameCount%10==0 && frameCount <=3999

    speedDelta+= 1;  // decompte is always positive, here it is the signal to control acceleration in Teensy Duino
    if ( speedDelta>=20) {
      speedDelta=16;
    }
    print(speedDelta);  
    println ("up acceleration in Teensy Duino == PCTer0");
    millisRatio=millis();
  }
  
  if (key == ')') {
    // song.play();
    /*
    float rate = map(mouseX, 0, width, 0.5f, 1f);
     rate = 1; //rateSong
     rateControl.value.setLastValue(rate);
     */
    filePlayer.loop();
  }

  if ( (key == '°') )
  {
    filePlayer.pause();
  }       
  if (key == 'J') { 
    formerKeyMetro = key;
    print ("KEY LFO MODE "); 
    print ("FormerkeyMetro"); 
    print (char(formerKeyMetro));
    print ("key"); 
    println (char(key));
  }

/*
  if (key == '<') { 
    formerKeyMetro = key;
    print ("KEY CIRCULAR FOLLOW MODE "); 
    print ("FormerkeyMetro"); 
    print (char(formerKeyMetro));
    print ("key"); 
    println (char(key));
  }
*/
  if (key == '£' || key == '*') {//|| key == '£') {
    for (int i = 0; i < networkSize; i++) {
      rev[i]=0;// set revolution of all oscillator to 0  at the beginning if circular way

      formerKeyMetro = key;
      print ("KEY  CICULAR "); 
      print ("FormerkeyMetro: "); 
      print (char(formerKeyMetro));
      print ("Actualkey"); 
      println (char(key));
    }
  }  
  // ***********************************************************************************************  
  // ***********************************************************************************************  
  //********************* TRY PENDULAR PATTERN
  if (key == 'à' ) {//|| key == '£') {
    //   formerKeyMetro = key;
    print ("KEY PENDULAR OTHER PATTERN "); 
    print ("FormerkeyMetro"); 
    print (char(formerKeyMetro));
    print ("key"); 
    println (char(key));
    //      pendularOtherPattern ();
  }
  if (key == '$' ) {//|| key == '£') {
    formerKeyMetro = key;
    print ("KEY PENDULAR "); 
    print ("FormerkeyMetro"); 
    print (char(formerKeyMetro));
    print ("key"); 
    println (char(key));
  }

  if (formerKeyMetro == 'à') {  
    println ("Frequencie adatped to PENDULAR way WITH OTHER PATTERN trigged with à");
    //  pendularOtherPattern ();
  }
  if (formerKeyMetro == '$') {  
    println ("Frequencies adatped to PENDULAR way trigged with $");
    phasePattern();
  } 

  //*********************************************CIRCULAR

  if (formerKeyMetro == '£' ) {    
    println ("Frequencies adatped to circular way");

    circularWay();
    // MAKE A SORT OF FOLLOW MODE
  } 
  if ( formerKeyMetro == '*' || formerKeyMetro == '<') {   // formerKeyMetro == 'J'  
    println ("Frequencies adatped to ÒTHER circular way");

    //  circularOTHERWay();
    //  circularPENDULARWay();
    phasePattern(); //same as $
    // MAKE A SORT OF FOLLOW MODE
  }
 key= '#'; 

}
