/* 

Sound Analysis: soundwave, spectrum, loudness 
Sonic Instruments Workshop / 2015
(c) stc@binaura.net

*/

//  import PureData
import org.puredata.processing.PureData;
PureData pd;

//  Default blocksize in pd
int pdBlockSize = 64;

//  Number of fft bins in pd
int spectrumSize = 256;

//  Array to store & display sound waves
float[] soundWave = new float[pdBlockSize];

//  Array to store & display spectrum
float[] spectrum = new float[spectrumSize];

//  Loudest value of the spectrum (aka gain)
float loudest = 0;

void setup() {
  size( 800, 600, P3D );
  pd = new PureData(this, 44100, 2, 2);
  pd.openPatch("Main.pd");
  pd.start();
  pd.sendBang("init");
}

void draw() {
  background(0);
  
  //  display the waveform by reading 'pd_soundwave' array from puredata
  stroke(255);
  pd.readArray(soundWave, 0, "pd_soundwave", 0, pdBlockSize);
  for (int i =0; i< pdBlockSize-1; i++) {
    line ( map( i, 0, pdBlockSize, 0, width ) , soundWave[i] * 100 + height / 2, map( i + 1 , 0, pdBlockSize, 0, width ), soundWave[i+1] * 100 + height / 2 );
  }
  
  //  display the spectrum by reading 'spectrum' array from puredata
  pd.readArray(spectrum, 0, "logFFT", 0, spectrumSize);
  stroke(255);
  for (int i =0; i< spectrumSize-1; i++) {
    line ( map( i, 0, spectrumSize, 0, width ) , -spectrum[i] + height, map( i + 1 , 0, spectrumSize, 0, width ), -spectrum[i+1] + height );
  }
  
  //  compare & get maximum value from spectrum array, then draw a line at the index of this value
  int maxIndex = 0;
  for (int i = 1; i < spectrum.length; i++){
   int tmp = (int)spectrum[i];
   if ((tmp > spectrum[maxIndex])){
     maxIndex = i;
   }
  }
  stroke(200, 0, 200);
  line( map( maxIndex, 0, spectrumSize, 0, width ), 0, map( maxIndex, 0, spectrumSize, 0, width ), height );
  
  //  display loudest value of the spectrum 
  loudest = spectrum[maxIndex];
  fill(255);
  noStroke();
  text( "GAIN: " + loudest, 20, 20 );
  rect( 20, 25, 30, loudest / 5 );
}

void pdPrint(String s) {
  println( s );
}


