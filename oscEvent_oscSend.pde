//********  OSCRECEIVE
//RECEIVE OSC AUTOMATION with port 2346 or 2349 and 2350 and analyse OSC messages
void oscEvent(OscMessage theMsg) {
  if (theMsg.checkAddrPattern("/LFO1")==true) {
    automationLFO[0] = theMsg.get(0).floatValue();
  }

  if (theMsg.checkAddrPattern("/LFOdecay")==true) {
    automationLFO[1] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/LFO2")==true) {
    automationLFO[2] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/LFO3")==true) {
    automationLFO[3] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/LFO4")==true) {
    automationLFO[4] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/LFO5")==true) {
    automationLFO[5] = theMsg.get(0).floatValue();
  }  
/*
  if (theMsg.checkAddrPattern("/LFO6")==true) {
    automationLFO[6] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/LFO7")==true) {
    automationLFO[7] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/LFO8")==true) {
    automationLFO[8] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/LFO9")==true) {
    automationLFO[9] = theMsg.get(0).floatValue();
  }
  
*/  
  


  if (theMsg.checkAddrPattern("/oscillator2")==true) {
    oscillator[2] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/oscillator3")==true) {
    oscillator[3] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/oscillator4")==true) {
    oscillator[4] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/oscillator5")==true) {
    oscillator[5] = theMsg.get(0).floatValue();
  }  
/*
  if (theMsg.checkAddrPattern("/oscillator6")==true) {
    oscillator[6] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/oscillator7")==true) {
    oscillator[7] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/oscillator8")==true) {
    oscillator[8] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/oscillator9")==true) {
    oscillator[9] = theMsg.get(0).floatValue();
  }
  
      if (theMsg.checkAddrPattern("/oscillator10")==true) {
    oscillator[10] = theMsg.get(0).floatValue();
  }

  if (theMsg.checkAddrPattern("/oscillator11")==true) {
    oscillator[11] = theMsg.get(0).floatValue();
  } 
  
  */
  


  if (theMsg.checkAddrPattern("/madTempoShaper")==true) {
    formerAutomation1=automation1;
    automation1 = theMsg.get(0).floatValue();
    for (int i = 0; i < networkSize; i++) {   
      //   net.phase[i]= map (automation2, 0, 1, -PI, PI );
    }
  }
  if (theMsg.checkAddrPattern("/speedTempo")==true) {
    automation2 = theMsg.get(0).floatValue();
    //  LFOX=automation2;
  }
  if (theMsg.checkAddrPattern("/followMadTrack1bis")==true) {
    automation3 = theMsg.get(0).floatValue();
    //  LFOY=automation3;
  }  

  if (theMsg.checkAddrPattern("/measureGood")==true) {
    automation4 = theMsg.get(0).floatValue();

  }  

  if (theMsg.checkAddrPattern("/beatPrecised")==true) {
    automation5 = theMsg.get(0).floatValue();
  
  }  

  if (theMsg.checkAddrPattern("/lfo1")==true) {
    automation6 = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/lfo2")==true) {
    automation7 = theMsg.get(0).floatValue();
  } 
  
    if (theMsg.checkAddrPattern("/lfo3")==true) {
    automation8 = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/LPF")==true) {
    automation9 = theMsg.get(0).floatValue();
  } 
  
   //***** ableton[i]
  

  if (theMsg.checkAddrPattern("/ableton0")==true) {
    ableton[0] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/ableton1")==true) {
    ableton[1] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/ableton2")==true) {
    ableton[2] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/ableton3")==true) {
    ableton[3] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/ableton4")==true) {
    ableton[4] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/ableton5")==true) {
    ableton[5] = theMsg.get(0).floatValue();
  } 
/*
  if (theMsg.checkAddrPattern("/ableton6")==true) {
    ableton[6] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/ableton7")==true) {
    ableton[7] = theMsg.get(0).floatValue();
  }
  
  if (theMsg.checkAddrPattern("/ableton8")==true) {
    ableton[8] = theMsg.get(0).floatValue();
  }

  if (theMsg.checkAddrPattern("/ableton9")==true) {
    ableton[9] = theMsg.get(0).floatValue();
  } 
  */
  
  

  if (theMsg.checkAddrPattern("/signal0")==true) {
    signal[0] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/signal1")==true) {
    signal[1] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/signal2")==true) {
    signal[2] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/signal3")==true) {
    signal[3] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/signal4")==true) {
    signal[4] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/signal5")==true) {
    signal[5] = theMsg.get(0).floatValue();
  } 
/*
  if (theMsg.checkAddrPattern("/signal6")==true) {
    signal[6] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/signal7")==true) {
    signal[7] = theMsg.get(0).floatValue();
  }
  
    if (theMsg.checkAddrPattern("/signal8")==true) {
    signal[8] = theMsg.get(0).floatValue();
  }

  if (theMsg.checkAddrPattern("/signal9")==true) {
    signal[9] = theMsg.get(0).floatValue();
  } 
  */

  //***  MIDI NOTE

  if (theMsg.checkAddrPattern("/Velocity1")==true) {
    velocity1 = theMsg.get(0).intValue();
    ver_move1 = map(velocity1, 0, 127, 0, 60);
  }

  if (theMsg.checkAddrPattern("/Velocity2")==true) {
    velocity2 = theMsg.get(0).intValue();
    ver_move2 = map(velocity2, 0, 127, 0, 60);
  }  

  if (theMsg.checkAddrPattern("/Velocity3")==true) {
    velocity3 = theMsg.get(0).intValue();
    ver_move3 = map(velocity3, 0, 127, 0, 60);
  }  

  if (theMsg.checkAddrPattern("/Velocity4")==true) {
    velocity4 = theMsg.get(0).intValue();
    ver_move4 = map(velocity4, 0, 127, 0, 60);
  }

  if (theMsg.checkAddrPattern("/Velocity5")==true) {
    velocity5 = theMsg.get(0).intValue();
    ver_move5 = map(velocity5, 0, 127, 0, 60);
  }  

  if (theMsg.checkAddrPattern("/Velocity6")==true) {
    velocity6 = theMsg.get(0).intValue();
    ver_move6 = map(velocity6, 0, 127, 0, 60);
  }  

  if (theMsg.checkAddrPattern("/Velocity7")==true) {
    velocity7 = theMsg.get(0).intValue();
    ver_move7 = map(velocity7, 0, 127, 0, 60);
  }  

  if (theMsg.checkAddrPattern("/Velocity8")==true) {
    velocity8 = theMsg.get(0).intValue();
    ver_move8 = map(velocity8, 0, 127, 0, 60);
  }  

  if (theMsg.checkAddrPattern("/Note1")==true) {
    note1 = theMsg.get(0).intValue();
    duration1 = map(sq(note1), 1, sq(127), 0.05, 0.5);
  }

  if (theMsg.checkAddrPattern("/Note2")==true) {
    note2 = theMsg.get(0).intValue();
    duration2 = map(sq(note2), 1, sq(127), 0.05, 0.5);
  } 

  if (theMsg.checkAddrPattern("/Note3")==true) {
    note3 = theMsg.get(0).intValue();
    duration3 = map(sq(note3), 1, sq(127), 0.05, 0.5);
  }

  if (theMsg.checkAddrPattern("/Note4")==true) {
    note4 = theMsg.get(0).intValue();
    duration4 = map(sq(note4), 1, sq(127), 0.05, 0.5);
  } 

  if (theMsg.checkAddrPattern("/Note5")==true) {
    note5 = theMsg.get(0).intValue();
    duration5 = map(sq(note5), 1, sq(127), 0.05, 0.5);
  }

  if (theMsg.checkAddrPattern("/Note6")==true) {
    note6 = theMsg.get(0).intValue();
    duration6 = map(sq(note6), 1, sq(127), 0.05, 0.5);
  } 

  if (theMsg.checkAddrPattern("/Note7")==true) {
    note7 = theMsg.get(0).intValue();
    duration7 = map(sq(note7), 1, sq(127), 0.05, 0.5);
  }

  if (theMsg.checkAddrPattern("/Note8")==true) {
    note8 = theMsg.get(0).intValue();
    duration8 = map(sq(note8), 1, sq(127), 0.05, 0.5);
  }
}




/*float log10 (int x) {
 return (log(x) / log(10));
 }*/

class B_String {
  float osc_points, p11, p21, p31, p41, shade;

  B_String(float a1, float b1, float c1, float d1, float i, int colour) {
    noFill();
    //fill(250, 0, 0, 55);
    stroke(200, colour, 0);
    bezier(a1, i, b1, i, c1, i, d1, i);
    osc_points = i;
    p11 = a1;
    p21 = b1;
    p31 = c1;
    p41 = d1;
    shade = colour;
    //fill(0, 0, 0);
  }

  void display(float velocity) { 
    noFill();
    stroke(200, shade, 0);
    /*
    bezier(p11, osc_points, p21, osc_points+velocity, p31, osc_points+velocity, p41, osc_points);
    bezier(p11, osc_points, p21, osc_points+0.8*velocity, p31, osc_points+0.8*velocity, p41, osc_points);
    bezier(p11, osc_points, p21, osc_points+0.6*velocity, p31, osc_points+0.6*velocity, p41, osc_points);
    bezier(p11, osc_points, p21, osc_points+0.4*velocity, p31, osc_points+0.4*velocity, p41, osc_points);
    bezier(p11, osc_points, p21, osc_points+0.2*velocity, p31, osc_points+0.2*velocity, p41, osc_points);
    bezier(p11, osc_points, p21, osc_points, p31, osc_points, p41, osc_points);
    */
  }
} 

void printMidiNoteVelocity() {

  if  (note1>0) {

    print ("note "); 
    print (1); 
    print (" "); 
    print (note1);
    print ("note "); 
    print (2); 
    print (" "); 
    print (note2);
    print ("note "); 
    print (3); 
    print (" "); 
    print (note3);
    print ("note "); 
    print (4); 
    print (" "); 
    print (note4);
    print ("note "); 
    print (5); 
    print (" "); 
    print (note5);
    print ("note "); 
    print (6); 
    print (" "); 
    print (note6);
    print ("note "); 
    print (7); 
    print (" "); 
    println (note7);
  } else {
    //   println (" ");
  }

  if  (velocity1>0) {

    print ("velo "); 
    print (1); 
    print (" "); 
    print (velocity1);
    print ("velo "); 
    print (2); 
    print (" "); 
    print (velocity2);
    print ("velo "); 
    print (3); 
    print (" "); 
    print (velocity3);
    print ("velo "); 
    print (4); 
    print (" "); 
    print (velocity4);
    print ("velo"); 
    print (5); 
    print (" "); 
    println (velocity5);
    print ("velo"); 
    print (6); 
    print (" "); 
    print (velocity6);
    print ("velo"); 
    print (7); 
    print (" "); 
    println (velocity7);
  }

  //  print ("measure "); println (measure);

  //  if  (1!=0) {
  if  (velocity1>0) {
    rotate (PI/2);
    //  String NOTE1= nf (note1, 0, 0); // transform time elapsed betwween two pulsation in BPM
    text (measure, (-width+1350), -height );  
    text ("1", (-width-150), -height );
    text (note1, -width-50+50, -height );
    text ("2", (-width+50+50), -height );
    text (note2, -width+150+50, -height );   
    text ("3", (-width+250+50), -height );
    text (note3, -width+350+50, -height );
    text ("4", (-width+450+50), -height);
    text (note4, -width+550+50, -height );
    text ("5", (-width+650+50), -height);
    text (note5, -width+750+50, -height );
    text ("6", (-width+850+50), -height);
    text (note6, -width+950+50, -height );
    text ("7", (-width+1050+50), -height);
    text (note7, -width+1150+50, -height );

    text (velocity1, -width-50+50, -height+100 );
    text (velocity2, -width+150+50, -height+100 );   
    text (velocity3, -width+350+50, -height+100 );
    text (velocity4, -width+550+50, -height+100 );
    text (velocity5, -width+750+50, -height+100 );
    text (velocity6, -width+950+50, -height+100 );   
    text (velocity7, -width+1150+50, -height+100 );
  } else {
    rotate (PI/2);
    note1=note2=note3=note4=note5=note6=note7=note8=0;
    velocity1=velocity2=velocity3=velocity4=velocity5=velocity6=velocity7=velocity8=0;

    text (measure, (-width+1350), -height );  
    text ("1", (-width-150), -height );
    text (note1, -width-50+50, -height );
    text ("2", (-width+50+50), -height );
    text (note2, -width+150+50, -height );   
    text ("3", (-width+250+50), -height );
    text (note3, -width+350+50, -height );
    text ("4", (-width+450+50), -height);
    text (note4, -width+550+50, -height );
    text ("5", (-width+650+50), -height);
    text (note5, -width+750+50, -height );
    text ("6", (-width+850+50), -height);
    text (note6, -width+950+50, -height );
    text ("7", (-width+1050+50), -height);
    text (note7, -width+1150+50, -height );

    text (velocity1, -width-50+50, -height+100 );
    text (velocity2, -width+150+50, -height+100 );   
    text (velocity3, -width+350+50, -height+100 );
    text (velocity4, -width+550+50, -height+100 );
    text (velocity5, -width+750+50, -height+100 );
    text (velocity6, -width+950+50, -height+100 );   
    text (velocity7, -width+1150+50, -height+100 );
    //println (" ");
  }
}


void oscSend(){
 
  for (int i = 1; i < networkSize-0; i++) { 
    //    print (" upVelocity "); print (i); print ("  "); print ( upVelocity[i]);
    //    print (" dataToLive[i] "); println (dataToLive[0]);
   // Pos[0]=0;   
    oldPos[i]=Pos[i];
   
    //MIDDLE POINT == between 61 & 65
    if ((oldPos[i]<= 65 && Pos[i] >=61) ||
        (oldPos[i]>= 61 && Pos[i] <=65)) {

          dataToLive[i]= (networkSize-1)*(i-0);  // because there i beac you can send data with the step you want to separate controller depending oscillator --> here it is 11.
          dataToLive[0]= (networkSize-1)*(i-0);  // you can send data with the step you want to one controler 
      
        upVelocity[i]= 1;   
    }
    
       if ( Pos[i] >65 ||
            Pos[i] <61) {
       dataToLive[i]=0;
      upVelocity[i]= -1;
 
    }    
}

    downVelocity[1]=  upVelocity[2]* upVelocity[3]* upVelocity[4]* upVelocity[5];//* upVelocity[6];
    
               //       upVelocity[7]* upVelocity[8] * upVelocity[9]* upVelocity[10]* upVelocity[11];
                    
     if ( downVelocity[1]>0){ // if one of oscillator is at middle point
    Velocity=1;  
    }
     else  Velocity=-1; 
     
  OscMessage myMessage = new OscMessage("/test");
  OscMessage myMessage1 = new OscMessage("/trigLfo");
  OscMessage myMessage2 = new OscMessage("/Velocity");
  OscMessage myMessage3 = new OscMessage("/cohesion");
  OscMessage myMessage4 = new OscMessage("/upVelocity11");
  OscMessage myMessage5 = new OscMessage("/upVelocity10");
  OscMessage myMessage6 = new OscMessage("/upVelocity9");
  OscMessage myMessage7 = new OscMessage("/upVelocity8");
  OscMessage myMessage8 = new OscMessage("/upVelocity7");
  OscMessage myMessage9 = new OscMessage("/upVelocity6");
  OscMessage myMessage10= new OscMessage("/upVelocity5");
  OscMessage myMessage11= new OscMessage("/upVelocity4");
  OscMessage myMessage12= new OscMessage("/upVelocity3");
  OscMessage myMessage13= new OscMessage("/upVelocity2");
  
  OscMessage myMessage14= new OscMessage("/averageDeltaPhase");
  OscMessage myMessage15= new OscMessage("/startStop");
  OscMessage myMessage16= new OscMessage("/addPhase");
  OscMessage myMessage17= new OscMessage("/addPhaseAllMode");
  OscMessage myMessage18= new OscMessage("/mouseX"); // oscillator 
  OscMessage myMessage19= new OscMessage("/mouseY"); // oscillator behind

 
    float j= LevelCohesionToSend*1.0;
  myMessage.add((map ((j), 0, 1, 1, 127))); /* add an int to the osc message */
  myMessage1.add( trigLfo);
  float data10= DataToDueCircularVirtualPosition[networkSize-1]*1.0;   
  myMessage2.add(Velocity);
  myMessage3.add(LevelCohesionToSend);
  /*
  myMessage4.add(upVelocity[11]);
  myMessage5.add(upVelocity[10]);
  myMessage6.add(upVelocity[9]);
  myMessage7.add(upVelocity[8]);
  myMessage8.add(upVelocity[7]);
  myMessage9.add(upVelocity[6]);
*/
  myMessage10.add(upVelocity[5]);
  myMessage11.add(upVelocity[4]);
  myMessage12.add(upVelocity[3]);
  myMessage13.add(upVelocity[2]);
  
  myMessage14.add(averageDeltaPhase);
  myMessage15.add(startStop);
  myMessage16.add((map (addPhase, -1, 1, 0, 127)));
  myMessage17.add((map (addPhaseAllMode, -1, 1, 0, 127)));  
  myMessage18.add((float) map (mouseX, 0, 800, 0, 127));
  myMessage19.add((float) map (mouseY, 0, 800, 0, 127));

 

  OscMessage myMessage60= new OscMessage("/encodeur0"); // oscillator SEND ACCELERATION
  OscMessage myMessage61= new OscMessage("/encodeur1"); // oscillator 
  OscMessage myMessage62= new OscMessage("/encodeur2"); // oscillator 
  OscMessage myMessage63= new OscMessage("/encodeur3"); // oscillator 
  OscMessage myMessage64= new OscMessage("/encodeur4"); // oscillator 
  OscMessage myMessage65= new OscMessage("/encodeur5"); // oscillato
  
 // oldEncodeur[0]= encodeur[0];
  encodeur[0]=mouseY*2;
  myMessage60.add(abs (map (encodeur[0], 0, 800, 0, 127)));  // send encodeur
  myMessage61.add(encodeur[1]);
  myMessage62.add(encodeur[2]);
  myMessage63.add(encodeur[3]);
  myMessage64.add(encodeur[4]);
  myMessage65.add(encodeur[5]);
  


  JoDebug  ="<" // BPM9   
   // + (DataToDueCircularVirtualPosition[11])+","+DataToDueCircularVirtualPosition[10]+","+(DataToDueCircularVirtualPosition[9])+","+DataToDueCircularVirtualPosition[8]+","+DataToDueCircularVirtualPosition[7]+","
   // + DataToDueCircularVirtualPosition[6]+","
    +( DataToDueCircularVirtualPosition[5])+","+DataToDueCircularVirtualPosition[4]+","+DataToDueCircularVirtualPosition[3]+","+DataToDueCircularVirtualPosition[2]+","
    + ">";
    
 
  OscMessage myMessage20= new OscMessage("/position11"); // oscillator front
  OscMessage myMessage21= new OscMessage("/position10"); // oscillator 
  OscMessage myMessage22= new OscMessage("/position9"); // oscillator 
  OscMessage myMessage23= new OscMessage("/position8"); // oscillator 
  OscMessage myMessage24= new OscMessage("/position7"); // oscillator 
  OscMessage myMessage25= new OscMessage("/position6"); // oscillato
  OscMessage myMessage26= new OscMessage("/position5"); // oscillator 
  OscMessage myMessage27= new OscMessage("/position4"); // oscillator 
  OscMessage myMessage28= new OscMessage("/position3"); // oscillator 
  OscMessage myMessage29= new OscMessage("/position2"); // oscillator behind
   
  OscMessage myMessage30= new OscMessage("/decompte11"); // oscillator SEND TRIG NOTE IN MAX4LIVE
  OscMessage myMessage31= new OscMessage("/decompte10"); // oscillator 
  OscMessage myMessage32= new OscMessage("/decompte9"); // oscillator 
  OscMessage myMessage33= new OscMessage("/decompte8"); // oscillator 
  OscMessage myMessage34= new OscMessage("/decompte7"); // oscillator 
  OscMessage myMessage35= new OscMessage("/decompte6"); // oscillato
  OscMessage myMessage36= new OscMessage("/decompte5"); // oscillator 
  OscMessage myMessage37= new OscMessage("/decompte4"); // oscillator 
  OscMessage myMessage38= new OscMessage("/decompte3"); // oscillator 
  OscMessage myMessage39= new OscMessage("/decompte2"); // oscillator behind
  
  OscMessage myMessage40= new OscMessage("/dataToLive11"); // oscillator SEND TRIG NOTE IN MAX4LIVE
  OscMessage myMessage41= new OscMessage("/dataToLive10"); // oscillator 
  OscMessage myMessage42= new OscMessage("/dataToLive9"); // oscillator 
  OscMessage myMessage43= new OscMessage("/dataToLive8"); // oscillator 
  OscMessage myMessage44= new OscMessage("/dataToLive7"); // oscillator 
  OscMessage myMessage45= new OscMessage("/dataToLive6"); // oscillato
  OscMessage myMessage46= new OscMessage("/dataToLive5"); // oscillator 
  OscMessage myMessage47= new OscMessage("/dataToLive4"); // oscillator 
  OscMessage myMessage48= new OscMessage("/dataToLive3"); // oscillator 
  OscMessage myMessage49= new OscMessage("/dataToLive2"); // oscillator behind
 
  OscMessage myMessage50= new OscMessage("/acceleration11"); // oscillator SEND ACCELERATION
  OscMessage myMessage51= new OscMessage("/acceleration10"); // oscillator 
  OscMessage myMessage52= new OscMessage("/acceleration9"); // oscillator 
  OscMessage myMessage53= new OscMessage("/acceleration8"); // oscillator 
  OscMessage myMessage54= new OscMessage("/acceleration7"); // oscillator 
  OscMessage myMessage55= new OscMessage("/acceleration6"); // oscillato
  OscMessage myMessage56= new OscMessage("/acceleration5"); // oscillator 
  OscMessage myMessage57= new OscMessage("/acceleration4"); // oscillator 
  OscMessage myMessage58= new OscMessage("/acceleration3"); // oscillator 
  OscMessage myMessage59= new OscMessage("/acceleration2"); // oscillator behind
 // OscMessage myMessage60= new OscMessage("/acceleration1"); // oscillator behind




 
 /*
  myMessage20.add(Pos[9]);
  myMessage21.add(Pos[8]);
  myMessage22.add(Pos[7]);
  myMessage23.add(Pos[6]);
  myMessage24.add(Pos[5]);
  myMessage25.add(Pos[4]);
  myMessage26.add(Pos[3]);
  myMessage27.add(Pos[2]);
  myMessage28.add(Pos[1]);
  myMessage29.add(Pos[0]);
*/  
//  print ("Pos11");   println (Pos[11]); println (Pos[11]); println (Pos[11]); println (Pos[11]); 
/*
  myMessage20.add(Pos[11]);
  myMessage21.add(Pos[10]);
  myMessage22.add(Pos[9]);
  myMessage23.add(Pos[8]);
  myMessage24.add(Pos[7]);
  myMessage25.add(Pos[6]);
*/
  myMessage26.add(Pos[5]);
  myMessage27.add(Pos[4]);
  myMessage28.add(Pos[3]);
  myMessage29.add(Pos[2]);
/*  
  myMessage30.add(Pos[9]);
  myMessage31.add(Pos[8]);
  myMessage32.add(Pos[7]);
  myMessage33.add(Pos[6]);
  myMessage34.add(Pos[5]);
  myMessage35.add(Pos[4]);
  myMessage36.add(Pos[3]);
  myMessage37.add(Pos[2]);
  myMessage38.add(Pos[1]);
  myMessage39.add(Pos[0]);
 */
 
 if (formerKeyMetro == '$'  ) { 
  /*
  myMessage30.add(revolution[11]);  //  Trig on the left bug when playing sample in negative way. problem with net_oldphase? or and countrevs
  myMessage31.add(revolution[10]);
  myMessage32.add(revolution[9]);
  myMessage33.add(revolution[8]);
  myMessage34.add(revolution[7]);
  myMessage35.add(revolution[6]);
  */
  myMessage36.add(revolution[5]);
  myMessage37.add(revolution[4]);
  myMessage38.add(revolution[3]);
  myMessage39.add(revolution[2]);
 } 
  
  
 /*
  myMessage30.add(decompte[11]);
  myMessage31.add(decompte[10]);
  myMessage32.add(decompte[9]);
  myMessage33.add(decompte[8]);
  myMessage34.add(decompte[7]);
  myMessage35.add(decompte[6]);
  myMessage36.add(decompte[5]);
  myMessage37.add(decompte[4]);
  myMessage38.add(decompte[3]);
  myMessage39.add(decompte[2]);
  */
  
//  osctrignote

  if (formerKeyMetro == '£'  || formerKeyMetro == '*' || formerKeyMetro == 'J' || formerKeyMetro == 's' || formerKeyMetro == '@' || formerKeyMetro == 'c' ) { // trig note if TrigmodPos[i]=0
    showArray(TrigmodPos);
  // These tests used a copy of the original array so that we can perform multiple
  // test using the same working array
//  println("Convert multiple 0s to 1s (good)");
  result = multiMatchData(0, 1, TrigmodPos.clone());
  TrigmodPos=result;
  showArray(result);
  
 if ( keyMode ==  " followSignalLfo "){
    print (" trigNoteOnlyOnceFollowSignalLfo "); 
    showArray(trigFollowSignalLfo);   
  result = multiMatchData(0, 1, trigFollowSignalLfo.clone());
//  TrigmodPos=result;
  showArray(result); 
   } 
  /*
  myMessage30.add(TrigmodPos[11]);  // Trig on the right but there are bugs in pendular way
  myMessage31.add(TrigmodPos[10]);
  myMessage32.add(TrigmodPos[9]);
  myMessage33.add(TrigmodPos[8]);
  myMessage34.add(TrigmodPos[7]);
  myMessage35.add(TrigmodPos[6]);
  */
  myMessage36.add(TrigmodPos[5]);
  myMessage37.add(TrigmodPos[4]);
  myMessage38.add(TrigmodPos[3]);
  myMessage39.add(TrigmodPos[2]);
  println (" NOTE TRIGGED FROM OSCSEND ");
} 
  /*
  myMessage40.add(dataToLive[11]);  // Trig on the right but there are bugs in pendular way
  myMessage41.add(dataToLive[10]);
  myMessage42.add(dataToLive[9]);
  myMessage43.add(dataToLive[8]);
  myMessage44.add(dataToLive[7]);
  myMessage45.add(dataToLive[6]);
  */

  myMessage46.add(dataToLive[5]);
  myMessage47.add(dataToLive[4]);
  myMessage48.add(dataToLive[3]);
  myMessage49.add(dataToLive[2]);
//  myMessage50.add(dataToLive[0]);
/*
  myMessage50.add(mapAcceleration[11]);  // Trig on the right but there are bugs in pendular way
  myMessage51.add(mapAcceleration[10]);
  myMessage52.add(mapAcceleration[9]);
  myMessage53.add(mapAcceleration[8]);
  myMessage54.add(mapAcceleration[7]);
  myMessage55.add(mapAcceleration[6]);
  */
  myMessage56.add(mapAcceleration[5]);
  myMessage57.add(mapAcceleration[4]);
  myMessage58.add(mapAcceleration[3]);
  myMessage59.add(mapAcceleration[2]);
 // myMessage60.add(mapAcceleration[1]);
    
 
  
  //  UNCOMMENT to BEGIN TO USE good useful OSC
  // /* myRemoteLocation to port 8000

  oscP5.send(myMessage,  myRemoteLocation); 
  oscP5.send(myMessage1, myRemoteLocation); 
  oscP5.send(myMessage2, myRemoteLocation); 
  oscP5.send(myMessage3, myRemoteLocation); 

  oscP5.send(myMessage4, myRemoteLocation); 
  oscP5.send(myMessage5, myRemoteLocation); 
  oscP5.send(myMessage6, myRemoteLocation); 
  oscP5.send(myMessage7, myRemoteLocation); 
  oscP5.send(myMessage8, myRemoteLocation); 
  oscP5.send(myMessage9, myRemoteLocation); 
  oscP5.send(myMessage10, myRemoteLocation); 
  oscP5.send(myMessage11, myRemoteLocation); 
  oscP5.send(myMessage12, myRemoteLocation); 
  oscP5.send(myMessage13, myRemoteLocation); 
  

  oscP5.send(myMessage14, myRemoteLocation);
  oscP5.send(myMessage15, myRemoteLocation); 
  oscP5.send(myMessage16, myRemoteLocation); 
  oscP5.send(myMessage17, myRemoteLocation); 

  oscP5.send(myMessage18, myRemoteLocation); 
  oscP5.send(myMessage19, myRemoteLocation); 



  // myRemoteLocationII port 8001
  
  oscP5.send(myMessage20, myRemoteLocationII);
  oscP5.send(myMessage21, myRemoteLocationII);
  oscP5.send(myMessage22, myRemoteLocationII);
  oscP5.send(myMessage23, myRemoteLocationII);
  oscP5.send(myMessage24, myRemoteLocationII);
  oscP5.send(myMessage25, myRemoteLocationII);
  oscP5.send(myMessage26, myRemoteLocationII);
  oscP5.send(myMessage27, myRemoteLocationII);
  oscP5.send(myMessage28, myRemoteLocationII);
  oscP5.send(myMessage29, myRemoteLocationII);
   //  END TO USE, NOT BELOW, END OF UNCOMMENT
  
  //*** /*
  oscP5.send(myMessage30, myRemoteLocation);
  oscP5.send(myMessage31, myRemoteLocation);
  oscP5.send(myMessage32, myRemoteLocation);
  oscP5.send(myMessage33, myRemoteLocation);
  oscP5.send(myMessage34, myRemoteLocation);
  oscP5.send(myMessage35, myRemoteLocation);
  oscP5.send(myMessage36, myRemoteLocation);
  oscP5.send(myMessage37, myRemoteLocation);
  oscP5.send(myMessage38, myRemoteLocation);
  oscP5.send(myMessage39, myRemoteLocation);
  //*** */
  
  // myRemoteLocation port 8000  data to live
  oscP5.send(myMessage40, myRemoteLocation);
  oscP5.send(myMessage41, myRemoteLocation);
  oscP5.send(myMessage42, myRemoteLocation);
  oscP5.send(myMessage43, myRemoteLocation);
  oscP5.send(myMessage44, myRemoteLocation);
  oscP5.send(myMessage45, myRemoteLocation);
  oscP5.send(myMessage46, myRemoteLocation);
  oscP5.send(myMessage47, myRemoteLocation);
  oscP5.send(myMessage48, myRemoteLocation);
  oscP5.send(myMessage49, myRemoteLocation);
  oscP5.send(myMessage50, myRemoteLocation);

 // encodeur
  oscP5.send(myMessage60, myRemoteLocation);
  oscP5.send(myMessage61, myRemoteLocation);
  oscP5.send(myMessage62, myRemoteLocation);
  oscP5.send(myMessage63, myRemoteLocation);
  oscP5.send(myMessage64, myRemoteLocation);
  oscP5.send(myMessage65, myRemoteLocation);

   // myRemoteLocationII port 8002
  
  // acceleration
  /*
  oscP5.send(myMessage50, myRemoteLocation3);
  oscP5.send(myMessage51, myRemoteLocation3);
  oscP5.send(myMessage52, myRemoteLocation3);
  oscP5.send(myMessage53, myRemoteLocation3);
  oscP5.send(myMessage54, myRemoteLocation3);
  oscP5.send(myMessage55, myRemoteLocation3);
  oscP5.send(myMessage56, myRemoteLocation3);
  oscP5.send(myMessage57, myRemoteLocation3);
  oscP5.send(myMessage58, myRemoteLocation3);
  oscP5.send(myMessage59, myRemoteLocation3);
  
   // myRemoteLocation port 8000
   
    oscP5.send(myMessage50, myRemoteLocation);
  oscP5.send(myMessage51, myRemoteLocation);
  oscP5.send(myMessage52, myRemoteLocation);
  oscP5.send(myMessage53, myRemoteLocation);
  oscP5.send(myMessage54, myRemoteLocation);
  oscP5.send(myMessage55, myRemoteLocation);
  oscP5.send(myMessage56, myRemoteLocation);
  oscP5.send(myMessage57, myRemoteLocation);
  oscP5.send(myMessage58, myRemoteLocation);
  oscP5.send(myMessage59, myRemoteLocation);
*/
 
 
}