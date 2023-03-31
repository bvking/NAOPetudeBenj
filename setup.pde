 
//import PNetwork.java.*; 
// MANAGE NETWORK of OSCILLATOR
// import java.util.Arrays;
import sync.*;
PNetwork net;
import java.util.Arrays;

int networkSize = 6;
int nbBalls=networkSize;

float log10 (float x) {
  return (log(x) / log(10));
}

int numberOfPointInterpolated= 2; 
float []  interpolatedAngle = new float [numberOfPointInterpolated];
float []  netPhaseBase  = new float [networkSize];
float []  netOldPhaseBase  = new float [networkSize];

int v0, v1, v2, v3, v4, v5;
int incrementeX;

int [] result_modulo  = new int [networkSize];
int [] AlternativeVirtualPositionFromOtherMode = new int [networkSize];
int [] oldEncodeur = new int [networkSize];
int [] encodeur = new int [networkSize];
float [] newPosFollowed= new float [networkSize]; // followOppositeWay


int oldOscillatorChangePropagation, oscillatorChangePropagation; // splitIncoming
boolean oscillatorChangingPropagation; // splitIncoming

 
// INTERPOLATION
int actualSec,lastSec, lastLastSec, measure;  // trig internal clock each seconde as a measure  (period of 1 seconde)

int currTime;
boolean bRecording = true;
boolean mouseRecorded = true;
float movementInterpolatedContinue;

int Movement;

float oldMovementInterpolated, movementInterpolated;
float formerInterpolatedY;
float interpolatedX, interpolatedY;

//END INTERPOLaTION

// MANAGE ARDUINO && TENNSY
import processing.serial.*;
Serial encoderReceiveUSBport101; // The native serial port of the DUE fibish with 101
Serial teensyport;

String dataTransformed ;
String dataFromMode ;

boolean startZ=false; // to trig opposite way of propaagtion in addSignalOneAndTwoQuater

float signalToSplit, oldSignalToSplit ;  // signal oscillant entre 0 et 1 ou entre - TWO_PI et TWO_PI. oldSignalTosplit est la valeur du signal a la frame precedente. 

float timeLfo; // met à l'echelle le "signalToSplit" afin qu'il soit limité entre 0 et 1000

float splitTime, oldSplitTime ; // // renvoie la valeur discontine du time. Quand le temps s'ecoule de maniere cconstante et lineaire

float splitTimeLfo, oldSplitTimeLfo; // renvoie la valeur discontine du timeLFO. Quand timeLFO va de 0 à 1000, splitTimeLfo renvoie la valeur restante du timeLfo

int propagationSpeed=20;; // " vitesse " à laquelle on change d'oscillateur

int oscillatorChanging; // next or last changing oscillator
//******************         followSignalLfo
 
 char  modeStartKey;
 String modeStartKeyToFollow;
 
 float [] oscillator = new float [networkSize];
 int [] countFollowSignalLfo = new int [networkSize];
 int [] oldOldPositionToMotor = new int [networkSize];
 int [] trigFollowSignalLfo = new int [networkSize];

// ALIGNEMENT Trig 0
int[] result;


int[] multiMatchData(int matchValue, int newValue, int [] theArray) {
  IntList list = new IntList();
  for (int i = 0; i <  theArray.length; i++)
    if (theArray[i] == matchValue) list.append(i);
  if (list.size() > 1)
  list.forEach(element -> { theArray[element] = newValue; } );
  return theArray;
}

void showArray(int[] array) {
  for (int i = 0; i < array.length; i++)
    print(array[i] + "   ");
    println();
}

//

float []  velocityBis =  new float[networkSize]; //;
float []  oldVelocityBis =  new float[networkSize]; //;
float []  accelerationBis =  new float[networkSize]; //;
//float []  oldaccelerationBis =  new float[networkSize]; //;

float [] phaseAcceleration =  new float[networkSize]; //;
float [] oldPhaseAcceleration =  new float[networkSize]; //;


//******************         FollowMovement addSignalOneAndTwo and addSignalOneAndTwoBis

char letter;
boolean doA,doQ,doZ;

int oldOscillatorChange, oscillatorChange;
boolean oscillatorChanged;




int [] recordLastDataOfMotorPosition = new int[networkSize];  // not used

//float [] phaseShiftingFollowLFO = new float[12];


int frameCountRed;
String keyModeRed;
String mappingMode; 
int   controlTrigLfoPattern;
float phaseShiftingFollowLFO;

int decayTimeLfo;
int formerDecayTimeLfo;


 //int [] j = new int[networkSize];// number of the last changed oscillator
float [] phaseKeptAtChange =  new float[networkSize]; //;
float [] phasePatternFollow =  new float[networkSize]; //;

float [] newPosXaddSignal =  new float[networkSize]; //;
float [] newPosX =  new float[networkSize]; //;
float [] oldPosX =  new float[networkSize]; //;


int decayTimeBis;
int formerDecayTimeBis;

//******************         FollowMovement   

float oldYsampled,  ySampled;
int formerDecayTime, decayTime;
int frameCountBis = 0;
int decayshiftFollowMov = 0;


float [] ableton = new float[networkSize]; //;
float [] signal = new float[networkSize]; //;
float [] phaseAbleton =  new float[networkSize]; //;
float [] oldPhaseAbleton =  new float[networkSize]; //;

float [] oldPhaseLfo = new float[networkSize]; //;
float [] newPhaseLfo = new float[networkSize]; //;

float [] newPosY = new float[networkSize]; //;
float [] LFO = new float[networkSize]; //;

float [] phaseFollowLFO= new float[networkSize]; // 
float [] oldPosF= new float[networkSize]; // 
float [] newPosF= new float[networkSize]; //
float [] oldLfoPhase=  new float[networkSize]; //
float [] lfoPhase=  new float[networkSize]; //
int[] dataMappedForMotor =  new int[networkSize]; //
int[] positionToMotor =  new int[networkSize];
int[] oldPositionToMotor =  new int[networkSize];
int[] revLfo =  new int[networkSize];

// for mode keyMetro < in fonction PatternFollowLfo()
int[] dataToChange =  new int[networkSize]; //
float [] oldMotorToVisualPhase = new float[networkSize];
float [] motorToVisualPhase = new float[networkSize ];
//float [] phaseShiftingFollowLFO = new float[12];




  
//int frameRatio = 20;
//int nbBall = 9;
//int nbMaxDelais = 2000;




//******************       INTERPOLATION AND  SamplingMovement
int phase11;
float addPhase;
float addPhaseAllMode;
float trigLfo; // send only to float to osc
float oldMov;
float movementRecording; 

// IMPORTANT TO COMPARE
// to interpolate angle
float mlerp(float x0, float x1, float t, float M ){
   float dx = (x1 - x0 + 1.5*M) % M - 0.5*M;
   return (x0 + t * dx + M) % M;
}



int formerBeatPrecised, beatPrecised, formerMeasure, formerBeatOnMeasure; // autmationWithMeasureAndNote
int beginTrigEffect, stopTrigEffect, beginMeasure, stopMeasure;
int lastMeasureRecordStart, measureRecordStart, beginSample, endSample;
boolean beatPrecisedTrigged;
int timeFrameOffsetFollowing;


// RECORD MOTOR 0 and SAMPLING MOVEMENT and PLAIY IT in LOOP

int frameSampling; 
int z;

int  counterV1;
int  oldv1;
//Record and repeat movement

boolean trigFollowSampling=true;
boolean trigRatio;
int  delayTimeFollowPhase11=0;
float phaseShiftingFollowPhase11=0;
int num = 40; // you need normally 45 frameSamplings/s but actually with a 3D setting you  need only 40 frameSamplings
int numberSec = 5;

float mx[] = new float[num*numberSec]; // memorised frameSampling played 
float my[] = new float[num*numberSec]; // 

float rx[] = new float[num*numberSec]; // recorded frameSampling
float ry[] = new float[num*numberSec]; 

int beginTime,endTime,TimeMiddleElapsed,LastTimeMiddleElapsed,LastTimeElapsed;
int restartTimer;
float Timer,Timer2;

// END RECORD MOTOR 0 and SAMPLING MOVEMENT and PLAIY IT in LOOP


// fonction FOLLOW phase Jo
String debug ="";
String dataToControlMotor;

int nbBall = 12;
int nbMaxDelais = 2000;

// Variable pour suivre un mouvement avec un decalage en frame et phase. DANS les FONCTIONS commencant par follow
boolean firstFollowingLast = true;
float deltaFollow = PI/180;
boolean firstFollowingStarted = false;

float [][] phases = new float[nbBall][nbMaxDelais];
int[] phaseToMotor;
float [] phaseMapped;
float [] phaseMappedFollow;

float b, a;
// fin fonction JO

color bg = rcolor();
color rcolor() {
  return ( color( random(255), random(255), random(255) ) );
}
// Variable pour fonction avec starter et inteerphase

float [] interFrequency =  new float[networkSize];
float [] interPhase  =  new float[networkSize];
float [] interPhaseCircular  =  new float[networkSize];
int oldOldOldMemoryi, oldOldMemoryi;
int lastTimeTrigged;
int TimeTrigged;
float [] TrigRightTemp  =  new float[networkSize];
float [] interPosition = new float[networkSize];
int [] upstairVpos = new int[networkSize];
int [] upstairOldVpos = new int[networkSize];
int [] LasttimeTrigged = new int[networkSize];
int [] timeTrigged = new int[networkSize];
int lastTimeUpstair;
boolean [] upstairShifting;
boolean [] clockWay;
boolean [] oldClockWay;
int [] ClockWay = new int[networkSize];
int [] FactorWay = new int[networkSize];
//boolean upstairShifting; 

int upstairTime=0;
int TimeUpstair=0;
float [] PhaseDecay;
int oldMemoryi;
int oscillatorMoving;
int OldoscillatorMoving;
boolean [] oldOscillatorMoving; 
boolean [] OscillatorMoving; 
int millisRatio;
String JoDebug;
int incrementSpeed; // the speed of periodic wave
int[] formerEvent = new int[networkSize];
int[] TimeEllapsedBall = new int[networkSize];

float [] automationLFO;
int numberOfStep=6400;
int speedDelta=18; // ratio of speed and acceleration in Arduino
float averageDeltaPhase;
boolean twoTree=false;
boolean treeFour=false;
boolean fourFive=false;
boolean fiveSix=false;
boolean sixSeven=false;
boolean sevenEight=false;
boolean eightNine=false;
boolean nineTen=false;
boolean tenEleven=false;
boolean elevenTwo=false;
boolean [] followNumber;
int currentTime;
float [] pseudoTimer;
float [] timer;
float [] phaseReturned;
float k=0; // factor of phiShift in fonction formerkeyo
int d=0; // factor of timeOffset before trigging phaseshifting in fonction formerkeyo
boolean [] factorWay; // factor of phiShift according the oscillator moving in upstairx in cw or ccw
int timeOffset=1;
float phiShift=-PI/4;
float mapShiftPendular; // map the scale of K * phiShift
float mapShiftCircular;
float LFOX;
float LFOY;

//import the necessary libraries to use send, receive and understand OSC data
import oscP5.*;
import netP5.*;

// OSC loading stuff
OscP5 o;//Receive Piano/ Only track 1 from live 
OscP5 oII;//Receive Data/ Automation from Live
OscP5 oscP5;//send data
OscP5 oscP5bis;//send data
NetAddress myRemoteLocation; // send data  to Live
NetAddress myRemoteLocationII; // send data  to Live

float[] dataToLive; 
int[] upVelocity = new int[networkSize]; 
int[] downVelocity = new int[networkSize]; 
float Velocity;
int autmationWithMeasureAndNote;
int beatOnMeasure;
int actualMeasure;

int formerFrameBeat;
float formerAutomation ;
int LastBeat=0;
boolean beatTrigged;

// potar position scaled 0 to 1
float formerAutomation1;
float automation1, automation2, automation3, automation4, automation5, automation6, automation7, automation8, automation9  = 0; 


// midi note data
B_String string1, string2, string3, string4, string5, string6, string7, string8;
int velocity1, velocity2, velocity3, velocity4, velocity5, velocity6, velocity7, velocity8 = 0;
float ver_move1, ver_move2, ver_move3, ver_move4, ver_move5, ver_move6, ver_move7, ver_move8;
float duration1, duration2, duration3, duration4, duration5, duration6, duration7, duration8;
int note1, note2, note3, note4, note5, note6, note7, note8  = 0;

// END OF OSC DATAS

int oscillatorBlocked;

int pendular;  //actualise datas. 
boolean circularMov; //switch datas of positions in a pendular way
boolean trigTest; // Trig data when oscillator is on the left

// variable to manage graphics 
PNetwork netG;
int numRows = 12;
int numCols = 12;
int networkSizeGraphic = numRows * numCols;
int gridSize = 16;  

float Coupling;
float sigma; 
float Freq; 
// end of variable to manage graphics 

int orderframe;
int stoploop ;
int memoryi;
float f=0.05; // FOLLOW MODE to incremente phase with  formerkey =='f'
float fmemory;

boolean F11 = true;  
//MANAGE START STOP into LIVE

int startStop;

int nextScene=0; // Do not trig nextScene
int cohesionTrig;

//Manage when oscillator 11 trig his position=0
boolean ready = false;
float pulsation; // nnot used
int pause_start_time, sketch_pause_interval = 0;
int prev_time;

// MANAGE Time according the frame.
float TimeFrame;
int lastMillis = 0;
int sec; 

float timeFrame;
boolean running = true;

int pair=0; // to manage wether I control oscillator odd or even.




// variable of the setting of oscillator network

float x, y;
float side;  
float displacement;
float NaturalF;
//float coupling;
float noiseScale= 1;
float radius;
float orderParameter;
float coupling;
float formerCoupling;
float averagePhase;
float averageFrequency;

float stepSize;
int[] rev; //(counter of revolution of each oscillator);

// MANAGE data TO SEND POSITION or SPEED to ARDUINO
int[] oldVirtualPosition =new int[networkSize];
int[] VirtualPosition  = new int[networkSize];
int[] pos= new int[networkSize];
int[] oldPos = new int[networkSize];
int[] Pos = new int[networkSize]; // to convert data of position always positively
int[] modPos = new int[networkSize]; // ta have special position  quarter or half round
int[] modOldPos = new int[networkSize]; //to have former
int[] modOldOldPos = new int[networkSize]; //to have former
int[] TrigmodPos = new int[networkSize]; // to trig accordinag modPos;

int[] counter= new int[networkSize];


float[] metroPhase; 
float[] metroOldPhase; // convert circular to pendular
float[] abstractPhase; // to compute abstract phase
float[] OldFrequency;
float[] divideFrequency;

int[] PendularVirtualPosition = new int[networkSize];
int[] CircularVirtualPosition  = new int[networkSize];;
int[] DataToDueCircularVirtualPosition  = new int[networkSize];;
int[] ActualVirtualPosition  = new int[networkSize];;
int[] ActualVirtualPositionFromOtherMode  = new int[networkSize];;
int[] oldActualVirtualPosition  = new int[networkSize];;
int[] PendularOldVirtualPosition  = new int[networkSize];;
int[] CircularOldVirtualPosition  = new int[networkSize];;
int[] PendularLeftVirtualPosition  = new int[networkSize];;
int[] PendularOldLeftVirtualPosition  = new int[networkSize];;
int[] PendularOldOldLeftVirtualPosition  = new int[networkSize];;
int[] PendularOldOldOldLeftVirtualPosition  = new int[networkSize];;

int[] revolution;
int[] pseudoRevolutionTodeblock;
// WHAT TO CHOSSE?????  200*4 ou 200*8=?????
int[] decompte; // decremente a number when a revolution is trigged
int[] mapAcceleration;
int[] mapAccelerationinversed;


int [] j; // to reduce the number of revolution to their number even or odd  

//MANAGE VARIABLE TO MODULATE MOVEMENT with different CASES AUTOMATICALY
int caseNumber;
char caseLetter;

// MANAGE COUNTER of COHESION to manage sound
// Trig counter when cohesion is >=0.99
int orderCohesion;
int cohesionCounterHigh;
int cohesionCounterLow;

// Trig counter when cohesion is <=0.01
int orderCohesionLow;
int cohesionCounterHighLow;
float LevelCohesionToSend;

// MANAGE PERSPECTIVE
import peasy.*;
PeasyCam cam;

// change these for screen size
float fov = 45;  // degrees
float w = 1000;
float h = 800;

// don't change these
float cameraZ, zNear, zFar;
float w2 = w / 2;
float h2 = h / 2;

int frameRatio;

// SPECIFIED DATAS TO MAX MSP
float bPM9;
int BPM9;
int constrainedBPM; 
int onOFF;

//********** to RECORD and  playback data in the skecth folder
int formerKey; 
int formerSartKey; 
int formerKeyCode;
int formerFormerKey; 
int formerKeyCodeAzerty;
int formerFrame;
int formerKeyMetro;

int Key;
int KeyCode;

int couplingRed;
float couplingRecorded;

String[] lines;
int index = 0, nextFrame = 0; // these stay the same
// To outpout data recorded as sequences of case on Keypressed
PrintWriter output;

//********************* Data mapped to send To MAX 4 LIVE
int  orderToexpMappedOpposedLive; 
int  acc0ToexpMappedBisLive, acc9ToexpMappedBisLive; 

//BPM
float [] bpmFrequency;
float bpmToSend= 0.0;

//frame where to stop
//int framecount=10040;//4440 //5040  0à°)-_
int framecount=30040;//4440 //5040  0à°)-_

void frameStop() { 
  if (frameCount%framecount ==  0 ) { /// choose the in the   frame where you want to stop
    stoploop = 10; // incrmente the step to the next frame
    framecount = framecount  + stoploop ;
    noLoop();
    //       print (" last or : ");   println (orderframe );
    orderframe  = framecount;
    //       print ("a:ctual order : ");   println (orderframe );
  }
}     
void setup() {
  sampler = new Sampler();

  LastTimeMiddleElapsed=1980;
  LastTimeElapsed=4000-20;
  //  noStroke();
  fill(255, 0, 0, 50); 
  println("Start Drawing!");
  //  frameRate(45);
  v1=counterV1=height/2;

  // end sampling

  int midiNoteAndOtherData  = 300;
  //int networkSize = 6;
 
  formerEvent= new int[300];
  formerSartKey='#';
  autmationWithMeasureAndNote=1;
  oscillatorBlocked = 2;

 
  automationLFO = new float [networkSize];
  followNumber= new boolean [networkSize];
  pseudoTimer = new float [networkSize];
  timer =  new float [networkSize];
  phaseReturned =  new float [networkSize];
  
  k=0; // set phase offset to 0
  d=0; // set time offset to 0

  TimeEllapsedBall= new int[networkSize];
  timeTrigged = new int[networkSize];
  TrigRightTemp = new float[networkSize];
  upstairVpos = new int[networkSize];
  upstairOldVpos = new int[networkSize];
  LasttimeTrigged = new int[networkSize];
  interPosition = new float[networkSize];
  PhaseDecay = new float[networkSize];
  interPhase = new float[networkSize];
  interFrequency = new float[networkSize];
  interPhaseCircular = new float[networkSize];
  factorWay = new boolean[networkSize];


  float noiseLevel = 0 ; // Usefull only with case Q?

  // Osc midi potar
  automation1= automation2= automation3= automation4= automation5= automation6= automation7 = 0.5;
  o = new OscP5(this, 2346);//receive data from a port number - it has to be same as in your Max for Live device // careful to oveflow
  oII = new OscP5(this, 2350);//receive data piano partitionII

  oscP5 = new OscP5(this, 7999);//receive data to himself
  //  oscP5bis = new OscP5(this, 8002);//receive data to himself

  // myRemoteLocation = new OscP5(this, 8000); // rsend data to live. define address ove which the communication takes place. Requires host address (127.0.0.1 for localhost and the port number previously defined.)
  // myRemoteLocationII = new OscP5bis(this, 8001); // receive data fto live. define address ove which the communication takes place. Requires host address (127.0.0.1 for localhost and the port number previously defined.)

  myRemoteLocation = new NetAddress("127.0.0.1", 8000); // rsend data to live. define address ove which the communication takes place. Requires host address (127.0.0.1 for localhost and the port number previously defined.)
  myRemoteLocationII = new NetAddress("127.0.0.1", 8001); // receive data fto live. define address ove which the communication takes place. Requires host address (127.0.0.1 for localhost and the port number previously defined.)

  dataToLive= new float[networkSize];
  upVelocity= new int[networkSize];

  downVelocity= new int[networkSize];
  //OSC midi note data

  string1=new B_String (width*0.1, width*0.3, width*0.7, width*0.9, height*0.2, 250);
  string2=new B_String (width*0.1, width*0.3, width*0.7, width*0.9, height*0.3, 50);
  string3=new B_String (width*0.1, width*0.3, width*0.7, width*0.9, height*0.4, 150);
  string4=new B_String (width*0.1, width*0.3, width*0.7, width*0.9, height*0.5, 100);
  string5=new B_String (width*0.1, width*0.3, width*0.7, width*0.9, height*0.6, 200);
  string6=new B_String (width*0.1, width*0.3, width*0.7, width*0.9, height*0.7, 0);
  string7=new B_String (width*0.1, width*0.3, width*0.7, width*0.9, height*0.8, 133);
  string8=new B_String (width*0.1, width*0.3, width*0.7, width*0.9, height*0.9, 278);

 

  startStop = 0; // data used in Live
  frameRatio = 30;///30/5=> 108/5 BPM 21.6  or 114/5 = 22.8
  frameRate(frameRatio); //57 frame pour 1 tour. // joure avec G et g et cf le p

  stepSize = 10; // no effect //  net.stepSize = 1; // no effect  
  // Creat text with cases, in order to have a sequence according cases
  //================ record data to the skecth folder
  output = createWriter("OVERCOOL/viergelentAlongRecBisVitesse8FRAMEFaireVVraimentBis5FINAL39.txt");// 
  output.println("0:0:0:0:0: addSignalOneAndTwo ");   
  //================ donwload data from the skecth folder

  //********************  
  // lines = loadStrings("OVERCOOL/viergelentAlongRecBisVitesse8FRAMEcontinueBisElague.txt");//retire o garde pendulaire 5366:36:56:42
  //lines = loadStrings("OVERCOOL/viergelentAlongRecBisVitesse8FRAMEFaireVVraimentBis2.txt");// // to play to trig LIVE
  //lines = loadStrings("OVERCOOL/viergelentAlongRecBisVitesse8FRAMEFaireVVraimentBis5FINAL6.txt");// drole d'effet vers frame 16000 
  //lines = loadStrings("OVERCOOL/viergelentAlongRecBisVitesse8FRAMEFaireVVraimentBis5FINAL13.txt");//
  //lines = loadStrings("OVERCOOL/viergelentAlongRecBisVitesse8FRAMEFaireVVraimentBis5FINAL16.txt");//
  
  //lines = loadStrings("OVERCOOL/viergelentAlongRecBisVitesse8FRAMEFaireVVraimentBis5FINAL33.txt");//  // 33 fonctione


  //********************  fichier vierge
 //  lines = loadStrings("vierge.txt");
   lines = loadStrings("viergechar.txt");
  // lines = loadStrings("madrushstart.txt");
  //**** readOneLine(); // play case frame by frame. Uncomment if you want play in live
  textSize(200);
  //********Sending and Receiving data with two different serialport
 
  setPort();

  //********************************************************* BEGIN GRAPHIC CHIMERA STATE SETUP
  float[][] Coupling = new float[networkSizeGraphic][networkSizeGraphic];
  float sigma = 0.25; // play with this? How can I do?
  initializeCoupling(Coupling, sigma);
  float[] phase = new float[networkSizeGraphic];
  initializePhase(phase);
  float[] naturalFrequency = new float[networkSizeGraphic];
  Freq = PI / 8; // play with this PI/8
  initializeNaturalFrequency(naturalFrequency, Freq);
  netG = new PNetwork(this, phase, naturalFrequency, Coupling);

  colorMode(HSB, TWO_PI, 100, 100);
  noStroke();

  //********************************************************* END GRAPHIC CHIMERA STATE SETUP
  rev = new int[networkSize]; // counter of rev
  j= new int[networkSize]; // reduce  the number of rev  to the number even or odd with 0 or 1 /

  oldVirtualPosition= new int[networkSize];
  VirtualPosition= new int[networkSize];
  pos= new int[networkSize];
  oldPos= new int[networkSize];
  Pos= new int[networkSize];
  modPos= new int[networkSize];
  modOldPos= new int[networkSize]; 
  modOldOldPos=new int[networkSize]; 

  metroPhase= new float[networkSize]; 

  metroOldPhase= new float[networkSize]; 
  abstractPhase = new float[networkSize]; 
 
  OldFrequency = new float[networkSize]; 
  PendularVirtualPosition = new int[networkSize]; 
  CircularVirtualPosition = new int[networkSize]; 
  DataToDueCircularVirtualPosition =new int[networkSize]; 
  ActualVirtualPosition = new int[networkSize];
  ActualVirtualPositionFromOtherMode = new int[networkSize];
  oldActualVirtualPosition = new int[networkSize];

  PendularOldVirtualPosition = new int[networkSize]; 
  CircularOldVirtualPosition = new int[networkSize]; 
  PendularLeftVirtualPosition = new int[networkSize];
  PendularOldLeftVirtualPosition = new int[networkSize];
  PendularOldOldLeftVirtualPosition = new int[networkSize];
  PendularOldOldOldLeftVirtualPosition = new int[networkSize];
  TrigmodPos = new int[networkSize]; 
  revolution= new int[networkSize];
  pseudoRevolutionTodeblock= new int[networkSize];
  decompte=  new int[networkSize];
  mapAcceleration=new int[networkSize];
  mapAccelerationinversed=new int[networkSize];
  divideFrequency= new float[networkSize];

  coupling = 0; 

  net = new PNetwork(this, networkSize, coupling, noiseLevel);
  side = height*0.15*1/networkSize;
  displacement = width/2;

  minim   = new Minim(this);

  // this opens the file and puts it in the "play" state.                           
  filePlayer = new FilePlayer( minim.loadFileStream(fileName) );
  // and then we'll tell the recording to loop indefinitely
  // filePlayer.loop();

  // this creates a TickRate UGen with the default playback speed of 1.
  // ie, it will sound as if the file is patched directly to the output
  rateControl = new TickRate(1.f);

  // get a line out from Minim. It's important that the file is the same audio format 
  // as our output (i.e. same sample rate, number of channels, etc).
  out = minim.getLineOut();

  // patch the file player through the TickRate to the output.
  filePlayer.patch(rateControl).patch(out);
  //**************************
  // to play synthesis with minim. Not used anymore

  phazi=  new float[networkSize];
  speedi= new float[networkSize];
  freqi=  new float[networkSize];
  volumei= new float[networkSize];
  bpmFrequency= new float[networkSize];
  //**************************
   
  
  
  /*  to manage later reflection on sphere
   colorMode(RGB, 1);
   //  fill(0.4);
   */
 
  //***************************************** SET minim library to discriminate 3 differents frequencies in a mp3 

  //  minim = new Minim(this);
  //** song = minim.loadFile("09-The Secret Agent Ending.mp3", 1024);
  //**song.play();

  //  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  //  beat.setSensitivity(400);//300 ou 100? 

  
  kickSize = snareSize = hatSize = 16;
  // make a new beat listener, so that we won't miss any buffers for the analysis
  bl = new BeatListener(beat, song);  
  textFont(createFont("Helvetica", 16));
  textAlign(CENTER);
  //***************************************** set position and coupling of oscillators
  mouseX= width/2;
  // in order to have coupling=0;
  formerKeyMetro = '$'; // to begin setting of phase with pendular phase in the menu $ ; 
  circularMov=false;
  for (int i = 0; i < networkSize; i++) {
    //   net.phase[i] = (i*PI/2);// position 0 at the top
    net.phase[i] = PI/2;// position 0 at the top
    //   net.phase[i]=-PI+0.5*PI+PI/12; // position 0+PI/12
  }
  
 
  upstairShifting = new boolean [networkSize];
  clockWay = new boolean [networkSize];
  oldClockWay = new boolean [networkSize];
 // ClockWay = new int [networkSize];
  FactorWay = new int [networkSize];
  oldOscillatorMoving = new boolean [networkSize];
  OscillatorMoving = new boolean [networkSize];

  for (int i = 0; i < networkSize; i++) {

    oldOscillatorMoving[i]=false;
    OscillatorMoving[i]=false;

  }

  for (int i = 0; i < networkSize; i++) {
    //   ActualVirtualPosition[i]=80*i;
    // DataToDueCircularVirtualPosition[i]= DataToDueCircularVirtualPosition[i]+800;
    DataToDueCircularVirtualPosition[i]= (int) map ( DataToDueCircularVirtualPosition[i], -800, 800, 1600, 4800)+ ActualVirtualPosition[i];  // mapped for 6400 step/round +800
 //  dataToLive[i]=(float)  map(DataToDueCircularVirtualPosition[i], 1600, 4800, 0f, 1f);
  }
  for (int i = 0; i < 300; i++) {
    // which+1 is the smallest (the oldest in the array)
    //  formerEvent[i]=0; //Time elapsed before trigging event
  }
  for (int i = 0; i <  networkSize; i++) {
    phaseToMotor= new int [networkSize];
    phaseMapped= new float [nbBall];
    phaseMappedFollow= new float [nbBall];
    ActualVirtualPosition[i]= 0;

    for (int j = 2; j < nbMaxDelais; j++)
      phases[i][j] = -PI;      
  }

    //***************************************** SET 3D CAM 
  cam = new PeasyCam(this, 2000);
  cameraZ = (h / 2.0) / tan(radians(fov) / 2.0);
  zNear = cameraZ / 10.0;
  zFar = cameraZ * 10.0;
  println("CamZ: " + cameraZ);
  rectMode(CENTER);
  //***************************************** END 3D CAM  
  
  
//keyMode = " addSignalOneAndTwoBis ";  
keyMode = " phasePattern ";                                                                                                                                                                                                                 
formerKeyMetro = '@';
translate(0, -800,1000);
 
}