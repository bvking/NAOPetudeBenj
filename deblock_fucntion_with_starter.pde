void formerKeyoJo() { 

  print ("circularMov "); 
  println (circularMov);
  //print("inspired from u$ and v$.  funny  "); 

  if (circularMov==false) {
    memoryi=0;
    if (d>=0) {
      timeOffset=d/10;
    }

    if (k>=0) { // k goes from -8 to 8.   you can paramater it to increase phase shifting
      phiShift=k*-PI/32;
      mapShiftPendular= map (phiShift, 0, 16*-PI/32, 0, 1600); //
    }
    print (" mapShiftPendular "); 
    println (mapShiftPendular); 

    for (int i = 0; i < (net.size()-1); i++) {  
      PendularLeftVirtualPosition[i]= PendularLeftVirtualPosition[i];// -800 à gauche 800 à droite
      PendularOldLeftVirtualPosition[i]=  PendularOldLeftVirtualPosition[i];
      PendularLeftVirtualPosition[i+1]= PendularLeftVirtualPosition[i+1];
      PendularOldLeftVirtualPosition[i+1]=  PendularOldLeftVirtualPosition[i+1];
    }
    //    mapShiftPendular=600;
    // for (int i = 2; i < (net.size()-1); i++) {//
    for (int i = 2; i < (11); i++) {//test only point 2 and 3

      if (   millis()>TimeEllapsedBall[i]+timeOffset && 
        (((PendularOldLeftVirtualPosition[i] <= PendularLeftVirtualPosition[i+1]+mapShiftPendular) && (PendularLeftVirtualPosition[i]+mapShiftPendular > PendularLeftVirtualPosition[i+1]) && (PendularOldLeftVirtualPosition[i]< PendularLeftVirtualPosition[i])) || // balls go to the right
        ((PendularOldLeftVirtualPosition[i]+mapShiftPendular >= PendularLeftVirtualPosition[i+1]) && (PendularLeftVirtualPosition[i]< PendularLeftVirtualPosition[i+1]+mapShiftPendular)&& (PendularOldLeftVirtualPosition[i] > PendularLeftVirtualPosition[i]))) // balls go to the left
        ) { 
        memoryi=i;
        TimeEllapsedBall[i]=millis();  
        net.phase[i+1]= net.oldPhase[i];//  
        //    mapShiftPendular=200;
      } else if (millis()<=TimeEllapsedBall[i]+timeOffset) {
        memoryi=100*i;
      }
    }
    //   mapShiftPendular=200;
    print ("BeforeTimeEllapsedBall "); 
    print (11);  
    print (" "); 
    println (TimeEllapsedBall[11]) ;
    if  (millis()>TimeEllapsedBall[11]+timeOffset && //ici + 200 sert à voir  memoryi=12; mapShiftPendular
      ((PendularOldLeftVirtualPosition[11] <= PendularLeftVirtualPosition[2]+mapShiftPendular) && (PendularLeftVirtualPosition[11]+mapShiftPendular > PendularLeftVirtualPosition[2]) && (PendularOldLeftVirtualPosition[11]< PendularLeftVirtualPosition[11]) ||
      ((PendularOldLeftVirtualPosition[11]+mapShiftPendular >= PendularLeftVirtualPosition[2]) && (PendularLeftVirtualPosition[11]< PendularLeftVirtualPosition[2]+mapShiftPendular)&& (PendularOldLeftVirtualPosition[11] > PendularLeftVirtualPosition[11]))
      )) {
      memoryi=11;
      TimeEllapsedBall[11]=millis();
      net.phase[2]= net.oldPhase[net.size()-1];
      print ("AfterTimeEllapsedBall "); 
      print (11);  
      print (" "); 
      println (TimeEllapsedBall[11]) ;
      print ("mapShiftPendular "); 
      print (11);  
      print (" "); 
      println (mapShiftPendular) ;
    } else if (millis()<=TimeEllapsedBall[11]+timeOffset) { //+timeOffset*11
      memoryi=12;
    }
  } 
  //*/
  ///*******end of pendular shifting




  if (circularMov==true ) { 
    print ("Beginning circularMov "); 
    println (circularMov);
    if (d>=0) {
      timeOffset=d; // timeOffset in millis (50,.. 1000 ms),  before changing phase i+1 with the phase from i
    }   
    if (k>=0) {
      phiShift=k*-PI/64; // here the position to add or substrat to the next point (i+1)
      mapShiftCircular= map (phiShift, 0, 16*-PI/16, 0, 6400);   // one revolution is 6400 step 
      //  mapShiftCircular is the space to reach in order to follow the previous point
    }
    formerEvent[0]=millis();   // time from the beginning of the launch of the program.
    print (" timeOffset "); 
    print ( timeOffset ); 
    print ( "mapShiftCircular ");   
    print ( mapShiftCircular ); 

    for (int j = 2; j < (4); j++) {

      if ( circularMov==true  && //( // circularMov==true

        ((CircularOldVirtualPosition[j] <= CircularOldVirtualPosition[j+1]+mapShiftCircular) && (CircularVirtualPosition[j] >= CircularVirtualPosition[j+1]+mapShiftCircular) &&
        (CircularOldVirtualPosition[j] < CircularVirtualPosition[j]))// space CW
      /*
      ||
       
       ((CircularOldVirtualPosition[j] >= CircularOldVirtualPosition[j+1]+mapShiftCircular) && (CircularVirtualPosition[j] <= CircularVirtualPosition[j+1]+mapShiftCircular) &&
       (CircularOldVirtualPosition[j] >= CircularVirtualPosition[j]))// time CCW
       */
        )

      {  
        println ("2**********************TRIGGED with PHASE OFFSET*******************") ;
        print ("before net.phase[j+1]= "); 
        print (j+1); 
        print (" ");  
        println (net.phase[j+1]);
        print (" metroPhase[j+1] ") ;  
        print (j+1); 
        print (" ") ; 
        println (metroPhase[j+1]) ; //  println();
        print ("formerEvent[2] ") ;  
        print (2); 
        print (" ") ; 
        println (formerEvent[2]) ; //  println();
        print ("After timer formerEvent[j+1] ") ;  
        print (j+1); 
        print (" ") ; 
        println (formerEvent[j+1]) ; //  println();
        followNumber[j]= true;
        formerEvent[j]=formerEvent[0]; // set formerEvent[j] to actual time
      }

      //   else followNumber[j]= false;

      if ( formerEvent[0]>=formerEvent[j]+timeOffset  && (CircularOldVirtualPosition[j]<= CircularVirtualPosition[j]) && followNumber[j]== true//
        ) {

        print ("CW After timer formerEvent[j+1] ") ;  
        print (j+1); 
        print (" ") ; 
        println (formerEvent[j+1]) ; //  println();
        print ("After timer net.phase[j]= ");  
        print (j+1); 
        print (" ") ;
        println (net.phase[j+1]);
        //  net.phase[i+1]=(net.phase[i])+phiShift;// fun at speed -4
        //  net.phase[j+1]=(net.phase[j]);// 

        net.phase[j+1]=(net.phase[j])-phiShift*0;// 
        net.phase[j+1]= net.phase[j+1]%(TWO_PI*1);//  keep phase between 0 and TWO_PI

        print ("CW After timer & phase net.phase[j]= ");  
        print (j+1); 
        print (" ") ;
        println (net.phase[j+1]); 
        print (" metroPhase[j+1] ") ;  
        print (j+1); 
        print (" ") ; 
        println (metroPhase[j+1]) ; //  println();

        followNumber[j]= false;
        memoryi=j;  
        //    formerEvent[j]=formerEvent[0];


        println ("2**********************TIME AFTER TIME  OFFSET CW") ;  

        //   print ("After  Automation1[100+i] ") ;  print (j); print (" ") ; print (Automation1[100+j]) ; //  test with pendular
        //    print (" pseudoTimer[i] to compare at timer ") ;  print (j); print (" ") ; print (pseudoTimer[j]) ; //  test with pendular
        print (" Timer[j+1] to compare at timer ") ;  
        print (j+1); 
        print (" ") ; 
        print (formerEvent[j+1]) ; //  test with pendular
        print (" memoryiCircular= ");  
        print (memoryi);
        print (" followNumber "); 
        print (j); 
        print (" "); 
        println (followNumber[j]);
      }


      if ( formerEvent[0]>formerEvent[j]+timeOffset  && (CircularOldVirtualPosition[j] > CircularVirtualPosition[j])// CCW && followNumber[j]== false
        ) {
        // background(50);
        print ("After timer formerEvent[j+1] ") ;  
        print (j+1); 
        print (" ") ; 
        println (formerEvent[j+1]) ; //  println();
        print ("CCW After timer net.phase[j]= ");  
        print (j+1); 
        print (" ") ;
        println (net.phase[j+1]);
        //  net.phase[i+1]=(net.phase[i])+phiShift;// fun at speed -4

        net.phase[j+1]=(net.phase[j])-phiShift*0;// 
        net.phase[j+1]= net.phase[j+1]%(TWO_PI*1);//  keep phase between 0 and TWO_PI

        print ("CCW After timer & phase net.phase[j]= ");  
        print (j+1); 
        print (" ") ;
        println (net.phase[j+1]); 
        print (" metroPhase[j+1] ") ;  
        print (j+1); 
        print (" ") ; 
        println (metroPhase[j+1]) ; //  println();
        /* 
         print (" metroPhase[i+1] ") ;  print (i+1); print (" ") ; println (metroPhase[i+1]) ; //  println();
         metroPhase[i+1]=   metroPhase[i]+phiShift*0; 
         metroPhase[i+1]=   metroPhase[i+1]%-TWO_PI;
         net.phase[i+1]=    metroPhase[i+1]%TWO_PI;
         */


        memoryi=j;  
        //      formerEvent[j]=formerEvent[0];
      }
    }     




    // end 2 3 

    for (int j = 3; j < (5); j++) {

      if ( circularMov==true  && //( // circularMov==true

        ((CircularOldVirtualPosition[j] <= CircularOldVirtualPosition[j+1]+mapShiftCircular) && (CircularVirtualPosition[j] >= CircularVirtualPosition[j+1]+mapShiftCircular) &&
        (CircularOldVirtualPosition[j] < CircularVirtualPosition[j]))// space CW
      /*
      ||
       
       ((CircularOldVirtualPosition[j] >= CircularOldVirtualPosition[j+1]+mapShiftCircular) && (CircularVirtualPosition[j] <= CircularVirtualPosition[j+1]+mapShiftCircular) &&
       (CircularOldVirtualPosition[j] >= CircularVirtualPosition[j]))// time CCW
       */
        )

      {  
        println ("3**********************TRIGGED with PHASE OFFSET*******************") ;
        print ("before net.phase[j+1]= "); 
        print (j+1); 
        print (" ");  
        println (net.phase[j+1]);
        print (" metroPhase[j+1] ") ;  
        print (j+1); 
        print (" ") ; 
        println (metroPhase[j+1]) ; //  println();
        print ("formerEvent[2] ") ;  
        print (2); 
        print (" ") ; 
        println (formerEvent[2]) ; //  println();
        print ("After timer formerEvent[j+1] ") ;  
        print (j+1); 
        print (" ") ; 
        println (formerEvent[j+1]) ; //  println();
        followNumber[j]= true;
        formerEvent[j]=formerEvent[0]; // set formerEvent[j] to actual time
      }

      //   else followNumber[j]= false;

      if ( formerEvent[0]>=formerEvent[j]+timeOffset  && (CircularOldVirtualPosition[j]<= CircularVirtualPosition[j]) && followNumber[j]== true//
        ) {

        print ("CW After timer formerEvent[j+1] ") ;  
        print (j+1); 
        print (" ") ; 
        println (formerEvent[j+1]) ; //  println();
        print ("After timer net.phase[j]= ");  
        print (j+1); 
        print (" ") ;
        println (net.phase[j+1]);
        //  net.phase[i+1]=(net.phase[i])+phiShift;// fun at speed -4
        //  net.phase[j+1]=(net.phase[j]);// 

        net.phase[j+1]=(net.phase[j])-phiShift*0;// 
        net.phase[j+1]= net.phase[j+1]%(TWO_PI*1);//  keep phase between 0 and TWO_PI

        print ("CW After timer & phase net.phase[j]= ");  
        print (j+1); 
        print (" ") ;
        println (net.phase[j+1]); 
        print (" metroPhase[j+1] ") ;  
        print (j+1); 
        print (" ") ; 
        println (metroPhase[j+1]) ; //  println();


        followNumber[j]= false;
        memoryi=j;  
        //    formerEvent[j]=formerEvent[0];


        println ("3**********************TIME AFTER TIME  OFFSET CW") ;  

        //   print ("After  Automation1[100+i] ") ;  print (j); print (" ") ; print (Automation1[100+j]) ; //  test with pendular
        //    print (" pseudoTimer[i] to compare at timer ") ;  print (j); print (" ") ; print (pseudoTimer[j]) ; //  test with pendular
        print (" Timer[j+1] to compare at timer ") ;  
        print (j+1); 
        print (" ") ; 
        print (formerEvent[j+1]) ; //  test with pendular
        print (" memoryiCircular= ");  
        print (memoryi);
        print (" followNumber "); 
        print (j); 
        print (" "); 
        println (followNumber[j]);
      }

      if ( formerEvent[0]>formerEvent[j]+timeOffset  && (CircularOldVirtualPosition[j] > CircularVirtualPosition[j])// CCW && followNumber[j]== false
        ) {
        // background(50);
        print ("After timer formerEvent[j+1] ") ;  
        print (j+1); 
        print (" ") ; 
        println (formerEvent[j+1]) ; //  println();
        print ("CCW After timer net.phase[j]= ");  
        print (j+1); 
        print (" ") ;
        println (net.phase[j+1]);
        //  net.phase[i+1]=(net.phase[i])+phiShift;// fun at speed -4

        net.phase[j+1]=(net.phase[j])-phiShift*0;// 
        net.phase[j+1]= net.phase[j+1]%(TWO_PI*1);//  keep phase between 0 and TWO_PI

        print ("CCW After timer & phase net.phase[j]= ");  
        print (j+1); 
        print (" ") ;
        println (net.phase[j+1]); 
        print (" metroPhase[j+1] ") ;  
        print (j+1); 
        print (" ") ; 
        println (metroPhase[j+1]) ; //  println();
        /* 
         print (" metroPhase[i+1] ") ;  print (i+1); print (" ") ; println (metroPhase[i+1]) ; //  println();
         metroPhase[i+1]=   metroPhase[i]+phiShift*0; 
         metroPhase[i+1]=   metroPhase[i+1]%-TWO_PI;
         net.phase[i+1]=    metroPhase[i+1]%TWO_PI;
         */


        memoryi=j;  
        //      formerEvent[j]=formerEvent[0];

        //   CircularOldVirtualPosition[j]= CircularOldVirtualPosition[j];
      }

      // end 3 4
    }

    for (int j = 4; j < (5); j++) {

      if ( circularMov==true  && //( // circularMov==true

        ((CircularOldVirtualPosition[j] <= CircularOldVirtualPosition[j+1]+mapShiftCircular) && (CircularVirtualPosition[j] >= CircularVirtualPosition[j+1]+mapShiftCircular) &&
        (CircularOldVirtualPosition[j] < CircularVirtualPosition[j]))// space CW
      /*
      ||
       
       ((CircularOldVirtualPosition[j] >= CircularOldVirtualPosition[j+1]+mapShiftCircular) && (CircularVirtualPosition[j] <= CircularVirtualPosition[j+1]+mapShiftCircular) &&
       (CircularOldVirtualPosition[j] >= CircularVirtualPosition[j]))// time CCW
       */
        )

      {  
        println ("4 *********************TRIGGED with PHASE OFFSET*******************") ;
        print ("before net.phase[j+1]= "); 
        print (j+1); 
        print (" ");  
        println (net.phase[j+1]);
        print (" metroPhase[j+1] ") ;  
        print (j+1); 
        print (" ") ; 
        println (metroPhase[j+1]) ; //  println();
        print ("formerEvent[2] ") ;  
        print (2); 
        print (" ") ; 
        println (formerEvent[2]) ; //  println();
        print ("After timer formerEvent[j+1] ") ;  
        print (j+1); 
        print (" ") ; 
        println (formerEvent[j+1]) ; //  println();
        followNumber[j]= true;
        formerEvent[j]=formerEvent[0]; // set formerEvent[j] to actual time
      }

      //   else followNumber[j]= false;

      if ( formerEvent[0]>=formerEvent[j]+timeOffset  && (CircularOldVirtualPosition[j]<= CircularVirtualPosition[j]) && followNumber[j]== true//
        ) {

        print ("CW After timer formerEvent[j+1] ") ;  
        print (j+1); 
        print (" ") ; 
        println (formerEvent[j+1]) ; //  println();
        print ("After timer net.phase[j]= ");  
        print (j+1); 
        print (" ") ;
        println (net.phase[j+1]);
        //  net.phase[i+1]=(net.phase[i])+phiShift;// fun at speed -4
        //  net.phase[j+1]=(net.phase[j]);// 

        net.phase[j+1]=(net.phase[j])-phiShift*0;// 
        net.phase[j+1]= net.phase[j+1]%(TWO_PI*1);//  keep phase between 0 and TWO_PI

        print ("CW After timer & phase net.phase[j]= ");  
        print (j+1); 
        print (" ") ;
        println (net.phase[j+1]); 
        print (" metroPhase[j+1] ") ;  
        print (j+1); 
        print (" ") ; 
        println (metroPhase[j+1]) ; //  println();


        followNumber[j]= false;
        memoryi=j;  
        //    formerEvent[j]=formerEvent[0];


        println ("4**********************TIME AFTER TIME  OFFSET CW") ;  

        //   print ("After  Automation1[100+i] ") ;  print (j); print (" ") ; print (Automation1[100+j]) ; //  test with pendular
        //    print (" pseudoTimer[i] to compare at timer ") ;  print (j); print (" ") ; print (pseudoTimer[j]) ; //  test with pendular
        print (" Timer[j+1] to compare at timer ") ;  
        print (j+1); 
        print (" ") ; 
        print (formerEvent[j+1]) ; //  test with pendular
        print (" memoryiCircular= ");  
        print (memoryi);
        print (" followNumber "); 
        print (j); 
        print (" "); 
        println (followNumber[j]);
      }
      if ( formerEvent[0]>formerEvent[j]+timeOffset  && (CircularOldVirtualPosition[j] > CircularVirtualPosition[j])// CCW && followNumber[j]== false
        ) {
        // background(50);
        print ("After timer formerEvent[j+1] ") ;  
        print (j+1); 
        print (" ") ; 
        println (formerEvent[j+1]) ; //  println();
        print ("CCW After timer net.phase[j]= ");  
        print (j+1); 
        print (" ") ;
        println (net.phase[j+1]);
        //  net.phase[i+1]=(net.phase[i])+phiShift;// fun at speed -4

        net.phase[j+1]=(net.phase[j])-phiShift*0;// 
        net.phase[j+1]= net.phase[j+1]%(TWO_PI*1);//  keep phase between 0 and TWO_PI

        print ("CCW After timer & phase net.phase[j]= ");  
        print (j+1); 
        print (" ") ;
        println (net.phase[j+1]); 
        print (" metroPhase[j+1] ") ;  
        print (j+1); 
        print (" ") ; 
        println (metroPhase[j+1]) ; //  println();
        /* 
         print (" metroPhase[i+1] ") ;  print (i+1); print (" ") ; println (metroPhase[i+1]) ; //  println();
         metroPhase[i+1]=   metroPhase[i]+phiShift*0; 
         metroPhase[i+1]=   metroPhase[i+1]%-TWO_PI;
         net.phase[i+1]=    metroPhase[i+1]%TWO_PI;
         */


        memoryi=j;  
        //      formerEvent[j]=formerEvent[0];
      }

      // end 4 5
    } 

    // OSCILLATOR 11 gives its position to 2
    /*
      for (int j = 11; j < (12); j++) {
     
     if ( circularMov==true  && //( // circularMov==true
     
     ((CircularOldVirtualPosition[j] <= CircularVirtualPosition[2]+mapShiftCircular) && (CircularVirtualPosition[j] >= CircularVirtualPosition[2]+mapShiftCircular) &&
     (CircularOldVirtualPosition[j]+800*0.1 < CircularVirtualPosition[j]+800*0.1))
     
     ||
     
     ((CircularOldVirtualPosition[j]+mapShiftCircular >= CircularVirtualPosition[2]) && (CircularVirtualPosition[j]<= CircularVirtualPosition[2]+mapShiftCircular) &&
     (CircularOldVirtualPosition[j]+800*0.1 > CircularVirtualPosition[j]+800*0.1))
     
     )
     
     { 
     followNumber[j]= true;
     formerEvent[12]=formerEvent[0];
     }
     else followNumber[j]= false;
     
     if  (
     formerEvent[0]>formerEvent[12]+timeOffset && followNumber[j]== false
     ){
     //  background (127, 50,50);
     print ("formerEvent[0] ") ;  print (2); print (" ") ; print (formerEvent[0]) ; //  println();
     print ("formerEvent[2] ") ;  print (2); print (" ") ; println (formerEvent[2]) ; //  println();
     //  net.phase[i+1]=(net.phase[i])+phiShift;// fun at speed -4
     net.phase[2]=(net.phase[j]);// 
     net.phase[2]= net.phase[2]%TWO_PI;//  keep phase between 0 and TWO_PI
     
     memoryi=j;  
     formerEvent[2]=formerEvent[0];
     
     print (" memoryiCircular= ");  print (memoryi);
     print (" followNumber ");  print (followNumber[j]);
     
     }
     
     }
     */
  }
  for (int j = 2; j < (11); j++) {
    //     CircularOldVirtualPosition[j]= CircularOldVirtualPosition[j]; // useless
    //     CircularOldVirtualPosition[j+1]= CircularOldVirtualPosition[j+1]; // useless
  }
}
void deblockPendularOriginial() { 
  float PhaseDecay;
  PhaseDecay=d*QUARTER_PI/2;
  if // debug if oscillator are blocked to the left or the right in pendular mode
    (circularMov==false && ( (TrigmodPos[memoryi]>=0 && TrigmodPos[memoryi]<=0 && PendularLeftVirtualPosition[oldMemoryi]>=700 ) ||
    (revolution[memoryi]>=0 && revolution[memoryi]<=0 && PendularLeftVirtualPosition[oldMemoryi]<=-700) )
    ) { 
    //  background (75, 25, 75);
    if ( memoryi>=net.size()-1) {

      net.phase[1]=net.phase[0];
      print ("memoryi upstairx = 11? ");

      print (memoryi);
      net.phase[memoryi-1]= net.phase[memoryi];
      //**      net.phase[memoryi-1]= net.phase[memoryi]+PhaseDecay;
      //***      net.phase[memoryi-1]= net.phase[memoryi-1]%TWO_PI;
      net.naturalFrequency[memoryi-1]= net.naturalFrequency[memoryi];
      net.phase[memoryi]= net.phase[2]+PhaseDecay*1; // what it has been changed with formerkeyc
      net.phase[memoryi]= net.phase[memoryi]%TWO_PI; // what it has been changed with formerkeyc
      net.naturalFrequency[memoryi]=net.naturalFrequency[2];
      oldMemoryi=memoryi;
      OldoscillatorMoving=oldMemoryi;     
      oscillatorMoving=memoryi-1 ;
      memoryi=oscillatorMoving; //print onscreen actual oscillatorMoving   
      print ("Next frame oscillator Moving will be ");      
      println (oscillatorMoving); 
      print (" "); 
      println (memoryi);         
      oldOscillatorMoving[oldMemoryi]= false;
      OscillatorMoving[memoryi]= true;
      key='&';
      // end of memory=11
    }  

    if ( memoryi<net.size()-1) { 
      if (memoryi>2 ) {
        net.phase[1]=net.phase[0];
        print ("you were here: ");
        oldMemoryi=memoryi;  
        print (oldMemoryi); 
        net.phase[memoryi-1]= net.phase[memoryi];
        //**   net.phase[memoryi-1]= net.phase[memoryi]+PhaseDecay;
        //**   net.phase[memoryi-1]= net.phase[memoryi-1]%TWO_PI;
        net.phase[memoryi]= net.phase[memoryi+1]+PhaseDecay*1;//      
        net.phase[memoryi]= net.phase[memoryi]%TWO_PI;
        net.naturalFrequency[memoryi-1]= net.naturalFrequency[memoryi];
        net.naturalFrequency[memoryi]= net.naturalFrequency[memoryi+1];

        OldoscillatorMoving=oldMemoryi;
        oldMemoryi=OldoscillatorMoving;
        print ("you were still here "); 
        println (oldMemoryi);
        oscillatorMoving=memoryi-1;

        memoryi=oscillatorMoving; //print onscreen actual oscillatorMoving
        print ("Next frame are different memory here? ");
        println (oscillatorMoving);
      }

      oldOscillatorMoving[oldMemoryi]= false;
      OscillatorMoving[memoryi]= true;

      key='+';  
      //end case memory 3 to 10
    }



    if (memoryi>1 && memoryi<3 ) {
      net.phase[1]=net.phase[0];
      print ("memoryi upstairx = 2? ");
      print (memoryi);
      //***     net.phase[memoryi-1]= net.phase[memoryi];
      //**    net.phase[net.size()-1]= net.phase[2]+PhaseDecay;
      //***   net.phase[net.size()-1]= net.phase[11]%TWO_PI;
      //    net.phase[2]= net.phase[11]+PhaseDecay*1;
      //      net.phase[2]= net.phase[2]%TWO_PI;

      net.phase[11]= net.phase[2];
      net.naturalFrequency[11]= net.naturalFrequency[2];
      //***      net.phase[2]= net.phase[1];

      //    net.phase[2]= net.phase[1]+PhaseDecay;
      //    net.phase[2]= net.phase[2]%TWO_PI;

      net.phase[2]= net.phase[3]+PhaseDecay;
      net.phase[2]= net.phase[2]%TWO_PI;

      net.naturalFrequency[2]=net.naturalFrequency[1];
      oldMemoryi=2;     
      OldoscillatorMoving=2;
      oldMemoryi=OldoscillatorMoving;      
      oscillatorMoving=net.size()-1 ;
      memoryi=oscillatorMoving; //print onscreen actual oscillatorMoving
      print (" oscillator moving gonna be  = 11 ? ");
      println (oscillatorMoving); 
      print (" "); 
      println (memoryi);          
      oldOscillatorMoving[oldMemoryi]= false;
      OscillatorMoving[memoryi]= true;      
      key='&';
    }     //end case memory 2
  } //end of special debug in CIRCULAR = false. To deblock oscillator when they are blocked to the LEFT or to THE RIGHT
} 

// deblockPendularPendular()u
void deblockPendularu() {

  float PhaseDecay;
  PhaseDecay=d*QUARTER_PI/2;
  if // debug if oscillator are blocked to the left or the right in pendular mode
    (circularMov==false && ( (TrigmodPos[memoryi]>=0 && TrigmodPos[memoryi]<=0  ) ||
    (revolution[memoryi]>=0 && revolution[memoryi]<=0 )
    )) { 
    //  background (75, 25, 75);
    if ( memoryi<=net.size()-0) {
      print (" DEBLO deblockPendularu BEF  CHRO ");            
      print (upstairTime); 
      upstairTime = millis()+10;
      print (" DEBLO deblockPendularu AFT  CHRO ");            
      println (upstairTime); 
      ; 

      oldMemoryi=(memoryi+1)%12;
      if ( oldMemoryi<=0) {
        oldMemoryi=2;
      }

      //    net.phase[1]=net.phase[0];
      print ("memoryi DEBLOCK ");

      println (memoryi);

      metroPhase[oldMemoryi]= metroPhase [memoryi];// TrigRightTemp[oldMemoryi];

      net.phase[oldMemoryi]=  net.phase [memoryi];

      interPhase[memoryi]=  net.phase[oldMemoryi]; 

      //   key='#'; // do not use interphase[memoryi] from beginning  
      key='e'; //restart test condition
      net.naturalFrequency[memoryi]= 0;
      if ( millis()>=  TimeTrigged ) {
        TimeTrigged = millis() +10;
        key='#'; // do not use interphase[memoryi] from beginning       
        net.naturalFrequency[oldMemoryi]=   interFrequency[memoryi];
      }

      interFrequency[oldMemoryi]= interFrequency[memoryi];

      print (" FIRST CHRO ");
      println (upstairTime); 

      println (  upstairTime );
      //   upstairTime = millis() + 500;
      OldoscillatorMoving=memoryi;
      oldMemoryi=OldoscillatorMoving;
      //   oldMemoryi=memoryi;

      memoryi=(memoryi+1)%12;
      print (" memoryi deblock pendularu ");
      println (memoryi);
      if ( memoryi<=0) {
        memoryi=2;
      }
      // memoryi=memoryi+1;
      oscillatorMoving=memoryi;
      memoryi=oscillatorMoving; //print onscreen actual oscillatorMoving
      print ("Next frame  DEBLOCK and clock way = true you'll moving to  ");
      println (oscillatorMoving); 
      oldOscillatorMoving[oldMemoryi]= false;
      OscillatorMoving[memoryi]= true;
      key='e';
    }
  }
}


void deblockPendulari() {

  float PhaseDecay;
  PhaseDecay=d*QUARTER_PI/2;
  if // debug if oscillator are blocked to the left or the right in pendular mode
    (circularMov==false && ( (TrigmodPos[memoryi]>=0 && TrigmodPos[memoryi]<=0  ) ||
    (revolution[memoryi]>=0 && revolution[memoryi]<=0 )
    )) { 

    print (" DEBLO deblockPendulari BEF  CHRO ");            
    print (upstairTime); 
    upstairTime = millis()+10;
    print (" DEBLO deblockPendulari AFT  CHRO ");            
    println (upstairTime); 
    /*       A TESTER
     if ( millis()>= upstairTime-10 && //net.phase[memoryi]>= interPhase[memoryi]+PhaseDecay[5]) {
     ((TWO_PI-interPhase[memoryi]+net.phase[memoryi]
     >= interPhase[memoryi]-interPhase[oldMemoryi]))) { 
     */
    oldMemoryi=memoryi-1;
    if ( oldMemoryi<=1) {
      oldMemoryi=11;
    }   

    metroPhase[oldMemoryi]= metroPhase [memoryi];// TrigRightTemp[oldMemoryi];       
    net.phase[oldMemoryi]=  net.phase [memoryi];
    interPhase[memoryi]=  net.phase[oldMemoryi]; 

    //   key='#'; // do not use interphase[memoryi] from beginning  
    key='e'; //restart test condition
    net.naturalFrequency[memoryi]= 0;
    //***         }
    if ( millis()>=  TimeTrigged ) {
      TimeTrigged = millis() +d/10;
      key='#'; // do not use interphase[memoryi] from beginning       
      net.naturalFrequency[oldMemoryi]=   interFrequency[memoryi];
    }

    interFrequency[oldMemoryi]= interFrequency[memoryi];

    print (" FIRST CHRO ");          
    println (upstairTime); 

    //   upstairTime = millis() + 500;

    OldoscillatorMoving=memoryi;
    oldMemoryi=OldoscillatorMoving;
    memoryi=(memoryi-1)%12;
    print (" memoryi ");
    println (memoryi);
    if ( memoryi<=1) {
      memoryi=11;
    }

    oscillatorMoving=memoryi;
    memoryi=oscillatorMoving; //print onscreen actual oscillatorMoving
    print ("DEBLOCK Next frame  and clock way = true you'll moving to  ");
    println (oscillatorMoving); 
    oldOscillatorMoving[oldMemoryi]= false;
    OscillatorMoving[memoryi]= true;
    key='e';
  }
}

void deblockCircularu() {  // 11; 10; 9

  float PhaseDecay;
  PhaseDecay=d*QUARTER_PI/2;
  if // debug if oscillator are blocked to the left or the right in pendular mode
    (circularMov==true &&  (  (revolution[memoryi]>=0 && revolution[memoryi]<=0 ) // (TrigmodPos[memoryi]>=0 && TrigmodPos[memoryi]<=0  ) 
    // || ((6400-DataToDueCircularVirtualPosition[oldMemoryi]+DataToDueCircularVirtualPosition[memoryi])>= DataToDueCircularVirtualPosition[oldMemoryi]-DataToDueCircularVirtualPosition[oldMemoryi-1] )
    ||  1<0 //   (revolution[memoryi]>=0 && revolution[memoryi]<=0 )
    )) { 

    print (" DEBLO deblockCircularu BEF  CHRO ");            
    print (upstairTime); 
    upstairTime = millis()+10;
    print (" DEBLO deblockCircularu AFT  CHRO ");            
    println (upstairTime); 

    //    print (" DataToDueCircularVirtualPosition[oldMemoryi-1] " ) ;  println (DataToDueCircularVirtualPosition[oldMemoryi-1]); // bug based on us
    print (" DataToDueCircularVirtualPosition[oldMemoryi] " ) ;  
    println (DataToDueCircularVirtualPosition[oldMemoryi]);
    print (" 6400-DataToDueCircularVirtualPosition[oldMemoryi] " ) ;  
    println (6400 - DataToDueCircularVirtualPosition[oldMemoryi]);


    //     if ((6400-DataToDueCircularVirtualPosition[oldMemoryi]+DataToDueCircularVirtualPosition[memoryi])
    //            >= DataToDueCircularVirtualPosition[oldMemoryi]-DataToDueCircularVirtualPosition[oldMemoryi-1] ){ 
    if ( millis()>= upstairTime-10 && //net.phase[memoryi]>= interPhase[memoryi]+PhaseDecay[5]) {
      ((TWO_PI-interPhase[memoryi]+net.phase[memoryi]
      >= interPhase[memoryi]-interPhase[oldMemoryi]))) { 

      print (" AFTER  CHRO ");            
      println (upstairTime); 
      upstairTime = millis()+10;

      oldMemoryi=(memoryi+1)%12;
      if ( oldMemoryi<=0) {
        oldMemoryi=2;
      }

      metroPhase[oldMemoryi]= metroPhase [memoryi];// TrigRightTemp[oldMemoryi];       
      net.phase[oldMemoryi]=  net.phase [memoryi];
      interPhase[memoryi]=  net.phase[oldMemoryi]; 


      //    key='#'; // do not use interphase[memoryi] from beginning  
      key='e'; //restart test condition
      net.naturalFrequency[memoryi]= 0;
    }
    if ( millis()>=  TimeTrigged ) {
      TimeTrigged = millis() +d/10;
      key='#'; // do not use interphase[memoryi] from beginning       
      net.naturalFrequency[oldMemoryi]=   interFrequency[memoryi];
    }

    interFrequency[oldMemoryi]= interFrequency[memoryi];

    print (" FIRST CHRO ");          
    println (upstairTime); 

    //   upstairTime = millis() + 500;

    OldoscillatorMoving=memoryi;
    oldMemoryi=OldoscillatorMoving;

    memoryi=(memoryi+1)%12;
    print (" memoryi deblock pendularu ");
    println (memoryi);
    if ( memoryi<=0) {
      memoryi=2;
    }

    oscillatorMoving=memoryi;
    memoryi=oscillatorMoving; //print onscreen actual oscillatorMoving
    print ("DEBLOCK Next frame  and clock way = true you'll moving to  ");
    println (oscillatorMoving); 
    oldOscillatorMoving[oldMemoryi]= false;
    OscillatorMoving[memoryi]= true;
    key='e';
  }
}    

void deblockCirculari() {  // 11; 10; 9

  float PhaseDecay;
  PhaseDecay=d*QUARTER_PI/2;
  if // debug if oscillator are blocked to the left or the right in pendular mode
    (circularMov==true &&(           (revolution[memoryi]>=0 && revolution[memoryi]<=0 ) //
    // || ((6400-DataToDueCircularVirtualPosition[oldMemoryi]+DataToDueCircularVirtualPosition[memoryi])>= DataToDueCircularVirtualPosition[oldMemoryi]-DataToDueCircularVirtualPosition[oldMemoryi-1] )
    ||  1<0 //   (revolution[memoryi]>=0 && revolution[memoryi]<=0 )
    )) { 
    //   background (127, 50, 50 );
    print (" DEBLO deblockCirculari BEF  CHRO ");            
    print (upstairTime); 
    upstairTime = millis()+10;
    print (" DEBLO deblockCirculari AFT  CHRO ");            
    println (upstairTime); 

    print (" DataToDueCircularVirtualPosition[oldMemoryi-1] " ) ;  
    println (DataToDueCircularVirtualPosition[oldMemoryi-1]);
    print (" DataToDueCircularVirtualPosition[oldMemoryi] " ) ;  
    println (DataToDueCircularVirtualPosition[oldMemoryi]);
    print (" 6400-DataToDueCircularVirtualPosition[oldMemoryi] " ) ;  
    println (6400 - DataToDueCircularVirtualPosition[oldMemoryi]);


    //     if ((6400-DataToDueCircularVirtualPosition[oldMemoryi]+DataToDueCircularVirtualPosition[memoryi])
    //            >= DataToDueCircularVirtualPosition[oldMemoryi]-DataToDueCircularVirtualPosition[oldMemoryi-1] ){ 
    if ( millis()>= upstairTime-10 && //net.phase[memoryi]>= interPhase[memoryi]+PhaseDecay[5]) {
      ((TWO_PI-interPhase[memoryi]+net.phase[memoryi]
      >= interPhase[memoryi]-interPhase[oldMemoryi]))) { 
      //***     ((TWO_PI-net.oldPhase[memoryi]+net.phase[memoryi]>=net.phase[memoryi]+PhaseDecay[5])) // good to find


      print (" AFTER  CHRO ");            
      println (upstairTime); 
      upstairTime = millis()+10;


      oldMemoryi=memoryi-1;
      if ( oldMemoryi<=1) {
        oldMemoryi=11;
      } 
      metroPhase[oldMemoryi]= metroPhase [memoryi];// TrigRightTemp[oldMemoryi];       
      net.phase[oldMemoryi]=  net.phase [memoryi];
      interPhase[memoryi]=  net.phase[oldMemoryi]; 


      //    key='#'; // do not use interphase[memoryi] from beginning  
      key='e'; //restart test condition
      net.naturalFrequency[memoryi]= 0;
    }
    if ( millis()>=  TimeTrigged ) {
      TimeTrigged = millis() +d/10;
      key='#'; // do not use interphase[memoryi] from beginning       
      net.naturalFrequency[oldMemoryi]=   interFrequency[memoryi];
    }

    interFrequency[oldMemoryi]= interFrequency[memoryi];

    print (" FIRST CHRO ");          
    println (upstairTime); 

    //   upstairTime = millis() + 500;

    OldoscillatorMoving=memoryi;
    oldMemoryi=OldoscillatorMoving;

    memoryi=(memoryi-1)%12;
    print (" memoryi ");
    println (memoryi);
    if ( memoryi<=1) {
      memoryi=11;
    }

    oscillatorMoving=memoryi;
    memoryi=oscillatorMoving; //print onscreen actual oscillatorMoving
    print ("DEBLOCK Next frame  and clock way = true you'll moving to  ");
    println (oscillatorMoving); 
    oldOscillatorMoving[oldMemoryi]= false;
    OscillatorMoving[memoryi]= true;
    key='e';
  }
}

void deblockCircularwi() {  // 11; 10; 9
//  PhaseDecay[5]=QUARTER_PI/8 in starterw
  float PhaseDecay;
  PhaseDecay=k*QUARTER_PI/16;
 //  PhaseDecay=QUARTER_PI/8;


  print (" PhaseDecaydeblockCircularwi ");  
  println (PhaseDecay); 
  if // debug if oscillator are blocked to the left or the right in pendular mode
    (circularMov==true &&(   (revolution[memoryi]>=0 && revolution[memoryi]<=0 )  // (pseudoRevolutionTodeblock[memoryi]>=0 && pseudoRevolutionTodeblock[memoryi]<=0 )
    // || ((6400-DataToDueCircularVirtualPosition[oldMemoryi]+DataToDueCircularVirtualPosition[memoryi])>= DataToDueCircularVirtualPosition[oldMemoryi]-DataToDueCircularVirtualPosition[oldMemoryi-1] )
    ||  1<0 //   (revolution[memoryi]>=0 && revolution[memoryi]<=0 )

    )) { 

//    background (127, 50, 50 );
    print (" DEBLO deblockCircularWI BEF  CHRO ");            
    print (upstairTime); 
    upstairTime = millis()+10;
    print (" DEBLO deblockCirculari AFT  CHRO ");            
    println (upstairTime); 
    if  (net.phase[memoryi]<=0 && TWO_PI+net.phase[memoryi]<=interPhase[oldMemoryi]+PhaseDecay) { 

      print (" DataToDueCircularVirtualPosition[oldMemoryi-1] " ) ;  
      println (DataToDueCircularVirtualPosition[oldMemoryi-1]);
      print (" DataToDueCircularVirtualPosition[oldMemoryi] " ) ;  
      println (DataToDueCircularVirtualPosition[oldMemoryi]);
      print (" 6400-DataToDueCircularVirtualPosition[oldMemoryi] " ) ;  
      println (6400 - DataToDueCircularVirtualPosition[oldMemoryi]);
      key='O'; 
      keyReleased();
    } 

    if ( millis()>= upstairTime-10 // &&  net.phase[memoryi]<=0 && TWO_PI+net.phase[memoryi]<=interPhase[oldMemoryi]+PhaseDecay//net.phase[memoryi]>= interPhase[memoryi]+PhaseDecay[5]) {
      //   &&  ((TWO_PI-interPhase[memoryi]+net.phase[memoryi]
      //         >= interPhase[memoryi]-interPhase[oldMemoryi]))
      //***     ((TWO_PI-net.oldPhase[memoryi]+net.phase[memoryi]>=net.phase[memoryi]+PhaseDecay[5])) // good to find

      ) { 


      print (" AFTER  CHRO ");            
      println (upstairTime); 
      upstairTime = millis()+10;


      oldMemoryi=memoryi-1;
      if ( oldMemoryi<=1) {
        oldMemoryi=11;
      } 

      metroPhase[oldMemoryi]= metroPhase [memoryi];// TrigRightTemp[oldMemoryi];       
      net.phase[oldMemoryi]=  net.phase [memoryi];
      interPhase[memoryi]=  net.phase[oldMemoryi]; 


      //    key='#'; // do not use interphase[memoryi] from beginning  
      key='e'; //restart test condition
      net.naturalFrequency[memoryi]= 0;
    }
    if ( millis()>=  TimeTrigged ) {
      TimeTrigged = millis() +d/10;
      key='#'; // do not use interphase[memoryi] from beginning       
      net.naturalFrequency[oldMemoryi]=   interFrequency[memoryi];
    }

    interFrequency[oldMemoryi]= interFrequency[memoryi];

    print (" FIRST CHRO ");          
    println (upstairTime); 

    //   upstairTime = millis() + 500;

    OldoscillatorMoving=memoryi;
    oldMemoryi=OldoscillatorMoving;

    memoryi=(memoryi-1)%12;
    print (" memoryi ");
    println (memoryi);
    if ( memoryi<=1) {
      memoryi=11;
    }

    oscillatorMoving=memoryi;
    memoryi=oscillatorMoving; //print onscreen actual oscillatorMoving
    print ("DEBLOCK WI Next frame  and clock way = true you'll moving to  ");
    println (oscillatorMoving); 
    oldOscillatorMoving[oldMemoryi]= false;
    OscillatorMoving[memoryi]= true;
    key='e';
  }
}
