void addSignalOneAndTwoTer() { // inspireé de quater . splitTimeQuater A reconfigurer
//   signal2 continue
 //   signal to split sinus
  // lfoPattern(); // if ive is not open  //lfoPattern(); // if Live is not open
    // if you dob't use this, uncomment signal2 in addSignalLfoPattern()
     textSize (100);
     text ("Change mode q, z, or stop progation with b ", -width-200, -height- 600 );
     text ("signal2 " + signal[2], -width-200, -height- 500 );
 //    text ("signal3 " + signal[3], -width-200, -height- 400 );
     text (" oldSignalToSplit " + oldSplitTime + " splitTime " +  splitTime + " timeLFO " + timeLfo,  -width-200, -height- 400 );
     text (" oldSignalToSplit " + oldSignalToSplit + " signalToSplit " +     signalToSplit + " timeLFO " + timeLfo,  -width-200, -height- 300 );
     text (" oscillatorChange " + oscillatorChange + " oscillatorChanging " + phaseKeptAtChange[oscillatorChanging], -width-200, -height- 200 );
     text (" propagationSpeed " + propagationSpeed + " key " + key + " startZ " + startZ, -width-200, -height- 100 );
      
   if (key=='q' || key=='b' || key=='z' ) { // q == addsignal
     letter = key;   
     }
     
  switch(letter) {
    case 'q': 
    doQ=true;
    doZ=false;
    startZ=false;
    break;
    case 'b': 
    doQ=false;
    break;
    case 'z': // change way of propagation
    doZ=true;
    doQ=true;
    break;
    }
//*** splitTimeOriginal(10.0); //USELESS with propagation Mode
// splitTimeQuater(30.0); // fonctionne pas

//  splitTimeLfoQuater(); //USELESS with propagation Mode
  splitTimeWithAbletonNoteBis(); // oscillator Change with note from Ableton
 // addSignalLfoPatternQuater(); // devenu fonction ci dessous
  propagationMode();
 
 formerFormerKey= formerKey;   
 formerKey=key;
 }

void addSignalOneAndTwoTerOriginal(){
    print (formerKeyMetro);
    
   // lfoPattern();

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
    
    
 // splitTimeTer(); 
 splitTimeLfoTer(); 
 // splitTimeLfoWithAbleton(); 
    
 addSignalLfoPatternTer(); 
 
 println(" formerFormerKey " + char (formerFormerKey) + " formerKey " + char (formerKey) + " key " + key)  ;
 formerFormerKey= formerKey;
 formerKey=key;
 }
 
 void addSignalLfoPatternTer()  {
   
    if (doQ==true ){
  //   pendularPattern(); // offset with lfo oscillator by osillator
     print ("  case q phaseFollowLFO " + oscillatorChange + " "  + phaseFollowLFO[oscillatorChange] + " ");
     print ("  LFOoscillatorChange  "); print (oscillatorChange); print ("   ") ;  print (LFO[oscillatorChange]  ); 
     print (" newPosXaddSignal[oscillatorChange] " + newPosXaddSignal[oscillatorChange]);
     
 //    phaseFollowLFO[oscillatorChange]= lfoPhase[2];    
//   phaseFollowLFO[oscillatorChange]= map (signal[2], 0, 1, 0, TWO_PI); 
// phaseFollowLFO[oscillatorChange]= map (0.01, 0, 1, 0, TWO_PI); //   ..DON4T WORK


   }

  
    print ("  LFO+LFOoscillatorChange  "); print (oscillatorChange); print ("   ") ;  println (LFO[oscillatorChange]  ); 

 if (formerFormerKey  != '#' ) { //  != '#'
     print ("  normal " + frameCount + " lfoPhase[1] " + lfoPhase[1] + " lfoPhase[2] " + lfoPhase[2]);    println (   ); 
       
  int i;
  i= oscillatorChange;
    
  oscillatorChanging= (oscillatorChange-1);
  if (oscillatorChanging<= 0){
  oscillatorChanging= networkSize-1;
  }
 
 //********POURQUOI DIFFERENT AU DEMARRAGE DE lA FONCTION
  //  signal[2] = (0*PI + (frameCount / 30.0) * cos (1000 / 500.0)*-1)%1;  // toujours UP
   // signal[2]=0.09;
   
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
 // ABOVE LFO on oscillatorChange
 
    
   if (LFO[oscillatorChange]<0 && phaseFollowLFO[oscillatorChange]<0 ) {        
       LFO[oscillatorChange] =   phaseFollowLFO[oscillatorChange]-LFO[oscillatorChange]; 
       dataMappedForMotor[oscillatorChange]= int (map (LFO[oscillatorChange], 0, -TWO_PI, numberOfStep, 0)); 

       newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], numberOfStep, 0, 0, -TWO_PI);
  }
       
   else if (LFO[oscillatorChange]>0 && phaseFollowLFO[oscillatorChange]>0 ) {      
       LFO[oscillatorChange] = phaseFollowLFO[oscillatorChange]; // +LFO[oscillatorChange];
       LFO[oscillatorChange] = LFO[oscillatorChange]%TWO_PI;
       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI, 0, numberOfStep);

       newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
    
    }
    
    
  }

    println (" newPosXaddSignal[oscillatorChange] ",  oscillatorChange, " ",  newPosXaddSignal[oscillatorChange] );
  
     int j;  
  j= (oscillatorChange-1);
  if (j<= 1){
  j= 11;
  }
       
  if (oscillatorChanged==true )  { 

     phaseKeptAtChange[oscillatorChange]=newPosXaddSignal[oscillatorChange];    //  RECORD on oscillatorChange-1 the postion of oscillatorChange where it has just changed
  
  
   }

      print (" phaseKeptAtChange[o] ",  oscillatorChange, " ",  phaseKeptAtChange[oscillatorChange] );
      println (" phaseKeptAtChange[j] " , j, " ",  phaseKeptAtChange[j] );
      
 
       LFO[j] = phaseKeptAtChange[j]+0*PI/24 ;  //les redressent de temps en temps
       LFO[j] = LFO[j]%TWO_PI;
       dataMappedForMotor[j]= (int) map (LFO[j], 0, TWO_PI, 0, numberOfStep);
       println (" phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oscillatorChange]);
 
       newPosXaddSignal[j]= map (dataMappedForMotor[j], 0, numberOfStep, 0, TWO_PI);
       

///////////////////// 


}
 
 
 void assignMotorWithPositionTer() {
  
           for (int i = 0; i < 12; i++) {
      // rev[i]=rev[0];


      //*******************************  ASSIGN MOTOR WITH POSITION

      if (revLfo[i]!=0  && (positionToMotor[i] >  0) ) { // number of revLfoolution is even and rotation is clock wise   
        DataToDueCircularVirtualPosition[i]= int (map (positionToMotor[i], 0, numberOfStep, 0, numberOfStep))+ (revLfo[i]*numberOfStep);
      }

      if (revLfo[i]!=0  && (positionToMotor[i] <  0)) { // number of revLfoolution is even and rotation is Counter clock wise          // pos[i]= int (map (positionToMotor[i], 0, -numberOfStep, 0,  numberOfStep))+ (revLfo[i]*numberOfStep);
        DataToDueCircularVirtualPosition[i]= int (map (positionToMotor[i], 0, -numberOfStep, numberOfStep, 0)) +(revLfo[i]*numberOfStep);       //   print ("pos "); print (i); print (" ");println (pos[i]);
      }

      if (revLfo[i]==0 && (positionToMotor[i] < 0) ) { //  number of revLfoolution is 0 and rotation is counter clock wise 
        DataToDueCircularVirtualPosition[i]= int (map (positionToMotor[i], 0, -numberOfStep, numberOfStep, 0));        
      }         
      if  (revLfo[i]==0 && (positionToMotor[i] > 0) ) {  //  number of revLfoolution is 0 and rotation is clock wise     
        DataToDueCircularVirtualPosition[i]= int (map (positionToMotor[i], 0, numberOfStep, 0, numberOfStep));                //      print ("pos "); print (i); print (" CW revLfo=0 ");println (pos[i]);
      }
      
      recordLastDataOfMotorPosition[i]=  DataToDueCircularVirtualPosition[i];
    }
  
  }
  
  
  void assignMotorWithDataMappedTer() {
  
           for (int i = 0; i < 12; i++) {
      // rev[i]=rev[0];


      //*******************************  ASSIGN MOTOR WITH POSITION

      if (countFollowSignalLfo[i]!=0  && (dataMappedForMotor[i] >  0) ) { // number of countFollowSignalLfoolution is even and rotation is clock wise   
        DataToDueCircularVirtualPosition[i]= int (map (dataMappedForMotor[i], 0, numberOfStep, 0, numberOfStep))+ (countFollowSignalLfo[i]*numberOfStep);
      }

      if (countFollowSignalLfo[i]!=0  && (dataMappedForMotor[i] <  0)) { // number of countFollowSignalLfoolution is even and rotation is Counter clock wise          // pos[i]= int (map (dataMappedForMotor[i], 0, -numberOfStep, 0,  numberOfStep))+ (countFollowSignalLfo[i]*numberOfStep);
        DataToDueCircularVirtualPosition[i]= int (map (dataMappedForMotor[i], 0, -numberOfStep, numberOfStep, 0)) +(countFollowSignalLfo[i]*numberOfStep);       //   print ("pos "); print (i); print (" ");println (pos[i]);
      }

      if (countFollowSignalLfo[i]==0 && (dataMappedForMotor[i] < 0) ) { //  number of countFollowSignalLfoolution is 0 and rotation is counter clock wise 
        DataToDueCircularVirtualPosition[i]= int (map (dataMappedForMotor[i], 0, -numberOfStep, numberOfStep, 0));        
      }         
      if  (countFollowSignalLfo[i]==0 && (dataMappedForMotor[i] > 0) ) {  //  number of countFollowSignalLfoolution is 0 and rotation is clock wise     
        DataToDueCircularVirtualPosition[i]= int (map (positionToMotor[i], 0, numberOfStep, 0, numberOfStep));                //      print ("pos "); print (i); print (" CW countFollowSignalLfo=0 ");println (pos[i]);
      }
      
      recordLastDataOfMotorPosition[i]=  DataToDueCircularVirtualPosition[i];
    }
  
  }
 
 void  splitTimeTer() { 
 
  if (doZ==false){ 
  if (formerDecayTimeLfo>decayTimeLfo){
      oldMemoryi=memoryi;
       memoryi=(memoryi+1);
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
      } 
      memoryi=memoryi%12;
      oscillatorChange=oscillatorChange%12;
     if (oscillatorChange<=0) {
         memoryi=2;
         oscillatorChange=2; 
   } 
     if (memoryi<=0) {
         memoryi=2;
         oscillatorChange=2; 
   } 
  }

  if (doZ==true){
  if (formerDecayTimeLfo>decayTimeLfo){
    oldMemoryi=memoryi;
    memoryi=(memoryi-1);
      oscillatorChange=oscillatorChange-1;
   } 
      if (oscillatorChange<=2) {
     //   memoryi=11;
     //   oldMemoryi=2;
        oscillatorChange=11;
   }
      if (memoryi<=2) {
       memoryi=11;
      oldMemoryi=2;    
   }
  } 


  if ( oldOscillatorChange!=oscillatorChange )
  {
       oscillatorChanged=true;
  } 
       formerDecayTimeLfo = decayTimeLfo; 
       oldSignalToSplit=signalToSplit;

   signalToSplit = (int ) map (signal[3], 0, 1, 0, 1000); 

    if (oldSignalToSplit> signalToSplit ) {  // signal goes down
 timeLfo= 0;  //do not consider this signal 
    }
  else if (oldSignalToSplit< signalToSplit ) {  
//  signalToSplit= map (signalToSplit, 0, 1, 1000, 0);  // 0 to
 timeLfo= map (signalToSplit, 0, 1000, 0, 1000);  // 0 to  
 }
 
   

 int   splitTime= int  (timeLfo%200);  // it you increase the ratio of the modulu u increase latency betwwen propagation.

text (" oldsig " + oldSignalToSplit  , -2000, height+400 ); 
text ("    sig " + signalToSplit + " timeLfo " + timeLfo , -2000, height+600 ); 
text (" splitTime " + splitTime + " timeLfo%200 " + timeLfo%200 + " doZ " + doZ, -1600, height+800 ); 

         decayTimeLfo = splitTime;
          
}
 
 
void  splitTimeLfoTer() {  // signalToSplit = lfoPhase3

 lfoPhase[3] = map ((((cos  (frameCount / 20.0))*-1) %2), -1, 1, -TWO_PI, TWO_PI);  

  signalToSplit= map (signal[3], 0, 1, -TWO_PI, TWO_PI);


  //lfoPattern();   // signalTosplit come from lfoPattern(). Signal of rotation come from Lfopattern too. Function is at the top 
 
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
 
 void  splitTimeLfoWithAbletonTer() { 
 
    
  if (formerDecayTimeLfo>decayTimeLfo+10){
 // frameCountBis=frameCountBis+1;
    oscillatorChange=oscillatorChange+1;

        
 // key='a';
  } 
  
  if ( oldOscillatorChange!=oscillatorChange )
  {
       oscillatorChanged=true;
  } 
  
  formerDecayTimeLfo = decayTimeLfo;
 // decayTime = millis()%500;// incremente frameCountBis+1 each 100 millisecondes  
 /*
  if (oldSignalToSplit> signalToSplit ) {
//  timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  // 0 to  
    timeLfo= map (signalToSplit, 0, 100, 0, 1000);  // 0 to  
    }
  else if (oldSignalToSplit< signalToSplit ) {  
//  timeLfo= map (signalToSplit, -TWO_PI, TWO_PI, 0, 1000);  // 0 to
  timeLfo= map (signalToSplit, 100, 0, 0, 1000);  // 0 to  
  
   }
 */  
   
  //  println ( " oldlfoPhase[3] " + oldLfoPhase[3] + " lfoPhase[2] " + lfoPhase[3] );
//  print ( " oldSignalToSplit " + oldSignalToSplit + " signalToSplit " + signalToSplit );

  
  
  
   oldSignalToSplit=signalToSplit;

//_____   signalToSplit= map (automationAbleton[8], 0, 1, 0, 127);
   
//   if ( formerKeyMetro == '>' )  {
     
       if (oldSignalToSplit> signalToSplit ) { println (" SIGNAL DESCEND " );
   timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  // 0 to  
 //_____   timeLfo= map (signalToSplit, 0, 127, 1000, 0);  // 0 to  
    }
    
    else   println (" SIGNAL MONTE " ); timeLfo= map (signalToSplit, 127, 0, 0, 1000);   
   
   
//  timeLfo= map (signalToSplit, 0, 100, 0, 1000); 

  //  timeLfo=   timeLfo;
  
  print (" timeLfo "); print ( timeLfo );   println (" splittimeLfo ");// println ( splitTimeLfo );  

  print (" timeLfo "); print ( timeLfo );   println (" splittimeLfo ");// println ( splitTimeLfo );  

  print (" timeLfo "); print ( timeLfo );   println (" splittimeLfo ");// println ( splitTimeLfo );  

  
//  int splitTimeLfo= (int) timeLfo; //  (timeLfo%100
 if (signalToSplit>15){
   // timeLfo= map (signalToSplit, 0, 100, 0, 1000);  // 0 to 
    
  print (" TIMELfo "); print ( timeLfo );   println (" splittimeLfo ");// println ( splitTimeLfo );  

 }
// int splitTimeLfo= int (timeLfo);
  
  
 //** float timeLfo= millis();  // 0 to
 //**  int splitTimeLfo= frameCountBis;
 
   //    print (" oldLfoPhase[2] "); print ( oldLfoPhase[2] ); print (" lfoPhase[2] "); print ( lfoPhase[2] );

       
         oscillatorChange=oscillatorChange%12;
     if (oscillatorChange<=0) {
         oscillatorChange=2;
         }
      //   decayTimeLfo = splitTimeLfo;
       decayTimeLfo = (int) timeLfo;
         print (" oscillatorChange "); println ( oscillatorChange ); 
        
         
}
 

void splitTimeWithAbletonNoteBis() { 

     
  //   TRY RANDOM OSCILLATOR BLOCKED
     
       text (memoryi, 350, 100); // with key d it's better when memoryi as oscillator blocked doesn't change. 
     //  measure<361 && measure<278 &&
      if ((  millis()>formerEvent[74]+500) &&  // wiat 200 ms before consideration of the next event 74. Here is note 74
      ((note1>73 && note1<75 && velocity1>=1 && velocity1<=64)|| (note2>73 && note2<75 && velocity2>=1 && velocity2<=64)|| (note3>73 && note3<75 && velocity3>=1 && velocity3<=64) ||
      (note4>73 && note4<75 && velocity4>=1 && velocity4<=64)|| (note5>73 && note5<75 && velocity5>=1 && velocity5<=64)|| (note6>73 && note6<75 && velocity6>=1 && velocity6<=64)
      )) {
        
      formerEvent[74]=millis(); // repeat above if formerEvent[74]+1000
   
   //   oscillatorBlocked=6;  // used to phase shifiting from the oscillatorBlocked. Here 6 doesn't move and 7, 8 ... to 5 are shifted as k* 7, K* 8. See 'g' in phasePattern
      key='d';  keyReleased();//i= 105
      
      
      
      // SIGNAL TO SPLIT?
      
      
   if (doZ==false){  
         oscillatorChange=oscillatorChange+1;
         oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
         oscillatorChange=0;
         }
       }
       
       
     if (doZ==true) {   
       oscillatorChange=oscillatorChange-1;
     if (oscillatorChange<0) {
        oscillatorChange=networkSize-1;
        memoryi=networkSize-1;
        oldMemoryi=0;
        
         }
       } 
       
       
     if (doZ==false){  
         oscillatorBlocked=oscillatorBlocked+1;
         oscillatorBlocked=oscillatorBlocked%networkSize;
     if (oscillatorBlocked<=0) {
         oscillatorBlocked=0;
         }
       }
       
       
     if (doZ==true) {   
      oscillatorBlocked=oscillatorBlocked-1;
     if (oscillatorBlocked<0) {
        oscillatorBlocked=networkSize-1;
        memoryi=networkSize-1;
        oldMemoryi=0;
        
         }
       } 
       
          text (oscillatorChange, 300, 100);
  
    }
  }
 
 
 void  splitTimeLfoWithAbletonBis() { 
 
   if (doZ==false){ 
  if (formerDecayTimeLfo>decayTimeLfo){
 // frameCountBis=frameCountBis+1;
  
    oscillatorChange=oscillatorChange+1;

     }    
 // key='a';
  } 
   if (doZ==true){
  if (formerDecayTimeLfo>decayTimeLfo){
    oldMemoryi=memoryi;
    memoryi=(memoryi-1);
    oscillatorChange=oscillatorChange-1;
    } 
   } 
  
  if ( oldOscillatorChange!=oscillatorChange )
  {
       oscillatorChanged=true;
  } 
  
  formerDecayTimeLfo = decayTimeLfo;
  
 print ( " oldSignalToSplitABLETON " + oldSignalToSplit + " signalToSplit " + signalToSplit );
// oldSignalToSplit=signalToSplit;
 float oldautomation9;
 oldautomation9=automation9;
 
 
 
 signalToSplit= map (automation9, 0, 1, -TWO_PI, TWO_PI);  // called LPF in ableton
 
   if (oldSignalToSplit> signalToSplit ) {
    timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  // 0 to  
    }
  else if (oldSignalToSplit< signalToSplit ) {  
  timeLfo= map (signalToSplit, -TWO_PI, TWO_PI, 0, 1000);  // 0 to
   }
   
   
    
 oldSignalToSplit=signalToSplit;
   

   int splitTimeLfo= int  (timeLfo%100);
   
   
  print( " automation9 " + automation9 );
  print (" timeLfo "); print ( timeLfo );   print (" splittimeLfo "); println ( splitTimeLfo );  

      if (doZ==false){   
         oscillatorChange=oscillatorChange%12;
     if (oscillatorChange<=0) {
         oscillatorChange=2;
         }
       }
       
       
     if (doZ==true) {   
     if (oscillatorChange<=2) {
        memoryi=11;
        oldMemoryi=2;
        oscillatorChange=11;
         }
       } 
         
     
         decayTimeLfo = splitTimeLfo;
         print (" oscillatorChange "); println ( oscillatorChange ); 
        
         
}



 void  splitTimeBis() { 
  //   key='b';
  if (formerDecayTimeLfo>decayTimeLfo){
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
   //  key='q';
  } 
  if ( oldOscillatorChange!=oscillatorChange )
  {
       oscillatorChanged=true;
  } 
       formerDecayTimeLfo = decayTimeLfo; 

//   int splitTimeLfo = millis()%150; // linear time  to change " oscillator " each 200 ms

     signal[2] = (0*PI + (frameCount / 75.0) * cos (1000 / 500.0)*-1)%1;
    
       println ( " ***************************************************    SPLIT TIME  timeLfoooooooooo " + " signal[2] " + signal[2] );

      timeLfo = (int ) map (signal[2], 0, 1, 0, 1000); // linear time  to change " oscillator " each 200 ms

 int   splitTime= int  (timeLfo%100);   
 
         oscillatorChange=oscillatorChange%12;
     if (oscillatorChange<=0) {
         oscillatorChange=2;
         }
         decayTimeLfo = splitTime;
    //     print (" oscillatorChange "); println ( oscillatorChange ); 
      
}

void  splitTimeLfoQuater() {  // signalToSplit = lfoPhase3
 
//  lfoPattern();   // signalTosplit come from lfoPattern(). Signal of rotation come from Lfopattern too. Function is at the top 
    lfoPhase[1] = (0*PI + (frameCount / 5.0) * cos (1000 / 500.0)*-1)%TWO_PI;  // continue 0 to TWO_PI;
    lfoPhase[3] = map ((((cos  (frameCount / 30.0))*-1) %2), -1, 1, -TWO_PI, TWO_PI);  // sinusoidale lente
    lfoPhase[2] = map ((((cos  (frameCount / 100.0))*-1) %2), -1, 1, -TWO_PI, TWO_PI); // sinusoidale rapide
    
    println (" forme d'onde lfoPhase[1] ", lfoPhase[1], "lfoPhase[2] ", lfoPhase[2], "lfoPhase[3]= signalTosplit ", lfoPhase[3]); 

    oldSignalToSplit=signalToSplit;
    signalToSplit= lfoPhase[1];
 
  if (oldSignalToSplit> signalToSplit ) {
  //  key = 'q' ; // when signal goes down --> propagation FRONT SIDE
  // timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  // 0 to  
    }
  else if (oldSignalToSplit< signalToSplit ) { // on est dans cette configuration avec  signalToSplit= lfoPhase[1]
//   key = 'z';  //  when signal goes down --> propagation BEHIND SIDE 
//   key = 'q' ;  // propagation in on the same way
//  timeLfo= map (signalToSplit, -TWO_PI, TWO_PI, 0, 1000);  // 0 to
    timeLfo= map (signalToSplit, 0, TWO_PI, 0, 1000);  // 0 to  // with lfoPhase[1]
 
  }

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
   //   memoryi=memoryi%networkSize;
      oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
     //    memoryi=0;
         oscillatorChange=0;
   } 
  }
  
    if (doZ==true){ // case z
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
   oldSplitTimeLfo = splitTimeLfo;
             
}

 void  splitTimeQuater(float propagationSpeed) { 
   
  //  oldSignalToSplit=signalToSplit;
  
         signal[2] = (0*PI + (frameCount / propagationSpeed) * cos (1000 / 500.0)*-1)%1;

//  splitTime=signal[2];
   
  if (oldSplitTime>splitTime){
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
   //  key='q';
  } 
  if ( oldOscillatorChange!=oscillatorChange )
  {
       oscillatorChanged=true;
  } 
   //    formerDecayTimeLfo = decayTimeLfo; 
  //  oldSplitTime = splitTime;
    

//   int splitTimeLfo = millis()%150; // linear time  to change " oscillator " each 200 ms

    
       println ( " ***************************************************    SPLIT TIME  timeLfoooooooooo " + " signal[2] " + signal[2] + " oldSplitTime " + oldSplitTime + " splitTime " + splitTime );

   timeLfo = (int ) map (signal[2], 0, 1, 0, 1000); // linear time  to change " oscillator " each 200 ms
 
       println ( " ***************************************************    SPLIT TIME  timeLfoooooooooo " + " timeLfo   " + timeLfo );

/*  
  if ( mappingMode == " circular " ) {
      
    if (oldSignalToSplit> signalToSplit ) {
  timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  // 0 to  
    }
  else if (oldSignalToSplit< signalToSplit ) {  
  timeLfo= map (signalToSplit, -TWO_PI, TWO_PI, 0, 1000);  // 0 to
   }
   oldSignalToSplit=signalToSplit;
  }
*/ 
   oldSplitTime=splitTime;
    splitTime= int  (timeLfo%100);   
   //    println ( " ***************************************************    SPLIT TIME  decayTimeLfo     " + decayTimeLfo + " signalToSplit " + splitTime );
   //    println ( " ***************************************************    SPLIT TIME  oldSignalToSplit " + oldSignalToSplit + " signalToSplit " + signalToSplit );
  
         oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
         oscillatorChange=0;
         }
     // 
    //     print (" oscillatorChange "); println ( oscillatorChange ); 
      
}

void  splitTimeOriginal(float propagationSpeed) { 
   oldSplitTime = splitTime;  
     signal[2] = (0*PI + (frameCount / propagationSpeed) * cos (1000 / 500.0)*-1)%1;
  //   key='b';
//  if (formerDecayTimeLfo>decayTimeLfo){
   if (oldSplitTime>splitTime){
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
   //  key='q';
  } 
  if ( oldOscillatorChange!=oscillatorChange )
  {
       oscillatorChanged=true;
  } 
  //     formerDecayTimeLfo = decayTimeLfo; 
//
//   int splitTimeLfo = millis()%150; // linear time  to change " oscillator " each 200 ms

 //      signal[2] = (0*PI + (frameCount / propagationSpeed) * cos (1000 / 500.0)*-1)%1;
    
       println ( " ***************************************************    SPLIT TIME  timeLfoooooooooo " + " signal[2] " + signal[2] );

 int  timeLfo = (int ) map (signal[2], 0, 1, 0, 1000); // linear time  to change " oscillator " each 200 ms
 
       println ( " ***************************************************    SPLIT TIME  timeLfoooooooooo " + " timeLfo   " + timeLfo );

/*  
  if ( mappingMode == " circular " ) {
      
    if (oldSignalToSplit> signalToSplit ) {
  timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  // 0 to  
    }
  else if (oldSignalToSplit< signalToSplit ) {  
  timeLfo= map (signalToSplit, -TWO_PI, TWO_PI, 0, 1000);  // 0 to
   }
   oldSignalToSplit=signalToSplit;
  }
*/ 
  //   oldSplitTime = splitTime;  
    splitTime= int  (timeLfo%100);   
   //    println ( " ***************************************************    SPLIT TIME  decayTimeLfo     " + decayTimeLfo + " signalToSplit " + splitTime );
   //    println ( " ***************************************************    SPLIT TIME  oldSignalToSplit " + oldSignalToSplit + " signalToSplit " + signalToSplit );
  
         oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
         oscillatorChange=0;
         }
     //    decayTimeLfo = splitTime;
    
    //     print (" oscillatorChange "); println ( oscillatorChange ); 
      
}
 


    
 
