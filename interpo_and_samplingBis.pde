float calcAngle() {
 float a = atan2(mouseY-height/8, mouseX-width/8); // 2
 if (a<0) {
    a=map(a, -PI, 0, PI, TWO_PI);
  }
  return a;
}

class Sample {
int t;
float x, y;
Sample( int t, float x, float y ) {
this.t = t; this.x = x; this.y = y;
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
void addSample( float x, float y ) { // add sample when bRecording
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
if(samples.size() > 0){
float deltax = samples.get(0).x - samples.get(samples.size()-1).x;
float deltay = samples.get(0).y - samples.get(samples.size()-1).y;
float sumdist = 0;
 
for(int i = 0; i < samples.size() - 1; i++) {
sumdist += sqrt((samples.get(i).x - samples.get(i +1 ).x)*(samples.get(i).x - samples.get(i +1 ).x) + (samples.get(i).y - samples.get(i +1 ).y)*(samples.get(i).y - samples.get(i +1 ).y));
}
samplesModified.add( new Sample(samples.get(0).t, samples.get(0).x , samples.get(0).y ) );
float dist = 0;
for(int i = 0; i < samples.size() - 1; i++) {
dist += sqrt((samples.get(i).x - samples.get(i +1 ).x)*(samples.get(i).x - samples.get(i +1 ).x) + (samples.get(i).y - samples.get(i +1 ).y)*(samples.get(i).y - samples.get(i +1 ).y));
samplesModified.add( new Sample(samples.get(i+1).t, (float) (samples.get(i +1).x + (dist * deltax) / sumdist), (float) (samples.get(i+1).y +( dist * deltay )/ sumdist)) );
print(samples.get(i).x);
print(",");
print(samples.get(i).y);
print(",");
print( " good data x " + samplesModified.get(i).x);
print(",");
print( " good data y " + samplesModified.get(i).y);
println("");
}
}
}
 
 void draw() {
stroke( 255 );
//**RECORD
beginShape(LINES);
for( int i=1; i<samples.size(); i++) {
vertex( samplesModified.get(i-1).x, samplesModified.get(i-1).y ); // replace vertex with Pvector
vertex( samplesModified.get(i).x, samplesModified.get(i).y );
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


//float x =lerp( s0.x, s1.x, dt );  // interpolation de base
//float y =lerp( s0.y, s1.y, dt ); // 

float x =mlerp( s0.x, s1.x, dt, TWO_PI ); // interpolation avec modulo 
float y =mlerp( s0.x, s1.x, dt, TWO_PI );

 movementInterpolated=y;
//float movementInterpolatedB = y ;
text (" x " + x + " y " + y + " mov " + movementInterpolated , 100, 800);
fill (255,255,255);
circle ( 100* cos (movementInterpolated)+200, 100*sin (movementInterpolated)+200, 20);

}
}
Sampler sampler;