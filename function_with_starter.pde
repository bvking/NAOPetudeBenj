
void formerKeyo() { 
  print ("circularMov "); 
  println (circularMov);
  //print("inspired from u$ and v$.  funny  "); 

  if (circularMov==false) {
    memoryi=0;
    if (d>=0) {
      timeOffset=d/10;
    }

    if (k>=0) { // k goes from -8 to 8.   you can paramater it at increase phase shifting
      phiShift=k*-PI/32;
      mapShiftPendular= map (phiShift, 0, 16*-PI/32, 0, 1600);
    }
    print (" mapShiftPendular "); 
    println (mapShiftPendular); 

    for (int i = 0; i < (net.size()-1); i++) {  
      PendularLeftVirtualPosition[i]= PendularLeftVirtualPosition[i];// -800 à gauche 800 à droite
      PendularOldLeftVirtualPosition[i]=  PendularOldLeftVirtualPosition[i];
      PendularLeftVirtualPosition[i+1]= PendularLeftVirtualPosition[i+1];
      PendularOldLeftVirtualPosition[i+1]=  PendularOldLeftVirtualPosition[i+1];
    }

    // for (int i = 2; i < (net.size()-1); i++) {//
    for (int i = 2; i < (3); i++) {//test only point 2 and 3

      if (  circularMov==false  && 
        (
        (
        // deplacement point vers la droite

        (PendularOldLeftVirtualPosition[i] <= PendularLeftVirtualPosition[i+1]+mapShiftPendular) && (PendularLeftVirtualPosition[i] >= PendularLeftVirtualPosition[i+1]+mapShiftPendular) &&
        (PendularOldLeftVirtualPosition[i]+800 < PendularLeftVirtualPosition[i]+800))

        ||


        ((PendularOldLeftVirtualPosition[i] >= PendularLeftVirtualPosition[i+1]-mapShiftPendular) && (PendularLeftVirtualPosition[i] <= PendularLeftVirtualPosition[i+1]-mapShiftPendular) &&
        (PendularOldLeftVirtualPosition[i]+800 > PendularLeftVirtualPosition[i]+800))// movement to the left

        )
        )

      { 
        memoryi=i;
        print (" Before timer net.phase[i] ") ;  
        print (i+1); 
        print (" ") ; 
        println (net.phase[i]) ; //  println();
        print (" metroPhase[i+1] ") ;  
        print (i); 
        print (" ") ; 
        println (metroPhase[i+1]) ; //  println();


        println ("***********************TIME BEFORE TIME OFFSET*******************************************************************") ;  
        print ("Before Automation1[100+i] ") ;  
        print (i); 
        print (" ") ; 
        println (Automation1[100+3]) ; //  println();
        currentTime=millis();
        timer[i]= currentTime - Automation1[100+i+0];
        //  Automation1[100+i+0]=currentTime;
        print ("timer ") ;  
        print (i) ; 
        print (" ");  
        println (timer[i]);  
        pseudoTimer[i]=timer[i];// something to add to the timer?
      }

      if (pseudoTimer[i]>=timeOffset && (PendularOldLeftVirtualPosition[i]+800 <= PendularLeftVirtualPosition[i]+800)// to the right
        ) {

        print (" After timer net.phase[i] ") ;  
        print (i); 
        print (" ") ; 
        println (net.phase[i]) ; //  println();
        net.phase[i+1]=   net.phase[i]-phiShift*0; 
        net.phase[i+1]=   net.phase[i+1]%TWO_PI; 
        print (" metroPhase[i+1] ") ;  
        print (i+1); 
        print (" ") ; 
        println (metroPhase[i+1]) ; //  println();
        /* 
         print (" metroPhase[i+1] ") ;  print (i+1); print (" ") ; println (metroPhase[i+1]) ; //  println();
         metroPhase[i+1]=   metroPhase[i]+phiShift*0; 
         metroPhase[i+1]=   metroPhase[i+1]%-TWO_PI;
         net.phase[i+1]=    metroPhase[i+1]%TWO_PI;
         */


        memoryi=i;  

        Automation1[100+i+0]=currentTime;

        println ("***********************TIME AFTER TIME OFFSET*******************************************************************") ;  

        print ("After  Automation1[100+i] ") ;  
        print (i); 
        print (" ") ; 
        print (Automation1[100+i]) ; //  println();
        print (" pseudoTimer[i] to compare at timer ") ;  
        print (i); 
        print (" ") ; 
        print (pseudoTimer[i]) ; //  println();
        print (" memoryi= ");  
        println (memoryi); // to show which point is changing its position
      }

      if (pseudoTimer[i]>=timeOffset && (PendularOldLeftVirtualPosition[i]+800 >= PendularLeftVirtualPosition[i]+800)// to the right
        ) {

        net.phase[i+1]=   net.phase[i]+phiShift*0; 
        net.phase[i+1]=   net.phase[i+1]%TWO_PI; 

        /*
           metroPhase[i+1]=   metroPhase[i]+phiShift*0; 
         metroPhase[i+1]=   metroPhase[i+1]%TWO_PI;
         net.phase[i+1]=    metroPhase[i+1]%TWO_PI;
         */

        memoryi=i;  

        Automation1[100+i+0]=currentTime;

        println ("***********************TIME AFTER TIME OFFSET*******************************************************************") ;  

        print ("After  Automation1[100+i] ") ;  
        print (i); 
        print (" ") ; 
        print (Automation1[100+i]) ; //  println();
        print (" pseudoTimer[i] ") ;  
        print (i); 
        print (" ") ; 
        print (pseudoTimer[i]) ; //  println();
        print (" memoryi= ");  
        print (memoryi); // to show which point is changing its position
      }
    }
    // }
    //  OSCILLATOR 11 give his position to oscillator 2
    ///*
    if ((  circularMov==false  && 
      (PendularOldLeftVirtualPosition[11] <= PendularLeftVirtualPosition[2]+mapShiftPendular) && (PendularLeftVirtualPosition[11] >= PendularLeftVirtualPosition[2]+mapShiftPendular) &&
      (PendularOldLeftVirtualPosition[11]+800*0.01 < PendularLeftVirtualPosition[11]+800*0.01))

      ||

      //((PendularLeftVirtualPosition[2+1]>PendularLeftVirtualPosition[2]&&PendularLeftVirtualPosition[2+1]>-400 && PendularLeftVirtualPosition[2]>-400  )) && 

      ((PendularOldLeftVirtualPosition[11] >= PendularLeftVirtualPosition[2]-mapShiftPendular) && (PendularLeftVirtualPosition[11] <= PendularLeftVirtualPosition[2]-mapShiftPendular) &&
      (PendularOldLeftVirtualPosition[11]+800*0.01 > PendularLeftVirtualPosition[11]+800*0.01))

      )

    { 

      println ("******************************TIME 11 BEFORE TIME OFFSET************************************************************") ;  
      print ("Before Automation1[100+11] ") ;  
      print (11); 
      print (" ") ; 
      println (Automation1[100+11]) ; //  println();
      int currentTime=millis();
      timer[11]= currentTime - Automation1[100+11+0];
      //  Automation1[100+11+0]=currentTime;
      print ("timer ") ;   
      println (timer[11]) ;  
      pseudoTimer[11]=timer[11];

      if (pseudoTimer[11]>=timeOffset //&& (Automation1[100+2]>Automation1[100+3])
        ) {
        /*
           net.phase[2]=   net.phase[11]-phiShift*0; 
         net.phase[2]=   net.phase[2]%TWO_PI;
         */
        /*
           metroPhase[2]=   metroPhase[11]+phiShift; 
         metroPhase[2]=   metroPhase[2]%TWO_PI;
         net.phase[2]=    metroPhase[2]%TWO_PI; 
         */
        memoryi=11;  
        //   Automation1[100+2]=Automation1[100+2];
        Automation1[100+11+0]=currentTime;

        println ("******************************AFTER 11 BEFORE TIME OFFSET************************************************************") ;  
        print ("After Automation1[100+11] ") ;  
        print (11); 
        print (" ") ; 
        println (Automation1[100+11]) ; //  println();

        print ("pseudoTimer[i] ") ;  
        print (11); 
        print (" ") ; 
        print (pseudoTimer[11]) ; //  println();

        print (" memoryi= ");  
        print (memoryi);
      }
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
  }// end formerKeyO
}
//upstairv

void formerKeyv(int oscillatorMoving, int OldoscillatorMoving, float phaseDecay) { 

  print (" phaseDecay ");  
  print (phaseDecay);
  float PhaseDecay=phaseDecay*QUARTER_PI/4; // if K=8 --> PhaseDecay=HALF_PI
  int PhaseDecayMapped = (int)  map (PhaseDecay, 0, HALF_PI, 0, 800);
  print (" PhaseDecay ");
  print (PhaseDecay);  
  print (" PhaseDecayMapped ");
  print (PhaseDecayMapped);
  print (" oldMemoryi ");  
  print (oldMemoryi );
  print (" memoryi ");  
  println ( memoryi );

  if ( metroPhase[memoryi]<=0 &&  metroPhase[memoryi]>=-PI ) {
    factorWay[memoryi]=true;
    print ("  factorWay "); 
    print (memoryi);  
    print (" "); 
    print (factorWay[memoryi]);
  } else factorWay[memoryi]=false;  

  if ( metroPhase[oldMemoryi]<=0 &&  metroPhase[oldMemoryi]>=-PI) {
    factorWay[oldMemoryi]=true;
  } else factorWay[oldMemoryi]=false; 

  print ("  factorWayO "); 
  print (oldMemoryi);  
  print (" "); 
  print (factorWay[oldMemoryi]);     
  print ("  factorWayM "); 
  print (memoryi);  
  print (" "); 
  print (factorWay[memoryi]);     

  for (int j = 0; j < networkSize; j++) {

    if ((metroOldPhase[j] <= PI && metroOldPhase[j] >= 0 &&  metroPhase[j] <= metroOldPhase[j] )||   //CCW
      (metroOldPhase[j] >= -PI && metroOldPhase[j] <= 0 &&  metroPhase[j] <= metroOldPhase[j] )) {
      clockWay[j]= false;
    }
    if ((metroOldPhase[j] >= -PI && metroOldPhase[j] <= 0 &&  metroPhase[j]<=0 &&  metroPhase[j] >= metroOldPhase[j] )||
      (metroOldPhase[j] <= PI  && metroOldPhase[j] >= 0 &&  metroPhase[j]>=0 &&  metroPhase[j] >= metroOldPhase[j] )) { 
      clockWay[j]= true;
    }



    //       metroOldOldPhase[j]=metroOldPhase[j];
    metroOldPhase[j]= (metroPhase[j]);
    //**       PhaseDecay[j]=factorWay[j]*phaseDecay*QUARTER_PI/2;
    //       PhaseDecay[j]= phaseDecay*QUARTER_PI/2;
  }

  //**    PhaseDecay[memoryi]=factorWay[memoryi]*phaseDecay*QUARTER_PI/2;
  print ("  clockWay "); 
  print (memoryi);  
  print (" "); 
  println ( clockWay[memoryi]);
  print ("  clockWayOld "); 
  print (oldMemoryi);  
  print (" "); 
  println ( clockWay[oldMemoryi]);
  // print ("  clockWaySuiv "); print (memoryi+1);  print (" "); println ( clockWay[memoryi+1]);

  if (circularMov==true ) {
    for (int i = 0; i < (net.size()-0); i++) {  
      PendularLeftVirtualPosition[i]= CircularVirtualPosition[i];
      PendularOldLeftVirtualPosition[i]= CircularOldVirtualPosition[i];      
      print ("PendularLeftVirtualPosition ");
      print (i);
      print (" "); 
      print (PendularLeftVirtualPosition[i]); 
      print ("CircularVirtualPosition "); 
      print (i); 
      print (" ");   
      println (CircularVirtualPosition[i]);
    }
  } 
  if (circularMov==false ) {
    for (int i = 0; i < (net.size()-0); i++) {
      upstairOldVpos[i] = upstairVpos[i];
      upstairVpos[i]= (int) map (PendularLeftVirtualPosition[i], -800, 800, 0, 3200);
      print (" PendularOldLeftVirtualPosition[i] ");
      print (i);
      print (" ");  
      print (PendularOldLeftVirtualPosition[i]);   
      print (" upstairOldVpos ");
      print (i);
      print (" "); 
      print (upstairOldVpos[i]); 
      print ("upstairVpos "); 
      print (i); 
      print (" ");   
      println (upstairVpos[i]);
    }
  } 
  //  deblockPendular(); 

  if ( memoryi<net.size()-1   ) {// oldMemory=memoryi+1; 4<=5 for example
    if ((((upstairOldVpos[memoryi]%3200 <= upstairVpos[oldMemoryi]%3200+PhaseDecayMapped*ClockWay[memoryi]*0) && (upstairVpos[memoryi]%3200 > upstairVpos[oldMemoryi]%3200+PhaseDecayMapped*ClockWay[memoryi]*0) && 
      (upstairOldVpos[memoryi]%3200 < upstairVpos[memoryi]%3200)) ||  //CW
      ( (upstairOldVpos[memoryi]%3200 >= upstairVpos[oldMemoryi]%3200+PhaseDecayMapped*ClockWay[memoryi]*0) && (upstairVpos[memoryi]%3200 < upstairVpos[oldMemoryi]%3200+PhaseDecayMapped*ClockWay[memoryi]*0) &&
      (upstairOldVpos[memoryi]%3200 > upstairVpos[memoryi]%3200) ) ) ||  // CCW
      (   (metroPhase[0]-metroPhase[networkSize-1] <=0)  ||  (metroPhase[networkSize-1]-metroPhase[0] <=0)  )
      ) {

      if (memoryi>0  && memoryi<networkSize-1 ) { //  &&   clockWay[memoryi]== false

        net.phase[memoryi]= net.phase[memoryi+1]-PhaseDecay*0;// 
        //   net.phase[memoryi+1]= net.phase[memoryi+1]+PhaseDecay*1;//%TWO_PI;// +PhaseDecay is Clock WAY =0 
        net.phase[memoryi+1]= (net.phase[memoryi+1]-PhaseDecay*1)%TWO_PI;//;// +PhaseDecay is Clock WAY =0 

        net.naturalFrequency[memoryi+1]= net.naturalFrequency[memoryi];
        net.naturalFrequency[memoryi]= net.naturalFrequency[memoryi-1];

        oldMemoryi=memoryi;      
        OldoscillatorMoving=oldMemoryi;
        oldMemoryi=OldoscillatorMoving;
        oscillatorMoving=memoryi+1;
        memoryi=oscillatorMoving; //print onscreen actual oscillatorMoving
        print ("Next frame you'll moving to  ");
        println (oscillatorMoving);
      } 
      /* 
       if (memoryi>1  &&   clockWay[memoryi]== true && memoryi<11 ) {
       
       metroPhase[memoryi]=   metroPhase[memoryi+1]+PhaseDecay;// 
       metroPhase[memoryi+1]= metroPhase[memoryi+1]-PhaseDecay;// +PhaseDecay is Clock WAY =0 
       
       net.naturalFrequency[memoryi+1]=  net.naturalFrequency[memoryi];
       net.naturalFrequency[memoryi]= net.naturalFrequency[memoryi-1];
       
       oldMemoryi=memoryi;      
       OldoscillatorMoving=oldMemoryi;
       oldMemoryi=OldoscillatorMoving;
       oscillatorMoving=memoryi+1;
       memoryi=oscillatorMoving; //print onscreen actual oscillatorMoving
       print ("Next frame  and clock way = true you'll moving to  ");
       println (oscillatorMoving);         
       } 
       */
      oldOscillatorMoving[oldMemoryi]= false;
      OscillatorMoving[memoryi]= true;

      key='z';
    }
  }
  //  deblockPendular(); 
 /*
  if ((upstairOldVpos[net.size()-1]%3200 <= upstairVpos[10]%3200) && (upstairVpos[net.size()-1]%3200 > upstairVpos[10]%3200)&& (upstairOldVpos[net.size()-1]%3200 < upstairVpos[net.size()-1]%3200) ||
    ( (upstairOldVpos[net.size()-1]%3200 >= upstairVpos[10]%3200) && (upstairVpos[net.size()-1]%3200 < upstairVpos[10]%3200)&& (upstairOldVpos[net.size()-1]%3200 > upstairVpos[net.size()-1]%3200+800)) ||
    (  (metroPhase[11]-metroPhase[2] <=-PI+PhaseDecay)  ||  (metroPhase[2]-metroPhase[11] <=-PI+PhaseDecay) ) //(metroPhase[memoryi]-metroPhase[oldMemoryi] <=-PI-PhaseDecay)  ||  (metroPhase[memoryi]-metroPhase[oldMemoryi] >=PI+PhaseDecay) //  (metroPhase[memoryi]-metroPhase[oldMemoryi] <=-PI-PhaseDecay)  ||  (metroPhase[oldMemoryi]-metroPhase[memoryi] <=-PI-PhaseDecay)
    ) {
    net.phase[2]=   net.phase[1]-PhaseDecay*0;


    net.phase[11]=  (net.phase[11]-PhaseDecay*1)%TWO_PI;//%TWO_PI; //No sens , but to do when phase is <0
    net.naturalFrequency[2]=   net.naturalFrequency[11];
    net.naturalFrequency[11]= net.naturalFrequency[10];

    print ("Where is you oscillator, your memory ? ");
    println (oscillatorMoving); 
    print (" "); 
    println (memoryi);
    print ("you are coming back to  oscillatorMoving 2   ");

    OldoscillatorMoving=net.size()-1;
    oldMemoryi=OldoscillatorMoving; 

    oscillatorMoving=2 ;
    memoryi=oscillatorMoving; //print onscreen actual oscillatorMoving

    println (oscillatorMoving); 
    print (" "); 
    println (memoryi);

    oldOscillatorMoving[net.size()-1]= false;
    OscillatorMoving[memoryi]= true;

    print ("oldOscillatorMoving "); 
    print (11); 
    print (" ");   
    print (oldOscillatorMoving[11]); 
    print ("OscillatorMoving "); 
    print (2); 
    print (" ");   
    println (OscillatorMoving[2]); 

    key='e';
  }
 */
  // deblockPendular();
  print (" ENDUPSTAIRv " ); 
  
  print (" BeforeOscillatorMoving ");  
  println ( OldoscillatorMoving );
  print (" OldoscillatorMoving ");     
  println ( oldOscillatorMoving[OldoscillatorMoving]);

  print (" BeginINToscillatorMoving ");  
  println ( oscillatorMoving );
  print (" BOOLoscillatorMoving ");  
  println ( OscillatorMoving[oscillatorMoving] );
  print (" BOOLOldoscillatorMoving ");  
  println ( oldOscillatorMoving[oscillatorMoving] );
}  
//upstairwi;
// upstairwioppositeway
//starterw
void formerKeyCopposite(int oscillatorMoving, int OldoscillatorMoving, float phaseDecay) {   // based on i$ 6, 5, 4 ...,  2, 11

pendularPatternLFO();  // function at the top of function with starter in main program

 // PhaseDecay[5]=k*QUARTER_PI/8;
// PhaseDecay[5]=k;
 PhaseDecay[5]=QUARTER_PI/8;
    print (" phaseDecay in starterw ");  print (phaseDecay);  print (" phaseDecay5 ");   print (PhaseDecay[5]); 

  float PhaseDecayBis=phaseDecay*QUARTER_PI/8; // QUARTER_PI/8 if K=8 --> PhaseDecay=HALF_PI/2
  int PhaseDecayMapped = (int)  map (PhaseDecayBis, 0, HALF_PI, 0, 800); 
 
  print (" PhaseDecayMapped ");  print (PhaseDecayMapped);  print (" oldMemoryi ");    print (oldMemoryi );  print (" memoryi ");    println ( memoryi );

  if ( metroPhase[memoryi]<=0 &&  metroPhase[memoryi]>=-PI ) { // to know where the ball moving is (left or right)
    factorWay[memoryi]=true;
    print ("  factorWay ");     print (memoryi);      print (" ");     print (factorWay[memoryi]);
  } else factorWay[memoryi]=false;  // memoryi is on the part right  

  if ( metroPhase[oldMemoryi]<=0 &&  metroPhase[oldMemoryi]>=-PI) {
    factorWay[oldMemoryi]=true;
  } else factorWay[oldMemoryi]=false; 

  print ("  factorWayO ");   print (oldMemoryi);    print (" ");   print (factorWay[oldMemoryi]);      print ("  factorWayM ");   print (memoryi);    print (" ");  print (factorWay[memoryi]);     
  for (int j = 0; j < networkSize; j++) { // to know if the ball turns on ClockWise or counterclockwise

    if ((metroOldPhase[j] <= PI && metroOldPhase[j] >= 0 &&  metroPhase[j] <= metroOldPhase[j] )||   //CCW
        (metroOldPhase[j] >= -PI && metroOldPhase[j] <= 0 &&  metroPhase[j] <= metroOldPhase[j] )) {
      clockWay[j]= false;
    }
    if ((metroOldPhase[j] >= -PI && metroOldPhase[j] <= 0 &&  metroPhase[j]<=0 &&  metroPhase[j] >= metroOldPhase[j] )||
        (metroOldPhase[j] <= PI  && metroOldPhase[j] >= 0 &&  metroPhase[j]>=0 &&  metroPhase[j] >= metroOldPhase[j] )) { 
      clockWay[j]= true;
    }
    PhaseDecay[j]= phaseDecay*QUARTER_PI/16;    // specif decay used in deblock
  }

  print ("  clockWay ");  print (memoryi);  print (" ");  println ( clockWay[memoryi]); print ("  clockWayOld ");  print (oldMemoryi);   print (" "); println ( clockWay[oldMemoryi]);

  if ( memoryi<=net.size()-0  ) {  // oldMemory=memoryi+1; 4<=5 for example
    print (" BEFORE CHRO WI upstair Time ");          println (  upstairTime );  // condition below is not always respected

    if (( millis()>= upstairTime-10 && ( (net.phase[memoryi]) >=  (interPhase[memoryi]+PhaseDecay[5]) ) && net.naturalFrequency[memoryi]>0   )  
      ||     ( millis()>= upstairTime-10 && ( (net.phase[memoryi]) <=  (interPhaseCircular[oldMemoryi]-PhaseDecay[5]) ) && net.naturalFrequency[memoryi]<0 )
      ) { //  ||  (  (net.phase[memoryi]) <=  (A-interPhase[memoryi]-PhaseDecay[5]) ))) {
      print (" AFTER  CHRO WI  Frequencey > O upstair Time");                  println (upstairTime); 
      upstairTime = millis()+d;

      oldMemoryi=memoryi-1;
      if ( oldMemoryi<=1) {
        oldMemoryi=11;
      }   

      metroPhase[oldMemoryi]= metroPhase [memoryi];// TrigRightTemp[oldMemoryi];
      net.phase[oldMemoryi]=  net.phase [memoryi];
      interPhase[memoryi]=  net.phase[oldMemoryi]; 
      interPhaseCircular[memoryi]=  net.phase[oldMemoryi]; 

      key='e'; //restart test condition
      net.naturalFrequency[memoryi]= 0;

      if ( millis()>=  TimeTrigged ) {

        TimeTrigged = millis() + d/10;
        key='#'; // do not use interphase[memoryi] from beginning       
        net.naturalFrequency[oldMemoryi]=   interFrequency[memoryi];
      }

      interFrequency[oldMemoryi]= interFrequency[memoryi];

      print (" FIRST CHRO WI upstairTime");          println (upstairTime); 
      OldoscillatorMoving=memoryi;
      oldMemoryi=OldoscillatorMoving;

      memoryi=(memoryi-1)%networkSize;
      print (" memoryi "); println (memoryi);
      if ( memoryi<=1) {
        memoryi=11;
      }

      oscillatorMoving=memoryi;
      memoryi=oscillatorMoving; //print onscreen actual oscillatorMoving
      print ("Next frame  and clock way = true you'll moving to  ");     println (oscillatorMoving); 
      oldOscillatorMoving[oldMemoryi]= false;
      OscillatorMoving[memoryi]= true;
      key='e';
    }
    deblockPendulari(); // only work in pendular way
    deblockCircularwi(); // only work in circular way
  }   

  print (" ENDformerKeyCopposite " );   print (" BeforeOscillatorMoving ");    println ( OldoscillatorMoving );
  print (" OldoscillatorMoving ");       println ( oldOscillatorMoving[OldoscillatorMoving]); 
  print (" BeginINToscillatorMoving ");    println ( oscillatorMoving );  print (" BOOLoscillatorMoving ");    println ( OscillatorMoving[oscillatorMoving] );
  print (" BOOLOldoscillatorMoving ");   println ( oldOscillatorMoving[oscillatorMoving] );

  if (circularMov==false ) {
    for (int j = 0; j < (networkSize-0); j++) {
      metroOldPhase[j]= (metroPhase[j]);
    }
  }
}
//upstairwi;

void formerKeyC(int oscillatorMoving, int OldoscillatorMoving, float phaseDecay) {   // based on i$ 6, 5, 4 ...,  2, 11

  print (" phaseDecay ");  
  print (phaseDecay);
  print (" phaseDecay5 ");  
  print (PhaseDecay[5]); 
  float PhaseDecayBis=phaseDecay*QUARTER_PI/8; // if K=8 --> PhaseDecay=HALF_PI    /// QUARTER_PI/8 if K=8 --> PhaseDecay=HALF_PI/2
  int PhaseDecayMapped = (int)  map (PhaseDecayBis, 0, HALF_PI, 0, 800);
  print (" PhaseDecay ");
  print (PhaseDecay);  
  print (" PhaseDecayMapped ");
  print (PhaseDecayMapped);
  print (" oldMemoryi ");  
  print (oldMemoryi );
  print (" memoryi ");  
  println ( memoryi );

  if ( metroPhase[memoryi]<=0 &&  metroPhase[memoryi]>=-PI ) {
    factorWay[memoryi]=true;
    print ("  factorWay "); 
    print (memoryi);  
    print (" "); 
    print (factorWay[memoryi]);
  } else factorWay[memoryi]=false;  // memoryi is on the part right  

  if ( metroPhase[oldMemoryi]<=0 &&  metroPhase[oldMemoryi]>=-PI) {
    factorWay[oldMemoryi]=true;
  } else factorWay[oldMemoryi]=false; 

  print ("  factorWayO "); 
  print (oldMemoryi);  
  print (" "); 
  print (factorWay[oldMemoryi]);     
  print ("  factorWayM "); 
  print (memoryi);  
  print (" "); 
  print (factorWay[memoryi]);     

  for (int j = 0; j < networkSize; j++) {

    if ((metroOldPhase[j] <= PI && metroOldPhase[j] >= 0 &&  metroPhase[j] <= metroOldPhase[j] )||   //CCW
      (metroOldPhase[j] >= -PI && metroOldPhase[j] <= 0 &&  metroPhase[j] <= metroOldPhase[j] )) {
      clockWay[j]= false;
    }
    if ((metroOldPhase[j] >= -PI && metroOldPhase[j] <= 0 &&  metroPhase[j]<=0 &&  metroPhase[j] >= metroOldPhase[j] )||
      (metroOldPhase[j] <= PI  && metroOldPhase[j] >= 0 &&  metroPhase[j]>=0 &&  metroPhase[j] >= metroOldPhase[j] )) { 
      clockWay[j]= true;
    }
    //*     PhaseDecay[j]=factorWay[j]*phaseDecay*QUARTER_PI/2;
    PhaseDecay[j]= phaseDecay*QUARTER_PI/16;    // specif decay used in deblock
  }

  //**    PhaseDecay[memoryi]=factorWay[memoryi]*phaseDecay*QUARTER_PI/2;
  print ("  clockWay "); 
  print (memoryi);  
  print (" "); 
  println ( clockWay[memoryi]);
  print ("  clockWayOld "); 
  print (oldMemoryi);  
  print (" "); 
  println ( clockWay[oldMemoryi]);
  // print ("  clockWaySuiv "); print (memoryi+1);  print (" "); println ( clockWay[memoryi+1]);

  deblockPendulari(); // only work in pendular way
  deblockCirculari(); // only work in pendular way

  if ( memoryi<=networkSize-0  ) {  // oldMemory=memoryi+1; 4<=5 for example

    println (" BEFORE CHRO ");      
    println (  upstairTime );

    //      when you tap x interphase[memoryi] is recorded as metroPhase [memoryi];          
    //     interPhase[memoryi]= metroPhase[memoryi]; do not work
    //      interPhaseCircular[memoryi]= net. phase[oldMemoryi];


    if ( millis()>= upstairTime-10 && net.phase[memoryi]>= interPhase[memoryi]+(PhaseDecay[5]/5)) {


      if ( memoryi>1  && memoryi<networkSize  && net.phase[memoryi]>= interPhase[memoryi]+(PhaseDecay[5]/5)

        //   || ( (TrigmodPos[memoryi]>=0 && TrigmodPos[memoryi]<=0  ) || (  revolution[memoryi]>=0 && revolution[memoryi]<=0  ))  

        ) {


        print (" AFTER  CHRO ");            
        println (upstairTime); 
        upstairTime = millis()+10;

        oldMemoryi=memoryi-1;
        if ( oldMemoryi<=-1) {
          oldMemoryi=networkSize-1;
        }   

        metroPhase[oldMemoryi]= metroPhase [memoryi];// TrigRightTemp[oldMemoryi];

        net.phase[oldMemoryi]=  net.phase [memoryi];

        interPhase[memoryi]=  net.phase[oldMemoryi]; 

        //   key='#'; // do not use interphase[memoryi] from beginning  
        key='e'; //restart test condition
        net.naturalFrequency[memoryi]= 0;

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

        memoryi=(memoryi-1)%networkSize;
        print (" memoryi ");
        println (memoryi);
        if ( memoryi<=-1) {
          memoryi=networkSize-1;
        }

        oscillatorMoving=memoryi;
        memoryi=oscillatorMoving; //print onscreen actual oscillatorMoving
        print ("Next frame  and clock way = true you'll moving to  ");
        println (oscillatorMoving); 
        oldOscillatorMoving[oldMemoryi]= false;
        OscillatorMoving[memoryi]= true;
        key='e';
      }
      print (" ENDupstairi?? " ); 
      print (" END FUNCTION SITUATION " ); 
      print (" END FUNCTION SITUATION " );   
      print (" BeforeOscillatorMoving ");  
      println ( OldoscillatorMoving );
      print (" OldoscillatorMoving ");     
      println ( oldOscillatorMoving[OldoscillatorMoving]);

      print (" BeginINToscillatorMoving ");  
      println ( oscillatorMoving );
      print (" BOOLoscillatorMoving ");  
      println ( OscillatorMoving[oscillatorMoving] );
      print (" BOOLOldoscillatorMoving ");  
      println ( oldOscillatorMoving[oscillatorMoving] );

      if (circularMov==false ) {
        for (int j = 0; j < (networkSize); j++) {
          metroOldPhase[j]= (metroPhase[j]);
        }
      }
    }
  }
}
//upstairw call formerKeyw
void formerKeyCu$(int oscillatorMoving, int OldoscillatorMoving, float phaseDecay) {   // based on u$ 4, 5, 6....

  print (" phaseDecay ");  
  print (phaseDecay);
  print (" phaseDecay5 ");  
  print (PhaseDecay[5]); 
  float PhaseDecayBis=phaseDecay*QUARTER_PI/4; // if K=8 --> PhaseDecay=HALF_PI
  int PhaseDecayMapped = (int)  map (PhaseDecayBis, 0, HALF_PI, 0, 800);
  print (" PhaseDecay ");
  print (PhaseDecay);  
  print (" PhaseDecayMapped ");
  print (PhaseDecayMapped);
  print (" oldMemoryi ");  
  print (oldMemoryi );
  print (" memoryi ");  
  println ( memoryi );

  if ( metroPhase[memoryi]<=0 &&  metroPhase[memoryi]>=-PI ) {
    factorWay[memoryi]=true;
    print ("  factorWay "); 
    print (memoryi);  
    print (" "); 
    print (factorWay[memoryi]);
  } else factorWay[memoryi]=false;  // memoryi is on the part right  

  if ( metroPhase[oldMemoryi]<=0 &&  metroPhase[oldMemoryi]>=-PI) {
    factorWay[oldMemoryi]=true;
  } else factorWay[oldMemoryi]=false; 

  print ("  factorWayO "); 
  print (oldMemoryi);  
  print (" "); 
  print (factorWay[oldMemoryi]);     
  print ("  factorWayM "); 
  print (memoryi);  
  print (" "); 
  print (factorWay[memoryi]);     

  for (int j = 0; j < networkSize; j++) {

    if ((metroOldPhase[j] <= PI && metroOldPhase[j] >= 0 &&  metroPhase[j] <= metroOldPhase[j] )||   //CCW
      (metroOldPhase[j] >= -PI && metroOldPhase[j] <= 0 &&  metroPhase[j] <= metroOldPhase[j] )) {
      clockWay[j]= false;
    }
    if ((metroOldPhase[j] >= -PI && metroOldPhase[j] <= 0 &&  metroPhase[j]<=0 &&  metroPhase[j] >= metroOldPhase[j] )||
      (metroOldPhase[j] <= PI  && metroOldPhase[j] >= 0 &&  metroPhase[j]>=0 &&  metroPhase[j] >= metroOldPhase[j] )) { 
      clockWay[j]= true;
    }
    //*     PhaseDecay[j]=factorWay[j]*phaseDecay*QUARTER_PI/2;
    PhaseDecay[j]= phaseDecay*QUARTER_PI/16;    // specif decay used in deblock
  }

  //**    PhaseDecay[memoryi]=factorWay[memoryi]*phaseDecay*QUARTER_PI/2;
  print ("  clockWay "); 
  print (memoryi);  
  print (" "); 
  println ( clockWay[memoryi]);
  print ("  clockWayOld "); 
  print (oldMemoryi);  
  print (" "); 
  println ( clockWay[oldMemoryi]);
  // print ("  clockWaySuiv "); print (memoryi+1);  print (" "); println ( clockWay[memoryi+1]);

  deblockPendularu();
  deblockCircularu();

  if ( memoryi<=net.size()-0  ) {  // oldMemory=memoryi+1; 4<=5 for example

    println (" BEFORE CHRO ");      
    println (  upstairTime );

    //      when you tap x interphase[memoryi] is recorded as metroPhase [memoryi];          
    //     interPhase[memoryi]= metroPhase[memoryi]; do not work
    //      interPhaseCircular[memoryi]= net. phase[oldMemoryi];


    if ( millis()>= upstairTime && net.phase[memoryi]>= interPhase[memoryi]+PhaseDecay[5]) {

      if (memoryi>1  && memoryi<networkSize  && net.phase[memoryi]>= interPhase[memoryi]+PhaseDecay[5]) { //  &&   clockWay[memoryi]== false
        print (" AFTER  CHRO ");            
        println (upstairTime); 
        upstairTime = millis()+10;

        oldMemoryi=(memoryi+1)%networkSize;
        if ( oldMemoryi<=0) {
          oldMemoryi=0;
        }

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

        //   upstairTime = millis() + 500;

        OldoscillatorMoving=memoryi;
        oldMemoryi=OldoscillatorMoving;
        //   oldMemoryi=memoryi;
        memoryi=(memoryi+1)%12;
        print (" memoryi ");
        println (memoryi);
        if ( memoryi<=0) {
          memoryi=0;
        }

        oscillatorMoving=memoryi;
        memoryi=oscillatorMoving; //print onscreen actual oscillatorMoving
        print ("Next frame  and clock way = true you'll moving to  ");
        println (oscillatorMoving); 
        oldOscillatorMoving[oldMemoryi]= false;
        OscillatorMoving[memoryi]= true;
        key='e';
      }
    }
  } 
  // deblockPendular();
  print (" END FUNCTION SITUATION " ); 
  print (" END FUNCTION SITUATION " ); 
  print (" END FUNCTION SITUATION " );   
  print (" BeforeOscillatorMoving ");  
  println ( OldoscillatorMoving );
  print (" OldoscillatorMoving ");     
  println ( oldOscillatorMoving[OldoscillatorMoving]);

  print (" BeginINToscillatorMoving ");  
  println ( oscillatorMoving );
  print (" BOOLoscillatorMoving ");  
  println ( OscillatorMoving[oscillatorMoving] );
  print (" BOOLOldoscillatorMoving ");  
  println ( oldOscillatorMoving[oscillatorMoving] );

  if (circularMov==false ) {
    for (int j = 0; j < (net.size()-0); j++) {
      metroOldPhase[j]= (metroPhase[j]);
    }
  }
} 

//  upstairx Trig normally formerKeyCTRUE

void formerKeyCTRUE(int oscillatorMoving, int OldoscillatorMoving, float phaseDecay) { 
  // netOldPhaseToMetroPhase();
  println (" Shift with C.  Oscillator <- one by one by keeping last position switched "); // based on u$
  for (int j = 11; j > 1; j--) {

    print (" m "); 
    print(j); 
    print ("  ");  
    print ( (metroPhase[j]));// -PI to PI
    print (" o "); 
    print(j); 
    print ("  ");  
    println ( (metroOldPhase[j]));// -PI to PI  
    //    metroOldPhase[j]=abs (metroPhase[j]);
    metroOldPhase[j]= (metroPhase[j]);
  }
  print (" phaseDecay ");  
  print (phaseDecay);
  float PhaseDecay; // TAKE OFF if you want to use several different decay with [] and not just one float
  PhaseDecay=phaseDecay*QUARTER_PI/2;  
  print (" PhaseDecay ");
  println (PhaseDecay);
  print (" BEGIN OF FUNCTION ");  
  print (" BEGIN OF FUNCTION ");  
  print (" oldMemoryi ");  
  print (oldMemoryi ); 
  println (" memoryi ");  
  print ( memoryi ); 
  print (" OLDOscillatorMoving ");  
  println ( OldoscillatorMoving );
  print (" OLDBOOOLDLoscillatorMoving ");     
  print ( oldOscillatorMoving[OldoscillatorMoving]);   
  print (" oscillatorMoving ");  
  println ( oscillatorMoving );
  print (" BOOLoscillatorMoving ");  
  print ( OscillatorMoving[oscillatorMoving] ); 
  print (" BOOLOLD "); 
  println (" oscillatorMoving ");  
  print ( oscillatorMoving ); 
  print ("  ");
  println ( oldOscillatorMoving[oscillatorMoving] ); //     print (" BeforeOscillatorMoving ");  print ( OldoscillatorMoving ); print (" BeginINToscillatorMoving ");  println ( oscillatorMoving ); print ("formerFormerKey c?  ");  println (char (formerFormerKey));
  print ("circularMov  ");  
  println (circularMov);
  if (circularMov==false) {
    print ("PendularOldOldOldLeftVirtualPosition "); 
    print ("mem "); 
    print (memoryi); 
    print (" ");   
    print(PendularOldOldOldLeftVirtualPosition[memoryi]);
    print ("PendularOldOldLeftVirtualPosition ");
    print ("mem "); 
    print (memoryi);
    print (" ");   
    print(PendularOldOldLeftVirtualPosition[memoryi]);
    print ("PendularOldLeftVirtualPosition "); 
    print ("mem "); 
    print (memoryi); 
    print (" ");   
    print(PendularOldLeftVirtualPosition[memoryi]);
    print ("PendularLeftVirtualPosition "); 
    print ("mem "); 
    print (memoryi); 
    print (" ");  
    println (PendularLeftVirtualPosition[memoryi]);       
    print ("PendularLeftVirtualPosition ");
    print ("old "); 
    print (oldMemoryi);
    print (" ");   
    println (PendularLeftVirtualPosition[oldMemoryi]);
  }

  if (circularMov==true ) {
    for (int i = 2; i < (net.size()-0); i++) {   
      print ("PendularLeftVirtualPosition "); 
      print (i); 
      print (" ");   
      print (PendularLeftVirtualPosition[i]); 
      print ("CircularVirtualPosition "); 
      print (i); 
      print (" ");   
      println (CircularVirtualPosition[i]);
    }
  } 
  // deblockPendular();
  // 2 from 11 
  print (" A Time is && upstairShifting is "); 
  print (millis());     
  print (" memory "); 
  print (memoryi);  
  print (upstairShifting[memoryi]);
  print (" oldMemory "); 
  print (oldMemoryi);  
  println (upstairShifting[oldMemoryi]);

  //******NO INTERST
  if ( 
    (((PendularOldLeftVirtualPosition[memoryi] <= PendularLeftVirtualPosition[oldMemoryi]) && (PendularLeftVirtualPosition[memoryi] > PendularLeftVirtualPosition[oldMemoryi]) && (PendularOldLeftVirtualPosition[memoryi] < PendularLeftVirtualPosition[memoryi])) ||
    ((PendularOldLeftVirtualPosition[memoryi] >= PendularLeftVirtualPosition[oldMemoryi]) && (PendularLeftVirtualPosition[memoryi] < PendularLeftVirtualPosition[oldMemoryi]) && (PendularOldLeftVirtualPosition[memoryi] > PendularLeftVirtualPosition[memoryi])) ||
    ((PendularOldLeftVirtualPosition[memoryi]%6400 >= 6300 &&  (PendularLeftVirtualPosition[memoryi]%6400 <=  PendularOldLeftVirtualPosition[memoryi]%6400 ) && // you turn on cw
    (PendularLeftVirtualPosition[oldMemoryi]%6400 >= 0 && PendularOldLeftVirtualPosition[oldMemoryi]%6400 <= 100))))
    ) {
  } 
  //******NO INTERST  

  if ( memoryi<net.size()-1) {
    if ( ( millis()>1) && // upstairTime go down    10 to 9; 9 to 8 so old is 10 then 9 and memoryi 8 then 7

      (((PendularOldLeftVirtualPosition[memoryi] <= PendularLeftVirtualPosition[oldMemoryi]) && (PendularLeftVirtualPosition[memoryi] > PendularLeftVirtualPosition[oldMemoryi]) && (PendularOldLeftVirtualPosition[memoryi] < PendularLeftVirtualPosition[memoryi])) ||
      ((PendularOldLeftVirtualPosition[memoryi] >= PendularLeftVirtualPosition[oldMemoryi]) && (PendularLeftVirtualPosition[memoryi] < PendularLeftVirtualPosition[oldMemoryi]) && (PendularOldLeftVirtualPosition[memoryi] > PendularLeftVirtualPosition[memoryi])) ||
      ((PendularOldLeftVirtualPosition[memoryi]%6400 >= 6300 &&  (PendularLeftVirtualPosition[memoryi]%6400 <=  PendularOldLeftVirtualPosition[memoryi]%6400 ) && // you turn on cw
      (PendularLeftVirtualPosition[oldMemoryi]%6400 >= 0 && PendularOldLeftVirtualPosition[oldMemoryi]%6400 <= 100))))
      ) {  
      if (memoryi>2 ) {//&& OscillatorMoving[oldMemoryi]== false
        timeTrigged[memoryi]=millis();
        LasttimeTrigged[memoryi] =  timeTrigged[memoryi]-timeTrigged[oldMemoryi];
        interPosition[0] =   metroPhase[memoryi]- metroPhase[oldMemoryi];
        interPosition[1] =   net.oldPhase[memoryi]- net.oldPhase[oldMemoryi];
        print ( "interpositionMETRO " ) ; 
        print (0);  
        print ( " " ) ; 
        println (map  ((interPosition[0]/TWO_PI*360), 0, 360, 0, 1600));
        print ( "interpositionPHASE " ) ; 
        print (1);  
        print ( " " ) ; 
        println (map  ((interPosition[1]/TWO_PI*360), 0, 360, 0, 1600));

        interPosition[2] =   abs (metroPhase[memoryi]) - abs (metroPhase[oldMemoryi]);
        interPosition[3] =  abs (  net.oldPhase[memoryi]- net.oldPhase[oldMemoryi] ) ;
        print ( "ABSinterposition" ) ; 
        print (2);  
        print ( " " ) ; 
        println (map  ((interPosition[2]/TWO_PI*360), 0, 360, 0, 1600));
        print ( "ABSinterposition" ) ; 
        print (3);  
        print ( " " ) ; 
        println (map  ((interPosition[3]/TWO_PI*360), 0, 360, 0, 1600));

        print ( "PhaseDecay" ) ; 
        print (memoryi);  
        print ( " " ) ;
        println (map ((PhaseDecay/TWO_PI*360), 0, 360, 0, 1600)); // 45 degre = 400 points
        //  lastTimeTrigged

        print ( "timeTrigged" ) ; 
        print (memoryi);  
        print ( " " ) ;
        println ( timeTrigged[memoryi]);
        print ( "timeTrigged" ) ; 
        print (oldMemoryi);  
        print ( " " ) ;
        println ( timeTrigged[oldMemoryi]);
        print ( "LasttimeTrigged" ) ; 
        print (memoryi);  
        print ( " " ) ;
        println ( LasttimeTrigged[memoryi]);
        print ( "LasttimeTrigged" ) ; 
        print (oldMemoryi);  
        print ( " " ) ;
        println ( LasttimeTrigged[oldMemoryi]);
        //  lastTimeTrigged
        if (LasttimeTrigged[memoryi]>= TimeTrigged ) { 

          //  TimeTrigged= millis() +200;
          TimeTrigged= 0;
          // timeTrigged[memoryi]= millis() +200;
          print ( "  OSCILLATOR 3 to 10 "); 
          print ( "  lastTimeTrigged "); 
          print (lastTimeTrigged);
          print ( "  TimeTrigged "); 
          print (TimeTrigged);
          print ( "  Actual "); 
          println (millis());
          key='e'; 


          metroPhase[1]=metroPhase[0];
          oldMemoryi=memoryi;


          metroPhase[memoryi-1]= metroPhase[memoryi];  // l'oscillateur suivant se met à la position de l'oscillateur actuelle
          //**   metroPhase[memoryi-1]= metroPhase[memoryi]+PhaseDecay;
          //**   metroPhase[memoryi-1]= metroPhase[memoryi-1]%TWO_PI;
          metroPhase[memoryi]= metroPhase[memoryi+1]+PhaseDecay*1;//      l'oscillateur actuelle se met à la position de l'oscillateur precedent + un decalahe de phase en CW
          metroPhase[memoryi]= metroPhase[memoryi]%PI; // si on ajoute la phasedecay, il faut qu'il reste en -pi et pi
          net.naturalFrequency[memoryi-1]= net.naturalFrequency[memoryi]; // l'oscillateur suivant  va à la vitesse de l'oscillateur actuelle
          net.naturalFrequency[memoryi]= net.naturalFrequency[memoryi+1]; //  l'oscillateur actuelle  va à la vitesse de l'oscillateur precedent

          OldoscillatorMoving=oldMemoryi;
          oldMemoryi=OldoscillatorMoving;
          print ("you were still here "); 
          println (oldMemoryi);
          oscillatorMoving=memoryi-1;
          memoryi=oscillatorMoving; //print onscreen actual oscillatorMoving
          print ("Next frame are different memory here? ");
          println (oscillatorMoving);

          bg = rcolor();


          oldOscillatorMoving[oldMemoryi]= false;
          OscillatorMoving[memoryi]= true;


          lastTimeTrigged= TimeTrigged;
          //  lastTimeTrigged= timeTrigged[memoryi];

          //  key='+';
        }
      }
    }
  }  
  // 11 from 2
  if ((PendularOldLeftVirtualPosition[2] <= PendularLeftVirtualPosition[oldMemoryi]) && (PendularLeftVirtualPosition[2] > PendularLeftVirtualPosition[oldMemoryi])  && (PendularOldLeftVirtualPosition[2] < PendularLeftVirtualPosition[2])||
    (PendularOldLeftVirtualPosition[2] >= PendularLeftVirtualPosition[oldMemoryi]) && (PendularLeftVirtualPosition[2] < PendularLeftVirtualPosition[oldMemoryi])  && (PendularOldLeftVirtualPosition[2] > PendularLeftVirtualPosition[2])||
    ((PendularOldLeftVirtualPosition[2] >= 6300 &&  (PendularLeftVirtualPosition[2] <=  PendularOldLeftVirtualPosition[2] ) && // you turn on cw
    (PendularLeftVirtualPosition[oldMemoryi] >= 0 && PendularOldLeftVirtualPosition[oldMemoryi] <= 100)))
    ) { 

    if (memoryi>1 && memoryi<3 ) {

      if (LasttimeTrigged[memoryi]>= TimeTrigged ) { 

        //  TimeTrigged= millis() +200;
        TimeTrigged= 0;
        // timeTrigged[memoryi]= millis() +200;
        print ( " OSCILLATOR 11 from 2  "); 
        print ( "  lastTimeTrigged "); 
        println (lastTimeTrigged);
        print ( "  TimeTrigged "); 
        println (TimeTrigged);
        print ( " Actual "); 
        println (millis());
        key='e'; 



        metroPhase[1]=metroPhase[0];
        print ("memoryi upstairx = 2? ");
        print (memoryi);
        //***     metroPhase[memoryi-1]= metroPhase[memoryi];
        //**    metroPhase[net.size()-1]= metroPhase[2]+PhaseDecay;
        //***   metroPhase[net.size()-1]= metroPhase[11]%TWO_PI;
        //    metroPhase[2]= metroPhase[11]+PhaseDecay*1;
        //      metroPhase[2]= metroPhase[2]%TWO_PI;

        metroPhase[11]= metroPhase[2];
        net.naturalFrequency[11]= net.naturalFrequency[2];
        //***      metroPhase[2]= metroPhase[1];

        //    metroPhase[2]= metroPhase[1]+PhaseDecay;
        //    metroPhase[2]= metroPhase[2]%TWO_PI;

        metroPhase[2]= metroPhase[3]+PhaseDecay;
        metroPhase[2]= metroPhase[2]%PI;

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
        //  key='f';
      }
    }
  } 

  //  deblockPendular();
  // 11 from 2 ou le contraire
  if ( memoryi>=net.size()-1 ) {


    if ((PendularOldLeftVirtualPosition[memoryi] <= PendularLeftVirtualPosition[2]) && (PendularLeftVirtualPosition[memoryi] > PendularLeftVirtualPosition[2]) && (PendularOldLeftVirtualPosition[memoryi] < PendularLeftVirtualPosition[memoryi]) ||
      (PendularOldLeftVirtualPosition[memoryi] >= PendularLeftVirtualPosition[2]) && (PendularLeftVirtualPosition[memoryi] < PendularLeftVirtualPosition[2]) && (PendularOldLeftVirtualPosition[memoryi] > PendularLeftVirtualPosition[memoryi]) ||
      (PendularOldLeftVirtualPosition[memoryi] >= 3200 &&  (PendularLeftVirtualPosition[memoryi] <=  PendularOldLeftVirtualPosition[memoryi] ) && // you turn on cw
      (PendularLeftVirtualPosition[2] >= 0 && PendularOldLeftVirtualPosition[2] <= 3200))
      ) { 

      if (LasttimeTrigged[memoryi]>= TimeTrigged ) { 

        //  TimeTrigged= millis() +200;
        TimeTrigged= 0;
        // timeTrigged[memoryi]= millis() +200;
        print ( " OSCILLATOR 2 from 11  "); 
        print ( "  lastTimeTrigged "); 
        println (lastTimeTrigged);
        print ( "  TimeTrigged "); 
        println (TimeTrigged);
        print ( " Actual "); 
        println (millis());
        key='e'; 



        metroPhase[1]=metroPhase[0];
        print ("memoryi upstairx = 11? ");
        print (memoryi);
        oldMemoryi=memoryi;

        metroPhase[memoryi-1]= metroPhase[memoryi]; //phase 10= phase 11
        //**      metroPhase[memoryi-1]= metroPhase[memoryi]+PhaseDecay;
        //***      metroPhase[memoryi-1]= metroPhase[memoryi-1]%TWO_PI;
        net.naturalFrequency[memoryi-1]= net.naturalFrequency[memoryi];
        metroPhase[memoryi]= metroPhase[2]+PhaseDecay*1; // what it has been changed with formerkeyc
        metroPhase[memoryi]= metroPhase[memoryi]%PI; // what it has been changed with formerkeyc
        net.naturalFrequency[memoryi]=net.naturalFrequency[2];
        // ***   oldMemoryi=memoryi;
        OldoscillatorMoving=oldMemoryi;     
        oscillatorMoving=10 ;
        memoryi=oscillatorMoving; //print onscreen actual oscillatorMoving   
        print ("Next frame oscillator Moving will be 10 ?");      
        println (oscillatorMoving); 
        print (" "); 
        println (memoryi);         
        oldOscillatorMoving[oldMemoryi]= false;
        OscillatorMoving[memoryi]= true;


        //    lastTimeTrigged= timeTrigged[memoryi];
        //    TimeTrigged= millis ();
      }
    }
  }


  if (circularMov==true ) {
    for (int i = 0; i < (net.size()-0); i++) {  
      PendularLeftVirtualPosition[i]= CircularVirtualPosition[i];
      PendularOldLeftVirtualPosition[i]= CircularOldVirtualPosition[i];
    }
    print (" AFTER OLD PendularLeftVirtualPosition "); 
    print (oldMemoryi); 
    print (" ");   
    print (PendularLeftVirtualPosition[oldMemoryi]); 
    print ("CircularVirtualPosition "); 
    print (oldMemoryi); 
    print (" ");   
    println (CircularVirtualPosition[oldMemoryi]);

    print (" AFTER PendularLeftVirtualPosition "); 
    print (memoryi); 
    print (" ");   
    print (PendularLeftVirtualPosition[memoryi]); 
    print ("CircularVirtualPosition "); 
    print (memoryi); 
    print (" ");   
    println (CircularVirtualPosition[memoryi]);
  }  
  print (" ENDUPSTAIRX ");   
  print (" oldMemoryi ");  
  print (oldMemoryi ); 
  println (" memoryi ");  
  println ( memoryi );
  print (" OLDOscillatorMoving ");  
  println ( OldoscillatorMoving );
  print (" OLDBOOOLDLoscillatorMoving ");     
  println ( oldOscillatorMoving[OldoscillatorMoving]);   
  print (" oscillatorMoving ");  
  println ( oscillatorMoving );
  print (" BOOLoscillatorMoving ");  
  println ( OscillatorMoving[oscillatorMoving] );
  print (" BOOLOLD "); 
  println (" oscillatorMoving ");  
  println ( oscillatorMoving ); 
  println ("  "); 
  println ( oldOscillatorMoving[oscillatorMoving] );
}




void formerKeyCoriginal(int oscillatorMoving, int OldoscillatorMoving, float phaseDecay) {     
  println (" Shift with C.  Oscillator <- one by one by keeping last position switched "); // based on u$
  print (" phaseDecay ");  
  print (phaseDecay);
  float PhaseDecay=phaseDecay*QUARTER_PI/2;
  print (" PhaseDecay ");
  print (PhaseDecay);
  print (" oldMemoryi ");  
  print (oldMemoryi );
  print (" memoryi ");  
  println ( memoryi );
  print (" BeforeOscillatorMoving ");  
  print ( OldoscillatorMoving );
  print (" BeginINToscillatorMoving ");  
  println ( oscillatorMoving );  
  print ("formerFormerKey c?  ");  
  println (char (formerFormerKey));
  print ("circularMov  ");  
  println (circularMov);
  if (circularMov==true ) {
    for (int i = 0; i < (net.size()-1); i++) {  
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
      println (CircularVirtualPosition[i]);
    }
  }  
  if ( memoryi>=net.size()-1) {
    if ((PendularOldLeftVirtualPosition[memoryi] <= PendularLeftVirtualPosition[2]) && (PendularLeftVirtualPosition[memoryi] > PendularLeftVirtualPosition[2]) && (PendularOldLeftVirtualPosition[memoryi] < PendularLeftVirtualPosition[memoryi]) ||
      (PendularOldLeftVirtualPosition[memoryi] >= PendularLeftVirtualPosition[2]) && (PendularLeftVirtualPosition[memoryi] < PendularLeftVirtualPosition[2]) && (PendularOldLeftVirtualPosition[memoryi] > PendularLeftVirtualPosition[memoryi])
      ) { 
      print ("memoryi upstairx = 11? ");
      print (memoryi);
      metroPhase[memoryi-1]= metroPhase[memoryi]+PhaseDecay;
      metroPhase[memoryi-1]= metroPhase[memoryi-1]%TWO_PI;
      net.naturalFrequency[memoryi-1]= net.naturalFrequency[memoryi];
      metroPhase[memoryi]= metroPhase[2]+PhaseDecay;
      metroPhase[memoryi]= metroPhase[memoryi]%TWO_PI;
      net.naturalFrequency[memoryi]=net.naturalFrequency[2];
      oldMemoryi=memoryi;
      OldoscillatorMoving=oldMemoryi;     
      oscillatorMoving=memoryi-1 ;
      memoryi=oscillatorMoving; //print onscreen actual oscillatorMoving      
      println (oscillatorMoving); 
      print (" "); 
      println (memoryi);         
      oldOscillatorMoving[oldMemoryi]= false;
      OscillatorMoving[memoryi]= true;
      key='&';
    }
  }  
  if ( memoryi<net.size()-1) {
    if ((PendularOldLeftVirtualPosition[memoryi] <= PendularLeftVirtualPosition[memoryi+1]) && (PendularLeftVirtualPosition[memoryi] > PendularLeftVirtualPosition[memoryi+1]) && (PendularOldLeftVirtualPosition[memoryi] < PendularLeftVirtualPosition[memoryi]) ||
      (PendularOldLeftVirtualPosition[memoryi] >= PendularLeftVirtualPosition[memoryi+1]) && (PendularLeftVirtualPosition[memoryi] < PendularLeftVirtualPosition[memoryi+1]) && (PendularOldLeftVirtualPosition[memoryi] > PendularLeftVirtualPosition[memoryi])
      ) {  
      if (memoryi>2 ) {
        metroPhase[1]=metroPhase[0];
        print ("you were here: ");
        oldMemoryi=memoryi;
        print (oldMemoryi); 

        metroPhase[memoryi-1]= metroPhase[memoryi]+PhaseDecay;
        metroPhase[memoryi-1]= metroPhase[memoryi-1]%TWO_PI;
        metroPhase[memoryi]= metroPhase[memoryi+1]+PhaseDecay;//      
        metroPhase[memoryi]= metroPhase[memoryi]%TWO_PI;
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
    }
  }

  if ((PendularOldLeftVirtualPosition[2] <= PendularLeftVirtualPosition[11]) && (PendularLeftVirtualPosition[2] > PendularLeftVirtualPosition[11])  && (PendularOldLeftVirtualPosition[2] < PendularLeftVirtualPosition[2])||
    (PendularOldLeftVirtualPosition[2] >= PendularLeftVirtualPosition[11]) && (PendularLeftVirtualPosition[2] < PendularLeftVirtualPosition[11])  && (PendularOldLeftVirtualPosition[2] > PendularLeftVirtualPosition[2])
    ) { 
    print ("memoryi upstairx = 2? ");
    print (memoryi);

    metroPhase[net.size()-1]= metroPhase[2]+PhaseDecay;
    metroPhase[net.size()-1]= metroPhase[11]%TWO_PI;     
    metroPhase[2]= metroPhase[11]+PhaseDecay;
    metroPhase[2]= metroPhase[2]%TWO_PI;
    net.naturalFrequency[net.size()-1]= net.naturalFrequency[2];
    net.naturalFrequency[2]=net.naturalFrequency[1];
    oldMemoryi=2;     
    oldMemoryi=OldoscillatorMoving;      
    oscillatorMoving=net.size()-1 ;
    memoryi=oscillatorMoving; //print onscreen actual oscillatorMoving
    println (oscillatorMoving); 
    print (" "); 
    println (memoryi);          
    oldOscillatorMoving[oldMemoryi]= false;
    OscillatorMoving[memoryi]= true;      
    key='&';
  }
  print (" END OF FUNCTION ");  
  print (" END OF FUNCTION ");  
  print (" oldMemoryi ");  
  print (oldMemoryi );
  print (" memoryi ");  
  println ( memoryi );
  print (" BeforeOscillatorMoving ");  
  println ( OldoscillatorMoving );
  print (" OldoscillatorMoving ");     
  println ( oldOscillatorMoving[OldoscillatorMoving]);   
  print (" BeginINToscillatorMoving ");  
  println ( oscillatorMoving );
  print (" BOOLoscillatorMoving ");  
  println ( OscillatorMoving[oscillatorMoving] );
  print (" BOOLOldoscillatorMoving ");  
  println ( oldOscillatorMoving[oscillatorMoving] );

  if (circularMov==true ) {
    for (int i = 0; i < (net.size()-1); i++) {  
      PendularLeftVirtualPosition[i]= CircularVirtualPosition[i];
      PendularOldLeftVirtualPosition[i]= CircularOldVirtualPosition[i];
      PendularLeftVirtualPosition[i+1]= CircularVirtualPosition[i+1];
      PendularOldLeftVirtualPosition[i+1]= CircularOldVirtualPosition[i+1];
      print (" AFTER PendularLeftVirtualPosition "); 
      print (i); 
      print (" ");   
      print (PendularLeftVirtualPosition[i]); 
      print ("CircularVirtualPosition "); 
      print (i); 
      print (" ");   
      println (CircularVirtualPosition[i]);
    }
  }
} 

void formerKeyc(int oscillatorMoving, int OldoscillatorMoving) { 

  print (" oldMemoryi ");  
  print (oldMemoryi );
  print (" memoryi ");  
  println ( memoryi );
  print (" BeforeOscillatorMoving ");  
  print ( OldoscillatorMoving );
  print (" BeginINToscillatorMoving ");  
  println ( oscillatorMoving );  
  print ("formerFormerKey c?  ");  
  println (char (formerFormerKey));
  print ("circularMov  ");  
  println (circularMov);
  if (circularMov==true ) {
    for (int i = 2; i < (net.size()-0); i++) {  
      PendularLeftVirtualPosition[i]= CircularVirtualPosition[i];
      PendularOldLeftVirtualPosition[i]= CircularOldVirtualPosition[i];

      print ("PendularLeftVirtualPosition "); 
      print (i); 
      print (" ");   
      print (PendularLeftVirtualPosition[i]); 
      print ("CircularVirtualPosition "); 
      print (i); 
      print (" ");   
      println (CircularVirtualPosition[i]);
    }
  }  
  if ( memoryi>=net.size()-1) {
    println (" Shift  Oscillator <- one by one by keeping last position switched "); // based on u$
    if ((PendularOldLeftVirtualPosition[memoryi] <= PendularLeftVirtualPosition[2]) && (PendularLeftVirtualPosition[memoryi] > PendularLeftVirtualPosition[2]) && (PendularOldLeftVirtualPosition[memoryi] < PendularLeftVirtualPosition[memoryi]) ||
      (PendularOldLeftVirtualPosition[memoryi] >= PendularLeftVirtualPosition[2]) && (PendularLeftVirtualPosition[memoryi] < PendularLeftVirtualPosition[2]) && (PendularOldLeftVirtualPosition[memoryi] > PendularLeftVirtualPosition[memoryi])
      ) { 

      print ("memoryi actuelle = 11? ");
      print (memoryi);
      metroPhase[memoryi-1]= metroPhase[memoryi];
      net.naturalFrequency[memoryi-1]= net.naturalFrequency[memoryi];
      metroPhase[memoryi]= metroPhase[2];
      net.naturalFrequency[memoryi]=net.naturalFrequency[2];
      oldMemoryi=memoryi;
      OldoscillatorMoving=oldMemoryi;     
      oscillatorMoving=memoryi-1 ;
      memoryi=oscillatorMoving; //
      print ("onscreen actual oscillatorMoving ");      
      println (oscillatorMoving); 
      print (" "); 
      println (memoryi);         
      oldOscillatorMoving[oldMemoryi]= false;
      OscillatorMoving[memoryi]= true;
      key='&';
    }
  }

  if ( memoryi<net.size()-1) {

    if ((PendularOldLeftVirtualPosition[memoryi] <= PendularLeftVirtualPosition[memoryi+1]) && (PendularLeftVirtualPosition[memoryi] > PendularLeftVirtualPosition[memoryi+1]) && (PendularOldLeftVirtualPosition[memoryi] < PendularLeftVirtualPosition[memoryi]) ||
      (PendularOldLeftVirtualPosition[memoryi] >= PendularLeftVirtualPosition[memoryi+1]) && (PendularLeftVirtualPosition[memoryi] < PendularLeftVirtualPosition[memoryi+1]) && (PendularOldLeftVirtualPosition[memoryi] > PendularLeftVirtualPosition[memoryi])
      ) {  
      if (memoryi>2 ) {
        metroPhase[1]=metroPhase[0];
        print ("you were here: ");
        oldMemoryi=memoryi;
        print (oldMemoryi); 

        metroPhase[memoryi-1]= metroPhase[memoryi];
        metroPhase[memoryi]= metroPhase[memoryi+1];// net.oldPhase[memoryi] keep phase at    
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
    }
  }

  if ((PendularOldLeftVirtualPosition[2] <= PendularLeftVirtualPosition[11]) && (PendularLeftVirtualPosition[2] > PendularLeftVirtualPosition[11])  && (PendularOldLeftVirtualPosition[2] < PendularLeftVirtualPosition[2])||
    (PendularOldLeftVirtualPosition[2] >= PendularLeftVirtualPosition[11]) && (PendularLeftVirtualPosition[2] < PendularLeftVirtualPosition[11])  && (PendularOldLeftVirtualPosition[2] > PendularLeftVirtualPosition[2])
    ) { 
    //        if (   oldOscillatorMoving[2]= true) {
    if (memoryi>1 && memoryi<3 ) {
      print ("memoryi actuelle = 2? ");
      print (memoryi);

      metroPhase[11]= metroPhase[2];
      net.naturalFrequency[11]= net.naturalFrequency[2];
      metroPhase[2]= net.phase[1];
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
    }
  }
  print (" AFTER "); 
  print (" oldMemoryi ");  
  print (oldMemoryi );
  print (" memoryi ");  
  println ( memoryi );
  print (" BeforeOscillatorMoving ");  
  println ( OldoscillatorMoving );
  print (" OldoscillatorMoving ");     
  println ( oldOscillatorMoving[OldoscillatorMoving]);   
  print (" BeginINToscillatorMoving ");  
  println ( oscillatorMoving );
  print (" BOOLoscillatorMoving ");  
  println ( OscillatorMoving[oscillatorMoving] );
  print (" BOOLOldoscillatorMoving ");  
  println ( oldOscillatorMoving[oscillatorMoving] );
} 

void formerKeyI() {  


  print ("char formerFormerKey  ");  
  println (char (formerFormerKey));
  print ("circularMov  ");  
  println (circularMov);
  if (circularMov==true ) {
    for (int i = 0; i < (net.size()-1); i++) {  
      PendularLeftVirtualPosition[i]= CircularVirtualPosition[i];
      PendularOldLeftVirtualPosition[i]= CircularOldVirtualPosition[i];
      PendularLeftVirtualPosition[i+1]= CircularVirtualPosition[i+1];
      PendularOldLeftVirtualPosition[i+1]= CircularOldVirtualPosition[i+1];
      //     print ("PendularLeftVirtualPosition "); print (i); print (" ");   print (PendularLeftVirtualPosition[i]); 
      //     print ("CircularVirtualPosition "); print (i); print (" ");   print (CircularVirtualPosition[i]);
    }
  } 



  println (" void c$  Shift frequencies <- one by one by keeping last position switched and multipied *2"); // based on u$
  for (int i = 2; i < (net.size()-1); i++) {    
    if ((PendularOldLeftVirtualPosition[i]+800 <= PendularLeftVirtualPosition[i+1]+800) && (PendularLeftVirtualPosition[i]+800 > PendularLeftVirtualPosition[i+1]+800)&& (PendularOldLeftVirtualPosition[i]+800 < PendularLeftVirtualPosition[i]+800) ||
      (PendularOldLeftVirtualPosition[i]+800 >= PendularLeftVirtualPosition[i+1]+800) && (PendularLeftVirtualPosition[i]+800 < PendularLeftVirtualPosition[i+1]+800)&& (PendularOldLeftVirtualPosition[i]+800 > PendularLeftVirtualPosition[i]+800)

      ) { //  && (PendularOldLeftVirtualPosition[i]+800 < PendularLeftVirtualPosition[i]+800) 
      //     print ("PendularLeftVirtualPosition "); print (i); print (" ");   print (PendularLeftVirtualPosition[i]); 
      //     print ("CircularVirtualPosition "); print (i); print (" ");   print (CircularVirtualPosition[i]); 
      key='+';     
      net.phase[1]=net.phase[0];
      print ("phase 1  ");  
      print (net.phase[1]);
      if (i==2) {
        //     if (i!=1000){

        println ("i 1 à 10  usefull when you go from behind to the front or inverse");
        net.phase[1]=net.phase[0];
        print ("phase 1  ");  
        print (net.phase[1]);

        //  net.phase[2]=  net.oldPhase[net.size()-1];
        net.naturalFrequency[net.size()-1]=net.naturalFrequency[2]; 
        net.phase[net.size()-1]=net.phase[2];
        OldFrequency[i-0]= net.naturalFrequency[i];
        memoryi=42; //usefull when you go from behind to the front or inverse? c to v?
      } else memoryi=i;
      print ("else memoryi: ");
      print (memoryi); 
      key  = '#'; 
      formerKey = '#';

      print ("PendularLeftVirtualPosition "); 
      print (i); 
      print (" ");   
      print (PendularLeftVirtualPosition[i]); 
      print ("CircularVirtualPosition "); 
      print (i); 
      print (" ");   
      print (CircularVirtualPosition[i]); 
      print ("PendularOldLeftVirtualPosition "); 
      print (i); 
      print (" ");   
      print (PendularOldLeftVirtualPosition[i]); 
      print ("CircularOldVirtualPosition "); 
      print (i); 
      print (" ");   
      print (CircularOldVirtualPosition[i]); 


      print ("PendularLeftVirtualPosition "); 
      print (i); 
      print (" ");   
      print (PendularLeftVirtualPosition[i]);   
      print ("  OldPendularLeftVirtualPosition[i-1] "); 
      print (i-1);  
      print (" ");   
      print (   PendularOldLeftVirtualPosition[i-1]); 
      print (" "); 
      print ("  net.naturalFrequency[i] "); 
      print (i); 
      print (" ");    
      print  (  net.naturalFrequency[i]);    
      print ("  net.naturalFrequency[i-1] "); 
      print (i-1); 
      print (" ");    
      println  (  net.naturalFrequency[i-1]); 

      net.phase[i-1]= net.phase[i];
      net.phase[i]= net.phase[i+1];// net.oldPhase[i] keep phase at    
      net.naturalFrequency[i-1]= net.naturalFrequency[i];
      net.naturalFrequency[i]= net.naturalFrequency[i+1];

      print ("After phase memoryi"); 
      print (11);  
      print ("  ") ;  
      print ( net.phase[11]);  
      print ("  net.naturalFrequency[11] ");   
      print (  net.naturalFrequency[11]);  
      print ("  OldFrequency[11] ");   
      println  (  OldFrequency[11]); 
      print ("   pass Old oscillator  "); 
      print (2);  
      print ("  ") ;  
      print ( net.phase[2]);  
      print ("  net.naturalFrequency[i] ");   
      print  (  net.naturalFrequency[2]);  
      print ("  OldFrequency[2] ");   
      println  (  OldFrequency[2]);  

      print ("memoryi=i ");
      print (memoryi);
      print ("summary?  "); 
      printSummary(i);    
      print ("summaryi-1  "); 
      printSummary(i-1);   

      print ("PendularLeftVirtualPosition "); 
      print (i); 
      print (" ");   
      print (PendularLeftVirtualPosition[i]); 
      print ("CircularVirtualPosition "); 
      print (i); 
      print (" ");   
      print (CircularVirtualPosition[i]); 
      print ("PendularOldLeftVirtualPosition "); 
      print (i); 
      print (" ");   
      print (PendularOldLeftVirtualPosition[i]); 
      print ("CircularOldVirtualPosition "); 
      print (i); 
      print (" ");   
      print (CircularOldVirtualPosition[i]); 


      if (i<11) {
        //    if (memoryi<11){ dont work
      }
      print ("After phase  "); 
      print (11);  
      print ("  ") ;  
      print ( net.phase[11]);  
      print ("  net.naturalFrequency[i] ");   
      println  (  net.naturalFrequency[11]); 
      print ("  OldFrequency[11] ");   
      println  (  OldFrequency[11]); 
      print ("   pass Old oscillator  "); 
      print (2);  
      print ("  ") ;  
      print ( net.phase[2]);  
      print ("  net.naturalFrequency[i] ");   
      println  (  net.naturalFrequency[2]);  
      print ("  OldFrequency[2] ");   
      println  (  OldFrequency[2]);
    }
  }


  // if (memoryi==11||memoryi==42||memoryi==3 ||memoryi==10){

  if (memoryi!=1000) {
    if ((PendularOldLeftVirtualPosition[11]+800 <= PendularLeftVirtualPosition[10]+800) && (PendularLeftVirtualPosition[11]+800 > PendularLeftVirtualPosition[10]+800)  && (PendularOldLeftVirtualPosition[11]+800 < PendularLeftVirtualPosition[11]+800)||
      (PendularOldLeftVirtualPosition[11]+800 >= PendularLeftVirtualPosition[10]+800) && (PendularLeftVirtualPosition[11]+800 < PendularLeftVirtualPosition[10]+800)  && (PendularOldLeftVirtualPosition[11]+800 > PendularLeftVirtualPosition[11]+800)
      ) { 
      key='#'; 

      print ("memoryi!=1000 ");
      print (memoryi);
      print ("summary11  "); 
      printSummary(11);    
      print ("summaryi10  "); 
      printSummary(10);   

      print ("before i+1==11   pass Old oscillator  "); 
      print (11);  
      print ("  ") ;  
      print ( net.phase[11]);  
      print ("  net.naturalFrequency[i] ");   
      println  (  net.naturalFrequency[11]); 
      print ("  OldFrequency[11] ");   
      println  (  OldFrequency[11]); 
      print ("   pass Old oscillator+1  "); 
      print (2);  
      print ("  ") ;  
      print ( net.phase[2]);  
      print ("  net.naturalFrequency[i] ");   
      println  (  net.naturalFrequency[2]);  
      print ("  OldFrequency[2] ");   
      println  (  OldFrequency[2]);  
      net.phase[10]= net.phase[11];
      net.naturalFrequency[10]= net.naturalFrequency[11];
      ///  net.naturalFrequency[10]=OldFrequency[11];
      net.phase[11]= net.phase[2];
      net.naturalFrequency[11]=net.naturalFrequency[2];
      //  net.naturalFrequency[11]=OldFrequency[2];

      //   memoryi=42;
      print ("after memoryi!=1000  pass Old oscillator  "); 
      print (11);  
      print ("  ") ;  
      print ( net.phase[11]);  
      print ("  net.naturalFrequency[11] ");   
      println  (  net.naturalFrequency[11]); 
      print ("   pass Old oscillator+1  "); 
      print (2);  
      print ("  ") ;  
      print ( net.phase[2]);  
      print ("  net.naturalFrequency[i] ");   
      println  (  net.naturalFrequency[2]);  

      print ("PendularLeftVirtualPosition "); 
      print (10); 
      print (" ");   
      print (PendularLeftVirtualPosition[10]); 
      print ("CircularVirtualPosition "); 
      print (10); 
      print (" ");   
      print (CircularVirtualPosition[10]); 
      print ("PendularOldLeftVirtualPosition "); 
      print (10); 
      print (" ");   
      print (PendularOldLeftVirtualPosition[10]); 
      print ("CircularOldVirtualPosition "); 
      print (10); 
      print (" ");   
      print (CircularOldVirtualPosition[10]);
    }
  } 


  if (key=='#' || key=='+') {
    //net.shiftFrequencies(-2);
    //net.shiftPhases(-2); 
    //key='#'; keyPressed();
    key='I'; 
    keyReleased();  
    println ("I  Released ");
    key='#'; 
    formerKey='#';//keyPressed();
  }
}



void formerKeyV() { // inspired from  formerKey=='v' with two shift
  //  if (formerKey == 'U') { println ("former v$  Shift frequencies <- one by one by keeping last position switched"); }
  print ("char formerFormerKey V?  ");  
  println (char (formerFormerKey));
  print ("char formerFormerKey v?  ");  
  println (char (formerFormerKey));
  print ("circularMov  ");  
  println (circularMov);
  if (circularMov==true ) {
    for (int i = 0; i < (net.size()-1); i++) {  
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



  for (int i = 2; i < (net.size()-1); i++) {
    if ((PendularOldLeftVirtualPosition[i]+800 <= PendularLeftVirtualPosition[i+1]+800) && (PendularLeftVirtualPosition[i]+800 > PendularLeftVirtualPosition[i+1]+800)&& (PendularOldLeftVirtualPosition[i]+800 < PendularLeftVirtualPosition[i]+800) ||
      (PendularOldLeftVirtualPosition[i]+800 >= PendularLeftVirtualPosition[i+1]+800) && (PendularLeftVirtualPosition[i]+800 < PendularLeftVirtualPosition[i+1]+800)&& (PendularOldLeftVirtualPosition[i]+800 > PendularLeftVirtualPosition[i]+800)

      ) {
      key='+'; 
      // formerKey = '+' ;   
      //  net.phase[1]=net.phase[0];

      print("pendularOld " ); 
      print (i); 
      print(" " );   
      print (PendularOldLeftVirtualPosition[i]+800); // probleme dscrimination
      print("pendular " ); 
      print (i+1); 
      print(" " );   
      print (PendularOldLeftVirtualPosition[i+1]+800); // probleme dscrimination
      println("pendular i+1 > pendularOld i ? ou dans le sens oppose " );

      //      print("pendularOld" ); print (i); print(" " )   print (PendularOldLeftVirtualPosition[i]+800); // probleme dscrimination
      //      print("pendular" ); print (i+1); print(" " )   print (PendularOldLeftVirtualPosition[i+1]+800); // probleme dscrimination
      if (i!=i+1) {




        net.phase[0]= net.phase[11];// net.oldPhase[i] keep phase at 0
        net.naturalFrequency[0]= net.naturalFrequency[11];
        net.phase[1]= net.phase[0];// net.oldPhase[i] keep phase at 0
        net.naturalFrequency[1]= net.naturalFrequency[0];


        net.phase[i+1]= net.phase[i];// net.oldPhase[i] keep phase at 0
        net.phase[i]= net.phase[i-1];// net.oldPhase[i] keep phase at 0
        net.naturalFrequency[i+1]= net.naturalFrequency[i];
        net.naturalFrequency[i]= net.naturalFrequency[i-1];
      }       

      memoryi=i;
      println("summary before");
      printSummary(i-1);  
      printSummary(i);  
      printSummary(i+1);  

      if (i==10) {
        println ("é");
        key='é';// go from 10 to 2 (2 is the first oscillator)
        net.phase[2]= net.phase[11];// net.oldPhase[i] keep phase at 0
        net.naturalFrequency[2]= net.naturalFrequency[11];
        net.phase[11]= net.phase[10];// net.oldPhase[i] keep phase at 0
        net.naturalFrequency[11]= net.naturalFrequency[10];
        net.phase[1]= net.phase[0];// net.oldPhase[i] keep phase at 0
        net.naturalFrequency[1]= net.naturalFrequency[0];
        net.phase[0]= net.phase[11];// net.oldPhase[i] keep phase at 0
        net.naturalFrequency[0]= net.naturalFrequency[11];
      } else {
        key='+';
      }

      if (i<1) {// really better than that? if (i<11){
        //if (i<11){
        println ("i 1 à 10  usefull when you go from behind to the front or inverse");
        net.phase[0]=net.phase[1];
        print ("phase 1  ");  
        print (net.phase[1]);

        //  net.phase[2]=  net.oldPhase[net.size()-1];
        //   net.naturalFrequency[net.size()-1]=OldFrequency[2]; 
        net.naturalFrequency[2]=OldFrequency[net.size()-1]; 
        ///  net.phase[net.size()-1]=net.oldPhase[2];
        net.phase[2]=net.oldPhase[net.size()-1];
        OldFrequency[i]= net.naturalFrequency[i];

        println("summary after");
        printSummary(i-1);  
        printSummary(i);  
        printSummary(i+1);
      }
    }
  }   
  if ((PendularOldLeftVirtualPosition[net.size()-1]+800 <= PendularLeftVirtualPosition[2]+800) && (PendularLeftVirtualPosition[net.size()-1]+800 > PendularLeftVirtualPosition[2]+800)&& (PendularOldLeftVirtualPosition[net.size()-1]+800 < PendularLeftVirtualPosition[net.size()-1]+800) ||
    (PendularOldLeftVirtualPosition[net.size()-1]+800 >= PendularLeftVirtualPosition[2]+800) && (PendularLeftVirtualPosition[net.size()-1]+800 < PendularLeftVirtualPosition[2]+800)&& (PendularOldLeftVirtualPosition[net.size()-1]+800 > PendularLeftVirtualPosition[net.size()-1]+800)

    ) {



    //   net.phase[2]=  net.oldPhase[net.size()-1];
    net.phase[2]=   net.phase[11];
    //   net.phase[2]=   net.phase[10];
    //   net.naturalFrequency[2]= OldFrequency[net.size()-1];


    net.naturalFrequency[2]= net.naturalFrequency[11];

    net.phase[11]= net.phase[10];
    net.naturalFrequency[11]= net.naturalFrequency[10];
    key='&';  
    println("summary other");
    printSummary(2);  
    printSummary(10);  
    printSummary(11);  
    /* 
     if ((PendularOldLeftVirtualPosition[net.size()-1]+800 <= PendularLeftVirtualPosition[2]+800) && (PendularLeftVirtualPosition[net.size()-1]+800 > PendularLeftVirtualPosition[2]+800)&& (PendularOldLeftVirtualPosition[net.size()-1]+800 < PendularLeftVirtualPosition[net.size()-1]+800) ||
     (PendularOldLeftVirtualPosition[net.size()-1]+800 >= PendularLeftVirtualPosition[2]+800) && (PendularLeftVirtualPosition[net.size()-1]+800 < PendularLeftVirtualPosition[2]+800)&& (PendularOldLeftVirtualPosition[net.size()-1]+800 > PendularLeftVirtualPosition[net.size()-1]+800)
     
     ){
     
     println("summary other after");
     printSummary(2);  
     printSummary(10);  
     printSummary(11);  
     } 
     */

    // net.shiftPhases(-2);
  }


  if (key=='&' || key=='+') {

    net.shiftFrequencies(+1);
    net.shiftPhases(+1);
  }
}  
