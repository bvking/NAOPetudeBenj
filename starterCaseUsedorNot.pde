void starterCaseUsedorNot (){ 

 if ( keyMode != " null "  ) {  
    if ( keyMode == " phasePattern "  ) { 
 //       pendularPatternLFO();
      text ( " phase offset " + k + " delay " + d, - width-400, - height+400);
       
    if (formerKey=='o' || key=='ç'|| keyCode==SHIFT || key=='*' || key=='ç' || key==',' || key==';' || key=='A'
    || key=='n' || key=='N'   ) { //  || key=='ç'|| keyCode==SHIFT || key=='*' || key=='ç' || key==',' || key==';'
    //  formerKeyo();
    //  formerKeyoJo();
    }

    if (formerKey=='L') { // like V and shift two frequencies and phases at the same time
    formerSartKey='L';  // do note automatise movement of balls with note 
    // formerKeyL();
    } 
    if (formerSartKey=='L') { // like V and shift two frequencies and phases at the same time
    formerKeyL();
    }
  // oscillator moving
  // upstairauto

  // STARTERV Ar
    if (formerSartKey =='v' && (formerKey=='e' || formerKey=='z' || formerKey=='d' || formerKey=='r' || formerKey=='v')) { //  formerstartKey =='v' && || formerKey=='x'
     if (circularMov==false  ) {//|| circularMov==false
      for (int i = 2; i < (networkSize-0); i++) {
        PendularOldOldOldLeftVirtualPosition[i]=PendularOldOldLeftVirtualPosition[i];
        PendularOldOldLeftVirtualPosition[i]=PendularOldLeftVirtualPosition[i];
        PendularOldLeftVirtualPosition[i]=PendularLeftVirtualPosition[i];
        //    PendularLeftVirtualPosition[i]=CircularVirtualPosition[i];
        //   PendularOldLeftVirtualPosition[i]=CircularOldVirtualPosition[i];
      } 
      print ("STARTERvBIS PendularLeftVirtualPosition "); 
      print (memoryi); 
      print (" ");   
      print (PendularLeftVirtualPosition[memoryi]); 
      print ("STARTERvBIS PendularLeftVirtualPosition%"); 
      print (oldMemoryi); 
      print (" "); 
      println (PendularOldLeftVirtualPosition[oldMemoryi]); 

      if  ( 1>=1
        //        (PendularLeftVirtualPosition[memoryi]%6400 <= 100 &&  (PendularOldOldLeftVirtualPosition[oldMemoryi]%6400 <=  PendularOldLeftVirtualPosition[oldMemoryi]%6400 ) && // you turn on cw
        //        (PendularLeftVirtualPosition[oldMemoryi]%6400 <= PendularOldOldOldLeftVirtualPosition[oldMemoryi]%6400)) ||
        ) { //good with the ordination of the upstairc
        //  background (50,50,50);
        println ("HEREVBIS");   
        println ("HEREVBIS"); 
        print ("PendularLeftVirtualPosition"); 
        print (memoryi); 
        print(" "); 
        print (PendularLeftVirtualPosition[memoryi]);
        print ("PendularLeftVirtualPosition"); 
        print (oldMemoryi); 
        print(" "); 
        println (PendularOldLeftVirtualPosition[oldMemoryi]);            
        if  (millis()>TimeUpstair+d) {
          //  TimeUpstair=millis();
          TimeUpstair=millis();
          key='v'; 
          keyReleased();  
          println (" v  circular Pressed? ");
          //   formerKey='+';
          formerSartKey='v';
        }
      }
    }
  }
  // ***** automatise Oscillator Moving with a former Key

  // triggerv
   if (formerKey=='v') {
    formerKeyv(memoryi, oldMemoryi, k);
    formerSartKey ='v';
   }

 //*** arduinoPos();

  // triggerc

   if (formerSartKey =='c' && (formerKey=='&' || formerKey=='+')) { //  formerstartKey =='v' &&
    if (circularMov==true ) {
      for (int i = 0; i < (networkSize-0); i++) {
        PendularLeftVirtualPosition[i]=CircularVirtualPosition[i];
        PendularOldLeftVirtualPosition[i]=CircularOldVirtualPosition[i];
      } 
      print ("STARTER PendularLeftVirtualPosition "); 
      print (memoryi); 
      print (" ");   
      print (PendularLeftVirtualPosition[memoryi]); 
      print ("STARTER PendularLeftVirtualPosition "); 
      print (oldMemoryi); 
      print (" "); 
      print (PendularOldLeftVirtualPosition[oldMemoryi]); 

      if (millis()>TimeUpstair+d) {
        if  ((PendularLeftVirtualPosition[memoryi]%6400 >=  PendularLeftVirtualPosition[oldMemoryi]%6400 )) { //good with the ordination of the upstairc
          print ("PendularLeftVirtualPosition"); 
          print (memoryi); 
          print(" "); 
          print (PendularLeftVirtualPosition[memoryi]);
          print ("PendularLeftVirtualPosition"); 
          print (oldMemoryi); 
          print(" "); 
          print (PendularOldLeftVirtualPosition[oldMemoryi]);


          key='c'; 
          keyReleased();  
          println (" c circular Pressed? ");
        }
        TimeUpstair=millis();
      }
    }
    if (circularMov==false ) {
      if (millis()>=TimeUpstair+d) {
        if  (PendularLeftVirtualPosition[memoryi]> 400 ||  PendularLeftVirtualPosition[memoryi]<-400 ) { //&&  oldOscillatorMoving[i]== true
          print ("PendularLeftVirtualPosition"); 
          print (memoryi); 
          print(" "); 
          print (PendularLeftVirtualPosition[memoryi]);      
          key='c'; 
          keyReleased();  
          println (" c circular Pressed? ");
        }  
        TimeUpstair=millis();
      }
    }
  }
  
   if (formerKey=='c' ) {
  //  formerKeyc(memoryi, oldMemoryi);
    println (" FORMER formerKeyc ");
    String debug;
    debug = " FORMER formerKeyc string ";
    println (debug); 
    
    formerSartKey ='c';
   } 
  
  //************************************************************ //************************************************************   
  //************************************************************ //************************************************************ 
  //   begin of upstairAuto function 
  //    trigw = trigx
   if (formerKey=='w') {
    print (" formerKeyx? "); 
    print (formerKey );
 //   formerKeyCopposite(memoryi, oldMemoryi, k);
    formerSartKey ='w';
   }  
  //    trigX
   if (formerKey=='X') {
    print (" formerKeyx? "); 
    print (formerKey );
    formerKeyC(memoryi, oldMemoryi, k);
    formerSartKey ='X';
  }  
  // trigx
  if (formerKey=='x') {
    //   interPhase[memoryi]= metroPhase[memoryi];
    print (" formerKeyw? "); 
    print (formerKey );
    formerKeyCu$(memoryi, oldMemoryi, k);
    //  formerKeyCoriginal(memoryi, oldMemoryi, k);
    formerSartKey ='x';
  } 
  //   starterx
  if (formerSartKey =='x' && (formerKey=='e'  )  ) { //  formerstartKey =='v' && || formerKey=='X' || KeyCode== SHIFT
    if (circularMov==true || circularMov==false ) {//|| circularMov==false

      println ("STARTERxBIS DataToDueCircular ");
    

      if  ( 1>=1  ) { 
        if  (millis()>TimeUpstair+d) {
          //  TimeUpstair=millis();
          TimeUpstair=millis();
          key='x'; 
          keyReleased();  
          println ("  x circular Pressed automa? ");
          //   formerKey='+';
          formerSartKey='x';
        }
      }
    }
  }
  }
  
  // END STARTERCASE with formerKey
  //   starterX
  if (formerSartKey =='X' && (formerKey=='e'  )  ) { //  formerstartKey =='v' && || formerKey=='x' || KeyCode== SHIFT
    if (circularMov==true || circularMov==false ) {//|| circularMov==false

      println ("STARTERXBIS DataToDueCircular ");
      //     print (" DataToDueCircularVirtualPosition[oldMemoryi-1] " ) ;  println (DataToDueCircularVirtualPosition[oldMemoryi-1]); BUG x is ased on u$
      print (" DataToDueCircularVirtualPosition[oldMemoryi] " ) ;  
      println (DataToDueCircularVirtualPosition[oldMemoryi]);
      print (" 6400-DataToDueCircularVirtualPosition[oldMemoryi] " ) ;  
      println (6400 - DataToDueCircularVirtualPosition[oldMemoryi]);

      if  ( 1>=1  ) { 
        if  (millis()>TimeUpstair+d) {
          //  TimeUpstair=millis();
          TimeUpstair=millis();
          key='X'; 
          keyReleased();  
          println (" x  circular Pressed? ");
          //   formerKey='+';
          formerSartKey='X';
         }
       }
     }
   } //end starterX 
  //   starterw
   if (formerSartKey =='w'   )  { //  formerstartKey =='v' && || formerKey=='x' || KeyCode== SHIFT
     if (circularMov==true || circularMov==false ) {//|| circularMov==false
//  printDataOnScreen();
 //     pendularPatternLFO();

   
     //   if  (millis()>TimeUpstair+d) {
              if  (millis()>TimeUpstair) {
          //  TimeUpstair=millis();
          TimeUpstair=millis();
         key='w'; 
          keyReleased();  
           formerKeyCopposite(memoryi, oldMemoryi, k);
          println (" w  circular Pressed? ");
     
          formerSartKey='w';
        
      }
    }
  } //end starterX 



  // *****END of automatise Oscillator Moving with a former Key

  // arduinoPos();
  //metroEND
  if (circularMov==true || circularMov==false ) {
    //     print (" END ");          
    for (int i = 2; i < (12); i++) {// pendular from -800 to 800
      /*
              print (" itPhaseE "); print (i); print (" "); print (interPhase[i]); 
       print (" itPhaCiE "); print (i); print (" "); print (interPhaseCircular[i]);
       
       print (" metrPhaE "); print (i); print (" "); print (metroPhase[i]); 
       print (" meOlPhaE "); print (i); print (" "); print (metroOldPhase[i]);
       
       print (" ne.phasE "); print (i); print (" "); print (net.phase[i]); 
       print (" neOphasE "); print (i); print (" "); println (net.oldPhase[i]);
       */
    }
  } 
  //: noLoop();

  //   end of STARTERX function DELETED

  if (formerKey=='I') {
    formerKeyI();
  }  
  /*
    if (formerKey=='x') { // follow mode. What is w?
   formerx();
   //  key ='#';
   } 
   */
  if (formerKey=='V') { // like V and shift two frequencies and phases at the same time
    formerKeyV();
    //  key ='#';
     }
   } 
} 