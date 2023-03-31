void send24DatasToTeensy6motors(int accelerationRatio, int driver0_On_Off, int computeData, int eraseProcessingData){  // dataMarkedToTeensyArevoir

       dataFromMode ="<"

      + DataToDueCircularVirtualPosition[5]+ ","+ DataToDueCircularVirtualPosition[4]+ ","+ DataToDueCircularVirtualPosition[3]+","+ DataToDueCircularVirtualPosition[2]+ ","
      + DataToDueCircularVirtualPosition[1]+ ","+  DataToDueCircularVirtualPosition[0] + ","      // 
       +0+","+0+","+0+","+0+","

      +  accelerationRatio +","+ driver0_On_Off +","+ computeData +","+ eraseProcessingData + ","
      
  //    + TrigmodPos[11]+","+TrigmodPos[10]+","+TrigmodPos[9]+","+TrigmodPos[8]+","+TrigmodPos[7]+","+TrigmodPos[6]+","

      +0+","+0+","+0+","+0+","+0+","+0+","
      
    //  +TrigmodPos[5]+","+TrigmodPos[4]+","+TrigmodPos[3]+","+TrigmodPos[2]+","+TrigmodPos[1]+","+TrigmodPos[0]+ ">";  // to manage 12 note
    // //     +0+","+0+","+0+","+0+","+0+","+0+","+0+","

       +0+","+0+","+0+","+0+">";    

     if (computeData<-1){
       dataTransformed = " dataNotComputeInTeensy from mode ";
            println(frameCount + ": " + dataTransformed +  keyMode + " " +   dataFromMode );

  }
  
     else dataTransformed = " dataComputeInTeensy from mode ";
     println(frameCount + ": " + dataTransformed +  keyMode + " " +   dataFromMode );
  
     teensyport.write(dataFromMode);
      }

  void setPort(){

  String[] ports = Serial.list();
  printArray(Serial.list());

    //*************** WITH TEENSY connected
 // teensyport = new Serial(this, ports[0], 115200);// si port non connecte Monterey
  //  teensyport = new Serial(this, ports[0], 115200);// si port non connecte Catalina ou connecté Monterey
    teensyport = new Serial(this, ports[1],115200); // si port connecté Monterey
  //*************** WITHOUT ENODEER connected
    encoderReceiveUSBport101 = new Serial(this, Serial.list()[2], 1000000);
  //  encoderReceiveUSBport101 =  new Serial(this,ports[2], 1000000);

  // Read bytes into a buffer until you get a linefeed (ASCII 10):
    encoderReceiveUSBport101.bufferUntil('\n');

 }