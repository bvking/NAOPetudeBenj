
// END SETUP
void mouseXY () {  // MODULATION OF SIGMA and FREQ into GRAPHIC chimera state. No effect
  sigma =  (  map ((float (mouseX)/width*1), 0, 1, 0.0, 1.0 ));
  print ("Sigma"); 
  println (sigma);
  Freq  =  (  map ((float (mouseY)/width*1), 0, 1, 0.0, 0.05 ));
}
public void settings() {
  size(600, 600, P3D);
//  windowRatio(600, 600);
} 
void goZero () {
  for (int i = 0; i < 12; i++) {
    //  net.phase[i]=-PI+0.5*PI+PI/12;
    net.phase[i]= -PI/2;
  }
}

int numFrame = 900;
float LFOmemory[] = new float[numFrame];
float Automation1[] = new float[numFrame];
int formerAuto;


String keyMode;
boolean[] moveKeys = new boolean[99];

void setMovement(int k, boolean b) {//azeqsdwxcrty
  switch (k) {
  case 'a':
    moveKeys[0] = b;
    break;
  case 'z':
    moveKeys[1] = b;
    break;
  case 'e':
    moveKeys[2] = b;
    break;
  case 'q':
    moveKeys[3] = b;
    break;
  case 's':
    moveKeys[4] = b;
    break;
  case 'd':
    moveKeys[5] = b;
    break;
  case 'w':
    moveKeys[6] = b;
    break;
  case 'x':
    moveKeys[7] = b;
    break;
  /*       if (keyCode == CONTROL){ // .. in Keypressed =true, inKeyRelesed == false  // moveKeys[8]=true; }   */
  case 'c':
  moveKeys[9] = b;
  break;
  case 'r':
  moveKeys[10] = b;
  break;
  case 'f':
  moveKeys[11] = b;
  break;
  case 'v':
  moveKeys[12] = b;
  break;
    case 't':
  moveKeys[13] = b;
  break;
   
  }
}

void mousePressed() {  
  mouseRecorded = true;
  measure = 0;
  }
// before draw

int timeToTrigSomething;
int timeToTrigSomethingBis;
boolean trigEffect;
boolean trigEffectBis;

void draw() {
 
 println ("  oldEncodeur[0] " +   oldEncodeur[0] + " v1 " + v1 + " v2 " + v2 + " v3 " + v3 + " v4 " + v4 +  " v5 " + v5); 
 println ("  encodeur[0] " +  encodeur[0] + " v1 " + v1 + " v2 " + v2 + " v3 " + v3 + " v4 " + v4 +  " v5 " + v5); 


   
 // printArray(encodeur);
  background(0);
//  printDataOnScreen();
  
  
 print (" BEGIN OF MAIN KEYCODE  ");   
 
 printModeAndKey();
  
    if (moveKeys[0]==true){ // CONTROL && a pressed
 //   mappingMode = " circular " ;
    print (" ***************** ", mappingMode);
    }
    
    if (moveKeys[1]== true){ // CONTROL a && z pressed
 //   mappingMode = " pendular " ;
    print (" ***************** ", mappingMode);   
    }  

    if (moveKeys[8]==true && moveKeys[0]==true){ // CONTROL && a pressed
  //  keyMode = " signal " ;
    keyMode = " addSignalOneAndTwoTer " ;
  // formerKeyMetro = '@';
    print (" keyMode ", keyMode );
    }
  
    if (moveKeys[8]==true && moveKeys[1]==true){ // CONTROL && z pressed
    keyMode = " addSignalOneAndTwo " ;
   // formerKeyMetro = '@';
    print (" keyMode ",  keyMode );
    }
    
    if (moveKeys[8]==true && moveKeys[2]==true){ // CONTROL && e pressed
    keyMode = " addSignalOneAndTwoBis "  ;
  //  formerKeyMetro = '*';
    print (" keyMode ",  keyMode );
    }

      if (moveKeys[8]==true && moveKeys[10]==true){ // CONTROL && r pressed
    keyMode = " addSignalOneAndTwoQuater "  ;
  //  formerKeyMetro = '*';
    print (" keyMode ",  keyMode );
    }
    
        
    if (moveKeys[8]==true && moveKeys[3]==true){ // CONTROL && q pressed
    keyMode = " followDirectLfo " ;
    formerKeyMetro = '@';
    print (" keyMode ",  keyMode );
    }
    
    if (moveKeys[8]==true && moveKeys[4]==true){ // CONTROL && s pressed
    keyMode = " followDistribueAddphasePattern " ;
    
    formerKeyMetro = '*';
    print (" keyMode ",  keyMode );
    }
    
    if (moveKeys[8]==true && moveKeys[5]==true){ // ALT && d pressed
    keyMode = " followDistribueAddLfoPattern " ;
    
    formerKeyMetro = '*';
    print (" keyMode ",  keyMode );
    }
    
    if (moveKeys[8]==true && moveKeys[6]==true){ //ALT && w pressed
    keyMode = " samplingMode " ;
    
   // formerKeyMetro = '*';
    print (" keyMode ",  keyMode );
    }
    
    if (moveKeys[8]==true && moveKeys[7]==true){ // ALT && x pressed
    keyMode = " null " ;
    
   //formerKeyMetro = '*';
    print (" keyMode ",  keyMode, " formerKeyMetro ", formerKeyMetro );
    }
    
   if (moveKeys[8]==true && moveKeys[9]==true){ // ALT && c pressed  moveKeys[9]==true  //  r pressed  moveKeys[10]==true
    keyMode = " followDistribueAddLfoPatternControl " ;
   // formerKeyMetro = '*';
     
 //  formerKeyMetro = '#';  // can't add phasee
    print (" keyMode ",  keyMode, " formerKeyMetro ", formerKeyMetro );
    }

   if (moveKeys[8]==true && moveKeys[11]==true){ // ALT & f
    keyMode = " methodAbleton " ;
    formerKeyMetro = '*';
  }

       if (moveKeys[8]==true && moveKeys[12]==true){ // ALT & v
    keyMode = " trigEventWithAbletonSignal " ;
  //  formerKeyMetro = '*';
  }
    
     if (key == '%' ){ 
    keyMode = " phasePattern " ;
   
    
  // formerKeyMetro = '*';
    print (" keyMode ",  keyMode, " formerKeyMetro ", formerKeyMetro );
    }
    
        if (key == 'ù' ){
    keyMode = " abletonPattern " ;
    abletonPattern();
   
    
   formerKeyMetro = '*';
    print (" keyMode ",  keyMode, " formerKeyMetro ", formerKeyMetro );
    }
    
    
    
    
    
    
    
    
    
    
   
   if (keyMode == " followDistribueAddLfoPatternControl " ){ //moveKeys[8]==true && // CONTROL 
   // if (formerFormerKey!='#'){
     /*
     if (Key!='#'){
    controlTrigLfoPattern = millis();
  
     }
       */
 //  keyMode = " followDistribueAddLfoPatternControl " ;
    
  // formerKeyMetro = '';
    }
    
    
    
       
    setMovement(key, false); 
        println (" modeStartKeyToFollow ", modeStartKeyToFollow, " keyModeRed",  keyModeRed,"keyMode",  keyMode, "formerKeyMetro ", formerKeyMetro, " controlTrigLfoPattern ", controlTrigLfoPattern );
    keyModeRed = keyMode; // dont read keyMode in file.txt

     if (  keyMode == " trigEventWithAbletonSignal " || keyModeRed == " trigEventWithAbletonSignal " ) {
    //  formerKeyMetro = '@';       
          //  modeStartKeyToFollow = " trigEventWithAbletonSignal ";
            trigEventWithAbletonSignal();
      text ( keyMode, -width, -height); 
       }
     
      if (keyMode == " addSignalOneAndTwoQuater " || keyModeRed == " addSignalOneAndQuater " ) { //drive ball with lfo
    //   PatternFollowLfo();
     propagationMode();
      text ( keyMode, -width, -height); 
    }
   
    if (keyMode == " addSignalOneAndTwoTer " || keyModeRed == " addSignalOneAndTwoTer " ) { //drive ball with lfo
    //   PatternFollowLfo();
     addSignalOneAndTwoTer();
      text ( keyMode, -width, -height); 
    }
    
    
    if (keyMode == " addSignalOneAndTwoBis " || keyModeRed == " addSignalOneAndTwoBis " ) { //drive ball with lfo
    //   PatternFollowLfo();
     addSignalOneAndTwoBis();
      text ( keyMode, -width, -height); 
    }  

  if (keyMode == " addSignalOneAndTwo " || keyModeRed == " addSignalOneAndTwo " ) { //drive ball with lfo
    //   PatternFollowLfo();
     addSignalOneAndTwo();
      text ( keyMode, -width, -height); 
    }
  
  if (keyMode == " methodAbleton " || keyModeRed == " methodAbleton ") { //drive ball with lfo
     methodAbleton();
     text ( keyMode, -width, -height); 
     
  }
  
  if (keyMode == " followDirectLfo " || keyModeRed == " followDirectLfo ") { //drive ball with lfo
     followDirectLfo();
      text ( keyMode, -width, -height); 
  }
  
  if (keyMode == " followDistribueAddphasePattern " || keyModeRed == " followDistribueAddphasePattern ") { //drive ball with lfo
     followDistribueAddphasePattern();
      text ( keyMode, -width, -height); 
  }
  
  if (keyMode == " followDistribueAddLfoPatternBis " || keyModeRed == " followDistribueAddLfoPatternBis ") { //drive ball with lfo
     followDistribueAddLfoPattern();
      text ( keyMode, -width, -height); 
  }
  
    if (keyMode == " samplingMode " || keyModeRed == " samplingMode ") { //drive ball with lfo
  //   followDistribueAddLfoPattern();
     text ( keyMode, -width, -height);
  }
  
  
  
  if (keyMode ==  " followDistribueAddLfoPatternControl " || keyModeRed == " followDistribueAddLfoPatternControl ") { // drive with CONTROL & r
       if (key!='#'){
    controlTrigLfoPattern = millis();
    }
   //  followDistribueAddLfoPatternControl();
  }
  
  if (keyMode == " null " || keyModeRed == " null ") { //drive ball with lfo
    //  followDistribueAddLfoPattern();
      text (keyMode, (width/2), height/2);  

  }
  
   if (keyMode == " phasePattern " ) { //drive ball with lfo
    //  followDistribueAddLfoPattern();
   // followDistribueAddLfoPattern();
    // phasePattern();
      text (keyMode + " " + signal[5] , (width/2), height/2); 
    

  }
  
     if (keyMode == " abletonPattern " ) { //drive ball with lfo
    //  followDistribueAddLfoPattern();
      abletonPattern();
      text (keyMode, (width/2), height/2);  

  }

  

  
    if (keyMode == " signal "){ // || formerKeyMetro == 'J'
         text ( keyMode, -width, -height); 
    for (int i = 2; i <  networkSize; i++) {
    net.oldPhase[i] =  net.phase[i]; 
    net.phase[i] =  map (signal[i], 0, 1, 0, TWO_PI);   //  
    println ( " signalTo_net.phase ", (i), net.phase[i] );
    
    if (net.oldPhase[i]>net.phase[i]){
   
     DataToDueCircularVirtualPosition[i]= int (map (net.phase[i], TWO_PI, 0, numberOfStep, 0)); 
     net.oldPhase[i]=net.phase[i];
   
     }
       
     else
    
    DataToDueCircularVirtualPosition[i]= (int) map (net.phase[i], 0, TWO_PI, 0, numberOfStep); 
    net.oldPhase[i]=net.phase[i];
  

     }
     sendToTeensy();
     }
     
      
  
//  addPhaseAllMode =net.phase[2] + net.phase[3] + net.phase[4] +net.phase[5]+net.phase[6]+net.phase[7]+net.phase[8]+net.phase[9]+net.phase[10]+net.phase[11];
for (int i = 0; i < networkSize; i++) {
 
// addPhaseAllMode = addPhaseAllMode + net.phase[i];
  }

  print (" all automatik  "); println ( addPhaseAllMode);

  addPhaseAllMode =net.phase[0] + net.phase[1] + net.phase[2] +net.phase[3]+net.phase[4]+net.phase[5];//+net.phase[8]+net.phase[9]+net.phase[10]+net.phase[11];
  print (" all one by one "); println ( addPhaseAllMode);
  addPhaseAllMode= map (addPhaseAllMode,-(networkSize-1)*TWO_PI,(networkSize-1)*TWO_PI,0,1); 
  // addPhaseAllMode = 
  print (" all "); println ( addPhaseAllMode);


  formerBeatPrecised=beatPrecised;
  formerMeasure=measure;
  formerBeatOnMeasure=beatOnMeasure;


  if (modeStartKeyToFollow != " samplingModeInternal " )
   { 
    if (modeStartKeyToFollow != " followSignalSampledOppositeWay(frameRatio) " )
  { 
  measure=(int) map (automation4*10, 0, 7.874016, 1, 1000); // mapping from Ableton measure
  // measure=(int) map (automation4*10, 1,1000 , 1, 1000);
  print ( " measure ");print ( measure);
  print (" AUTOMATION 5= beatPrecised  "); 
  beatPrecised=(int) map (automation5*10, 0, 7.874016, 1, 1000); //  mapping from Ableton step in measure
 //  beatPrecised=(int) map (automation5*10, 1,1000 , 1, 1000);
  println (beatPrecised);
  }
   }  

 
  println( " begin main loop " ) ;

        trigBeatWithMeasure();
 //     autmationWithMeasureAndNote();
 //**   printDataOnScreen();
 //     printMidiNoteVelocity();
    















    
  if (keyMode != " phasePattern ")
  {   
   if ( key =='B'||  key =='c' ||  key =='>' ||  key =='<' || key =='d' || key =='e'  ) // 
  {
  //  formerKeyMetro = key;   // press l to change formerKeyMetro Mode
   }
  }
  
  if (keyMode == " null ")
  {   
    if ( key =='a'||  key =='b' ||  key =='c' ||  key =='d' || key =='e' || key =='f' || key =='s' || key =='z' || key =='j'  ) // 
   {
     if ( formerKeyCode == BACKSPACE){
    modeStartKey = key;   // press l to change formerKeyMetro Mode
     }
    }
   
       
    switch( modeStartKey) {
    case 'a': 
    modeStartKeyToFollow = " followSignalSampledLPF ";
    print ( " modeStartKeyToFollow " );
    followSignalSampledLPF(frameRatio);
    break;
    case 'b': 
    modeStartKeyToFollow = " followDistribueAddLfoPatternLPF ";
        print ( " modeStartKeyToFollow " );

    text ( " followDistribueAddLfoPatternLPF ", width/4, -height/4);  
    followDistribueAddLfoPatternLPF();
    break;
   case 'c':  
   formerKeyMetro = '@';       
    modeStartKeyToFollow = " followDistribueAddLfoPatternControl ";
        
   // text ( modeStartKeyToFollow, width/2, -height/4);  
    followDistribueAddLfoPatternControl();  
    //if (formerFormerKey!='#'){
          if (Key!='#'){
   // controlTrigLfoPattern = millis();
   // text (  controlTrigLfoPattern, 200, 300 );
  
    //}
    }
    break;
    case 'f':   
     formerKeyMetro = '@';  
    modeStartKeyToFollow = " followSignalfo ";
        print ( " modeStartKeyToFollow " );

    text ( modeStartKeyToFollow, width/4, -height/4); 
    followSignalLfo(frameRatio, signal[networkSize-1]);
    break;

     case 'd': 
     formerKeyMetro = '@';    
    modeStartKeyToFollow = " followDistribueAddLfoPattern ";
      //  print ( " followDistribueAddLfoPattern in KeyMode null " );

    text ( modeStartKeyToFollow, width/4, -height/4); 
  
    followDistribueAddLfoPattern();
    break;


    case 's':  
     formerKeyMetro = '*';    
    modeStartKeyToFollow = " samplingModeInternal ";
     //   print ( " modeStartKeyToFollow " );

    // keyMode = " samplingModeInternal " ;
     text ( modeStartKeyToFollow, width/4, -height/4); 
    break;

    case 'j': 
     formerKeyMetro = '@';     
    modeStartKeyToFollow = " followSignalSampledOppositeWay(frameRatio) ";
   // formerKeyMetro = 'J';  

    text ( modeStartKeyToFollow + " not good ? " , width/4, -height/4); 
    // keyMode = " modeStartKeyToFollow " ;
     text ( keyMode, width/4, -height/4); 
     followSignalSampledOppositeWay(frameRatio);

    break;

    case 'z':     
 //   modeStartKeyToFollow = " samplingMode ";
 //   text ( modeStartKeyToFollow, width/4, -height/4); 
     keyMode = " addSignalOneAndTwoTer " ;
     text ( keyMode, width/4, -height/4); 
     addSignalOneAndTwoTer();
    break;
   }
  }
   
    if (beatTrigged==true && formerKeyMetro == 's'){ // formerBeatOnMeasure>=4 && beatOnMeasure<=1 && 
        measureRecordStart=measure;
    //    beginSample=millis();
        print ("*****************************************************************************++++++++++++++++++++++ START SAMPLING  "); 
  
     //  formerKeyMetro = 'S';  // back to normal Mode with formerKeyMetro = '$';
   }
     
     
     
  
   if (formerKeyMetro == 'B' ){
    lfoPattern();
    splitTimeLfo();
  //   splitWithTime();
    addSignal(); 

  } 
  
  if (modeStartKeyToFollow == " samplingMode "     ){ // || formerKeyMetro == 'J'
   println ( " IN SAMPLING ");   println ( " IN SAMPLING ");   println ( " IN SAMPLING ");
    println ( " IN SAMPLING ");   println ( " IN SAMPLING ");   println ( " IN SAMPLING ");
     println ( " IN SAMPLING ");   println ( " IN SAMPLING ");   println ( " IN SAMPLING ");
     beginSample=millis();
    text (keyMode + " samplingMode LFOdecay ", width/4, - height - 100);  
     
 //    mouseY=(int) map (automationLFO[1], 0, 1, 0, 400);  // position from Ableton LFOdecay

    
     //  mouseY=mouseY+10;
       mouseX=mouseX+20;
/*
      oldMov = movementRecording;
      
      movementRecording= mouseY;
      
           
       if (oldMov>=  movementRecording){
      
    movementRecording= map (y, 0, 400, 0 , TWO_PI); 
      }
    else  
    movementRecording= map (y, 400, 0, TWO_PI, 0);
     
 */   
     
    
 
    //****  mouseY=(int) map (automation1, 0, 1, 0, 400);  //POSITION MOTOR
    
      //  mouseY = (int) map (signal[3], 0, 1, 0, 400);   // POSITION from ABLETON
    
        //  mouseY=(int) map (Movement/1000.0, 0, 1, 0, 400);  // to do WHAT?

     // followMovementAll();
     //  displayfollowMovementAll();
      //***** */   activeSamplingMeasure(3);
     //***** */    stopSamplingMeasure(4);
    
   //      activeSamplingInternalClock(7); //do not work
   //      stopSamplingInternalClock(8);  //do not work
      //   samplingMovement(2);
   //***** */     samplingMovementPro(); 
        
  //       print (" v1 ");   print (  v1);  print (" v1 ");   println (  v1); 
         sendToTeensy();
 }
 
     print( " INTERNAL CLOCK lastSec " ) ; print( lastSec ) ; print( " actual " ) ; print( actualSec ) ; print( " measure " ) ; println( measure ) ;
    
     if  (actualSec!=lastSec){
         lastSec=actualSec;
      if (modeStartKeyToFollow == " samplingModeInternal "  || modeStartKeyToFollow ==  " followSignalSampledOppositeWay(frameRatio) "  ){    
          measure ++;
       }
      }

         actualSec =(int) (millis()*0.001); 
         
   //*************    ENDINTERNALCLOCK  
  
  
   if (modeStartKeyToFollow == " samplingModeInternal "     ){ // || formerKeyMetro == 'J'
     println ( " samplingModeInternal  ");
    
     beginSample=millis();
     text ( " encodeur[0] " + encodeur[0] +  " newPosF[0] " + newPosF[0] + modeStartKeyToFollow + " mouseY " +  mouseY  + " mouseX " +  mouseX  +  measure , -width/4, - height + 100);  
   //      text ( measure + " mouseY ", width/4, -height-400);  

     
    //  mouseY=(int) map (automationLFO[1], 0, 1, 0, 400);  // position from Ableton LFOdecay

     //****  newPosF[networkSize-1]=  map (mouseY, 0, height/2, 0, TWO_PI);

      // mouseX=mouseX+27;
      incrementeX=incrementeX+9;
      incrementeX=incrementeX%800;
      

       /*
      if (incrementeX>=400 && incrementeX<=800){ 
       mouseX =(int) map  (incrementeX, 400, 800, 400, 0);
     //  newPosF[networkSize-1]=  map (mouseX, 400, 0, PI, TWO_PI);
       }
      if (incrementeX<400 ){ 
       mouseX =(int) map  (incrementeX, 0, 400, 0, 400);
     //  newPosF[networkSize-1]=  map (mouseX, 0, 400, 0, PI);
       }
*/
       
/*
        mouseY=(int) map (v0, 0, 800, 0, 800)%800;

      if (mouseY>=400 && mouseY<=800){ 
       mouseY =(int) map  (mouseY, 400, 800, 400, 0)*-1;
       newPosF[networkSize-1]=  map (mouseY, 400, 0, PI, TWO_PI);
       }

          if (mouseY <400 ){ 
       mouseY  =(int) map  (mouseY , 0, 400, 0, 400)*-1;
       newPosF[networkSize-1]=  map (mouseY, 0, 400, 0, PI);
       }
*/

    
     //  newPosF[networkSize-1]=  map (v0, 0, 800, 0, TWO_PI);
     
//==================== sampling from encoder
   //   newPosF[0]=  map (v0, 0, 800, 0, TWO_PI);
     //  newPosF[1]=  map (v0, 0, 800, 0, TWO_PI);
  //**** newPosF[0]=  map (encodeur[0], 0, 780, 0, TWO_PI)%TWO_PI;
  //  newPosF[1]=  map (v0, 0, 780, 0, TWO_PI);
//==================== 


//==================== sampling from encoder
       float radianTorec;
       radianTorec=(float) map (mouseY, 0, 200, 0, TWO_PI)%TWO_PI;  // position from Ableton LFOdecay    
       newPosF[0]= radianTorec;
         x = displacement*cos(newPosF[i]);  
         y = displacement*sin(newPosF[i]);    
      sphere(side*3);
      sphereDetail( 4*5); 
//==================== 

  text ( " new " + newPosF[0], 0, 300);
  

      float rayon=displacement;
      float polarToCartesionX= displacement*cos(newPosF[0]);
      float polarToCartesionY= displacement*sin(newPosF[0]);

    //  mouseX= (int) polarToCartesionX;
    //  mouseY= (int) polarToCartesionY;



      println ( " polarToCartesionX " + polarToCartesionX + " polarToCartesionY " + polarToCartesionY + " newPosF[networkSize-1] " + newPosF[networkSize-1] );



      

     // followMovementAll();
    //   displayfollowMovementAll();
     //   activeSamplingMeasure(2);
     //  stopSamplingMeasure(3);
    
         activeSamplingInternalClock(1); //do not work
         stopSamplingInternalClock(5);  //do not work
         samplingMovementPro(); 

       //  samplingMovement(2); 
        
  //       print (" v1 ");   print (  v1);  print (" v1 ");   println (  v1); 
    //     sendToTeensy();
 }

//********************* trigEffectToAbletonLive

              if ( oldEncodeur[0] != encodeur[0] ){   
      trigEffect=true;
      textSize(150);
      timeToTrigSomething=millis();
      trigEffectBis=true;
      encodeur[1]= 1;
  }
     else trigEffect=false;

     if (trigEffectBis==true && beatTrigged==true ){
      beginMeasure=measure;
      textSize(400); 
      trigEffectBis=false;  
  }

  if ( measure==beginMeasure+2 ){   
      textSize (200);
    //  trigEffectBis=false;
     // trigEffect=false;
      // send on ableton live
      encodeur[1]= 0;
    }
   oldEncodeur[0]= encodeur[0];


/*
    if ( trigEffectBis==true && millis()>timeToTrigSomething+4000 ){   
      textSize (200);
      trigEffectBis=false;
      trigEffect=false;
      // send on ableton live
      encodeur[1]= 0;
    }
*/
/*
      text  ("  beginMeasure " +  beginMeasure +  " beatTrigged " + beatTrigged + " measure " +  measure, 300, -100);

    text  (" encodeur[1]" + encodeur[1] +  " trigEffectBis " + trigEffectBis +  " encO " +  abs ((int)map (oldEncodeur[0], 0, 800, 0, 127)), 300, -300);
    text  ( " trigEffect " + trigEffect + " enco " +  abs ((int)map (encodeur[0], 0, 800, 0, 127)), 300, -200);
   

 for (int i = 0; i < networkSize; i++) {
//  text ( "metro" + metroPhase[i] + " actual Other" + i + " " + ActualVirtualPositionFromOtherMode[i] + " PendularVirtualPosition " + i + " " + PendularVirtualPosition[i] + " virtual " + i + " " + VirtualPosition[i] + " actual " + i + " " + ActualVirtualPosition[i] + " data " + i + " " + DataToDueCircularVirtualPosition[i], 800, 1600- 100*i );
  }
*/

  text ( " signal3 " + signal[3] , 500, 800);
   text ( " signal4 " + signal[4] , 500, 900);
    text ( " signal5 " + signal[5] , 500, 1000);
     text ( " measure  " + measure + "beatPrecised  " + beatPrecised + " key " + key , 500, 1100);



 
 
 //**************   END MODE SETTING   *************************


  //  followSignal();

  formerAuto= frameCount-1;
  // see storeinput example to create sample


  // midi note data

  string1.display(ver_move1);
  string2.display(ver_move2);
  string3.display(ver_move3);
  string4.display(ver_move4);
  string5.display(ver_move5);
  string6.display(ver_move6);
  string7.display(ver_move7);
  string8.display(ver_move8);

  if (ver_move1>0) {
    ver_move1 = ver_move1 -duration1;
  }
  if (ver_move2>0) {
    ver_move2 = ver_move2 -duration2;
  }
  if (ver_move3>0) {
    ver_move3 = ver_move3 -duration3;
  }
  if (ver_move4>0) {
    ver_move4 = ver_move4 -duration4;
  }
  if (ver_move5>0) {
    ver_move5 = ver_move5 -duration5;
  }
  if (ver_move6>0) {
    ver_move6 = ver_move6 -duration6;
  }
  if (ver_move7>0) {
    ver_move7 = ver_move7 -duration7;
  }
  if (ver_move8>0) {
    ver_move8 = ver_move8 -duration8;
  }

  ver_move1 = - ver_move1;
  ver_move2 = - ver_move2;
  ver_move3 = - ver_move3;
  ver_move4 = - ver_move4;
  ver_move5 = - ver_move5;
  ver_move6 = - ver_move6;
  ver_move7 = - ver_move7;
  ver_move8 = - ver_move8;

  //potar data move the circle

  // translate(width/2, height/2);
  //OSC RECEIVE
  print(" automation3 followMadTrack  "); 
  print (automation3);
  incrementSpeed+=10;
  incrementSpeed=incrementSpeed%width;

  float ver_move = (float) incrementSpeed;
  float triangularLFO = map(automation2, 0, 1, -300, 300); //FollowLFO   .. used to autmationWithMeasureAndNote()
  float hor_move = map(automation3, 0, 1, -300, 300);  // //followMad

  float RColour = map(automation7, 0, 1, 0, 255);
  // float GColour = map(automation4, 0, 1, 0, 255);
  float LFO1= map(automation6, 0, 1, 0, 255);
  float LFO2= map(automation7, 0, 1, 0, 255);

  float BColour = map(automation3, 0, 1, 0, 255);
  //  float XSize = map(automation6, 0, 1, 10, 80);
  float XSize = map(automation1, 0, 1, 10, 80);
  float YSize = map(automation3, 0, 1, 0, 320);
  
   float LFOphase1 = map(automation6, 0, 1, -300, 300);
   float LFOphase2 = map(automation7, 0, 1, -300, 300);
  //  fill(RColour, GColour, BColour);
  ellipse(ver_move, hor_move, 50, 50);
  ellipse(ver_move, triangularLFO, XSize, YSize);
//  ellipse(ver_move, LFOphase1, XSize, YSize); // seeAutomationAreverbershaper
//  ellipse(ver_move, LFOphase2, XSize, YSize); // seeAutomationAreverbershaper
  
  stroke (255,255,0);
  
    ellipse(ver_move, LFO1, XSize, YSize); // seeAutomationAreverbershaper
    
    ellipse(ver_move, LFO2, XSize, YSize); // seeAutomationAreverbershaper
  
  noStroke();
  //  ellipse(400, 400, GColour, GColour);



  // END midi note data 

  //  print (char(key)); println (char(formerKey));
  if (running == false) return;

  int m = millis();
  timeFrame += float(m - lastMillis) * 0.001;
  lastMillis = m;
  // background (0);
  //*********** to read on screen CASES from each frame count 

//**  printDataOnScreen();

  //* ************************ manage strobe with light()
  //  spotLight(102, 153, 100, mouseX, mouseY,cameraZ, 0, 0, -1, PI/2, 1000); 
  //  pointLight(51, 102, 126, mouseX, mouseY, cameraZ);
  if (1000/pulsation*60>=50 && 1000/pulsation*60<=200) { // pulsation of oscillator 11, at the front of the screen; transformed in BPM
    lights();
    if (frameCount%6==0) {
      noLights();
    }
  }
  //************************* end of manage light

  //   doNothing ();// to not repeat case with key
  //==============================TAKE ON BELOW TO RECORD COUPLING

  if (mousePressed != true) {
    coupling = map ((float (mouseX)/width*1), 0, 1, -10, 10 ); //SET COUPLING
    //   key= '#'; keyReleased();
    // keyCode =CONTROL; keyReleased();
    //   net.setCoupling(coupling);
  }


  text(couplingRed, -400, height - 20); 
  //  *********** TAKE ON BELOW TO HAVE THE COUPLING RECORDED RED. AND TAKE OFF ABOVE 
  /*
    couplingRecorded= float (couplingRed)/1000;
   coupling= couplingRecorded;
   net.setCoupling(coupling);
   
   text(couplingRecorded, 400, height - 20);
   */
  //******************************** 

  //======================== TAKE OFF BELOW TO RECORD DATA //======================== TAKE OFF TO RECORD DATA
  if (frameCount == nextFrame) {
    readOneLine();  
    keyReleased(); 
    keyPressed();
  }
  //****************************
  // BEAT_DETECT ();
  //****************************
  print ("FRAMERATIO "); 
  print ((1*frameRatio)); // utilise map (de 1 à 60);
    print ("  ******   FRAMERATIO "); 

  // Calculate the overall order (cohesion) in the network
  PVector order = net.getOrderVector();

  // DATA of cohesion and acceleration of the first and last oscillator
  orderParameter = net.getOrderParameter();

  // averagePhase = order.heading();
 // averagePhase= (net.phase[11]+net.phase[10]+net.phase[9]+net.phase[8]+net.phase[7]+net.phase[6]+net.phase[5]+
 //   net.phase[4]+net.phase[3]+net.phase[2])/(networkSize-2);
  print ("AVERGE PHASE "); 
  print (averagePhase);

 // averageFrequency= (net.naturalFrequency[11]+net.naturalFrequency[10]+net.naturalFrequency[9]+net.naturalFrequency[8]+net.naturalFrequency[7]+net.naturalFrequency[6]+net.naturalFrequency[5]+
 //   net.naturalFrequency[4]+net.naturalFrequency[3]+net.naturalFrequency[2])/(networkSize-2);


  print ("                                   AVERGE FREQUENCY ");  
  print (averageFrequency);

  float deltaPhase = map ((float (mouseY)/width*1), 0, 1, 0, QUARTER_PI ); // option not used
   
//**   averageDeltaPhase=  TWO_PI/ ((net.phase[11]+net.phase[10]+net.phase[9]+net.phase[8]+net.phase[7]+net.phase[6]+net.phase[5]+
// **  net.phase[4]+net.phase[3]+net.phase[2])/ (networkSize-2))*360;
   
  //   averageDeltaPhase=                    (abs((net.phase[11]+net.phase[10])))/TWO_PI*360;
 // averageDeltaPhase=                    (((abs (metroPhase[11])+ abs(metroPhase[10]))))/TWO_PI*360;
//  averageDeltaPhase= map (averageDeltaPhase, 0, TWO_PI, 0, 180);
  print ("                                    averageDeltaPhase ");  
  println (averageDeltaPhase);

  // SHOW_DATA ();
  //****************************
  translate(width/2, -height/2, -1000);// To set the center of the perspective
  rotate(-HALF_PI ); //TO change the beginning of the 0 (cercle trigo) and the cohesion point to - HALF_PI 

  // Draw  spheres corresponding to the phase of each oscillator
  colorMode(RGB, 255, 255, 255);
  //  stroke(75, 190, 70); // do not show the "perspective sphere"
//  print ("formerKeyMetro "); 

  
  if (actualSec==lastSec) {  // trigged on internal clock
      trigRatio = true;
    //  background(127, 40, 60);
   }
   
   else trigRatio = false;
   
   
    if (beatTrigged== true) {  // trigged with measure
      trigRatio = true;
    //  background(127, 40, 60);
   }
  
  else trigRatio = false;
   
  if (formerKeyMetro == 'J' ) { //drive ball with lfo ONCE //  && trigRatio == true
  trigFollowSampling=true;
  }
  
   if (formerKeyMetro != 'J' ) {
//   if (formerKeyMetro == 's' ||  formerKeyMetro ==  '@' || formerKeyMetro ==  'B' ) { //you can't distribuate data to others balls  //formerKeyMetro == '*' || formerKeyMetro == '$' ||
  trigFollowSampling=false;
  }
      
      
  if (trigFollowSampling == true ) {
      print (" trigFollowSampling ");   println (trigFollowSampling); 
  
    //  followMadTrack1bis(); ..  folloLFO with my technique
    //    followSignal();
  //****  delayTimeFollowPhase11=60;  // to control time phase offseet with a lot of delay time. You can wait one seconde before the next ball follow the previous ball
    
    
  //  followSignalSampled(frameRatio);
    samplingMovementPro();
  //  noStroke();
  //  fill( 255, 40, 40 );
  // circle ( 100* cos (movement)+400, 100*sin (movement)+400, 20);
  //   followSignalSampled(frameRatio); //no WORK with frame
     followSignalSampledOppositeWay(frameRatio);// with millis()
  //  phasePattern();
   // pendularPatternNoJoe(); // without transformation of position's datas in the Arduino.
    
    rotate(PI/2);
    printDataOnScreen();
    stroke(255);
    

    rect( (currTime % 2) / 2 * width, 10, 2, 8 );
  
//  println (currTime % 2);
    rect( (currTime % 4) / 4 * width, 20, 2, 8 );
    rect( (currTime % 8) / 8 * width, 30, 2, 8 );
    
    rotate(-PI/2);
    countRevs();
   }
   
   modePendulaireModeCirculaire();
   

  
  // ================================= 


  // countRevs();   
  println(frameCount + ": " + Arrays.toString(rev));
  // ================== fonction not used
  // devant_derriere();
  // manageCoupling();
  // mouseMovedPrinted ();
  // SoundmouseMoved(); // to automatise sound with speed. In the setup uncomment the out1, out2 ...

  if (formerKey== '!') {
    formerSartKey = formerKey;
  }

  if (key=='j') {// send a trig to start record in Ableton live 
    background(255);
    startStop= 3;//
    key='='; 
    keyPressed();
    print ("startStop from the beginning: "); 
    println (startStop);
    key='#'; // reset key to a key doing nothing
  } else {
    startStop= 2;
  } 

  // option to control sound in Live when the animation is stopped then started again and when oscillator 11 touches the left  
  if (formerSartKey == '!' &&  TrigmodPos[networkSize-1]>=0 && TrigmodPos[networkSize-1]<1) { 
    println ("TRIG LIVE WITH oscillator 11 on LEFT" ); //
    startStop= 1;  
    print ("MOVEMENT AND TIMER is already started, now START LIVE: "); 
    println (startStop );
/*
    String dataMarkedToDue  ="<" 
    
      + mapAcceleration[11]+","+  int  (1000/avgTimer.average()*60*1000)  +","+cohesionCounterHigh+","
      //+ onOFF+"," +nextScene+","
      //     + mapAcceleration[11]+","+ mapAcceleration[11]+","+mapAcceleration[11]+","+ mapAcceleration[11]+","+mapAcceleration[11]+"," 

   
      +TrigmodPos[11]+","+TrigmodPos[10]+","+TrigmodPos[9]+","+TrigmodPos[8]+","+TrigmodPos[7]+","+TrigmodPos[6]+","+TrigmodPos[5]+","+TrigmodPos[4]+","+TrigmodPos[3]+","+TrigmodPos[2]+","+TrigmodPos[1]+","+TrigmodPos[0]+ "," // to manage 12 note

      +cohesionCounterLow +","+ cohesionCounterHigh +","+ int (map (LevelCohesionToSend, 0, 1, 0, 100))+ ","+ startStop + ">"; // (2= neither start, neither stop)   cohesionCounterHigh // +orderCohesion+ ">";LevelCohesionToSend ","+ int (map ( LowLevelCohesionToSend, 0, 1, 0, 100))+ 

    print ("dataStart: "); 
    println(frameCount + ": " +  " " + ( dataMarkedToDue ));
*/
    formerKey = '#'; //reset formerkey to not trigging LIVE
    formerSartKey = formerKey;
  }
 
  // bpmAsfrequencyfunction ();

  textSize (100);


  if ( key=='*' ) {// || key==',' || key==';' || key==':'
    circularMov = true;
  }

  if ( key=='$') {//
    circularMov = false;
  }

  cohesionTrig = int (map (LevelCohesionToSend, 0, 1, 0, 100));
  println (cohesionTrig);

  // ***** automatise Oscillator Moving with a former Key
   arduinoPos(); // // carefull with arduinoPos and function after arduinopos
/*
   if (DataToDueCircularVirtualPosition[0]>0){
       for (int i = 0; i < networkSize; i=+1 ){
       // result_modulo[i]= (int)  (DataToDueCircularVirtualPosition[i]/6400)+1;
       // AlternativeVirtualPositionFromOtherMode[i]=DataToDueCircularVirtualPosition[i]; // - ActualVirtualPositionFromOtherMode[i]
         text ( " result_modulo " + i + " " +   " AlternativeVirtualPositionFromOtherMode[i] " + i + " " +  ActualVirtualPositionFromOtherMode[i] , -800, 800-100*i );
        // AlternativeVirtualPositionFromOtherMode[i]=DataToDueCircularVirtualPosition[i]%result_modulo[i];
         text ( "   AlternativeVirtualPositionFromOtherMode[i] " + i + " " +  ActualVirtualPositionFromOtherMode[i] , -800, -1600-100*i );
       } 
    } 
*/
 

   if (formerKeyMetro != 'J') { //countRevolutions when it is not the mode J
   countRevs();
  }
       
   //**********************************************************************    
   // STARTERCASE with formerKey
   //  starterCaseUsedorNot();
   // ENDSTARTERCASE




  //************ arduinoPos(); // to control Pos of motor and Trigging note and computing pulsation
  // countPendularTrig ();
  //frameStop();
  formerFormerKey= formerKey; 
  printModeAndKey();

  if ( key==',') {
    //    formerKey= formerKey;
    //    formerFormerKey= formerFormerKey;
    //    formerKeyCodeAzerty =formerKeyCodeAzerty;
  }
  
  if ( formerKeyMetro == 'J') {
      
    //    formerKey= formerKey;
    //    formerFormerKey= formerFormerKey;
     //   formerKeyCodeAzerty =formerKeyMetro;
  }

  
  for (int i = 2; i < networkSize; i++) {
    phaseReturned[i]=net.phase[i];
  }
  oscSend();
  // =============== =============== =============== =============== =============== =============== =============== END OF MAIN LOOP   
  // =============== =============== =============== =============== =============== =============== =============== END OF MAIN LOOP   
  // =============== =============== =============== =============== =============== =============== =============== END OF MAIN LOOP
  // =============== =============== =============== =============== =============== =============== =============== END OF MAIN LOOP
}

//trigRightTemp[i] = int [] TrigModPos { 
//if former





void BEAT_DETECT () {
  // end beatdetect
}

void manageCoupling() {
 
  if (orderParameter<=0.01  ) { //  net.velocity[0]<0 && net.velocity[0]>-1.46c
    coupling= (-coupling);
    //  coupling = exp(abs(coupling));
    net.setCoupling(coupling);
  } else  if (orderParameter>=0.1  ) {
    coupling = map ((float (mouseX)/width*1), 0, 1, -10, 10 );
    net.setCoupling(coupling);
  } 
  print ("coupling_Managed");    
  println ( coupling);
} 

void  doSEVEN() {

  //  if (frequencyEnergy(k)>1.7 ) {
  if ((K>199 && H <200)&& S>150) {
    //   if ((H>199 && H <200)&& S>150){

    print (" doSEVEN()doSEVEN()doSEVEN()doSEVEN()doSEVEN()doSEVEN()doSEVEN()doSEVEN()doSEVEN()");

    //   key='M'; keyPressed();
    key='4'; 
    keyReleased(); // '6';
    // find something actualising or doing case 7 automatical when kick is upper than 1.7
  }
}
void devant_derriere() {
  //    if ( (net.phase[networkSize] && rev[networkSize])  > (net.phase[0] && rev[0])){//     (net.phase[0] >  (j[i]==0 && rev[i]<0))  { 

  if ( (net.phase[9]  > net.phase[0]) &&  ( rev[9]  > rev[0]+2)) {//     (net.phase[0] >  (j[i]==0 && rev[i]<0))  { 

    print (" net.phase[9] "); 
    print ( net.phase[9] );  
    print (" net.phase[0 "); 
    print ( net.phase[0] ); 
    key = '3'; 
    keyReleased();
  }

  if ( (net.phase[0]  > net.phase[9]) &&  ( rev[0]  > rev[9]+2)) {//     (net.phase[0] >  (j[i]==0 && rev[i]<0))  { 

    print (" net.phase[9] "); 
    print ( net.phase[9] );  
    print (" net.phase[0 "); 
    print ( net.phase[0] ); 
    //       key = 'O'; keyPressed ();   
    key = '4'; 
    keyReleased();
  }
}


void countRevs() { // ============================================= Ter NE PAS TOUCHER LE COMPTEUR ou Reduire l'espace avant et apres 0 pour eviter bug à grande vitesse

  onOFF=0;

  for (int i = 0; i < networkSize; i++) { 
//**    print (net.oldPhase[i]); print ("count rev ");   println (net.phase[i]); 
    // decrement caused by negative angular velocity
    // both positive angles || both negative angles || positive-to-negative angle
    //   if (//(net.oldPhase[i] < 0.25 * PI && net.phase[i] > 1.75 * PI) ||//
    if (
      ((net.oldPhase[i] < 0.25 *PI && net.oldPhase[i]>0)  && (net.phase[i] > -0.25* PI && net.phase[i] <0))  || 
      (net.oldPhase[i] < -1.75 * PI && net.phase[i] > -0.25 * PI)// ||
      // (net.oldPhase[i] < 0.25 * PI && net.phase[i] > -0.25 * PI)
      ) {
      onOFF = 1;
      //    TrigmodPos[i]=0;
      rev[i]--;
      //      print (" revultion negative  "); println (revolution[i]=i+1);
      //   revolution[i]=i+1;
      revolution[i]=0; // trig 0 to sent 0 in Max4Live
  //**    memoryi=i;


      decompte[i] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
    } else { // if you do twice there is a funny bug
      //    decompte[i]  ++; 
      //   revolution[i]=0;
    }


    // increment caused by positive angular velocity
    // both positive angles || both negative angles || negative-to-positive angle

    if (
      ((net.oldPhase[i] > -0.25 *PI && net.oldPhase[i]<0)  && (net.phase[i] < 0.25* PI && net.phase[i] >0))  || 
      (net.oldPhase[i] > 1.75 * PI && net.phase[i] < 0.25*PI)
      ) {
      onOFF = 1;
      //   TrigmodPos[i]=0;
      rev[i]++;
      //   revolution[i]=i+1;
      revolution[i]=0;   // trig 0 to sent 0 in Max4Live
  //**    memoryi=i;
      decompte[i] = 0;  // RESET COUNTER AT 0
    } else {

      decompte[i]  ++; //START COUNTER when a REVOLUTION START OR FINISH

      revolution[i]=1;
    }
     if (  revolution[i]<1) {
  print (" revolution[i] "); print ( memoryi); print ("  "); println (revolution[memoryi]);
    }
  }
  
  /*
  if (

    (net.oldPhase[memoryi] < -1.75 * PI && net.phase[memoryi] >= -0.25*TWO_PI) || ( net.phase[memoryi]<=-TWO_PI+0.23  && net.phase[memoryi] >= -0.25*TWO_PI ) 
    ) {
    onOFF = 1;
    //   background (27,59,78);
    //    TrigmodPos[i]=0;
    rev[memoryi]--;

    // memoryi=i;


    decompte[memoryi] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
  }
 */
} 

void printSummary(int i) {
  /*
    print("oldphase "); print(i); print(" ");
   print(net.oldPhase[i]); print(" ");
   print("phase "); print(i); print(" ");
   print(net.phase[i]); print(" ");
   print("velocity"); print(i); print(" ");
   print(net.velocity[i]); print(" ");  
   print("frequency "); print(i); print(" "); 
   print(net.naturalFrequency[i]);
   print("OldFrequency "); print(i); print(" "); 
   println(OldFrequency[i]);
   */
}
  
void readOneLine() { // read data from recordBis()

  String[] current = split(lines[index], ':');
  frameCountRed = int (current[1]);
    print ("  frameCountRed ");  println (  frameCountRed);
 
  keyCode =  int (current[2]);
     print ("  keyCode ");  println ( char(keyCode) );
  couplingRed= int(current[3]);
  Movement= int(current[4]);
  keyModeRed= (current[5]);
  print ("  MovementRed ");  println (  Movement );
 // movement=  Movement/1000;
  if (++index == lines.length - 1) {
    exit();
  }
  nextFrame = int(split(lines[index], ':')[0]);
}   
void recordBis() {
  
if (frameCount>=0) { 
  if (formerFrame!=frameCount) {
  //  if (formerKey!=key  || formerKeyCode!=keyCode) {
   
 //       if (formerCoupling!=coupling) {
      //    if (formerAutomation1!=automation1) { 
       //     if (formerKeyMode!=keyMode) { 
            
    output.println(frameCount +  ":" + int (keyCode) + ":" + int (coupling*1000) + ":" + int (automation1*1000) + ":" + keyMode);
    //    } }  } }
   //   }
    }
  }
}

void recordTer() {
  
if (frameCount>=0) { 
  if (formerFrame!=frameCount) {
    if (formerKey!=key) {
      if (formerKeyCode!=keyCode) {
        if (formerCoupling!=coupling) {
          if (formerAutomation1!=automation1) { 
       //     if (formerKeyMode!=keyMode) { 
            
    output.println(frameCount + ":" + (int)key + ":" + (int)keyCode + ":" + int (coupling*1000) + ":" + int (automation1*1000) + ":" + keyMode);
        } }  } //}
      }
    }
  }
}

void bpmAsPulsationFunctionOscillator11 () {

  if (formerKeyMetro == '$' || formerKeyMetro == 'à') { 

    if (decompte[11]>=0 && decompte[11]<1 && isLooping()) {    
      println ("TEST OK");   // if oscillator 11 is at his position 0
      //    if (TrigmodPos[11]>=0 && TrigmodPos[11]<1 && isLooping()){    println ("TEST OK");   // if oscillator 11 is at his position 0
      if (!ready) {
        ready = true;
        prev_time = millis();
      } else {
        int curr_time = millis();

        avgTimer.nextValue(curr_time - prev_time - sketch_pause_interval);

        sketch_pause_interval = 0;

        println("'a' key pressed at " + curr_time);

        prev_time = curr_time;
      }
    }
  }

  if (formerKeyMetro == '£' || formerKeyMetro == '*') { 

    if (decompte[11]>=0 && decompte[11]<1 && isLooping()) {    
      println ("TEST OK");   // if oscillator 11 is at his position 0
      //  if (TrigmodPos[11]>=0 && TrigmodPos[11]<1 && isLooping()){    println ("TEST OK");   // if oscillator 11 is at his position 0

      if (!ready) {
        ready = true;
        prev_time = millis();
      } else {
        int curr_time = millis();

        avgTimer.nextValue(curr_time - prev_time - sketch_pause_interval);

        sketch_pause_interval = 0;

        println("'a' key pressed at " + curr_time);

        prev_time = curr_time;
      }
    }
  }
}

MovingAverage avgTimer = new MovingAverage(2);



/**
 
 * Use  a circular array to store generation step impl. times
 
 * and calculate a moving average.
 
 * 
 
 * Specify the number of values to include in the moving average when
 
 * using the constructor. 
 
 * 
 
 * The implementation time is O(1) i.e. the same whatever the number 
 
 * of values used it takes the same amount of time to calculate the
 
 * moving average.
 
 * 
 
 * @author Peter Lager 2021
 
 */

private class MovingAverage {

  private float[] data;

  private float total = 0, average = 0;

  private int idx = 0, n = 0;



  /**
   
   * For a moving average we must have at least remember the last 
   
   * two values.
   
   * @param size the size of the underlying array
   
   */

  public MovingAverage(int size) {

    data = new float[Math.max(2, size)];
  }



  // Include the next value in the moving average

  public float nextValue(float value) {

    total -= data[idx];

    data[idx] = value;

    total += value;

    idx = ++idx % data.length;

    if (n < data.length) n++;

    average = total / (float)n;

    return average;
  }



  public void reset() {

    for (int i = 0; i < data.length; i++)

      data[i] = 0;

    total = n = 0;
  }


  public float average() {

    return average;
  }
}
void frameratio() { 
  //**************************FRAME RATE    ***********CONTROL FRAME RATIO SPEED

  if ((key == ',')) {
    if (frameRatio>4 ) {// frameRatio !=0 || 
      frameRatio=frameRatio-5;  
      frameRate(frameRatio);
      text((frameRatio), -width/2, -height );
    } else {
      println ("CAREFULLLLLLLLLLLLLLLLLLLLLLLLLLL");
      frameRatio =0; 
      frameRate(frameRatio);
      text((frameRatio), -width/2, -height );
    }
  }

  if ((key == ';')) {

    //int frameRation

    frameRatio +=5;
    if ( frameRatio >=180) {
      frameRatio=60;
    }
    frameRate(frameRatio);
    text((frameRatio), -width/2, -height );
  }
  /*
   if (key == ':') {
   //  frameRatio=30;frameRate(frameRatio); // 30/5 = 6 frameRate ==> 124/5 = 24.8 BPM record. 124/3
   text((frameRatio), -width/2, -height ); 
   if (key == '='){
   frameRatio=30;frameRate(frameRatio);
   text((frameRatio), -width/2, -height ); 
   } 
   
   }
   */
  if (key == '=') {
    //  frameRatio=45;
    frameRatio=30;
    frameRate(frameRatio);
    text((frameRatio), -width/2, -height ); 
    //processingnodata
  } 



  //***********CONTROL FRAME RATIO SPEED
  if (key == '+') {
    frameRatio=120;
    frameRate(frameRatio);
    println ("MAXIMMMMMMMMMMUMMMMMMM");
    text((frameRatio), -width/2, -height );
  }
} 
void keyPressed() {
  
  setMovement(key, true);
  
 if (keyCode == ALT){ // .. in Keypressed
    moveKeys[8]=true;
   }
  
 
  if (key == '@'|| keyCode == ESC) {
    startStop=3;
    OscMessage myMessage15= new OscMessage("/startStop");
    myMessage15.add(startStop);
    oscP5.send(myMessage15, myRemoteLocation);
  }   

  frameratio();

  if ((key == '!'  ) ) {  
    text ("STOP MOVEMENT AND TIMER: and BPM ;) when restart slowly", 400, -400); //     // Toggle between sketch paused - running
    formerKey = '!'; // to prepare the next start. With the touch A you can trig play in live

    startStop= 3; 
    println ( startStop ); // = STOP
    //stopboolean= true;

    String dataMarkedToDue  ="<" 
     // + mapAcceleration[11]+","+ int  (bpmToSend)  +","+cohesionCounterHigh+","+ onOFF+","+nextScene+","
      + mapAcceleration[4]+","+ mapAcceleration[3]+","+mapAcceleration[2]+","+ mapAcceleration[1]+","+mapAcceleration[0]+"," 

     // +(VirtualPosition[11]) +","+VirtualPosition[2] +","+VirtualPosition[11] +","+VirtualPosition[0] +","+VirtualPosition[11] +","
    //  +int (phazi[11])+","+int (phazi[0])+","+int (phazi[11])+","+int (phazi[0])+","+int (phazi[11])+","

    //  +modPos[11]+","+modPos[10]+","+modPos[9]+","+modPos[8]+","+modPos[7]+","+modPos[6]+","+modPos[5]+","+modPos[4]+","+modPos[3]+","+modPos[2]+","+modPos[1]+","+modPos[0]+ "," // to manage 12 note

      +cohesionCounterLow +","+ cohesionCounterHigh +","+ int (map (LevelCohesionToSend, 0, 1, 0, 100))+ ","+ startStop + ">"; 

    print ("dataStop: ");  
    println(frameCount + ": " +  " dataMarkedToDue" + ( dataMarkedToDue ));

    //      encoderReceiveUSBport101.write(dataMarkedToDue ); 

    running = false;


    if (isLooping()) {

      pause_start_time = millis();

      noLoop();
    }
  } 
 // else if (keyCode == BACKSPACE) {
   else if (key == '!')  {
    /*
      running = true; // TRIG the TIMER
     int m = millis();
     lastMillis = m;
     
     sketch_pause_interval = millis() - pause_start_time;
     
     println("Paused at " + millis() + " for " + sketch_pause_interval + "ms");
     */
    noLoop();
    lastMillis=0;// restart period  oscillation number 11 to 0 ms 
    timeFrame=1;
    frameCount=1; // restart the begining of the program
  } 
  if (key == ':'||key == '=') {
    if (key == ':') {
      //    frameRatio=30;
      //    frameRate(frameRatio);
    }
    if (key == '=') {
      //    frameRatio=frameRatio+30;;
      //   frameRate(frameRatio);
    }

    running = true; // TRIG the TIMER
    int m = millis();
    lastMillis = m;

    sketch_pause_interval = millis() - pause_start_time;

    println("Paused at " + millis() + " for " + sketch_pause_interval + "ms");

    loop();
  }


  if (key == '-'  ) //&& song.isPlaying()
  {
  //  song.pause();
  }
  if (key == '_')
  {
    // simply call loop again to resume playing from where it was paused
    //  song.rewind();
  }
} 

void recordFrame() { 

  if (key == '@' || keyCode == ESC) {

    keyMode = " phasePattern ";
    key = '9'; // aligne les ballee
     for (int i = 0; i < networkSize; i++)  {
  // DataToDueCircularVirtualPosition[i]=0;
  
  }
    println ( " send24datasFromRecordFrameFuncrtion?? ");
    send24DatasToTeensy6motors (10,3,-3,1); // 1 means erase data in Teensy
    //  key='j'; keyReleased();
    output.println("1999999:0:0:0:0");
    output.println("2000000:0:0:0:0");
    output.flush();
    output.close();
    // startStop= 3;
    exit();
  }

  // if (frameCount !=formerFrame && (key != '!' && key != ':')  ){// do not record ! && :   // (frameCount !=formerFrame && key != '!' && key != ':') do not record ! only
  //if (frameCount !=formerFrame || key != key || key != '!' || key != ':' || key != ',' || key != ';'|| key != '=') {// do not record ! && :   // (frameCount !=formerFrame && key != '!' && key != ':') do not record ! only
  if (2>=1 ) { // frameCount !=formerFrame  && ( key != '!' || key != ':' || key != ',' || key != ';'|| key != '=')
    recordBis();
    formerFrame= frameCount;
  }
 if ( keyMode == " null " ) {
  
     text (" delayTimeFollowPhase11  ",  200,-1200);
     text ( delayTimeFollowPhase11  ,  200,-1100);
    
    text (" phaseShiftingFollowPhase11  ",  200,-1000);
    text ( phaseShiftingFollowPhase11  ,  200,-900);
    }
}


void bpmAsPulsationFunction () {
  // MIDDLE if ((PendularOldLeftVirtualPosition[i]+800 <= 800 && PendularLeftVirtualPosition[i]+800 >=800) ||
  //     (PendularOldLeftVirtualPosition[i]+800 >= 800 && PendularLeftVirtualPosition[i]+800 <=800)) {

     if ( revolution[networkSize-1]>=0 && revolution[networkSize-1]<1){    println ("TEST OK");   //revolution[11]>=0 && revolution[11]<1 &&// in pendular way, revolution trig 0 on the right and rev trig 0 on left side
 // if (TrigmodPos[0]>=0 && TrigmodPos[0]<1 ||  revolution[0]>=0 && revolution[0]<1) {    
    println ("TEST OK");   // if oscillator 11 is at his position 0. 0 mean on the right
    if (!ready) {
      ready = true;
      prev_time = millis();
    } else if (TrigmodPos[0]>0 ||  revolution[0]>0 ) {
      int curr_time = millis();
      pulsation = avgTimer.nextValue(curr_time - prev_time);
      prev_time = curr_time;
      println("Average time between two pulsation = " + pulsation + "ms");
    }
  }
}

void bpmAsfrequencyfunction () { 
  for (int i = 0; i < networkSize; i++) {
    //  bpmFrequency[i]= net.naturalFrequency[i]*60/4.608*4; // frequencey=1 ==> 1 round in 4.68 sec // *4 is to give an good beat scale
    bpmFrequency[i]= net.naturalFrequency[i]*54.54;
  }          
  if (abs (bpmFrequency[networkSize-1])>= abs (bpmFrequency[0])) {
    bpmToSend= abs(bpmFrequency[networkSize-1]);
  } else  bpmToSend= abs(bpmFrequency[0]);

  print (" bpmToSend");    
  print (" "); 
  print (bpmToSend); 
  println (" ");
}

void SoundmouseMoved()
{

  //      rez= constrain( map( orderParameter, 0, 1, -1, 1), 0, 1 );  
  //       rez= abs (constrain( map( orderParameter, 0, 1, -1, 1), -1, 1 ));

  //   volumei[0]= abs (speedi[0])*vol; // when vol = -1 && speed (0, 10)--> vol decrease.

  //    volumei[0]= abs (-speedi[0])*vol; // when vol = -1 && speed (0, 10)--> vol decrease.

  // volume to go from -50 to 0


  for (int i = 0; i < networkSize; i++) {

    speedi[i]=  (map ((net.velocity[i]*10000), -1000, 1000, -1, 1));
    //         print ("speedi[i "); print (i); print (" "); print  ( speedi[i]); // with this map until case 4 we go from -60 to 60
    //   speedi[i]= map ( (phazi[i]), 0, 14000, -1, 1); // Chnager d'echelle
    //     print ("velocity9 "); print (i);  print (" "); print ( net.velocity[i]); print (" ");  
    print ("speedi "); 
    print (i);  
    print (" "); 
    print ( speedi[i]);         


    volumei[i]= map ((speedi[i]), -1, 35, -50, 6); // 35 is the speed max.
    //       print ("volumei "); print (i); print (" "); print ( volumei[i]);  
    //**************************************************************   SET     VOLUME   WITH SPEED     
    /*
           out0.setGain(volumei[0]);
     out1.setGain(volumei[1]);
     out2.setGain(volumei[2]);
     out3.setGain(volumei[3]);
     out4.setGain(volumei[4]);
     out5.setGain(volumei[5]);
     out6.setGain(volumei[6]);
     out7.setGain(volumei[7]);
     out8.setGain(volumei[8]);
     out9.setGain(volumei[9]);
     
     */
  }

  float RealVelocity9 =   net.velocity[9]/20*2.4; // round*s-1
  float RealVelocity0 =   net.velocity[0]/20*2.4; // round*s-1

  float   bPM_Boundary9 = map (  RealVelocity9, 0, 0.5, 0, 120);// Half a round is the tempo.
  float   bPM_Boundary0 = map (  RealVelocity0, 0, 0.5, 0, 120);// Half a round is the tempo.

  if (bPM_Boundary9 >= bPM_Boundary0) { 
    bPM9= abs(bPM_Boundary9);
  } else  bPM9= abs(bPM_Boundary0);

  print ("velocityReel9 ");    
  print (" "); 
  print ( RealVelocity9); 
  println (" ");  

  print ("BPM9  ");    
  print (" "); 
  print ( bPM9); 
  println (" ");  

  //     constrainedBPM = int (map (bPM9, 0, 400, 20, 200));

  constrainedBPM = int (bPM9);

  print ("constrainedBPM");    
  print (" "); 
  print ( constrainedBPM); 
  println (" ");  




  for (int i = 0; i < networkSize; i++) {

    volumei[i]=-50;
  }
  println ();
}

void devant_derriereAutre() {
  if ( (net.phase[9]  > net.phase[0]) &&  ( rev[9]  > rev[0]+1)) {//     (net.phase[0] >  (j[i]==0 && rev[i]<0))  { 

    print (" net.phase[9] "); 
    print ( net.phase[9] );  
    print (" net.phase[0 "); 
    print ( net.phase[0] ); 
    key = 'O'; 
    keyPressed ();
  }

  if ( (net.phase[0]  > net.phase[9]) &&  ( rev[0]  > rev[9]+1)) {//     (net.phase[0] >  (j[i]==0 && rev[i]<0))  { 

    print (" net.phase[9] "); 
    print ( net.phase[9] );  
    print (" net.phase[0 "); 
    print ( net.phase[0] ); 
    key = '3'; 
    keyReleased ();
  }
}

void SHOW_DATA () {

  // float orderParameter = net.getOrderParameter();
  orderParameter = net.getOrderParameter();

  stroke(100);
  fill(100);


  // float ordometer=  net.orderParameter;  //float ordometer=  orderParameter;
  String ordometer = String.format("Order: %.2f", orderParameter);
  text(ordometer, -width*1.5, 0);

  String couplingFormat = String.format("Coupling: %.2f", coupling);
  text(couplingFormat, -width*-1, 0);


  float ordoMapped= map (orderParameter, 0, 1, 1, 0);



  float orderToexpOpp= 1- exp(-ordoMapped); // ( 0 to 0.632)
  text (orderToexpOpp, -width*1.5, -100);

  //******* THIS ONE (opposed and exponentionalised)?
  float orderToexpOppNormalised = map ( orderToexpOpp, (1-exp(-1)), 0, 1, 0); //( 0 to 1)
  text ( orderToexpOppNormalised, -width*1.5, -200);

  int orderToexpOppNormalisedLive = int (map ( orderToexpOpp, (1-exp(-1)), 0, 127, 0)); //( 0 to 1)
  text ( orderToexpOppNormalisedLive, -width*1.5, -300);



  float orderToexp= 1- exp(-orderParameter); //(0 to 0.632***
  text (orderToexp, -width*1.5, 100);


  float orderToexpMapped = map (orderToexp, 0, (1-exp(-1)), 0, 1);
  text (orderToexpMapped, -width*1.5, 200);

  //******* THIS SECOND ONE    
  float orderToexpMappedBis = map (orderToexp, 0, (1-exp(-1)), 1, 0); // map order from "orderexponnentionnalised scale 0 to 0.640" to linear 1 to 0 
  text (orderToexpMappedBis, -width*1.5, 300);  

  orderToexpMappedOpposedLive =int  (map (orderToexpMappedBis, 0, 1, 0, 127)); // map "order exp and linearised from 0 to 127 to use it in Ableton
  text (orderToexpMappedOpposedLive, -width*1, -300); // BEST MAPPING

  int  orderParameterLiveSimple  =int  (map (orderParameter, 0, 1, 127, 0));
  text (orderParameterLiveSimple, -width*0.5, -300);


  // ********************    
  //    mapAcceleration[i]= constrain ((int (map (abs(net.acceleration[i] *100), 0, 1000, 0, 255))), 0, 255); 

  text (map (mapAcceleration[0], 0, 255, 0, 127), -width*2, -1000); 
  text (map (mapAcceleration[9], 0, 255, 0, 127), -width*0, -1000); 


  float normalizeAcc0 = map ( mapAcceleration[0], 0, 255, 0, 1); 

  float acc0Toexp= 1- exp(-normalizeAcc0);
  text (acc0Toexp, -width*1.5, -700); 

  float acc0ToexpMappedBis = map (acc0Toexp, 0, (1-exp(-1)), 0, 1); // map acceleration0 from "orderexponnentionnalised scale 0 to 0.640" to linear 1 to 0 
  text (acc0ToexpMappedBis, -width*1, -700);  

  acc0ToexpMappedBisLive =int (map ( acc0ToexpMappedBis, 0, 1, 0, 127));
  text (acc0ToexpMappedBisLive, -width*1, -1000); // BEST MAPPING

  float normalizeAcc9 = map ( mapAcceleration[9], 0, 255, 0, 1);
  float acc9Toexp= 1- exp(-normalizeAcc9);

  float acc9ToexpMappedBis = map (acc9Toexp, 0, (1-exp(-1)), 0, 1);
  text (acc9ToexpMappedBis, -width*-0.5, -700);  

  acc9ToexpMappedBisLive=int (map (acc9ToexpMappedBis, 0, 1, 0, 127)); // it stay no too long between 0 and 60, more 60 to 127
  text (acc9ToexpMappedBisLive, -width*-1, -1000); // BEST MAPPING

  print ("acc0 & acc9 exp "); 
  print (acc9ToexpMappedBisLive); 
  print (" ");  
  println (acc9ToexpMappedBisLive);

  /* 
   float orderToexpOpposed= 1- exp(-ordoMapped);
   text (orderToexpOpposed,  -width*1.5, 200);
   */
}

void record() {

  // to STOP record touch @

  if (key == '@') {
    output.flush();
    output.close();
    exit();
  }// else { 
  //   else if (((formerCoupling != coupling) && frameCount %2==0 )|| ((formerCoupling == coupling) && frameCount %2==1)) { // tester l'ancien couple 
  // 
  //      else if (frameCount !=formerFrame){

  if (((((coupling <0 && formerCoupling <0) && coupling < formerCoupling-0.1) || ((coupling >0 && formerCoupling>0) && coupling>formerCoupling+0.1 )) || 
    (((coupling >0 && formerCoupling >0) && coupling < formerCoupling-0.1) || ((coupling <0 && formerCoupling<0) && coupling>formerCoupling+0.1 ))) 

    //  
    //&& (frameCount !=formerFrame )

    // ||  ((formerKey < Key))

    //||(formerKeyCode == int (keyCode)))))


    )
  {

    output.println(frameCount + ":" + (int)key + ":" + (int)keyCode + ":" + int (coupling*1000));
  }
}

void pendularPatternLFO(){ // trigged with J
    println( "pendularPatternLFO right DECREASE phase shifting  witch formerStartKey ")  ; // Incremente together without changing phases   

       
 //   if ((formerSartKey == 'X' || formerSartKey == 'x' || formerSartKey == 'W' || formerSartKey == 'w' || formerKeyMetro  == 'J')) {
       if (keyCode == RIGHT) { 
        k=k-QUARTER_PI/8;
     
   /*  
     if (k<=-8*QUARTER_PI/2) { 
         k = 8*QUARTER_PI;
      }
   */   
  
    }
//  }
  if (keyCode == LEFT) { 
//    println(" pendularPatternLFO left INCREASE phase shifting"); // Incremente together without changing phases  
    if ((formerSartKey == 'X' || formerSartKey == 'x' || formerSartKey == 'W' || formerSartKey == 'w' || formerKeyMetro == 'J')) {
      k= k+QUARTER_PI/8;
      k= k%(8*QUARTER_PI/8);
    }
    if (k>=9*QUARTER_PI/8) { 
   //   k=-k;
    }    
   
  } 

  if (keyCode == DOWN) { 
    println("pendularPatternLFO UP by 2 and change way of LFO2 "); //   TAB -
    for (int i = 2; i < 3; i++) { 
      LFO[i]= map (LFO[i], 0, 1, 0, TWO_PI);
      /*
         if (LFO[i]>=0 && LFO[i]<=1 ) {  
       LFO[i]= map (LFO[i], 0, 1, 0, TWO_PI);
       }
       if (LFO[i]<=1 && LFO[i]>=0) {  
       LFO[i]= map (LFO[i], 1, 1, 0, -TWO_PI);     
       }
       */
    } 
    d=d-25;
    d=d%525;
    keyCode =SHIFT; // to trig only once
  } 
  if (keyCode == UP) { 
    d=d+25;
    d=d%525;
    println("pendularPatternLFO UP by 2 and change way of LFO2 "); //   TAB -
    for (int i = 2; i < 3; i++) { 
      //   LFO[i]= automation3;
      LFO[i]= map (LFO[i], 0, 1, 0, PI);
      printSummary(i);
    }
     keyCode =SHIFT; // to trig only once
  }

  if (keyCode == CONTROL) { 
    println("pendularPatternLFO INCREASE phases with special modulo   "); //P$ 
    //else if (key == 'π') { println("INCREASE phases with special modulo   "); //P$ 
    //  LFO[2]= automation3;
    for (int i = 0; i < networkSize; i++) {

      LFO[i]+= (HALF_PI/(networkSize-2))*(1*(networkSize-1-i)); //
      LFO[i] = LFO[i]%(TWO_PI/1);

      net.phase[i]=  LFO[i]%(TWO_PI/1);

      interPhase[i]= LFO[i]%(TWO_PI/1);
      printSummary(i);  
      keyCode =SHIFT; // to trig only once
    }
  }
  
   keyCode = SHIFT; // to trig only once
   print ("k= shiftingPhaseRatio ");println (k);
   
      text ( " k "+ (k*360) + " delay " + d, -width+800, - height+400);

}

void abletonPattern()
{
    for (int i = 0; i < (networkSize); i++) { 
    {
     oscillator[i]= map (oscillator[i], 0,1, 0, TWO_PI);  //************************************ SET LAST FREQUENCIES as OLD FREQUENCIES
     net.phase[i]= oscillator[i];
    }
  }
  
  /*
 if (formerKey == 'A') { //A$  Shift frequencies one by one. 
    float speeed    = map ((float (mouseY)/width*1.0), 0, 1, -1, 1); 
    speeed=1;
    for (int i = 0; i < networkSize; i++) {
      net.naturalFrequency[i]=OldFrequency[i]; 
      printSummary(i);
    }
    memoryi=11;
//    net.naturalFrequency[memoryi]= speeed;//4.68/2; // 124 bpm
    net.phase[memoryi]= speeed*oscillator[11];//4.68/2; // 124 bpm
  }

  if (formerKey == 'a') { //A$  Shift frequencies one by one. 
    float speeed    = map ((float (mouseY)/width*1.0), 0, 1, -1, 1); 
    for (int i = 0; i < networkSize; i++) {    
      net.naturalFrequency[i]=OldFrequency[i]; 
      printSummary(i);
    }
    memoryi=2;
   net.phase[memoryi]= speeed*oscillator[memoryi];    //4.68/2; // 124 bpm
  }
*/

 }

void circularWay () {
  //************************************ DONT TOUCH  //************************************ RESET OLD FREQUENCIES 
  
  ///******************************============================================================SHIFT SEVERAL OSCILLATOR AT THE SAME TIME

  if (key == 'i') { 
    print("  Shift frequencies one by one, or 5 by five ");
    // net.shiftPhases(5);   
    net.shiftPhases(1);
  }

  if (key == 'u') { //ucircular  Shift frequencies one by one. 
    //  net.shiftPhases(2); 
    net.shiftPhases(-1);
  } 

  if (key == 'I') { //  Shift frequencies one by one, or 5 by five
    // net.shiftPhases(5);   
    net.shiftPhases(1);
  }

  if (key == 'U') { //  Shift frequencies one by one. 
    //  net.shiftPhases(2); 
    net.shiftPhases(-1);
  } 


  // key ='#';  
} 

void circularOTHERWay() { 
  print ("circularOTHERWay based ");
  //  pendularPattern ();
 
} 

void circularPENDULARWay() { 
  print ("circularPENDULARWay based ");
  phasePattern();
  //    pendularOtherPattern ();
}  



void formerx () {
  float k = 0.25;
  print ("char formerFormerKey x?  ");  
  println (char (formerFormerKey));
  print ("circularMov  ");  
  println (circularMov);
  if (circularMov==true ) {
    for (int i = 0; i < (networkSize-1); i++) {  
      PendularLeftVirtualPosition[i]= CircularVirtualPosition[i];
      PendularOldLeftVirtualPosition[i]= CircularOldVirtualPosition[i];
      PendularLeftVirtualPosition[i+1]= CircularVirtualPosition[i+1];
      PendularOldLeftVirtualPosition[i+1]= CircularOldVirtualPosition[i+1];
      print ("PendularLeftVirtualPosition "); 
      print (i); 
      print (" ");   
      print (PendularLeftVirtualPosition[i]); 
      print ("CircularVirtualPosition "); 
      print (i); 
      print (" ");   
      print (CircularVirtualPosition[i]);
    }
  } 
  for (int i = 0; i < networkSize-1; i++) {
    //  net.phase[i]=net.phase[11];

    print ("f: "); 
    println (f);

    net.phase[i]=(net.phase[11]+abstractPhase[i])%(TWO_PI/1);
    // net.phase[i] += (i+1)*0.05;
    net.phase[i]=  net.phase[i]%(TWO_PI);

    //    printSummary(i);


    print ("fmemory: "); 
    println (fmemory);

    //  key='#';
  }
  if (fmemory==k) {

    fmemory=0;
  }
} 

// Mexican-Hat spatial coupling
void initializeCoupling(float[][] Coupling, float sigma) {
  float[][] distance = distanceMatrix();
  for (int i = 0; i < networkSizeGraphic; i++) {
    for (int j = 0; j < networkSizeGraphic; j++) {
      float d = pow(distance[i][j] / sigma, 2);
      float c = (1 / (PI * pow(sigma, 4))) * (1 - 0.5 * d) * exp(-0.5 * d);
      Coupling[i][j] = c;
    }
  }
}

// Calculate the distance between oscillators
float[][] distanceMatrix() {
  float[][] distance = new float[networkSizeGraphic][networkSizeGraphic];
  for (int i = 0; i < networkSizeGraphic; i++) {
    int i1 = i % numCols;
    int j1 = int(floor(i / numCols));
    for (int j = 0; j < networkSizeGraphic; j++) {
      int i2 = j % numCols;
      int j2 = int(floor(j / numCols));
      distance[i][j] = dist(i1, j1, i2, j2);
    }
  }

  return distance;
}

// Set initial phases randomly
void initializePhase(float[] phase) {
  for (int i = 0; i < numRows; i++) {
    for (int j = 0; j < numCols; j++) {
      int index = i * numCols + j;
      phase[index] =  (QUARTER_PI*i);//FREQ ;//
    }
  }
}

// Set natural frequencies to the same random value
void initializeNaturalFrequency(float[] naturalFrequency, float freq) {
  for (int i = 0; i < numRows; i++) {
    for (int j = 0; j < numCols; j++) {
      int index = i * numCols + j;
      naturalFrequency[index] = freq;
    }
  }
} 

void printDataOnScreen() { 
   noStroke();
//**   /*
  text(formerFormerKey, -300, height +300); 
  text(formerKeyCodeAzerty, -100, height + 300);
  text(char (key), 100, height + 300);
  text(char (keyCode), 200, height +300)  ; 
  
    for (int i = 0; i < networkSize; i++) {
      
        text ("trig", -1200, height-500 - 75*i);
        text (TrigmodPos[i], -1000, height-500 - 75*i);
    
    }
  
  text ("mem", -800, height +300+100);
  text (memoryi, -600, height +300+100);
  if (TrigmodPos[networkSize-1]==0) {
   // counter11++;
    counter[networkSize-1]++;
  }  
  if (TrigmodPos[0]==0) {
    counter[0]++;
  } 
  text ( counter[networkSize-1], -600, height +300); 
  text ( counter[networkSize-1], -800, height +300); 
  text ("old", -1200, height +300+100);
  text (oldMemoryi, -1000, height +300+100);
  text ("mem", -800, height +300+100);
  text (memoryi, -600, height +300+100);
  text ("Ratio", -400, height +300+100);
  text (speedDelta, -200, height +300+100);
  text ("block", 0, height +300+100);
  text (oscillatorBlocked, 200, height +300+100);
  String Kratio = nf (k, 0, 1);
  text ("K phi", 0, height +300+200);
  text (Kratio, 200, height +300+200);
  text ("Fratio", 400, height +300+100);
  text (frameRatio, 600, height +300+100);
  text ("D btw case", 600, height +300+200);
  text (d, 1000, height +300+200);
//** */ 
  text ("FrameOffsetPhase11", -1000, height +400+200);
  text (delayTimeFollowPhase11, -200, height +400+200);
  text ("SpacephaseOffset11", 400,  height +400+200);
  text (degrees (phaseShiftingFollowPhase11), 1200, height +400+200);
  text ("measure ", -1000, height +800+200);
//  text (measure , -200, height +800+200);

  text ("Rec ", 800, height +300+0);
  text (measureRecordStart, 1000, height +300+0);
  
  text ("Llast ", 1200, height +300+0);
  text (lastLastSec, 1400, height +300+0);
  text ("last ", 1600, height +300+0);
  text (lastSec, 1800, height +300+0);
  text ("act ", 2000, height +300+0);
  text (actualSec, 2200, height +300+0);
  
  

  /// text (formerFrame, 700, height +300+100);
  text (frameCount, 1000, height +300+100);

  text(coupling, 400, height +300);
  text (frameCount, width/8, -height-200);
  String ONE_DEC = nf (timeFrame, 0, 1); 
  text(ONE_DEC, width/2+100, -height-200);
  String PULSATION = nf (pulsation, 0, 2); 
  text ("W", -width-800, -height -200);
  text (PULSATION, -width-550, -height -200);


  String BPM_PULSATION = nf (1000/pulsation*60, 0, 0); // transform time elapsed betwween two pulsation in BPM
  text ("BPM-W", -width-200, -height );
  text (BPM_PULSATION, -width+200, -height );

  String BPM = nf (bpmToSend, 0, 2); 
  text ("BPM", -width-200, -height -200);
  text (BPM, -width+100, -height-200);
 
  //********
  textSize (50);
  
    text ("BOTT F0", -width-900, height -100);
   text ("XXXX F9", -width-900, height -820);
   text ("FRON F11", -width-900, height -964);
   
  textSize (75);

  for (int i = 0; i < networkSize; i++) {
    if ( factorWay[i]==false) {
      FactorWay[i]=-1;
    } else  FactorWay[i]=1; 
    String FW= nf (FactorWay[i], 0, 0);
    text(FW, -width-800, height -20 - (i+1)*80);
  }

  textSize (75);

  for (int i = 0; i < networkSize; i++) {
    if ( clockWay[i]==false) {
      ClockWay[i]=-1;
    } else  ClockWay[i]=1;     
    String CW = nf (ClockWay[i], 0, 0); 
    text((CW), -width-700, height -20 - (i+1)*80);
  }
/*
  if ( oldClockWay[memoryi]==false) {
    oldC = -1;
  } else 

  oldC = 1;

  String oldClock = nf (oldC, 0, 3); 
  int k = 12;

  text((oldClock), -width-700, height -20 - (k+1)*80);
*/
  /* 
   textSize (50);
   for (int i = 0; i < networkSize; i++) {
   
   String REV = nf (rev[i], 0, 0); 
   //  text(  (net.naturalFrequency[i]), -width-200, height -20 - (i+1)*80); 
   text((REV), -width-700, height -20 - (i+1)*80);
   }
   */
   
 //************** REMETRRE
 
  textSize (50);
  for (int i = 0; i < networkSize; i++) {
    String TWO_DEC = nf (net.naturalFrequency[i], 0, 2); 
    //  text(  (net.naturalFrequency[i]), -width-200, height -20 - (i+1)*80); 
    text((TWO_DEC), -width-400, height -20 - (i+1)*80);
  }  
  textSize (50);

  for (int i = 0; i < 1; i++) {  // metroPhaseOnScreen

    String om = nf (metroPhase[oldMemoryi]-  metroPhase[memoryi], 0, 3); 
    //  text(  (net.naturalFrequency[i]), -width-200, height -20 - (i+1)*80); 
    text(("om " ), -width-300, height -20 - (i+1)*80);
    text((om), -width-200, height -20 - (i+1)*80);
  }

  for (int i = 1; i < 2; i++) {  // metroPhaseOnScreen

    String om = nf (metroPhase[networkSize-1]-  metroPhase[networkSize-1-1], 0, 3); 
    text(("10 "), -width-300, height -20 - (i+1)*80);
    text((om), -width-200, height -20 - (i+1)*80);
  }

  String inter = nf (interPhase[memoryi], 0, 3); 
  int j = networkSize;
  text(("i" ), -width-300, height -20 - (j+1)*80);
  text((inter), -width-200, height -20 - (j+1)*80);

  for (int i = 2; i < networkSize; i++) {  // metroPhaseOnScreen

    String m = nf (metroPhase[i], 0, 3); 
    text(("m" ), -width-300, height -20 - (i+1)*80);
    text((m), -width-200, height -20 - (i+1)*80);
  }

  textSize (50);

  String interCircular = nf (interPhaseCircular[memoryi], 0, 3); 
  int l = networkSize;
  text(("iC" ), -width-100, height -20 - (j+1)*80);
  text((interCircular), -width-0, height -20 - (j+1)*80);

  for (int i = 0; i < networkSize; i++) {  // netPhaseOnScreen

    String n = nf (net.phase[i], 0, 3); 
    text(("n" ), -width-100, height -20 - (i+1)*80);
    text((n), -width-0, height -20 - (i+1)*80);
  }

  for (int i = 2; i < networkSize; i++) {  // metroPhaseOnScreen

    String interPhaseM = nf (interFrequency[i], 0, 3); 
    text(("iF" ), -width+100, height -20 - (i+1)*80);
    text((interPhaseM), -width+200, height -20 - (i+1)*80);
  }
  
}


void formerW() {
   print  (" ACTUAL POSITION ");  print  (" ACTUAL POSITION ");  print  (" ACTUAL POSITION ");
    print  (" ACTUAL POSITION ");
    
  println  ("wwwwwwwwwwwwwwww");
  for (int i = 0; i < networkSize; i++) {    
    ActualVirtualPosition[i]+=0;  
    /*
        ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
     ActualVirtualPosition[i]=ActualVirtualPosition[i]%numberOfStep;
     ActualVirtualPosition[i]+=ActualVirtualPosition[i];
     */
    //*****

    //***  ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;// less conventional than numberOfStep/6*i
    //**   ActualVirtualPosition[i]+=ActualVirtualPosition[i]%numberOfStep;
    //**  ActualVirtualPosition[i]=ActualVirtualPosition[i]%numberOfStep*5;

    //    ActualVirtualPosition[i]=+3200;
    ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
    //VirtualPosition[i]= VirtualPosition[i]+(1600); 

    key='#';
    //formerKey='#';
  }
}



void formerKeyL() {
  if ( formerSartKey!='@') {

    float tempo= 1000/pulsation*60;

    print ("tempo ");  
    println (tempo);
    float ratioTempo= (oscillatorBlocked-1)%8.0 ;

    // float tempo108= (27*ratioTempo)+27;// pianophase
    float tempo108= (30*ratioTempo);// madrush
    float tempo109= (27*ratioTempo)%108;
    print ("ratioTempo ");  
    println (ratioTempo);
    print ("tempo108 ");  
    println (tempo108);
    print ("tempo109 ");  
    println (tempo109);

    //   if ( TrigmodPos[9]>=0 && TrigmodPos[9]<1 ||  revolution[9]>=0 && revolution[9]<1) {
    if ( TrigmodPos[0]>=0 && TrigmodPos[0]<1 ||  revolution[0]>=0 && revolution[0]<1) {

      if (tempo>tempo108+1.0) {
        key='h'; 
        keyReleased();
      }
      if (tempo<tempo108-1.0) {
        key='y'; 
        keyReleased();
      }
    }
  }
}

void followMovementAll() {
  shiftFollowMov();
    for (int i =1; i < 2; i+=1) {
          LFO[0]=  map (automation1 , 0, 1, 0, TWO_PI);//net.phase[11];// map (automation1 , 0, 1, 0, TWO_PI);
          LFO[i]= LFO[0];
  if (millis()>formerEvent[200+i]+0*i) {
   
    
      newPosX[i] = displacement* cos(LFO[i]);
      newPosY[i] = displacement* sin(LFO[i]);
      formerEvent[200+i]= millis();
    }
  }

  if (millis()>formerEvent[200+2]+d*2) {
    // delay();
    LFO[2]= LFO[1];
    //***   LFO[2]= map (automationLFO[0],0, 1, -PI, 0); // gauche droite vers le haut
    newPosX[2] = displacement*cos (LFO[2]);
    newPosY[2] = displacement*sin (LFO[2]);
    formerEvent[200+2]= millis();
  }

  if (millis()>formerEvent[200+3]+d*3) {
    LFO[3]= LFO[2];
     newPosX[3] = displacement*cos (LFO[3]);
     newPosY[3] = displacement*sin (LFO[3]);
    formerEvent[200+3]= millis();
  }

}

void displayfollowMovementAll(){
 // keyPressedLFO();
  
  for (int i =0; i < 1; i++) {
    if (millis()>formerEvent[200+i]+0) {
      //   formerPositionLFO[0]=LFO[0];

   //   LFO[0]= map (automation1, 0, 1, 0, 1); // gauche droite vers le haut
     
   //      LFO[0]=  map (automation1 , 0, 1, 0, TWO_PI);//net.phase[11];// map (automation1 , 0, 1, 0, TWO_PI);

  //     LFO[0]= net.phase[11];// map (automation1 , 0, 1, 0, TWO_PI);
 
   //   LFO[0]=net.phase[0];
   //   newPosX[i] = displacement*cos (LFO[0]);
   //   newPosY[i] = displacement*sin (LFO[0]);
      formerEvent[200+0]= millis(); 

      print (" cos LFO  " ); print (cos (LFO[0]) ); print (" automation1 " );  print (automation1); print (" formEvent  " ); print (i); print (formerEvent[200+i]);
      print (" net.phase[11]  " );  println (net.phase[11] );
    }
  } 
// translate( 0, 0, 1000);
  for (int i =0; i < networkSize-2; i++) {

    pushMatrix();  
    

    sphere(side*3); // this sphere serves as a reference
    sphereDetail( 4*5);
    colorMode(HSB, TWO_PI, 100, 100);
    noStroke();

    // Color sphere and Draw them, depending of acceleration or later with "chimera state"
    mapAcceleration[i]= constrain ((int (map (abs(net.acceleration[i] *100), 0, 150, 0, 255))), 0, 255); 
    mapAccelerationinversed[i]= abs (int (map ((net.acceleration[i] *100), -200, 200, 0, 255)));
    //********************************************************* BEGIN GRAPHIC CHIMERA STATE
    //********************************************************* END GRAPHIC CHIMERA STATE
    translate (newPosX[i], newPosY[i], 200+(50*5*i));  //*-1 go in clockwise, *1 go in CCW
    colorMode(RGB, 255, 255, 255);
    fill (255,255,0);
    fill( mapAccelerationinversed[i], 255, 0 ); // Sepheres are all modulated with the same color. depending of acceleration
    sphere(side*3);

    popMatrix();
  }
  //   rotate (-HALF_PI);
}

void followLFO() {
  shiftFollowMov();
  if (millis()>formerEvent[200+3]+d) {
    // delay();
    LFO[9]= LFO[8];
    LFO[8]= LFO[7];
    LFO[7]= LFO[6];
    LFO[6]= LFO[5];
    LFO[5]= LFO[4];
    LFO[4]= LFO[3];
    LFO[3]= LFO[2];
    //***   LFO[2]= map (automationLFO[0],0, 1, -PI, 0); // gauche droite vers le haut
    for (int i =3; i < networkSize; i++) {
      newPosX[i] = displacement*cos (LFO[i]);
      newPosY[i] = displacement*sin (LFO[i]);
      formerEvent[200+3]= millis();
    }
  }

  if (millis()>formerEvent[200+2]+d) {
    // delay();
    LFO[2]= LFO[1];
    //***   LFO[2]= map (automationLFO[0],0, 1, -PI, 0); // gauche droite vers le haut
    newPosX[2] = displacement*cos (LFO[2]);
    newPosY[2] = displacement*sin (LFO[2]);
    formerEvent[200+2]= millis();
  }

  if (millis()>formerEvent[200+1]+d*1) {
    LFO[1]= LFO[0];
    newPosX[1] = displacement*cos (LFO[1]);
    newPosY[1] = displacement*sin (LFO[1]);
    formerEvent[200+1]= millis();
  }


  for (int i =0; i < 1; i++) {
    if (millis()>formerEvent[200+i]+0) {
      //   formerPositionLFO[0]=LFO[0];

      LFO[0]=  map (automation1 , 0, 1, 0, TWO_PI);//net.phase[11];// map (automation1 , 0, 1, 0, TWO_PI);

      newPosX[0] = displacement*cos (LFO[0]);
      newPosY[0] = displacement*sin (LFO[0]);
      formerEvent[200+0]= millis(); 

      print ("LFO  " ); 
      print (i);  
      print (LFO[0] ); 
      print ("automationLFO " ); 
      print (i); 
      print (automationLFO[i]); 
      print ("formEvent " ); 
      print (i); 
      print (formerEvent[200+i]);
    }
  } 
// translate( 0, 0, 1000);
  for (int i =0; i < networkSize-2; i++) {

    pushMatrix();  
    

    sphere(side*3); // this sphere serves as a reference
    sphereDetail( 4*5);
    colorMode(HSB, TWO_PI, 100, 100);
    noStroke();

    // Color sphere and Draw them, depending of acceleration or later with "chimera state"
    mapAcceleration[i]= constrain ((int (map (abs(net.acceleration[i] *100), 0, 150, 0, 255))), 0, 255); 
    mapAccelerationinversed[i]= abs (int (map ((net.acceleration[i] *100), -200, 200, 0, 255)));
    //********************************************************* BEGIN GRAPHIC CHIMERA STATE
    //********************************************************* END GRAPHIC CHIMERA STATE
    translate (newPosX[i], newPosY[i], 200+(50*5*i));  //*-1 go in clockwise, *1 go in CCW
    colorMode(RGB, 255, 255, 255);
    fill( mapAccelerationinversed[i], 255, 0 ); // Sepheres are all modulated with the same color. depending of acceleration
    sphere(side*3);

    popMatrix();
  }
  //   rotate (-HALF_PI);
}



void followLFObis() {
shiftFollowMov();



  // delay();

  //***   LFO[2]= map (automationLFO[0],0, 1, -PI, 0); // gauche droite vers le haut
  for (int i =3; i < networkSize-2; i++) {
    if (millis()>formerEvent[200+i]+0) {
      LFO[i]= LFO[i-1];

      newPosX[i] = displacement*cos (LFO[i]);
      newPosY[i] = displacement*sin (LFO[i]);
      formerEvent[200+i]= millis();
    }
  }


  if (millis()>formerEvent[200+2]+d) {
    // delay();
    LFO[2]= LFO[1];
    //***   LFO[2]= map (automationLFO[0],0, 1, -PI, 0); // gauche droite vers le haut
    newPosX[2] = displacement*cos (LFO[2]);
    newPosY[2] = displacement*sin (LFO[2]);
    formerEvent[200+2]= millis();
  }

  if (millis()>formerEvent[200+0+1]+0*(0+1)) {
    //   formerPositionLFO[0]=LFO[0];

    LFO[1]=LFO[0]; // gauche droite vers le haut
    newPosX[1] = displacement*cos (LFO[1]);
    newPosY[1] = displacement*sin (LFO[1]);
    //  formerEvent[200+0]= millis();
    formerEvent[200+0+1]= millis(); 


    println (" ");
  }


  for (int i =0; i < 1; i++) {
    if (millis()>formerEvent[200+i]+0) {
      //   formerPositionLFO[0]=LFO[0];

      LFO[0]=  map (automation1 , 0, 1, 0, TWO_PI);//net.phase[11];// map (automation1 , 0, 1, 0, TWO_PI);

      newPosX[0] = displacement*cos (LFO[0]);
      newPosY[0] = displacement*sin (LFO[0]);
      formerEvent[200+0]= millis(); 

      print ("LFO  " ); 
      print (i);  
      print (LFO[0] ); 
      print ("automationLFO " ); 
      print (i); 
      print (automationLFO[i]); 
      print ("formEvent " ); 
      print (i); 
      print (formerEvent[200+i]);
    }
  } 


  for (int i =0; i < networkSize-2; i++) {

    pushMatrix();  

    sphere(side*3); // this sphere serves as a reference
    sphereDetail( 4*5);
    colorMode(HSB, TWO_PI, 100, 100);
    noStroke();

    // Color sphere and Draw them, depending of acceleration or later with "chimera state"
    mapAcceleration[i]= constrain ((int (map (abs(net.acceleration[i] *100), 0, 150, 0, 255))), 0, 255); 
    mapAccelerationinversed[i]= abs (int (map ((net.acceleration[i] *100), -200, 200, 0, 255)));
    //********************************************************* BEGIN GRAPHIC CHIMERA STATE


    //********************************************************* END GRAPHIC CHIMERA STATE
    translate (newPosX[i], newPosY[i], 200+(50*5*i));  //*-1 go in clockwise, *1 go in CCW
    colorMode(RGB, 255, 255, 255);
    fill( mapAccelerationinversed[i], 255, 0 ); // Sepheres are all modulated with the same color. depending of acceleration
    sphere(side*3);

    popMatrix();
  }
  //   rotate (-HALF_PI);
}

void shiftFollowMov() {
  
 
  if (keyCode == LEFT) {  
    println( " LEFT INCREASE decay offseft shiftFollowMov ")  ; 
 //   decayshiftFollowMov=decayshiftFollowMov+50;
    decayshiftFollowMov++;
  
    println ("d= timeOffsetRatio: "); 
    println ( decayshiftFollowMov);
    textSize (100);
    text (" decayshiftFollowMov  ", decayshiftFollowMov, 200,200);

    keyCode=SHIFT; // to trig once keyPressedLFO
  }


  if (keyCode == RIGHT) { 

    println( " right INCREASE decay offseft shiftFollowMov")  ; 
     decayshiftFollowMov=decayshiftFollowMov-50;  
    println ("d= timeOffsetRatio: "); 
    println (d);
    keyCode=SHIFT; // to trig once keyPressedLFO
  }

  if (keyCode == UP) { 

    oscillatorBlocked++;
  
    if (oscillatorBlocked > (networkSize-1)) { 
      oscillatorBlocked=1;
    }
   println ( decayshiftFollowMov);
   textSize (100);
   text (" decayshiftFollowMov  ", decayshiftFollowMov, 300,300);
    
    keyCode=SHIFT; // to trig once keyPressedLFO
  }

  if (keyCode == DOWN) { 
/*
    oscillatorBlocked--;
    // keyCode = LEFT; 
    print ("  oscillatorBlocked ");     
    println (oscillatorBlocked); 
    if (oscillatorBlocked < 2) { 
      oscillatorBlocked=11;
    }
*/
    keyCode=SHIFT; // to trig once keyPressedLFO
  }
} 

void keyPressedLFO() {

  float PhaseDecay=d*QUARTER_PI/8;

  if (keyCode == LEFT) {  
    println( " LEFT INCREASE decay offseft in  keyPressedLFO ")  ; // Incremente together without changing phases   
    d+=50;
    d=d%1000;
    println ("d= timeOffsetRatio: "); 
    println (d);

    keyCode=SHIFT; // to trig once keyPressedLFO
  }


  if (keyCode == RIGHT) { 

    println( " right INCREASE timeOffset    from F0 (the behind one  the fastest) F1 very slow =0.021 ")  ; // Incremente together without changing phases   
    d+=50;
    d=d%1000;
    println ("d= timeOffsetRatio: "); 
    println (d);

    keyCode=SHIFT; // to trig once keyPressedLFO
  }

  if (keyCode == UP) { 

    oscillatorBlocked++;
    print (" oscillatorBlocked ");     
    println (oscillatorBlocked); 
    if (oscillatorBlocked > (networkSize-1)) { 
      oscillatorBlocked=1;
    }
    keyCode=SHIFT; // to trig once keyPressedLFO
  }

  if (keyCode == DOWN) { 

    oscillatorBlocked--;
    // keyCode = LEFT; 
    print ("  oscillatorBlocked ");     
    println (oscillatorBlocked); 
    if (oscillatorBlocked < 2) { 
      oscillatorBlocked=11;
    }

    keyCode=SHIFT; // to trig once keyPressedLFO
  }
} 
void followMadTrack1bis() {
  //    pendularPatternLFO();
  //    phasePattern();
  if (millis()>formerEvent[200+3]+d) {
    formerEvent[200+3]= millis();
    //***    if (key!='K' || key!='K'){  
    LFO[11]= (LFO[10]+k)%TWO_PI;
    LFO[10]= (LFO[9]+k)%TWO_PI;
    LFO[9]= (LFO[8]+k)%TWO_PI;
    LFO[8]= (LFO[7]+k)%TWO_PI;
    LFO[7]= (LFO[6]+k)%TWO_PI;
    LFO[6]= (LFO[5]+k)%TWO_PI;
    LFO[5]= (LFO[4]+k)%TWO_PI;
    LFO[4]= (LFO[3]+k)%TWO_PI;
    LFO[3]= (LFO[2]+k)%TWO_PI;


    for (int i =3; i < 12; i++) {
      if (millis()>formerEvent[200+0]+0) {        
        net.phase[i]=LFO[i];
      }
    }
  }
  for (int i =2; i < 3; i++) {
    if (millis()>formerEvent[200+0]+0) {

      LFO[i]= map (automation3, 0, 1, 0, TWO_PI); // gauche droite vers le hau.t CIRCULAR MODE usefull ?
      formerEvent[200+0]= millis(); 
      net.phase[i]=LFO[i];

      print ("automation3 " );  
      print (automation3);
    }
  }       

  pendularPatternLFO();
  if (key=='u' || key=='U') {   
    for (int i =2; i < 12; i++) {
      if (millis()>formerEvent[200+0]+0) {        
        //   net.phase[i]=net.phase[i];
      }
    }
  }
}




void drawBall(int n, float phase) {
//  println ( "*************************** drawBall " );
  pushMatrix();
  translate(-w2, -h2, -1000);
  noStroke();
  float side = height*0.15*1/nbBall;
  float rayon = width/2;

  a = rayon*cos(phase); //-300 à 300
  b = rayon*sin(phase);
  
//   print (" phaseinDB" + phase);

  translate (a, b, 200+(50*5*n)); // on voit la vague comme j'aimerais si on fait ce qui est dit ligne 153
  translate (100, 100, 200+(50*5*n));
  colorMode(RGB, 255, 255, 255);
  fill( 0, 255, 0 );
  sphere(side*3);
  popMatrix();
}

float [] phaseReturnedBis(float[] netPhase) { 
  //if former
  for (int i = 2; i < networkSize; i++) {
    //   netPhase[i] = net.phase[i];
    netPhase[i] = netPhase[i];
  }
  return netPhase;  // Returns an array of 3 ints: 20, 40, 60
}

void follow( int target, int follower, int delais, float deltaphase) {
  int step = frameCount % nbMaxDelais;
  int followedStep = (step + nbMaxDelais - delais) % nbMaxDelais;
  phases[follower][step] = diffAngle(phases[target][followedStep] + deltaphase, 0);
}

float diffAngle(float angle1, float angle2) { // return the difference angle1 - angle2 between two angle between -PI PI
  float result = angle1 - angle2;
  while (result > PI) {
    result -= 2 * PI;
  }
  while (result < -PI) {
    result += 2 * PI;
  }
  return result;
}

void drawBallOppositeWay(int n, float phase) {
//  println ( "*************************** drawBallOPPOO " );
  pushMatrix();
  translate(-w2, -h2, -1000);
  noStroke();
  float side = height*0.15*1/nbBall;
  float rayon = width/2;

  a = rayon*cos(phase+PI); //-300 à 300
  b = rayon*sin(phase+PI);

//  translate (a, b, 200+(75*5*n)); // on voit la vague comme j'aimerais si on fait ce qui est dit ligne 153
  translate (a, b, 200+(50*5*n));
  colorMode(RGB, 255, 255, 255);
  fill( 255, 0, 0 );
  sphere(side*3);  // redsphere
  popMatrix();
}

void followOppositeWay( int target, int follower, int delais, float deltaphase) {
  int step = frameCountBis % nbMaxDelais;
  int followedStep = (step + nbMaxDelais - delais) % nbMaxDelais;
  phases[follower][step] = diffAngle(phases[target][followedStep] + deltaphase, 0);
}

float diffAngleOppositeWayOppositeWay(float angle1, float angle2) { // return the difference angle1 - angle2 between two angle between -PI PI
  float result = angle1 - angle2;
  while (result > PI) {
    result -= 2 * PI;
  }
  while (result < -PI) {
    result += 2 * PI;
  }
  return result;
}



void arduinoPosJO() { // envoyer les informations aux moteurs

  for (int i = 2; i < nbBall; i++) {

    //  phaseToMotor[i]= (int) map (phaseMapped[i], -PI, PI, 0, 6400);
    phaseToMotor[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, 6400);
  }

 // teensyport.write(dataToControlMotor); // Send data to Teensy. only the movement
  println(frameCount + ": " +  " dataToControlMotor " + ( dataToControlMotor ));
}

void keyReleasedfollowSignal() {
   if (keyCode == RIGHT) {
  phaseShiftingFollowPhase11++;  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6
  phaseShiftingFollowPhase11=phaseShiftingFollowPhase11%20;
  key='#';}

    if (keyCode == LEFT) {
  delayTimeFollowPhase11++;  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6
  delayTimeFollowPhase11= delayTimeFollowPhase11%20;
  key='#';}
}

void keyReleasedfollowSignalPerfect() {
  if (keyCode == RIGHT) {
    print ("keyReleasedfollowSignalPerfect right INCREASE timeOffset ")  ; // Incremente together without changing phases
  //  d++;
    timeFrameOffsetFollowing++;
//    d=d%20;
    timeFrameOffsetFollowing=timeFrameOffsetFollowing%20;
    print (" keyReleasedfollowSignalPerfect d= timeOffsetRatio: ");
    println (timeFrameOffsetFollowing);
    keyCode = SHIFT;
  }

  if (keyCode == LEFT) {
    print ("keyReleasedfollowSignalPerfect  left INCREASE phase shifting"); //
    k= (k+QUARTER_PI/4);
    k= k%(8*QUARTER_PI/2);   

    if (k>=8*QUARTER_PI/2) { 
      k=-k;
    }   
    print ("k= shiftingPhaseRatio ");
    println (k);
    keyCode = SHIFT;
  }
}
void followSignal() {
  keyReleasedfollowSignalPerfect();

  println(frameCount + ": " + ( debug ));
 // background(0);

  //  rotate(- TWO_PI+ HALF_PI  ); //TO change the beginning of the 0 (cercle trigo) and the cohesion point to - HALF_PI
  //  translate(width/2-400, -height/2, -1000);// To set the center of the perspective

  if (!firstFollowingStarted) {
    float angle = diffAngle(PI + (frameCount / 4.0) * cos (1000 / 500.0), 0);

    print ("angle ");
    println ( angle );

    LFO[2]= map (automation3, 0, 1, 0, TWO_PI);

    if (angle > 0 )
      phases[0][frameCount % nbMaxDelais]= LFO[2];  // gauche droite vers le hau.t CIRCULAR MODE usefull ?// diffAngle(angle, HALF_PI);//% TWO_PI  // position du point de depart + vitesse * phi constant  ==> ici vitesse du point phases[0] est constante
    else
      phases[0][frameCount % nbMaxDelais]= LFO[2];
      drawBall(0, phases[0][frameCount % nbMaxDelais]); // affiche le point 0. NE PAS AFFICHER SINON IL APPARAIT EN DOUBLE
  }

  float deltaFollow = PI/180;

  for (int i = 1; i < nbBall; i++) {
    debug ="Normal follow ";
    //   follow( i-1, i, 20 * i, 0);  // Modifier les deux derniers paramètres : délais et phase
    follow( i-1, i, d, k);  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6

    //*****   drawBall(i, phaseMapped[i] );
    drawBall(i, phases[i][frameCount % nbMaxDelais] );
  }

  /*
     for(int i = 0; i < nbBall; i++) { //Animation brute sans suivi, juste avec une formule
   //drawBall(i, PI + (i * frameCount / 50.0) * cos (frameCount / 500.0) );
   }*/  // A COMPRENDRE

  if (frameCount > nbMaxDelais/10 && firstFollowingLast == true && abs(diffAngle(phases[0][frameCount % nbMaxDelais], phases[nbBall-1][frameCount % nbMaxDelais])) < deltaFollow ) {
    colorMode(RGB, 255, 255, 255);
    fill( 0, 0, 255 );
    println("diffangle" + ": " + diffAngle(phases[0][frameCount % nbMaxDelais], phases[nbBall-1][frameCount % nbMaxDelais]));
    //    firstFollowingStarted = true;
    debug ="First follow last";
    //   firstFollowingLast = false;
    println (debug);
  }

  if (firstFollowingStarted) {
    colorMode(RGB, 255, 255, 255);
    fill( 255, 0, 0 );
    debug ="firstFollowingStarted";
    follow(nbBall-1, 0, d, k);  // Modifier les deux derniers paramètres : délais et phase
    drawBall(0, phases[0][frameCount % nbMaxDelais]);
    //   println ("PHASE MAPPED firstFollowing ");
    //   println("diffangle" + ": " + diffAngle(phases[0][frameCount % nbMaxDelais], phases[nbBall-1][frameCount % nbMaxDelais]));
  }

  arduinoPosJO();
}  



void samplingMovement(float timeSec) {
  
    keyReleasedfollowSignal(); // useless here, but if you sample with a decay of 100ms, each oscillator will have the movement of 11 each new cycle of 11
    frameSampling=frameSampling+1;
    Timer= (millis()%1000*timeSec)*restartTimer;
    Timer2 = (millis()%2000*timeSec)*restartTimer;
     print ("             Timer  "); print (Timer);
     print ("             Timer2  "); print ( Timer2);
     print ("             frameSampling160  "); print ( frameSampling%(num*timeSec)); // each x frameSampling record new datas
    int i = int(frameSampling%(num*timeSec)); // datas record from 0 to 40*number of secondes
    
    if(frameSampling>=0 && frameSampling<=num*timeSec  ) // && lastSec==actualSec
    {
    if(frameSampling<=0) { 
     int timeElapsed= endTime-beginTime; 
     print (" timeElapsed"); println (timeElapsed);
     beginTime=millis();
     background(255);     
    } 
    if(frameSampling>=1 && frameSampling<=num*timeSec )  //&& Timer<=100 && Timer2<=100
    {
//    rx[i] = mouseX;
//    ry[i] = mouseY;
 //**   net.phase[networkSize-1]= (float) map (v1, 0, 400, 0, TWO_PI);
  //  net.phase[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);
     newPosF[0]= (float) map (mouseY, 0, 400, 0, TWO_PI);
    rx[i] = z;
 //   ry[i] = v1;
     ry[i]= newPosF[0]+phaseShiftingFollowPhase11;//almost useless
    mx[i] = rx[i];
    my[i] = ry[i];
    fill(255, 0, 0, 50); 
 //     net.phase[networkSize-1]= (float) map (v1, 0, mouseY, 0, TWO_PI);

 //**   net.phase[2]= (float) map (v1, 0, 400, 0, TWO_PI);
    circle(rx[i], ry[i], 10); 
    }    
   }  
   
    int middleTime = millis(); 
    int TimeMiddleElapsed = middleTime -beginTime;
    
    if ( (frameSampling >=num*timeSec+1 && frameSampling <=num*timeSec+1)) { //|| TimeMiddleElapsed >=1970 && TimeMiddleElapsed <=2030 || 
       LastTimeMiddleElapsed=TimeMiddleElapsed;
       print (frameSampling); print ("  TimeMiddleElapsed "); println ( TimeMiddleElapsed);
       } 
     
    if(frameSampling>=num*timeSec+1  ) // begin to replay for 2 sec
    {
      trigFollowSampling=true;
     
 //**   net.phase[networkSize-1]= (float) map (my[i], 0, 400, 0, TWO_PI);
        newPosF[0]= my[i];
 //¨**    net.phase[networkSize-2]= (float) map (my[i], 0, 400, 0, TWO_PI)+k; // you have sampled oscillator2 and repeat it in oscillator 3 with decay
//  
        newPosF[1]= my[i]+delayTimeFollowPhase11; // useless
        newPosF[1]= newPosF[1]%TWO_PI;
    circle(mx[i]+400, my[i], 10); 
  //  print (frameSampling); print (" ry' "); print (i); print ("  "); println (ry[i]);
    print (" frameSampling "); print (frameSampling); print (" ry "); print (i); print ("  "); print (ry[i]);   // frameSampling%160=1 is the first point and  frameSampling%160=0 is the last point recorded
    print (" my "); print (i); print ("  "); println (my[i]);
    } 
  
   // if(frameSampling>=2*20*4+1 && frameSampling<=2*20*4+1  ) //
    if(frameSampling%(2*num*timeSec)<=0  ) //
    {

    endTime=millis();
    int timeElapsed= endTime-beginTime; 
    LastTimeElapsed= timeElapsed;
     print (" LastTimeElapsed"); println (LastTimeElapsed);
 //   Timer=0;
 //   Timer2=0;
 //   frameSampling=80;
    restartTimer=0;//useless for the moment
    background(255);
    }
    if (mousePressed==true){
        mouseRecorded=true;} 
        
    if (mouseRecorded==true  && frameSampling%(2*num*timeSec+0)<=0 
     ) {
       print (" Restart Record ");  print (" Restart Record ");  println (" Restart Record ");
    mouseRecorded=false;
    frameSampling = 0; // Restart main loop
    restartTimer=1;  //useless for the moment
    trigFollowSampling=false;
     }      
}



 

void sendToTeensy() {
  int turnOnDriverNetPhase11=1; //it has to be more than 2 to turn on the driver in the Teensy

  String dataMarkedToTeensyJoGood  ="<" // BPM9   

   // +   DataToDueCircularVirtualPosition[11]+ ","+DataToDueCircularVirtualPosition[10]+","+(DataToDueCircularVirtualPosition[9])+","+DataToDueCircularVirtualPosition[8]+","+DataToDueCircularVirtualPosition[7]+","
   // +   DataToDueCircularVirtualPosition[6]+","+( DataToDueCircularVirtualPosition[5])+","+DataToDueCircularVirtualPosition[4]+","+DataToDueCircularVirtualPosition[3]+","+DataToDueCircularVirtualPosition[2]+","//DataToDueCircularVirtualPosition[2]

   // +  (speedDelta) + "," + turnOnDriverNetPhase11 + "," +3+","+decompte[8]+","+decompte[7]+","+decompte[6]+","+decompte[5]+","+decompte[4]+","+decompte[3]+","+decompte[2]+"," // to manage 12 note +decompte[1]+","+decompte[0]+ ","

    +  decompte[1]+"," +cohesionCounterLow +","+ cohesionCounterHigh +","+ int (map (LevelCohesionToSend, 0, 1, 0, 100))+">"; //    cohesionCounterHigh // +orderCohesion+ ">";LevelCohesionToSend ","+ int (map ( LowLevelCohesionToSend, 0, 1, 0, 100))+ 


  if ( abs (speedi[networkSize-1]) > 950 || abs (speedi[0]) > 950) {
    //   key = 'h'; keyReleased();
    textSize (200);
    text("CAREFULL", width/2, height - 20);
  }

  println(frameCount + ": " +  " dataMarkedToTeensyJoGood_inSendToTeensy" + ( dataMarkedToTeensyJoGood ));
 // teensyport.write(dataMarkedToTeensyJoGood); // Send data to Teensy. only the movement
}

void sendToTeensyTurnOnDriver() {
  int turnOnDriverNetPhase11=3; //it has to be more than 2 to turn on the driver in the Teensy

  String dataMarkedToTeensyJoGood  ="<" // BPM9   

   // +   DataToDueCircularVirtualPosition[11]+ ","+DataToDueCircularVirtualPosition[10]+","+(DataToDueCircularVirtualPosition[9])+","+DataToDueCircularVirtualPosition[8]+","+DataToDueCircularVirtualPosition[7]+","
   // +   DataToDueCircularVirtualPosition[6]+","
    
    +( DataToDueCircularVirtualPosition[5])+","+DataToDueCircularVirtualPosition[4]+","+DataToDueCircularVirtualPosition[3]+","+DataToDueCircularVirtualPosition[2]+","//DataToDueCircularVirtualPosition[2]

    +  (speedDelta) + "," + turnOnDriverNetPhase11 + "," +3+","
    
    //+decompte[8]+","+decompte[7]+","+decompte[6]+","+decompte[5]+","+decompte[4]+","+decompte[3]+","+decompte[2]+"," // to manage 12 note +decompte[1]+","+decompte[0]+ ","

    +  decompte[1]+"," +cohesionCounterLow +","+ cohesionCounterHigh +","+ int (map (LevelCohesionToSend, 0, 1, 0, 100))+">"; //    cohesionCounterHigh // +orderCohesion+ ">";LevelCohesionToSend ","+ int (map ( LowLevelCohesionToSend, 0, 1, 0, 100))+ 



  println(frameCount + ": " +  " dataMarkedToTeensyJoGood" + ( dataMarkedToTeensyJoGood ));
  teensyport.write(dataMarkedToTeensyJoGood); // Send data to Teensy. only the movement
}







void followDistribueAddphasePattern(){
   for (int i = 0; i <  networkSize-0; i+=1) {// networkSize-0
 //    print (net.oldPhase[i]); print (" 12448 ");   println (net.phase[i]); 
 //   net.oldPhase[i]=phaseMapped[i];
    phaseMapped[i]= map (signal[2], 0, 1, 0, TWO_PI); // use varaible phaseMapped (to play movement with time delay or phase delay) to well send it in Teensy
 
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
  for (int i = 0; i < (networkSize-0); i+=1){
    print (" degrees "); print (i);  print (" "); println (degrees (net.phase[i]));
 }
   
  if (formerFormerKey == '#'  || formerKeyMetro == '*'  || formerKeyMetro == '*' ) { // || formerKeyMetro == '*'
    
      for (int i = 2; i < networkSize-0; i+=1) { 
        
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
 //   if (formerKeyMetro == '*' ) {
     phasePattern();
     
    for (int i = 0; i < networkSize-0; i+=1) { 
      print ("  BEF phaseMapped[i]  ");    println ( phaseMapped[i]  ); 
    phaseMappedFollow[i]= net.phase[i];
    phaseMapped[i] =  phaseMapped[i]+phaseMappedFollow[i];  // add offset given by pendularPattern
    phaseMapped[i] =  phaseMapped[i]%TWO_PI; 
    print ("  phaseMapped[i]  ");    println ( phaseMapped[i]  ); 
   
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


//   }
  }
 }
 
 
  //sendToTeensyTurnOnDriver();
  }  
    } 

     
void followDirectLfo(){    
   println (" PatternFollowLfo() ");   
   lfoPattern();
  //  LFO[0]= lfoPhase[2];
 
    splitTimeLfo();
   //  splitWithTime();
                
   if (key=='q' || key=='a') {
     letter = key;
    
     }
  switch(letter) {
    case 'a': 
    doA=true;
    doQ=false;
    println("Alpha");  // Does not execute
    break;
    case 'q': 
    doA=false;
    doQ=true;
    println("qqqqq");  // Does not execute
    break;
     
    }
    
  if (formerFormerKey == '#') { //  && doA==true
     lfoPattern();
      for (int i = 2; i < networkSize-0; i+=1) { 
      print ( " LFO  == '#' "); println (LFO[i]);   
      LFO[i]= lfoPhase[1];
    //  LFO[i]= 0;
   }
   }
   
   if (formerFormerKey == '#') {
     
   if (LFO[oscillatorChange]<0){   // movement drawn by myself      
    LFO[oscillatorChange] = phaseFollowLFO[oscillatorChange]-LFO[oscillatorChange]; 
    
    dataToChange[oscillatorChange]= int (map (LFO[oscillatorChange], 0, -TWO_PI, numberOfStep, 0)); 
    //**    net.oldPhase[i]=net.phase[i];
   // oldPosF[oscillatorChange]=newPosF[oscillatorChange];
   
    //**    net.phase[i]= map (dataToChange[i], numberOfStep, 0, 0, -TWO_PI);
    newPosF[oscillatorChange]= LFO[oscillatorChange]; //map (dataToChange[oscillatorChange], numberOfStep, 0, 0, -TWO_PI);
  }
       
   else
    LFO[oscillatorChange] = phaseFollowLFO[oscillatorChange]+LFO[oscillatorChange];
    LFO[oscillatorChange] = LFO[oscillatorChange]%TWO_PI;
     
    dataToChange[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI, 0, numberOfStep);
    //   net.oldPhase[i]=net.phase[i];
  //  oldPosF[oscillatorChange]=newPosF[oscillatorChange];
   //  net.phase[i]= map (dataToChange[i], 0, numberOfStep, 0, TWO_PI);
    newPosF[oscillatorChange]= LFO[oscillatorChange]; // map (dataToChange[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
  
 }
   
   
   if (formerKey != '#' ) { //  play this command once when you tap on keyboard expect #
    if (doA==true ){ // offset with pendularPattern  || doQ==true
     phasePattern(); // change offset between ball with pendularPattern
     lfoPattern();
   for (int i = 0; i < networkSize-0; i+=1) { 
   
  //  newPosF[i]= net.phase[i];
 //**   newPosF[i]= lfoPhase[1];
  //****  phaseFollowLFO[i]= newPosF[i];

     LFO[i]= lfoPhase[1];
      } 
      
     phaseFollowLFO[oscillatorChange]= lfoPhase[2];
     print ("  case a phaseFollowLFO  ");  print ( oscillatorChange  ); print ( " ");  print ( phaseFollowLFO[oscillatorChange]  ) ; println (   ); 
 //   LFO[i]=0;

//    LFO[oscillatorChange] =  LFO[oscillatorChange]+phaseFollowLFO[oscillatorChange];  // add offset given by pendularPattern
//    LFO[oscillatorChange] =  LFO[oscillatorChange]%TWO_PI; 

    for (int i = 2; i < networkSize-0; i+=1) { 
      
   if (LFO[i]<0){
   
    dataToChange[i]= int (map (LFO[i], 0, -TWO_PI, numberOfStep, 0)); 
  //  oldPosF[i]=newPosF[i];
    newPosF[i]=LFO[i];//dataToChange[i];
 //   DataToDueCircularVirtualPosition[i]= (int) newPosF[i];
       }
       
   else
    
    dataToChange[i]= (int) map (LFO[i], 0, TWO_PI, 0, numberOfStep); 
 //   oldPosF[i]=newPosF[i];
    newPosF[i]=LFO[i];//dataToChange[i];
 //   DataToDueCircularVirtualPosition[i]= (int) newPosF[i];
       } // 
       
      
       
        key='#';// key='a'; // formerFormerKey = '#';
   //    doA=false;
   //    doQ=true;
   }
   
   }
   /*
  for (int i = 2; i < networkSize; i++) { 
    oldDataToChange[i]= dataToChange[i];
    deltaDataToChange[i]= dataToChange[i]-oldDataToChange[i];
    DataToDueCircularVirtualPosition[i]= (int) dataToChange[i];// newPosF[i];
   }  
 */
  
      countRevsContinue();
      
    for (int i = 0; i < networkSize; i++) {
     
     oldPosF[i]=newPosF[i];

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
    
 
  

    int driverOnOff=3;
    int dataToTeensyNoJo=-3; // trig noJoe in Teensy
    String dataMarkedToTeensyNoJo  ="<" // BPM9   

    //  +   DataToDueCircularVirtualPosition[11]+ ","+DataToDueCircularVirtualPosition[10]+","+(DataToDueCircularVirtualPosition[9])+","+DataToDueCircularVirtualPosition[8]+","+DataToDueCircularVirtualPosition[7]+","
    //  +   DataToDueCircularVirtualPosition[6]+","+( DataToDueCircularVirtualPosition[5])+","+DataToDueCircularVirtualPosition[4]+","+DataToDueCircularVirtualPosition[3]+","+DataToDueCircularVirtualPosition[2]+","//DataToDueCircularVirtualPosition[2]

   //   +  (speedDelta) +","+ driverOnOff +","+decompte[9]+","+decompte[8]+","+decompte[7]+","+decompte[6]+","+decompte[5]+","+decompte[4]+","+decompte[3]+","+decompte[2]+"," // to manage 12 note +decompte[1]+","+decompte[0]+ ","

      +  decompte[1]+"," +cohesionCounterLow +","+ cohesionCounterHigh +","+ int (map (LevelCohesionToSend, 0, 1, 0, 100))+">";    

    println(frameCount + ": " +  " dataMarkedToTeensyNoJo" + ( dataMarkedToTeensyNoJo ));
   //  encoderReceiveUSBport101.write(dataMarkedToTeensyNoJo );// Send data to Arduino.
    teensyport.write(dataMarkedToTeensyNoJo); // Send data to Teensy. only the movement
 
 } 

 
 void countRevsContinue() { // =========================================== AJOUTE un case dans tableau networkSize+1

  for (int i = 0; i < networkSize; i++) { 
//**    print (net.oldPhase[i]); print ("count rev ");   println (net.phase[i]); 
    // decrement caused by negative angular velocity
    // both positive angles || both negative angles || positive-to-negative angle
    //   if (//(net.oldPhase[i] < 0.25 * PI && net.phase[i] > 1.75 * PI) ||//
    if (
      ((oldPosF[i] < 0.25 *PI && oldPosF[i]>0)  && (newPosF[i] > -0.25* PI && newPosF[i] <0))  || 
       (oldPosF[i] < -1.75 * PI && newPosF[i] > -0.25 * PI)// ||
    
      ) {
    
      //    TrigmodPos[i]=0;
      rev[i]--;
      //      print (" revultion negative  "); println (revolution[i]=i+1);
      //   revolution[i]=i+1;
     revolution[i]=0; // trig 0 to sent 0 in Max4Live
      memoryi=i;


   //   decompte[i] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
    } else { // if you do twice there is a funny bug
      //    decompte[i]  ++; 
      //   revolution[i]=0;
    }


    // increment caused by positive angular velocity
    // both positive angles || both negative angles || negative-to-positive angle

    if (
      ((oldPosF[i] > -0.25 *PI && oldPosF[i]<0)  && (newPosF[i] < 0.25* PI && newPosF[i] >0))  || 
       (oldPosF[i] > 1.75 * PI && newPosF[i] < 0.25*PI)
      ) {
      onOFF = 1;
      //   TrigmodPos[i]=0;
      rev[i]++;
      //   revolution[i]=i+1;
      revolution[i]=0;   // trig 0 to sent 0 in Max4Live
      memoryi=i;
      decompte[i] = 0;  // RESET COUNTER AT 0
    } else {

      decompte[i]  ++; //START COUNTER when a REVOLUTION START OR FINISH

      revolution[i]=1;
    }
     if (  revolution[i]<1) {
   print (" revolution[i] "); print ( memoryi); print ("  "); print (revolution[memoryi]);
    }
  
  //  print (" rev< "); print ( i); print ("  "); println (rev[i]);
  }
  if (

   
    (newPosF[memoryi] < -1.75 * PI && newPosF[memoryi] >= -0.25*TWO_PI) || ( newPosF[memoryi]<=-TWO_PI+0.23  && newPosF[memoryi] >= -0.25*TWO_PI ) 
    ) {
    onOFF = 1;
    //   background (27,59,78);
    //    TrigmodPos[i]=0;
    rev[memoryi]--;
    //      print (" revultion negative  "); println (revolution[i]=i+1);
    //   revolution[i]=i+1;
//**** revolution[memoryi]=0; // trig 0 to sent 0 in Max4Live   brecause it count twice in negative way!!!
    // memoryi=i;


    decompte[memoryi] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
  }
 
} 

void addSignal(){
  
    println (" pattern lfoPhase[1] ", lfoPhase[1], "lfoPhase[2] ", lfoPhase[2], "lfoPhase[3] ", lfoPhase[3]); 
   
   if (key=='q' || key=='b') {
     letter = key;   
     }
  switch(letter) {
    case 'q': 
    doQ=true;
    break;
    case 'b': 
    doQ=false;
    break;     
    }
  
   if (formerFormerKey == '#') { //  && doA==true
     print ("  normal " + frameCount + " lfoPhase[1] " + lfoPhase[1] + " lfoPhase[2] " + lfoPhase[2]);    println (   ); 
      for (int i = 2; i <  networkSize+1; i+=1) { 
       LFO[i] = lfoPhase[1]; 
   if (LFO[i]<0){        
       LFO[i] = phaseFollowLFO[i] -  LFO[i];
       dataMappedForMotor[i]= int (map (LFO[i], 0, -TWO_PI, numberOfStep, 0)); 

       newPosX[i]= map (dataMappedForMotor[i], numberOfStep, 0, 0, -TWO_PI);
  }
       
   else
       LFO[i] = phaseFollowLFO[i] +  LFO[i];
       dataMappedForMotor[i]= (int) map (LFO[i], 0, TWO_PI, 0, numberOfStep);

       newPosX[i]= map (dataMappedForMotor[i], 0, numberOfStep, 0, TWO_PI);
 
   }
  
   if (LFO[oscillatorChange]<0){        
       LFO[oscillatorChange] = phaseFollowLFO[oscillatorChange]-LFO[oscillatorChange]; 
       dataMappedForMotor[oscillatorChange]= int (map (LFO[oscillatorChange], 0, -TWO_PI, numberOfStep, 0)); 

       newPosX[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], numberOfStep, 0, 0, -TWO_PI);
  }
       
   else
       LFO[oscillatorChange] = phaseFollowLFO[oscillatorChange]+LFO[oscillatorChange];
       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI, 0, numberOfStep);

       newPosX[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
  }
 
   if (doQ==true ){
  //   phasePattern(); // offset with lfo oscillator by osillator
    print ("  case q phaseFollowLFO " + oscillatorChange + " "  + phaseFollowLFO[oscillatorChange] + " "); print ("  LFOoscillatorChange  "); print (oscillatorChange); print ("   ") ;  print (LFO[oscillatorChange]  ); 
    print (" newPosX[oscillatorChange] " + newPosX[oscillatorChange]);
    for (int i = 2; i <  networkSize-0; i+=1) { 
   
   //int i = oscillatorChange;
   //  phaseFollowLFO[oscillatorChange]= PI/10*-oscillatorChange; // to understand
     phaseFollowLFO[oscillatorChange]= lfoPhase[2];
     LFO[oscillatorChange]=  LFO[i]+phaseFollowLFO[i];  // add offset given by pendularPattern
     LFO[oscillatorChange]=  LFO[i]; 
  
   
    if (LFO[i]<0){
   
     dataMappedForMotor[i]= int (map (LFO[i], 0, -TWO_PI, numberOfStep, 0)); 

       newPosX[oscillatorChange]= map (dataMappedForMotor[i], numberOfStep, 0, 0, -TWO_PI);
  //   newPosX[i]= LFO[i];
       }
       
   else
    
    dataMappedForMotor[i]= (int) map (LFO[i], 0, TWO_PI, 0, numberOfStep);  
    
    newPosX[oscillatorChange]= map (dataMappedForMotor[i], 0, numberOfStep, 0, TWO_PI);
    
     } //
 
   }
    print ("  LFO+LFOoscillatorChange  "); print (oscillatorChange); print ("   ") ;  println (LFO[oscillatorChange]  ); 
   
  key='#';// 

     for (int i = 2; i <  networkSize+0; i+=1) { // la premiere celle du fond i=2,  la derniere celle du devant i=11
    drawBall(i, newPosX[i] );

   
    print( " oldPositionToMotor[i]" ); print ( oldPositionToMotor[i]);
    positionToMotor[i]= ((int) map (newPosX[i], 0, TWO_PI, 0, numberOfStep)%numberOfStep); //
    
    
    newPosF[i]=positionToMotor[i]%6400;
 //   if (oldPositionToMotor[i]>positionToMotor[i]){
    if ( oldPosF[i]>newPosF[i]){
      revLfo[i]++;
     
    } 
     oldPositionToMotor[i]=  positionToMotor[i];
     oldPosF[i]=newPosF[i];

     print( " newPosF[i] " ); print ( newPosF[i]);
     print( " positionToMotor[i] " ); print ( positionToMotor[i]);
     print (" revolutionLFO "); print ( i); print ("  "); println (revLfo[i]); 
  }
  
   if (formerKeyMetro=='B') {


         for (int i = 0; i < networkSize; i++) {
      // rev[i]=rev[0];


      //*******************************  ASSIGN MOTOR WITH POSITION

      if (revLfo[i]!=0  && (newPosF[i] >  0) ) { // number of revLfoolution is even and rotation is clock wise   
        DataToDueCircularVirtualPosition[i]= int (map (newPosF[i], 0, numberOfStep, 0, numberOfStep))+ (revLfo[i]*numberOfStep);
      }

      if (revLfo[i]!=0  && (newPosF[i] <  0)) { // number of revLfoolution is even and rotation is Counter clock wise          // pos[i]= int (map (newPosF[i], 0, -numberOfStep, 0,  numberOfStep))+ (revLfo[i]*numberOfStep);

        DataToDueCircularVirtualPosition[i]= int (map (newPosF[i], 0, -numberOfStep, numberOfStep, 0)) +(revLfo[i]*numberOfStep);       //   print ("pos "); print (i); print (" ");println (pos[i]);
      }

      if (revLfo[i]==0 && (newPosF[i] < 0) ) { //  number of revLfoolution is 0 and rotation is counter clock wise 
        DataToDueCircularVirtualPosition[i]= int (map (newPosF[i], 0, -numberOfStep, numberOfStep, 0));        
      }         
      if  (revLfo[i]==0 && (newPosF[i] > 0) ) {  //  number of revLfoolution is 0 and rotation is clock wise     
        DataToDueCircularVirtualPosition[i]= int (map (newPosF[i], 0, numberOfStep, 0, numberOfStep));                //      print ("pos "); print (i); print (" CW revLfo=0 ");println (pos[i]);
      }
    }
  } 
     
    int speedLocalDelta=4; 
    int driverOnOff=3;
    int dataToTeensyNoJo=-3; // trig noJoe in Teensy
    String dataMarkedToTeensyNoJo  ="<" // BPM9   

      +   DataToDueCircularVirtualPosition[11]+ ","+DataToDueCircularVirtualPosition[10]+","+(DataToDueCircularVirtualPosition[9])+","+DataToDueCircularVirtualPosition[8]+","+DataToDueCircularVirtualPosition[7]+","
      +   DataToDueCircularVirtualPosition[6]+","+( DataToDueCircularVirtualPosition[5])+","+DataToDueCircularVirtualPosition[4]+","+DataToDueCircularVirtualPosition[3]+","+DataToDueCircularVirtualPosition[2]+","//DataToDueCircularVirtualPosition[2]

    //  +  (speedDelta) +
     +  speedLocalDelta +
      
      ","+ driverOnOff +","+dataToTeensyNoJo+","+decompte[8]+","+decompte[7]+","+decompte[6]+","+decompte[5]+","+decompte[4]+","+decompte[3]+","+decompte[2]+"," // to manage 12 note +decompte[1]+","+decompte[0]+ ","

      +  decompte[1]+"," +cohesionCounterLow +","+ cohesionCounterHigh +","+ int (map (LevelCohesionToSend, 0, 1, 0, 100))+">";    

    println(frameCount + ": " +  " dataMarkedToTeensyNoJo" + ( dataMarkedToTeensyNoJo ));
    //   encoderReceiveUSBport101.write(dataMarkedToDue36data);// Send data to Arduino.
    teensyport.write(dataMarkedToTeensyNoJo); // Send data to Teensy. only the movement
  }
  /*
void countRevsLfoPattern11() { // =========================================== Ter NE PAS TOUCHER LE COMPTEUR ou Reduire l'espace avant et apres 0 pour eviter bug à grande vitesse

  for (int i = 1; i < 2; i++) { 
     print (" oldLfoCount[i] "); print (i); print (" ");  println (oldPhaseLfo[i]); print (" newPhaseLfoCount[i] ");; print (i); print (" ");    println (newPhaseLfo[i]); 
//**    print (net.oldPhase[i]); print ("count rev ");   println (net.phase[i]); 
    // decrement caused by negative angular velocity
    // both positive angles || both negative angles || positive-to-negative angle
    //   if (//(net.oldPhase[i] < 0.25 * PI && net.phase[i] > 1.75 * PI) ||//
    if (
      ((oldPhaseLfo[i] < 0.25 *PI && oldPhaseLfo[i]>0)  && (newPhaseLfo[i] > -0.25* PI && newPhaseLfo[i] <0))  || 
       (oldPhaseLfo[i] < -1.75 * PI && newPhaseLfo[i] > -0.25 * PI)// ||
       
    
      ) {
    
      //    TrigmodPos[i]=0;
      revLfo[i]--;
      //      print (" revultion negative  "); println (revolution[i]=i+1); 
      //   revolution[i]=i+1;
     revolution[i]=0; // trig 0 to sent 0 in Max4Live
      memoryi=i;


   //   decompte[i] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
    } else { // if you do twice there is a funny bug
      //    decompte[i]  ++; 
      //   revolution[i]=0;
    }


    // increment caused by positive angular velocity
    // both positive angles || both negative angles || negative-to-positive angle

    if (
      ((oldPhaseLfo[i] > -0.25 *PI && oldPhaseLfo[i]<0)  && (newPhaseLfo[i] < 0.25* PI && newPhaseLfo[i] >0))  || 
       (oldPhaseLfo[i] > 1.75 * PI && newPhaseLfo[i] < 0.25*PI)
      ) {
      onOFF = 1;
      //   TrigmodPos[i]=0;
      revLfo[i]++;
      //   revolution[i]=i+1;
      revolution[i]=0;   // trig 0 to sent 0 in Max4Live
      memoryi=i;
      decompte[i] = 0;  // RESET COUNTER AT 0
    } else {

      decompte[i]  ++; //START COUNTER when a REVOLUTION START OR FINISH

      revolution[i]=1;
    }
     if (  revolution[i]<1) {
   print (" revolutionPattern[i] "); print ( memoryi); print ("  "); print (revolution[memoryi]);
    }
  
    print (" revPattern "); print ( i); print ("  "); println (revLfo[i]);
  }
  if (

   
    (newPhaseLfo[memoryi] < -1.75 * PI && newPhaseLfo[memoryi] >= -0.25*TWO_PI) || ( newPhaseLfo[memoryi]<=-TWO_PI+0.23  && newPhaseLfo[memoryi] >= -0.25*TWO_PI ) 
    ) {
    onOFF = 1;
    //   background (27,59,78);
    //    TrigmodPos[i]=0;
    rev[memoryi]--;
    //      print (" revultion negative  "); println (revolution[i]=i+1);
    //   revolution[i]=i+1;
//**** revolution[memoryi]=0; // trig 0 to sent 0 in Max4Live   brecause it count twice in negative way!!!
    // memoryi=i;


    decompte[memoryi] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
  }
 
}

void countRevsLfoPattern22() { // =========================================== Ter NE PAS TOUCHER LE COMPTEUR ou Reduire l'espace avant et apres 0 pour eviter bug à grande vitesse

  for (int i = 2; i < 3; i++) { 
     print (" oldLfoCount[i] "); print (i); print (" ");  println (oldPhaseLfo[i]); print (" newPhaseLfoCount[i] ");; print (i); print (" ");    println (newPhaseLfo[i]); 
//**    print (net.oldPhase[i]); print ("count rev ");   println (net.phase[i]); 
    // decrement caused by negative angular velocity
    // both positive angles || both negative angles || positive-to-negative angle
    //   if (//(net.oldPhase[i] < 0.25 * PI && net.phase[i] > 1.75 * PI) ||//
    if (
      ((oldPhaseLfo[i] < 0.25 *PI && oldPhaseLfo[i]>0)  && (newPhaseLfo[i] > -0.25* PI && newPhaseLfo[i] <0))  || 
       (oldPhaseLfo[i] < -1.75 * PI && newPhaseLfo[i] > -0.25 * PI)// ||
       
    
      ) {
    
      //    TrigmodPos[i]=0;
      revLfo[i]--;
      //      print (" revultion negative  "); println (revolution[i]=i+1);
      //   revolution[i]=i+1;
     revolution[i]=0; // trig 0 to sent 0 in Max4Live
      memoryi=i;


   //   decompte[i] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
    } else { // if you do twice there is a funny bug
      //    decompte[i]  ++; 
      //   revolution[i]=0;
    }


    // increment caused by positive angular velocity
    // both positive angles || both negative angles || negative-to-positive angle

    if (
      ((oldPhaseLfo[i] > -0.25 *PI && oldPhaseLfo[i]<0)  && (newPhaseLfo[i] < 0.25* PI && newPhaseLfo[i] >0))  || 
       (oldPhaseLfo[i] > 1.75 * PI && newPhaseLfo[i] < 0.25*PI)
      ) {
      onOFF = 1;
      //   TrigmodPos[i]=0;
      revLfo[i]++;
      //   revolution[i]=i+1;
      revolution[i]=0;   // trig 0 to sent 0 in Max4Live
      memoryi=i;
      decompte[i] = 0;  // RESET COUNTER AT 0
    } else {

      decompte[i]  ++; //START COUNTER when a REVOLUTION START OR FINISH

      revolution[i]=1;
    }
     if (  revolution[i]<1) {
   print (" revolutionPattern[i] "); print ( memoryi); print ("  "); print (revolution[memoryi]);
    }
  
    print (" revPattern "); print ( i); print ("  "); println (revLfo[i]);
  }
  if (

   
    (newPhaseLfo[memoryi] < -1.75 * PI && newPhaseLfo[memoryi] >= -0.25*TWO_PI) || ( newPhaseLfo[memoryi]<=-TWO_PI+0.23  && newPhaseLfo[memoryi] >= -0.25*TWO_PI ) 
    ) {
    onOFF = 1;
    //   background (27,59,78);
    //    TrigmodPos[i]=0;
    rev[memoryi]--;
    //      print (" revultion negative  "); println (revolution[i]=i+1);
    //   revolution[i]=i+1;
//**** revolution[memoryi]=0; // trig 0 to sent 0 in Max4Live   brecause it count twice in negative way!!!
    // memoryi=i;


    decompte[memoryi] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
  }
 
}
*/