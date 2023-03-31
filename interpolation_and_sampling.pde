
float []  sampledModifiedChecking = new float [1000000000];
/*
class Sample {
  int t;
  float x, y;
  Sample( int t, float x, float y ) {
    this.t = t;  this.x = x;  this.y = y;
  }
}

class Sampler {
  
  ArrayList<Sample> samples;
  ArrayList<Sample> samplesModified;
  int startTime;
  int playbackFrame;
  
  Sampler() {
    samples = new ArrayList<Sample>();
        samplesModified = new ArrayList<Sample>();
    startTime = 0;
  }
  void beginRecording() {   
    samples = new ArrayList<Sample>();
    samplesModified = new ArrayList<Sample>();
    playbackFrame = 0;
  }
  void addSample( float x, float y ) {  // add sample when bRecording
    int now = millis();
    if( samples.size() == 0 ) startTime = now;
    samples.add( new Sample( now - startTime, x, y ) );
  }
  int fullTime() {
    return ( samples.size() > 1 ) ? 
    samples.get( samples.size()-1 ).t : 0;
  }

  void beginPlaying() {
    startTime = millis();
    playbackFrame = 0;
    println( samples.size(), "samples over", fullTime(), "milliseconds" );
    if ( samples.size()>0 ){

      
   

  
       float firstAngle = samples.get(0).y ;
       float lastAngle =  samples.get(samples.size()-1).y ;

        println (" firstAngle" + firstAngle + " " + lastAngle + " " );
      

      for (int i = 0; i < int (numberOfPointInterpolated); i++) {
    
       interpolatedAngle[i]  = lerp(firstAngle, lastAngle, i/float (numberOfPointInterpolated));       
       println (" interp " + i + " " + interpolatedAngle[i] + " " );
       fill( 255, 127*i, 127*i );
       circle ( 200* cos ( interpolatedAngle[i]), 200*sin ( interpolatedAngle[i]), 200);
    //   circle ( 100* cos ( interpolatedAngle[i])+400, 100*sin ( interpolatedAngle[i])+400, 200);
      // circle ( 100* cos ( newPosF[i])+400, 100*sin ( newPosF[i])+400, 200);
      // circle ( 100* cos ( newPosF[i])+400, 100*sin ( newPosF[i])+400, 200);
      
        }



           for(int i = samples.size() - 2; i < samples.size() - 0; i++) {
      
            println ( " i size-0  " + i + " i-samples.size()+3 " +  (i- samples.size()+3));
     
         }


        for(int i = samples.size() - 3; i < samples.size() - 1; i++) {

          println ( " i size-1 " + i + " i-samples.size()+3 " +  (i- samples.size()+3));
        
      //  samples.add( new Sample(  i, interpolatedAngle[i -samples.size() +3], interpolatedAngle[i -samples.size() +3] ) );

           }

         for (int i = 0; i < int (numberOfPointInterpolated); i++) {
           // add interpo to the end
   
            samples.add( new Sample(  samples.size() -1 - numberOfPointInterpolated + i, interpolatedAngle[i ], interpolatedAngle[i] ) );

             println( " interpolated and situa A bon " + (samples.size()-1 -  numberOfPointInterpolated + i)+ " " + samples.get(samples.size()-1 -  numberOfPointInterpolated + i).x);
             println( " interpolated and situa i " + (i)+ " " + samples.get(i).x);
             println( " interpolated and situa A " + (samples.size()-1 -  numberOfPointInterpolated + i)+ " " + samples.get(i).x);


           }
 
         for (int i = 0; i < int (numberOfPointInterpolated); i++) {
      println ( " (samples.size()-1 -  numberOfPointInterpolated + i) " + (samples.size()-1 -  numberOfPointInterpolated + i) );
      //      samples.add( new Sample(  i, interpolatedAngle[i], interpolatedAngle[i] ) );
      //****** for(int i = samples.size() - 3; i < samples.size() - 1; i++) {
     // samples.add( new Sample(  i, interpolatedAngle[samples.size() - i-2], interpolatedAngle[samples.size() - i-2] ) );
     //   samplesModified.add( new Sample( (samples.size()- i-2), interpolatedAngle[(samples.size()- i-2)], interpolatedAngle[(samples.size()- i-2)] ) );
    
         }
       }
       
   
     // samplesModified.add( new Sample(samples.get(0).t, samples.get(0).x , samples.get(0).y ) );
         for(int i = 0; i < samples.size() - 1; i++) {
//      samplesModified.add( new Sample(samples.get(i+0).t, samples.get(i+1).x ,  samples.get(i+1).y ) ) ;
        samplesModified.add( new Sample(samples.get(i+1).t, samples.get(i+1).x ,  samples.get(i+1).y ) ) ;
      if (i==samples.size()-1 -  numberOfPointInterpolated ){
        println (   " interpolated modif and situa A bon " +  i+ " " + samplesModified.get(i).x);
      }
       }
      for(int i = 0; i < samples.size() - 1; i++) {
        
     //   dist += sqrt((samples.get(i).x - samples.get(i +1 ).x)*(samples.get(i).x - samples.get(i +1 ).x) + (samples.get(i).y - samples.get(i +1 ).y)*(samples.get(i).y - samples.get(i +1 ).y));
      //  samplesModified.add( new Sample(samples.get(i+1).t, (int) (samples.get(i +1).x + (dist * deltax) / sumdist), (int) (samples.get(i+1).y +( dist * deltay )/ sumdist)) );
        print(samples.get(i).x);
        print(",");
        print(samples.get(i).y);
        print(",");
        print( " good data x " + i + " " + samplesModified.get(i).x);
        print(",");
        print( " good data y " + i + " " + samplesModified.get(i).y);
        println("");  

         sampledModifiedChecking[i] =    samplesModified.get(i).y;  
         // movementInterpolated =   samplesModified.get(i).y;  

      }
  }
 
 
  void draw() {
    stroke( 255 );
    
    //**RECORD
    beginShape(LINES);
    for( int i=1; i<samples.size()-1; i++) {
      vertex( samplesModified.get(i-1).x, samplesModified.get(i-1).y ); // replace vertex with Pvector
      vertex( samplesModified.get(i).x, samplesModified.get(i).y );
     //  movementInterpolated = samplesModified.get(i).y;

    }
    endShape();
    //**ENDRECORD
    
    //**REPEAT
    int now = (millis() - startTime) % fullTime();
    if( now < samplesModified.get( playbackFrame ).t ) playbackFrame = 0;
    while( samplesModified.get( playbackFrame+1).t < now )
      playbackFrame = (playbackFrame+1) % (samples.size()-1);
    Sample s0 = samplesModified.get( playbackFrame );
    Sample s1 = samplesModified.get( playbackFrame+1 );
    float t0 = s0.t;
    float t1 = s1.t;
    float dt = (now - t0) / (t1 - t0);

  //***float x =constrain (lerp( s0.x, s1.x, dt ),-300, 300);
   //  formerInterpolatedY=interpolatedY;
   //  interpolatedY = lerp( s0.y, s1.y, dt );
  //** float y =constrain (lerp( s0.y, s1.y, dt ),-300, 300);

  //** POLAR VERSION
    float x =constrain (mlerp( s0.x, s1.x, dt, TWO_PI ),0, TWO_PI);
    float y =constrain (mlerp( s0.y, s1.y, dt, TWO_PI ),0, TWO_PI);
    //  circle( (int) s0.x, (int) s0.x, 20 );
    circle( cos (x)*100, sin(y)*100, 20 );

    fill (100, 100, 100);
    circle ( 200* cos ( interpolatedAngle[1]), 200*sin ( interpolatedAngle[1]), 200);
    circle ( 200* cos ( interpolatedAngle[0]), 200*sin ( interpolatedAngle[0]), 200);


     
    textSize (50);
  
    movementInterpolated = y ;
    text (" x " + x + " y " + y + " mov " + movementInterpolated , 100, 500);
    
   

  /*  
      print( " good data y " + y);
      formerInterpolatedY=interpolatedY;
      interpolatedY=y+300;

      oldMovementInterpolated = movementInterpolated;
    text( " movementInterpolated " + movementInterpolated + " formerInterpolatedY " +formerInterpolatedY + " interpolatedY "+ interpolatedY, 400, 400 );
      
      if (interpolatedY > 300 && interpolatedY<= 600 && formerInterpolatedY<interpolatedY){
       movementInterpolated= map (interpolatedY, 300, 600,  PI, PI+PI/2);
       text( "   you are  going up first 1/4?  " , 400, 500 );
       }

   // 600 to 300 2 * 1/4
      if (interpolatedY > 300 && interpolatedY<= 600 && formerInterpolatedY>interpolatedY){
       movementInterpolated= map (interpolatedY, 600, 300,  PI+PI/2, TWO_PI);
       text( "   you are  going up second 2/4?  " , 400, 600 );
       }

       if (interpolatedY <= 300 && interpolatedY>= 0 && formerInterpolatedY>interpolatedY){
       movementInterpolated= map (interpolatedY, 300, 0,  0, PI/2);
       text( "   you are  going up third 3/4?  " , 400, 700 );
       }

        if (interpolatedY >=0 && interpolatedY<= 300 && formerInterpolatedY<interpolatedY){
       movementInterpolated= map (interpolatedY, 0, 300,  PI/2, 0);
       text( "   you are  going up forth 4/4?  " , 400, 800 );
       }
*/

  
     // movementInterpolated= map (y, -300, 300, 0, TWO_PI);   

     //  movementInterpolated= map (y/ displacement, -1, 1, 0, TWO_PI);
    
      /*
        if (formerInterpolatedY<=interpolatedY){
       movementInterpolated= map (interpolatedY,  0, TWO_PI,  0, -TWO_PI);

       text( "   you are  go up?  " , 400, 400 );
       }
       else {
       movementInterpolated=map (interpolatedY,  0, TWO_PI, 0, TWO_PI);
          text( "   you are  go down?  " , 400, 400 );
       }
      */  
//  }
//}

//Sampler sampler;

//******************         END INTERPOLATION SamplingMovement