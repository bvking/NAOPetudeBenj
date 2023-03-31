// MANAGE SOUND
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.spi.*; // for AudioRecordingStream
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer song; // not used any more
BeatDetect beat;
BeatDetect snare;
BeatListener bl;

TickRate rateControl;
FilePlayer filePlayer;
AudioOutput out;

//String fileName = "09-The Secret Agent Ending.mp3";
String fileName = "again_loop.aif";


float kickSize, snareSize, hatSize;
int V, K, S, H;
int snareSizeBis;

class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;

  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    // *** this.source.addListener(this);
    this.beat = beat;
  }

  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }

  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}

//MANAGE VARIABLE TO MODULATE SOUND
int freqMin = 0;
int freqMax= 14000;
float phaz, freq;
float rez;
float[] phazi;
float[] speedi;
float[] freqi;
float[] volumei;
