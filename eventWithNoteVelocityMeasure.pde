
void trigBeatWithMeasure()
 {
 //   beatTrigged=false;
 //   beatPrecisedTrigged=false; 
   if (formerMeasure!=measure) {
    //   background (127, 50, 50);
    beatTrigged=true;
    
    
    

    //    autmationWithMeasureAndNote++;

    beatOnMeasure=(measure%4)+1;
    print("  ******** "); 
    print("  ******** "); 
    print("  ******** "); 
    print("  ******** "); 
    print("  ******** "); 
    println(measure);
    formerFrameBeat=frameCount;
    //    if (formerBeatPrecised
 }
 
 else beatTrigged=false;
 
      if (formerBeatPrecised!=beatPrecised) {   
    //     background (127, 50, 50);
    beatPrecisedTrigged=true;
    print("  ******** "); 
    print("  ******** "); 
    print(" automation1*100 ");  println( automation1*100 );
    print("  ******** "); 
    print("  ******** "); 
    print("  beatPrecised "); 
    println(beatPrecisedTrigged);
  }
  
  else  beatPrecisedTrigged=false; 

  
  
   
} 

void autmationWithMeasureAndNote() {
 // if (formerSartKey!=L){
  autoNote1VelInf64();
 //  }

  if (measure<5 ) {
    //  speedDelta=15;
    speedDelta=4; 
    autoNote2();
  } 
  if (measure>=5 && measure<=5 && beatTrigged==true) {
    speedDelta=4 ;
    //   autoNote2();
  } 
  if ( measure<=2 ) {

    key='$';
    keyReleased();
  }
  if ( measure<=5 ) {
    // d=0;
    oscillatorBlocked=6;
//    d=100;
  }
  if ( measure>=6 && measure<=7 ) {
    d=200;
  }

  if ( measure<8 && beatTrigged==true) {
    //   key='?'; // slow acceleration
    //     keyReleased();
  } 


  if  (measure>=24 && measure<=38 ) {// measure>=41 && measure<=42
    //    autoNote2(); mis dans la vers FIVE
    //     key='Y';keyReleased();
    //     key='Y';keyReleased();
  }

  if  (measure>=61 && measure<=61 && beatTrigged==true  ) {

    key='o';
    keyReleased();
  }
  if  (measure>=66 && measure<67 ) {

    //   key='e';keyReleased();// shift phase mod   PI/3
  }
  if  (measure>=71 && measure<78 ) {

    autoNote2();
  }

  if  (measure>=40 && measure<41 && beatTrigged==true ) {//77  //&& beatTrigged==true
    //    key='o';
    //    keyReleased();
    key=9;
    keyReleased();
    key=CONTROL;
    keyReleased();
    oscillatorBlocked=10;
    speedDelta=4;
  }
  if  (measure>=43 && measure<44 && beatPrecised>=4 && beatPrecisedTrigged==true ) {//77  //&& beatTrigged==true
    //    key='9';
    //    keyReleased();
    key='o';
    keyReleased();
  } 
  if  (measure>=45 && measure<46 && beatPrecised>=4 && beatPrecisedTrigged==true ) {//77  //&& beatTrigged==true
    //    key='9';
    //    keyReleased();
    key='o';
    keyReleased();
  }   

  if  (measure>=47 && measure<48 && beatPrecised>=4 && beatPrecisedTrigged==true ) {//77  //&& beatTrigged==true

    key='o';
    keyReleased();
  }

  if  (measure>=50 && measure<51 && beatPrecised>=4 && beatPrecisedTrigged==true ) {//77  //&& beatTrigged==true

    key='o';
    keyReleased();
  }

  if ((( measure>40 && measure<58) && (millis()>formerEvent[74]+1000+d)) &&
    ((note1>73 && note1<75 && velocity1>=1 && velocity1<=64)|| (note2>73 && note2<75 && velocity2>=1 && velocity2<=64)|| (note3>73 && note3<75 && velocity3>=1 && velocity3<=64) ||
    (note4>73 && note4<75 && velocity4>=1 && velocity4<=64)|| (note5>73 && note5<75 && velocity5>=1 && velocity5<=64)|| (note6>73 && note6<75 && velocity6>=1 && velocity6<=64)
    )) {
    //  key='u'; //u=117 
    //   key='d'; //u=117 
    //     key='9'; //TROUVE AUTRE CHOSE QUE l'ALIGNEMENT   pas cool à 60
    key='t'; //TROUVE AUTRE CHOSE QUE l'ALIGNEMENT   pas cool à 60
    keyReleased();
    formerEvent[74]=millis();
  }

  if  (measure>=53 && measure<54 && beatTrigged==true) {
    //    oscillatorBlocked=10;
    //  key='ç';
    //  keyReleased();
    //      key='2';keyReleased();// frequencies equal
    //  key='l';
    //  keyReleased();
    //  formerSartKey='l'; //automatise movement with note
  }

  if (measure>=76 && measure<77 && beatTrigged==true) {//77  //&& beatTrigged==true
  }


  if  (measure>=77 && measure<78 && beatTrigged==true  ) {//77  //&& beatTrigged==true
  }

  if  (measure>=77 && measure<78 && beatTrigged==true ) { //
  }

  if  (measure>=78 && measure<=78 && beatTrigged==true) {
    key='A'; 
    keyReleased();
    key='o'; 
    keyReleased();

    key='*';
    keyReleased();

    key='T';
    keyReleased();
    key='T';
    keyReleased();
    key='T';
    keyReleased();
    key='T';
    keyReleased();

    key='T';
    keyReleased();
    key='T';
    keyReleased();
    key='T';
    keyReleased();
    key='T';
    keyReleased();

    key='T';
    keyReleased();
    key='T';
    keyReleased();
    key='T';
    keyReleased();
    key='T';
    keyReleased();
    key='t';
    keyReleased();
    keyCode=CONTROL;
    keyReleased();
    speedDelta=12;

    key='Y';
    keyReleased();
    key='Y';
    keyReleased();
    key='Y';
    keyReleased();
    key='Y';
    keyReleased();
    key='Y';
    keyReleased();
    key='Y';
    keyReleased();
    key='Y';
    keyReleased();


    key='Y';
    keyReleased();
    key='Y';
    keyReleased();
    key='Y';
    keyReleased();
    key='Y';
    keyReleased();
    key='Y';
    keyReleased();
  //    key='Y';keyReleased();
    //   key='Y';keyReleased();
  }
  if  (measure>=79 && measure<=79 && beatTrigged==true) {
    speedDelta= 11;
//    key='Y';
  //  keyReleased();
  //  key='y';
//    keyReleased();
  }

  if  (measure>=79+1 && measure<=79+1 && beatTrigged==true) {
    speedDelta= 8;
  }  
  if  (measure>=79+1 && measure<=200 ) {//129
    autoNote2();
  }
  if  (measure>=79+2 && measure<=79+2 && beatTrigged==true) {
    speedDelta= 4;
  }
  if  (measure>=79+3 && measure<=79+3 && beatTrigged==true) {
    speedDelta= 4;
  }
  
  if  (measure>=79+4 && measure<=79+4 && beatTrigged==true) {
    speedDelta= 2;
  }

  if  (measure>=84 && measure<=92 && beatTrigged==true) {

    //   key='y';keyReleased();
  }
   if ( measure>=106 && measure<=106 && beatTrigged==true) {
       speedDelta= 2;
  //     key='e'; keyReleased();
    
  } 
  if ( measure>=107 && measure<=107 && beatTrigged==true) {
       speedDelta= 2;
  //     key='e'; keyReleased();
      keyCode =CONTROL; keyReleased();
    
  } 
    if ( measure>=109 && measure<=109 && beatTrigged==true) {
       speedDelta= 2;
     
  } 
    if ( measure>=115 && measure<=115 && beatTrigged==true) {
       speedDelta= 2;
    //   key='e'; keyReleased();
    
  } 
      if ( measure>=116 && measure<=116 && beatTrigged==true) {
       speedDelta= 2;
     
  } 


  if  (measure>=129 && measure<130 && beatTrigged==true) {// measure>=41 && measure<=42
    speedDelta=4;
    key='$';
    keyReleased();
    key='H';
    keyReleased();
    key='H';
    keyReleased();
    key='H';
    keyReleased();
    key='H';
    keyReleased();

    key='H';
    keyReleased();
    key='H';
    keyReleased();
    key='H';
    keyReleased();
    key='H';
    keyReleased();

    //  key='O';
    ///   keyReleased();

    //   key='°';keyReleased(); // speed=0 
    key='0';
    keyReleased(); // speed=0
    key='q';
    keyReleased(); // speed=0
    key='n';
    keyReleased(); // speed=0
  }
  if  (measure>=129 ) {// measure>=41 && measure<=42
    //  autoNote1();
  }


  if  (measure>=133 && measure<=137 && beatTrigged==true) {// measure>=41 && measure<=42

    //  key='o';    keyReleased();
    key='*';    
    keyReleased();
    key='w';    
    keyReleased();
  }
  if  (measure>=137 && measure<=137 && beatTrigged==true) {// measure>=41 && measure<=42

    //  key='o';    keyReleased();
    key='*';    
    keyReleased();
    
  }
   if  (measure>=166 && beatTrigged==true) {// measure>=41 && measure<=42
    key='°';    keyReleased();
    key='o';    keyReleased();
    key='*';    keyReleased();
    
  }
  // autoNote1Original(); // !=0
  // autoNote2();
}

void autoNote1VelInf64() {//1 61 63 64 66 85 

 // keyPressedLFO();


 // if (((formerSartKey!='a')) 
  if (((formerSartKey!='L')) 
    ) 
  {

    if (( measure>=12 && measure<=12 && beatPrecised>=4 && beatPrecisedTrigged==true )
      ) {
      //    key='K';keyReleased();
    }
    if (( measure>=12 && measure<=34 && millis()>formerEvent[76]+1000) &&
      ((note1>75 && note1<77 && velocity1>=1 && velocity1<=127)|| (note2>75 && note2<77 && velocity2>=1 && velocity2<=127)|| (note3>75 && note3<77 && velocity3>=1 && velocity3<=127) ||
      (note4>75 && note4<77 && velocity4>=1 && velocity4<=127)|| (note5>75 && note5<77 && velocity5>=1 && velocity5<=127)|| (note6>75 && note6<77 && velocity6>=1 && velocity6<=127)
      )) {
      key='9';
      keyReleased();

      key='P';
      keyReleased();
      key='P';
      keyReleased();

      formerEvent[76]=millis();
    }
    if (( measure>=24 && measure<=34 && millis()>formerEvent[76]+1000) &&
      ((note1>75 && note1<77 && velocity1>=1 && velocity1<=127)|| (note2>75 && note2<77 && velocity2>=1 && velocity2<=127)|| (note3>75 && note3<77 && velocity3>=1 && velocity3<=127) ||
      (note4>75 && note4<77 && velocity4>=1 && velocity4<=127)|| (note5>75 && note5<77 && velocity5>=1 && velocity5<=127)|| (note6>75 && note6<77 && velocity6>=1 && velocity6<=127)
      )) {
      key='9';
      keyReleased();
      key='P';
      keyReleased();
      key='P';
      keyReleased();
      key='p';
      keyReleased();


      formerEvent[76]=millis();
    }

    if  (measure>=12 && measure<=15  && beatTrigged==true ) {// beatPrecised2=true
      for (int i = 0; i < networkSize; i++) {
      }
    }
    if  (measure>16 && measure<=18  && beatTrigged==true ) {// beatPrecised2=true
      for (int i = 0; i < networkSize; i++) {


        //   key='W'; 
        //   keyReleased();
      }
    }
    if  (measure>=36 && measure<=36  && beatTrigged==true  ) {// measure>=41 && measure<=42
      for (int i = 0; i < networkSize; i++) {
        key='0';
        keyReleased();
        key='q';
        keyReleased();
        key='n';
        keyReleased();
        key='q';
        keyReleased();
        key='n';
        keyReleased();
        key='o';
        keyReleased();

        //   key='W'; 
        //   keyReleased();
      }
    }
    if  (measure>41 && measure<=42  && beatTrigged==true  ) {// measure>=41 && measure<=42
      for (int i = 0; i < networkSize; i++) {

        //    ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
      }
    }
    //%ADMAD
    if (( measure<=40 && millis()>formerEvent[67]+50+d )&&
      (
      (note1>66 && note1<68  && velocity1>=1 && velocity1<=64)|| (note2>66 && note2<68 && velocity2>=1 && velocity2<=64) || (note3>66 && note3<68 && velocity3>=1 && velocity3<=64) || 
      (note4>66 && note4<68  && velocity4>=1 && velocity4<=64)|| (note5>66 && note5<68 && velocity5>=1 && velocity5<=64) || (note6>66 && note6<68 && velocity6>=1 && velocity6<=64)
      )) {
      //   key='E'; 
          key='r'; 
          keyReleased(); //u=117
      formerEvent[67]=millis();
      print ("formerEvent[67] INSIDE"); 
      println (formerEvent[67]);
    }

    if (( measure<=15 && millis()>formerEvent[64]+950+d )&&
      (
      (note1>63 && note1<65  && velocity1>=1 && velocity1<=64)|| (note2>63 && note2<65 && velocity2>=1 && velocity2<=64) || (note3>63 && note3<65 && velocity3>=1 && velocity3<=64) || 
      (note4>63 && note4<65  && velocity4>=1 && velocity4<=64)|| (note5>63 && note5<65 && velocity5>=1 && velocity5<=64) || (note6>63 && note6<65 && velocity6>=1 && velocity6<=64)
      )) {
      //    key='f'; 
      //     keyReleased(); //u=117
      formerEvent[64]=millis();
      print ("formerEvent[64] INSIDE"); 
      println (formerEvent[64]);
    }

    if (( measure<=40  && millis()>formerEvent[69]+900+d )&& // from Track1 and Track 0
      (
      (note1>68 && note1<70  && velocity1>=1 && velocity1<=64)|| (note2>68 && note2<70 && velocity2>=1 && velocity2<=64) || (note3>68 && note3<70 && velocity3>=1 && velocity3<=64) || 
      (note4>68 && note4<70  && velocity4>=1 && velocity4<=64)|| (note5>68 && note5<70 && velocity5>=1 && velocity5<=64) || (note6>68 && note6<70 && velocity6>=1 && velocity6<=64)
      )) {
      //      key='r'; 
      //   keyReleased(); //u=117
      formerEvent[69]=millis();
      print ("formerEvent[69] INSIDE"); 
      println (formerEvent[69]);
    }
    if (( measure>=123 && millis()>formerEvent[69]+100+d )&&
      (
      (note1>68 && note1<70  && velocity1>=1 && velocity1<=64)|| (note2>68 && note2<70 && velocity2>=1 && velocity2<=64) || (note3>68 && note3<70 && velocity3>=1 && velocity3<=64) || 
      (note4>68 && note4<70  && velocity4>=1 && velocity4<=64)|| (note5>68 && note5<70 && velocity5>=1 && velocity5<=64) || (note6>68 && note6<70 && velocity6>=1 && velocity6<=64)
      )) {
      key='U'; 
      keyReleased(); //u=117
      formerEvent[69]=millis();
      print ("formerEvent[69] INSIDE"); 
      println (formerEvent[69]);
    }
    if ( measure>=123 && measure<=123 && beatTrigged==true 

      ) {
      //   key='9'; 
      //   keyReleased(); //u=117
      //   formerEvent[69]=millis();
    }
    if ( measure>=123+4 && measure<=123+4 && beatTrigged==true 

      ) {
      //    key='9'; 
      //    keyReleased(); //u=117
      //   formerEvent[69]=millis();
    }
    if ( measure>=123+8 && measure<=123+8 && beatTrigged==true 

      ) {
      key='9'; 
      keyReleased(); //u=117
      //   formerEvent[69]=millis();
    }
    if ( measure>=123+8 && measure<=123+8 && beatTrigged==true 

      ) {
      key='p'; 
      keyReleased(); //u=117
      //   formerEvent[69]=millis();
    }


    if (( measure<=11 && millis()>formerEvent[72]+350+d )&& //250 to adjust with 172 (the other hand of mad rush)
      ((note1>71 && note1<73  && velocity1>=1 && velocity1<=64)|| (note2>71 && note2<73 && velocity2>=1 && velocity2<=64) || (note3>71 && note3<73 && velocity3>=1 && velocity3<=64) ||
      (note4>71 && note4<73  && velocity4>=1 && velocity4<=64)|| (note5>71 && note5<73 && velocity5>=1 && velocity5<=64) || (note6>71 && note6<73 && velocity6>=1 && velocity6<=64)
      )) {

      key='U';//i= 105 
      keyReleased(); 
      formerEvent[72]=millis();
      print ("formerEvent[72] INSIDE"); 
      println (formerEvent[72]);
    }

    if (( measure>11 && measure<41 && millis()>formerEvent[72]+350+d-300 )&& //250 to adjust with 172 (the other hand of mad rush)
      ((note1>71 && note1<73  && velocity1>=1 && velocity1<=64)|| (note2>71 && note2<73 && velocity2>=1 && velocity2<=64) || (note3>71 && note3<73 && velocity3>=1 && velocity3<=64) ||
      (note4>71 && note4<73  && velocity4>=1 && velocity4<=64)|| (note5>71 && note5<73 && velocity5>=1 && velocity5<=64) || (note6>71 && note6<73 && velocity6>=1 && velocity6<=64)
      )) {

      key='U';//i= 105 
      keyReleased(); 
      formerEvent[72]=millis();
      print ("formerEvent[72] INSIDE"); 
      println (formerEvent[72]);
    }
    /*
      if (( measure>40 && measure<61 && millis()>formerEvent[72]+25+d) && // RETROUVE joli d. Plus coherent sur 64
     ((note1>71 && note1<73  && velocity1>=1 && velocity1<=64 )|| (note2>71 && note2<73 && velocity2>=1 && velocity2<=64) || (note3>71 && note3<73 && velocity3>=1 && velocity3<=64)||
     (note4>71 && note4<73  && velocity4>=1 && velocity4<=64 )|| (note5>71 && note5<73 && velocity5>=1 && velocity5<=64) || (note6>71 && note6<73 && velocity6>=1 && velocity6<=64)
     )) { 
     key='d'; 
     keyReleased(); 
     key='d'; 
     keyReleased(); 
     key='d';    
     formerEvent[72]=millis();
     }
     */
    if (( measure>25 && measure<35 && millis()>formerEvent[70]+300 )&& // from Track1 and Track 0
      (
      (note1>69 && note1<71  && velocity1>=1 && velocity1<=64)|| (note2>69 && note2<71 && velocity2>=1 && velocity2<=64) || (note3>69 && note3<71 && velocity3>=1 && velocity3<=64) || 
      (note4>69 && note4<71  && velocity4>=1 && velocity4<=64)|| (note5>69 && note5<71 && velocity5>=1 && velocity5<=64) || (note6>69 && note6<71 && velocity6>=1 && velocity6<=64)
      )) {
      // oscillatorBlocked=10;  
      key='R'; 
      keyReleased(); 
      //   key='f'; 
      //   keyReleased(); 

      formerEvent[70]=millis();
      print ("                                                   formerEvent[64] INSIDE> f  "); 
      println (formerEvent[64]);
    }



    if (( measure>40 && measure<61  && millis()>formerEvent[64]+100 )&& // from Track1 and Track 0
      (
      (note1>63 && note1<65  && velocity1>=1 && velocity1<=64)|| (note2>63 && note2<65 && velocity2>=1 && velocity2<=64) || (note3>63 && note3<65 && velocity3>=1 && velocity3<=64) || 
      (note4>63 && note4<65  && velocity4>=1 && velocity4<=64)|| (note5>63 && note5<65 && velocity5>=1 && velocity5<=64) || (note6>63 && note6<65 && velocity6>=1 && velocity6<=64)
      )) {
      oscillatorBlocked=10;  
      key='f'; 
      keyReleased(); 
      //   key='f'; 
      //   keyReleased(); 

      formerEvent[64]=millis();
      print ("                                                   formerEvent[64] INSIDE> f  "); 
      println (formerEvent[64]);
    }




    if (( measure>40 && measure<61  && millis()>formerEvent[69]+100 )&& // from Track1 and Track 0
      (
      (note1>68 && note1<70  && velocity1>=1 && velocity1<=64)|| (note2>68 && note2<70 && velocity2>=1 && velocity2<=64) || (note3>68 && note3<70 && velocity3>=1 && velocity3<=64) || 
      (note4>68 && note4<70  && velocity4>=1 && velocity4<=64)|| (note5>68 && note5<70 && velocity5>=1 && velocity5<=64) || (note6>68 && note6<70 && velocity6>=1 && velocity6<=64)
      )) {
      oscillatorBlocked=1;
      key='d'; 
      keyReleased(); 
      //  key='d'; 
      //  keyReleased(); 


      formerEvent[69]=millis();
      print ("                                                   formerEvent[69] INSIDE> d  "); 
      println (formerEvent[69]);
    }

    if (( measure>40 && measure<61  && millis()>formerEvent[67]+100 )&& // pour equilibrer le trop plein de f
      (
      (note1>66 && note1<68  && velocity1>=1 && velocity1<=64)|| (note2>68 && note2<68 && velocity2>=1 && velocity2<=64) || (note3>68 && note3<68 && velocity3>=1 && velocity3<=64) || 
      (note4>68 && note4<68  && velocity4>=1 && velocity4<=64)|| (note5>68 && note5<68 && velocity5>=1 && velocity5<=64) || (note6>68 && note6<68 && velocity6>=1 && velocity6<=64)
      )) {
      //   oscillatorBlocked=1;
      key='d'; 
      keyReleased(); 
      //  key='d'; 
      //  keyReleased(); 


      formerEvent[67]=millis();
      print ("                                                   formerEvent[67] INSIDE> d  "); 
      println (formerEvent[67]);
    }


    if (( measure>60 && measure<78 && millis()>formerEvent[72]+1000) && //25+d
      ((note1>71 && note1<73  && velocity1>=1 && velocity1<=64 )|| (note2>71 && note2<73 && velocity2>=1 && velocity2<=64) || (note3>71 && note3<73 && velocity3>=1 && velocity3<=64)||
      (note4>71 && note4<73  && velocity4>=1 && velocity4<=64 )|| (note5>71 && note5<73 && velocity5>=1 && velocity5<=64) || (note6>71 && note6<73 && velocity6>=1 && velocity6<=64)
      )) {
      // key='d'; 
      key='i'; // u bloque 
      keyReleased(); //u=117
      formerEvent[72]=millis();
    }

    if  ( measure>60 && measure<78 && (millis()>formerEvent[73]+0+d+150) &&
      ((note1>71+1 && note1<73+1  && velocity1>=1 && velocity1<=64 )|| (note2>71+1 && note2<73+1 && velocity2>=1 && velocity2<=64) || (note3>71+1 && note3<73+1 && velocity3>=1 && velocity3<=64) ||
      (note4>71+1 && note4<73+1  && velocity4>=1 && velocity4<=64 )|| (note5>71+1 && note5<73+1 && velocity5>=1 && velocity5<=64) || (note6>71+1 && note6<73+1 && velocity6>=1 && velocity6<=64)
      )) {
      //  key='d';
      //  key='U';
      //    keyReleased(); //u=117
      formerEvent[73]=millis();
    }



    if ((( measure<41 && measure<41) && (millis()>formerEvent[74]+100)) &&
      ((note1>73 && note1<75 && velocity1>=1 && velocity1<=64)|| (note2>73 && note2<75 && velocity2>=1 && velocity2<=64)|| (note3>73 && note3<75 && velocity3>=1 && velocity3<=64) ||
      (note4>73 && note4<75 && velocity4>=1 && velocity4<=64)|| (note5>73 && note5<75 && velocity5>=1 && velocity5<=64)|| (note6>73 && note6<75 && velocity6>=1 && velocity6<=64)
      )) {
      key='r';
      keyReleased();
      key='r';
      keyReleased();
      formerEvent[74]=millis();
    }
    if (( measure>61 && measure<78 && millis()>formerEvent[74]+200) &&  // wiat 200 ms before consideration of the next event 74. Here is note 74
      ((note1>73 && note1<75 && velocity1>=1 && velocity1<=64)|| (note2>73 && note2<75 && velocity2>=1 && velocity2<=64)|| (note3>73 && note3<75 && velocity3>=1 && velocity3<=64) ||
      (note4>73 && note4<75 && velocity4>=1 && velocity4<=64)|| (note5>73 && note5<75 && velocity5>=1 && velocity5<=64)|| (note6>73 && note6<75 && velocity6>=1 && velocity6<=64)
      )) {

      oscillatorBlocked=6; 
      key='f'; 
      keyReleased();//i= 105
      ///   key='f'; 
      //  keyReleased();//i= 105
      formerEvent[74]=millis();
    }

    if  ( measure<78 && millis()>formerEvent[75]+0+d &&

      ((note1>73+1 && note1<75+1 && velocity1>=1 && velocity1<=64)|| (note2>73+1 && note2<75+1 && velocity2>=1 && velocity2<=64) || (note3>73+1 && note3<75+1 && velocity3>=1 && velocity3<=64) ||
      (note4>73+1 && note4<75+1 && velocity4>=1 && velocity4<=64)|| (note5>73+1 && note5<75+1 && velocity5>=1 && velocity5<=64) || (note6>73+1 && note6<75+1 && velocity6>=1 && velocity6<=64)
      )) {

      //  key='k'; 
      //  keyReleased();//i= 105

      formerEvent[75]=millis();
    }



    if  (note1>65 && note1<67 && velocity1 >79  && velocity1 <81) {

      //     key='J'; keyReleased();
    }
    if  (note1>73 && note1<75 && velocity1 >79  && velocity1 <81) {//
      //   key='f'; keyReleased();
      //      key='K'; keyReleased();



      if  (   (note1>59 && note1<61 && velocity1 >95 && velocity1 <97) || (note2>59 && note2<61 && velocity2 >95 && velocity2 <97)) {
        //       if  (note1<1){
        //  key='p'; keyReleased();
        //    formerFrame=millis();

        //   key='p'; 
        //   keyReleased();//p=112;
        //   formerEvent[60]=millis();

        //    key='d'; keyReleased();
        //     formerKey=key;

        // doNothing();
      }   

      if  (   (note1>75 && note1<77) || (note2>75 && note2<77)  ) {

        //   key='d'; 
        //   keyReleased();//d=100;
        formerEvent[76]=millis();
      }
      if  (note2>82 && note2<84 || note1>82 && note1<84) {

        //   key='f'; 
        //   keyReleased();//f=102
        formerEvent[83]=millis();
        //    key='g'; keyReleased();
        //     key='g'; keyReleased();
        //    doNothing();
      }
    }
  }
}


void  autoNote2() {//1 61 63 64 66 85 
 // keyPressedLFO();

  print (millis()); 
  print (" auto2  formerEvent[167]  "); 
  print (formerEvent[167]);
  print (" auto2  formerEvent[172]  "); 
  println (formerEvent[172]);

  if ((formerSartKey!='L') 
    ) 
  {
    if  (measure>40 && measure<=41 && beatTrigged==true  ) {// measure>=41 && measure<=42
      for (int i = 0; i < networkSize; i++) {

        //   key='W'; 
        //   keyReleased();
        //  formerW();
      }
    }
    if  (measure>41 && measure<=42  && beatTrigged==true  ) {// measure>=41 && measure<=42
      for (int i = 0; i < networkSize; i++) {

        //    ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
        //     ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
        //    key=';';keyPressed(); print ("rise up frameratio +5 ");
        //    key=';';keyPressed(); print ("rise up frameratio +5 ");
        //    key=';';keyPressed(); print ("rise up frameratio +5 ");
      }
    }
    //%ADMAD
    if (( measure<=40 && millis()>formerEvent[167]+450+d)&&
      ((note1>66 && note1<68  && velocity1>=96 && velocity1<=96)|| (note2>66 && note2<68 && velocity2>=96 && velocity2<=96) || (note3>66 && note3<68 && velocity3>=96 && velocity3<=96))) {
      formerEvent[167]=millis();
      //  key='E'; 
      //  keyReleased(); //u=117


      print ("formerEvent[167] INSIDE ");  
      print ("formerEvent[167] INSIDE ");  
      print ("formerEvent[167] INSIDE ");   
      print ("formerEvent[167] INSIDE "); 
      println (formerEvent[167]);
    }

    if (( measure<=40 && millis()>formerEvent[169]+1000+d)&&
      ((note1>68 && note1<70  && velocity1>=96 && velocity1<=96)|| (note2>68 && note2<70 && velocity2>=96 && velocity2<=96) || (note3>68 && note3<70 && velocity3>=96 && velocity3<=96))) {

      key='E'; //E=69
      keyReleased(); //u=117
      formerEvent[169]=millis(); 

      print ("formerEvent[169] INSIDE ");  
      println (formerEvent[169]);
    } 

    if (( measure>40 && measure<75 && millis()>formerEvent[169]+450+d)&&
      ((note1>68 && note1<70  && velocity1>=96 && velocity1<=96)|| (note2>68 && note2<70 && velocity2>=96 && velocity2<=96) || (note3>68 && note3<70 && velocity3>=96 && velocity3<=96))) {

      key='P'; //P=80
      keyReleased(); //u=117


      print ("formerEvent[169] INSIDE ");  
      println (formerEvent[169]);
      formerEvent[169]=millis();
    } 

    if (( measure>78 && measure<=129 && millis()>formerEvent[169]+2950 )  && //1400 with P
      ((note1>68 && note1<70  && velocity1>=96 && velocity1<=96)|| (note2>68 && note2<70 && velocity2>=96 && velocity2<=96) || (note3>68 && note3<70 && velocity3>=96 && velocity3<=96))) {

   //   key='R'; //P=80    R when frequency are negative
      key='p';
      keyReleased(); //u=117
      key='#'; //P=80    R when frequency are negative
      //  keyReleased(); //u=117

      formerEvent[169]=millis();
      print ("formerEvent[269] INSIDE ");  
      println (formerEvent[169]);
    } 
    
     if (( measure>=80 && measure<=80 && beatPrecised>=1 && beatPrecised<=1 && beatPrecisedTrigged==true )
      ) {
      //    key='p';keyReleased();
    //      keyCode=CONTROL;keyReleased();
          key='#';
    }
    
         if (( measure>=83 && measure<=83 && beatPrecised>=1 && beatPrecised<=1 && beatPrecisedTrigged==true )
      ) {
        //  key='p';keyReleased();
      //    keyCode=CONTROL;keyReleased();
          key='#';
    }



    if (( measure<=5 && millis()>formerEvent[172]+300+d)&&
      ((note1>71 && note1<73  && velocity1>=96 && velocity1<=96 )|| (note2>71 && note2<73 && velocity2>=96 && velocity2<=96) || (note3>71 && note3<73 && velocity3>=96 && velocity3<=96))) {

      //   key='i';//i= 105 
      oscillatorBlocked=6;
      //     key='d';
      //   key='f'; //f=102;
      //  keyReleased();
      formerEvent[172]=millis();
      print ("formerEvent[172] INSIDE ");  
      print ("formerEvent[172] INSIDE ");  
      print ("formerEvent[172] INSIDE ");  
      print ("formerEvent[172] INSIDE "); 
      println (formerEvent[172]);
    }
    if ((( measure>40 && measure<61) && (millis()>formerEvent[172]+100+d) && //200
      ((note1>71 && note1<73  && velocity1>=96 && velocity1<=96 )|| (note2>71 && note2<73 && velocity2>=96 && velocity2<=96) || (note3>71 && note3<73 && velocity3>=96 && velocity3<=96)))) {
      //   key='t'; keyReleased();//i= 105   
      //     key='d';//   to much case d with autonote1
      //     keyReleased(); 
      //     key='d'; 
      //     keyReleased(); 
      formerEvent[172]=millis();
    }
    if (( measure>60 && (millis()>formerEvent[172]+200+d) &&
      ((note1>71 && note1<73  && velocity1>=96 && velocity1<=96 )|| (note2>71 && note2<73 && velocity2>=96 && velocity2<=96) || (note3>71 && note3<73 && velocity3>=96 && velocity3<=96)))) {
      // key='d'; 
      //  key='u'; 
      //   keyReleased(); //u=117
      formerEvent[172]=millis();
    }

    if  ( (millis()>formerEvent[173]+1000+d) &&
      ((note1>71+1 && note1<73+1  && velocity1>=96 && velocity1<=96 )|| (note2>71+1 && note2<73+1 && velocity2>=96 && velocity2<=96) || (note3>71+1 && note3<73+1 && velocity3>=96 && velocity3<=96))) {
      //  key='d';
      //    key='i';
      //   keyReleased(); //u=117
      formerEvent[173]=millis();
    }
    if ((( measure<41 && measure<41) && (millis()>formerEvent[174]+200+d)) &&
      ((note1>73 && note1<75 && velocity1>=96 && velocity1<=96)|| (note2>73 && note2<75 && velocity2>=96 && velocity2<=96)|| (note3>73 && note3<75 && velocity3>=96 && velocity3<=96))) {
      //   key='u'; //u=117 
      //   key='d'; //u=117 
      //   keyReleased();
      formerEvent[174]=millis();
    }
    if ((( measure>41 && measure<78) && (millis()>formerEvent[174]+200+d) &&
      ((note1>73 && note1<75 && velocity1>=96 && velocity1<=96)|| (note2>73 && note2<75 && velocity2>=96 && velocity2<=96)))) {

      //      key='t'; keyReleased();//i= 105 
  //***    key='d'; 
      keyReleased();//i= 105
      //  key='d'; 
      //  keyReleased();//i= 105
      formerEvent[174]=millis();
    }

    if  ( millis()>formerEvent[175]+300 &&

      ((note1>73+1 && note1<75+1 && velocity1>=96 && velocity1<=96)|| (note2>73+1 && note2<75+1 && velocity2>=96 && velocity2<=96))) {


   //   key='f';  
    //  keyReleased();//i= 105
    
      /*
        keyReleased();//i= 105
       key='f'; 
       keyReleased();//i= 105
       key='f'; 
       keyReleased();//i= 105
       key='f'; 
       keyReleased();//i= 105
       */
      formerEvent[175]=millis();
    }



    if  (note1>65 && note1<67 && velocity1 >79  && velocity1 <81) {
      //       if  (note1<1){
      //  key='p'; keyReleased();

      //   key='d'; keyReleased();
      //     key='J'; keyReleased();

      //       formerFrame=millis();
      // doNothing();
    }
    if  (note1>73 && note1<75 && velocity1 >79  && velocity1 <81) {//
      //   key='f'; keyReleased();
      //      key='K'; keyReleased();

      //       formerFrame=millis();

      //     key='f'; keyReleased();
      //   doNothing();
    }
    /////TRACK 0 BEAT from MADRUSH 

    //   if  ((note1>0 && note1<6  && velocity1 >79 ) || (note2>0 && note2<6  && velocity2 >79 ) || (note3>0 && note3<6  && velocity3 >79 ) 
    //     || (note4>0 && note4<6  && velocity4 >79 ) || (note5>0 && note5<6  && velocity5 >79 ) || (note6>0 && note6<6  && velocity6 >79 ) 
    //   ){
    ///      if  ((note1>84 && note1<86  && velocity1 >78 && velocity1 <201) || (note2>84 && note2<86  && velocity2 >78  && velocity2 <201)
    //     ||   (note3>84 && note3<86  && velocity3 >78 && velocity3 <201)){  

    if  (   (note1>59 && note1<61 && velocity1 >95 && velocity1 <97) || (note2>59 && note2<61 && velocity2 >95 && velocity2 <97)) {
      //       if  (note1<1){
      //  key='p'; keyReleased();
      //    formerFrame=millis();

      //    key='p'; 
      keyReleased();//p=112;
      formerEvent[160]=millis();

      //    key='d'; keyReleased();
      //     formerKey=key;

      // doNothing();
    }   

    if  (   (note1>75 && note1<77) || (note2>75 && note2<77)) {
      //       if  (note1<1){
      //  key='p'; keyReleased();
      //    formerFrame=frameCount;

      //  key='d'; 
      keyReleased();//d=100;
      formerEvent[176]=millis();
      //    key='d'; keyReleased();
      //    formerKey=key;

      // doNothing();
    }
    if  (note2>82 && note2<84 || note1>82 && note1<84) {

  //***    key='d'; 
  //**    keyReleased();//f=102
      formerEvent[183]=millis();
      //    key='g'; keyReleased();
      //     key='g'; keyReleased();
      //    doNothing();
    }
  }
} 

void autoNote1Original() {//1 61 63 64 66 85 
  keyPressedLFO();


//  if (((formerSartKey!='a')) 
   if (((formerSartKey!='L')) 
    ) 
  {
    if  (measure>40 && measure<=41  && beatTrigged==true  ) {// measure>=41 && measure<=42
      for (int i = 0; i < networkSize; i++) {

        //   key='W'; 
        //   keyReleased();
      }
    }
    if  (measure>41 && measure<=42  && beatTrigged==true  ) {// measure>=41 && measure<=42
      for (int i = 0; i < networkSize; i++) {

        //    ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
      }
    }
    //%ADMAD
    if (( measure<=40 && millis()>formerEvent[67]+50+d )&&
      (
      (note1>66 && note1<68  && velocity1!=0)|| (note2>66 && note2<68 && velocity2!=0) || (note3>66 && note3<68 && velocity3!=0) || 
      (note4>66 && note4<68  && velocity4!=0)|| (note5>66 && note5<68 && velocity5!=0) || (note6>66 && note6<68 && velocity6!=0)
      )) {
      key='E'; 
      keyReleased(); //u=117
      formerEvent[67]=millis();
      print ("formerEvent[67] INSIDE"); 
      println (formerEvent[67]);
    }

    if (( measure<=40 && millis()>formerEvent[64]+50+d )&&
      (
      (note1>63 && note1<65  && velocity1!=0)|| (note2>63 && note2<65 && velocity2!=0) || (note3>63 && note3<65 && velocity3!=0) || 
      (note4>63 && note4<65  && velocity4!=0)|| (note5>63 && note5<65 && velocity5!=0) || (note6>63 && note6<65 && velocity6!=0)
      )) {
      key='f'; 
      //     keyReleased(); //u=117
      formerEvent[64]=millis();
      print ("formerEvent[64] INSIDE"); 
      println (formerEvent[64]);
    }

    if (( measure<=40  && millis()>formerEvent[69]+50+d )&& // from Track1
      (
      (note1>68 && note1<70  && velocity1!=0)|| (note2>68 && note2<70 && velocity2!=0) || (note3>68 && note3<70 && velocity3!=0) || 
      (note4>68 && note4<70  && velocity4!=0)|| (note5>68 && note5<70 && velocity5!=0) || (note6>68 && note6<70 && velocity6!=0)
      )) {
      key='r'; 
      keyReleased(); //u=117
      formerEvent[69]=millis();
      print ("formerEvent[69] INSIDE"); 
      println (formerEvent[69]);
    }
    if (( measure>=123 && millis()>formerEvent[69]+100+d )&&
      (
      (note1>68 && note1<70  && velocity1!=0)|| (note2>68 && note2<70 && velocity2!=0) || (note3>68 && note3<70 && velocity3!=0) || 
      (note4>68 && note4<70  && velocity4!=0)|| (note5>68 && note5<70 && velocity5!=0) || (note6>68 && note6<70 && velocity6!=0)
      )) {
      key='U'; 
      keyReleased(); //u=117
      formerEvent[69]=millis();
      print ("formerEvent[69] INSIDE"); 
      println (formerEvent[69]);
    }
    if ( measure>=123 && measure<=123 && beatTrigged==true 

      ) {
 //     key='9'; 
 //     keyReleased(); //u=117
      //   formerEvent[69]=millis();
    }
    if ( measure>=123+4 && measure<=123+4 && beatTrigged==true 

      ) {
  //    key='9'; 
  //    keyReleased(); //u=117
      //   formerEvent[69]=millis();
    }
    if ( measure>=123+8 && measure<=123+8 && beatTrigged==true 

      ) {
      key='9'; 
      keyReleased(); //u=117
      //   formerEvent[69]=millis();
    }
    if ( measure>=123+8 && measure<=123+8 && beatTrigged==true 

      ) {
      key='p'; 
      keyReleased(); //u=117
      //   formerEvent[69]=millis();
    }


    if (( measure<=40 && millis()>formerEvent[72]+100+d )&& // to adjust with 172 (the other hand of mad rush)
      ((note1>71 && note1<73  && velocity1!=0)|| (note2>71 && note2<73 && velocity2!=0) || (note3>71 && note3<73 && velocity3!=0) ||
      (note4>71 && note4<73  && velocity4!=0)|| (note5>71 && note5<73 && velocity5!=0) || (note6>71 && note6<73 && velocity6!=0)
      )) {

      key='U';//i= 105 
      //    key='f';
      keyReleased(); 
      formerEvent[72]=millis();
      print ("formerEvent[72] INSIDE"); 
      println (formerEvent[72]);
    }

    if (( measure>40 && measure<61 && millis()>formerEvent[72]+0+d) && // RETROUVE joli d
      ((note1>71 && note1<73  && velocity1!=0 )|| (note2>71 && note2<73 && velocity2!=0) || (note3>71 && note3<73 && velocity3!=0)||
      (note4>71 && note4<73  && velocity4!=0 )|| (note5>71 && note5<73 && velocity5!=0) || (note6>71 && note6<73 && velocity6!=0)
      )) {
      //   key='t'; keyReleased();//i= 105   
      key='d'; 
      keyReleased(); 
      key='d'; 
      keyReleased(); 

      formerEvent[72]=millis();
    }

    if (( measure>60 && measure<78 && millis()>formerEvent[72]+150+d) &&
      ((note1>71 && note1<73  && velocity1!=0 )|| (note2>71 && note2<73 && velocity2!=0) || (note3>71 && note3<73 && velocity3!=0)||
      (note4>71 && note4<73  && velocity4!=0 )|| (note5>71 && note5<73 && velocity5!=0) || (note6>71 && note6<73 && velocity6!=0)
      )) {
      // key='d'; 
      key='u'; 
      keyReleased(); //u=117
      formerEvent[72]=millis();
    }

    if  ( (millis()>formerEvent[73]+0+d+150) &&
      ((note1>71+1 && note1<73+1  && velocity1!=0 )|| (note2>71+1 && note2<73+1 && velocity2!=0) || (note3>71+1 && note3<73+1 && velocity3!=0) ||
      (note4>71+1 && note4<73+1  && velocity4!=0 )|| (note5>71+1 && note5<73+1 && velocity5!=0) || (note6>71+1 && note6<73+1 && velocity6!=0)
      )) {
      //  key='d';
      key='U';
      keyReleased(); //u=117
      formerEvent[73]=millis();
    }
    if ((( measure<41 && measure<41) && (millis()>formerEvent[74]+0+d)) &&
      ((note1>73 && note1<75 && velocity1!=0)|| (note2>73 && note2<75 && velocity2!=0)|| (note3>73 && note3<75 && velocity3!=0) ||
      (note4>73 && note4<75 && velocity4!=0)|| (note5>73 && note5<75 && velocity5!=0)|| (note6>73 && note6<75 && velocity6!=0)
      )) {
      key='u'; //u=117 
      //   key='d'; //u=117 
      keyReleased();
      formerEvent[74]=millis();
    }
    if (( measure>41 && measure<78 && millis()>formerEvent[74]+0+d) &&
      ((note1>73 && note1<75 && velocity1!=0)|| (note2>73 && note2<75 && velocity2!=0)|| (note3>73 && note3<75 && velocity3!=0) ||
      (note4>73 && note4<75 && velocity4!=0)|| (note5>73 && note5<75 && velocity5!=0)|| (note6>73 && note6<75 && velocity6!=0)
      )) {

      //      key='t'; keyReleased();//i= 105 
      key='f'; 
      keyReleased();//i= 105
      ///   key='f'; 
      //  keyReleased();//i= 105
      formerEvent[74]=millis();
    }

    if  ( measure<78 && millis()>formerEvent[75]+0+d &&

      ((note1>73+1 && note1<75+1 && velocity1!=0)|| (note2>73+1 && note2<75+1 && velocity2!=0) || (note3>73+1 && note3<75+1 && velocity2!=0) ||
      (note4>73+1 && note4<75+1 && velocity4!=0)|| (note5>73+1 && note5<75+1 && velocity5!=0) || (note6>73+1 && note6<75+1 && velocity6!=0)
      )) {

      key='k'; 
      keyReleased();//i= 105

      formerEvent[75]=millis();
    }



    if  (note1>65 && note1<67 && velocity1 >79  && velocity1 <81) {

      //     key='J'; keyReleased();
    }
    if  (note1>73 && note1<75 && velocity1 >79  && velocity1 <81) {//
      //   key='f'; keyReleased();
      //      key='K'; keyReleased();



      if  (   (note1>59 && note1<61 && velocity1 >95 && velocity1 <97) || (note2>59 && note2<61 && velocity2 >95 && velocity2 <97)) {
        //       if  (note1<1){
        //  key='p'; keyReleased();
        //    formerFrame=millis();

        key='p'; 
        keyReleased();//p=112;
        formerEvent[60]=millis();

        //    key='d'; keyReleased();
        //     formerKey=key;

        // doNothing();
      }   

      if  (   (note1>75 && note1<77) || (note2>75 && note2<77)  ) {

        //   key='d'; 
        //   keyReleased();//d=100;
        formerEvent[76]=millis();
      }
      if  (note2>82 && note2<84 || note1>82 && note1<84) {

        //   key='f'; 
        //   keyReleased();//f=102
        formerEvent[83]=millis();
        //    key='g'; keyReleased();
        //     key='g'; keyReleased();
        //    doNothing();
      }
    }
  }
} 

void autoNote1() {//1 61 63 64 66 85 
  keyPressedLFO();


  if (((formerSartKey!='a')) 
    ) 
  {

    if  (measure>13 && measure<=14  && beatTrigged==true ) {// beatPrecised2=true
      for (int i = 0; i < networkSize; i++) {
        key=CONTROL;
        keyReleased();

        //   key='W'; 
        //   keyReleased();
      }
    }
    if  (measure>23 && measure<=24  && beatTrigged==true ) {// beatPrecised2=true
      for (int i = 0; i < networkSize; i++) {
        key=CONTROL;
        keyReleased();

        //   key='W'; 
        //   keyReleased();
      }
    }
    if  (measure>40 && measure<=41  && beatTrigged==true  ) {// measure>=41 && measure<=42
      for (int i = 0; i < networkSize; i++) {
        key='0';
        keyReleased();
        key='q';
        keyReleased();
        key='n';
        keyReleased();
        key='q';
        keyReleased();
        key='n';
        keyReleased();
        key='o';
        keyReleased();

        //   key='W'; 
        //   keyReleased();
      }
    }
    if  (measure>41 && measure<=42  && beatTrigged==true  ) {// measure>=41 && measure<=42
      for (int i = 0; i < networkSize; i++) {

        //    ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
      }
    }
    //%ADMAD
    if (( measure<=40 && millis()>formerEvent[67]+50+d )&&
      (
      (note1>66 && note1<68  && velocity1!=0)|| (note2>66 && note2<68 && velocity2!=0) || (note3>66 && note3<68 && velocity3!=0) || 
      (note4>66 && note4<68  && velocity4!=0)|| (note5>66 && note5<68 && velocity5!=0) || (note6>66 && note6<68 && velocity6!=0)
      )) {
      //   key='E'; 
      //    key='r'; 
      keyReleased(); //u=117
      formerEvent[67]=millis();
      print ("formerEvent[67] INSIDE"); 
      println (formerEvent[67]);
    }

    if (( measure<=15 && millis()>formerEvent[64]+350+d )&&
      (
      (note1>63 && note1<65  && velocity1!=0)|| (note2>63 && note2<65 && velocity2!=0) || (note3>63 && note3<65 && velocity3!=0) || 
      (note4>63 && note4<65  && velocity4!=0)|| (note5>63 && note5<65 && velocity5!=0) || (note6>63 && note6<65 && velocity6!=0)
      )) {
      key='f'; 
      //     keyReleased(); //u=117
      formerEvent[64]=millis();
      print ("formerEvent[64] INSIDE"); 
      println (formerEvent[64]);
    }

    if (( measure<=40  && millis()>formerEvent[69]+900+d )&& // from Track1 and Track 0
      (
      (note1>68 && note1<70  && velocity1!=0)|| (note2>68 && note2<70 && velocity2!=0) || (note3>68 && note3<70 && velocity3!=0) || 
      (note4>68 && note4<70  && velocity4!=0)|| (note5>68 && note5<70 && velocity5!=0) || (note6>68 && note6<70 && velocity6!=0)
      )) {
      //      key='r'; 
      keyReleased(); //u=117
      formerEvent[69]=millis();
      print ("formerEvent[69] INSIDE"); 
      println (formerEvent[69]);
    }
    if (( measure>=123 && millis()>formerEvent[69]+100+d )&&
      (
      (note1>68 && note1<70  && velocity1!=0)|| (note2>68 && note2<70 && velocity2!=0) || (note3>68 && note3<70 && velocity3!=0) || 
      (note4>68 && note4<70  && velocity4!=0)|| (note5>68 && note5<70 && velocity5!=0) || (note6>68 && note6<70 && velocity6!=0)
      )) {
      key='U'; 
      keyReleased(); //u=117
      formerEvent[69]=millis();
      print ("formerEvent[69] INSIDE"); 
      println (formerEvent[69]);
    }
    if ( measure>=123 && measure<=123 && beatTrigged==true 

      ) {
      key='9'; 
      keyReleased(); //u=117
      //   formerEvent[69]=millis();
    }
    if ( measure>=123+4 && measure<=123+4 && beatTrigged==true 

      ) {
      key='9'; 
      keyReleased(); //u=117
      //   formerEvent[69]=millis();
    }
    if ( measure>=123+8 && measure<=123+8 && beatTrigged==true 

      ) {
      key='9'; 
      keyReleased(); //u=117
      //   formerEvent[69]=millis();
    }
    if ( measure>=123+8 && measure<=123+8 && beatTrigged==true 

      ) {
      key='p'; 
      keyReleased(); //u=117
      //   formerEvent[69]=millis();
    }


    if (( measure<=40 && millis()>formerEvent[72]+100+d )&& // to adjust with 172 (the other hand of mad rush)
      ((note1>71 && note1<73  && velocity1!=0)|| (note2>71 && note2<73 && velocity2!=0) || (note3>71 && note3<73 && velocity3!=0) ||
      (note4>71 && note4<73  && velocity4!=0)|| (note5>71 && note5<73 && velocity5!=0) || (note6>71 && note6<73 && velocity6!=0)
      )) {

      key='U';//i= 105 
      //    key='f';
      keyReleased(); 
      formerEvent[72]=millis();
      print ("formerEvent[72] INSIDE"); 
      println (formerEvent[72]);
    }

    if (( measure>40 && measure<61 && millis()>formerEvent[72]+100+d) && // RETROUVE joli d
      ((note1>71 && note1<73  && velocity1!=0 )|| (note2>71 && note2<73 && velocity2!=0) || (note3>71 && note3<73 && velocity3!=0)||
      (note4>71 && note4<73  && velocity4!=0 )|| (note5>71 && note5<73 && velocity5!=0) || (note6>71 && note6<73 && velocity6!=0)
      )) {
      //   key='t'; keyReleased();//i= 105   
      key='d'; 
      keyReleased(); 
      key='d'; 
      keyReleased(); 

      formerEvent[72]=millis();
    }

    if (( measure>60 && measure<78 && millis()>formerEvent[72]+150+d) &&
      ((note1>71 && note1<73  && velocity1!=0 )|| (note2>71 && note2<73 && velocity2!=0) || (note3>71 && note3<73 && velocity3!=0)||
      (note4>71 && note4<73  && velocity4!=0 )|| (note5>71 && note5<73 && velocity5!=0) || (note6>71 && note6<73 && velocity6!=0)
      )) {
      // key='d'; 
      key='i'; // u bloque 
      keyReleased(); //u=117
      formerEvent[72]=millis();
    }

    if  ( measure>60 && measure<78 && (millis()>formerEvent[73]+0+d+150) &&
      ((note1>71+1 && note1<73+1  && velocity1!=0 )|| (note2>71+1 && note2<73+1 && velocity2!=0) || (note3>71+1 && note3<73+1 && velocity3!=0) ||
      (note4>71+1 && note4<73+1  && velocity4!=0 )|| (note5>71+1 && note5<73+1 && velocity5!=0) || (note6>71+1 && note6<73+1 && velocity6!=0)
      )) {
      //  key='d';
      //  key='U';
      keyReleased(); //u=117
      formerEvent[73]=millis();
    }
    if ((( measure<41 && measure<41) && (millis()>formerEvent[74]+50+d)) &&
      ((note1>73 && note1<75 && velocity1!=0)|| (note2>73 && note2<75 && velocity2!=0)|| (note3>73 && note3<75 && velocity3!=0) ||
      (note4>73 && note4<75 && velocity4!=0)|| (note5>73 && note5<75 && velocity5!=0)|| (note6>73 && note6<75 && velocity6!=0)
      )) {
      //  key='u'; //u=117 
      //   key='d'; //u=117 
      key='i'; //u=117 
      keyReleased();
      formerEvent[74]=millis();
    }
    if (( measure>41 && measure<78 && millis()>formerEvent[74]+0+d) &&
      ((note1>73 && note1<75 && velocity1!=0)|| (note2>73 && note2<75 && velocity2!=0)|| (note3>73 && note3<75 && velocity3!=0) ||
      (note4>73 && note4<75 && velocity4!=0)|| (note5>73 && note5<75 && velocity5!=0)|| (note6>73 && note6<75 && velocity6!=0)
      )) {

      //      key='t'; keyReleased();//i= 105 
      key='f'; 
      keyReleased();//i= 105
      ///   key='f'; 
      //  keyReleased();//i= 105
      formerEvent[74]=millis();
    }

    if  ( measure<78 && millis()>formerEvent[75]+0+d &&

      ((note1>73+1 && note1<75+1 && velocity1!=0)|| (note2>73+1 && note2<75+1 && velocity2!=0) || (note3>73+1 && note3<75+1 && velocity2!=0) ||
      (note4>73+1 && note4<75+1 && velocity4!=0)|| (note5>73+1 && note5<75+1 && velocity5!=0) || (note6>73+1 && note6<75+1 && velocity6!=0)
      )) {

      key='k'; 
      keyReleased();//i= 105

      formerEvent[75]=millis();
    }



    if  (note1>65 && note1<67 && velocity1 >79  && velocity1 <81) {

      //     key='J'; keyReleased();
    }
    if  (note1>73 && note1<75 && velocity1 >79  && velocity1 <81) {//
      //   key='f'; keyReleased();
      //      key='K'; keyReleased();



      if  (   (note1>59 && note1<61 && velocity1 >95 && velocity1 <97) || (note2>59 && note2<61 && velocity2 >95 && velocity2 <97)) {
        //       if  (note1<1){
        //  key='p'; keyReleased();
        //    formerFrame=millis();

        key='p'; 
        keyReleased();//p=112;
        formerEvent[60]=millis();

        //    key='d'; keyReleased();
        //     formerKey=key;

        // doNothing();
      }   

      if  (   (note1>75 && note1<77) || (note2>75 && note2<77)  ) {

        //   key='d'; 
        //   keyReleased();//d=100;
        formerEvent[76]=millis();
      }
      if  (note2>82 && note2<84 || note1>82 && note1<84) {

        //   key='f'; 
        //   keyReleased();//f=102
        formerEvent[83]=millis();
        //    key='g'; keyReleased();
        //     key='g'; keyReleased();
        //    doNothing();
      }
    }
  }
}