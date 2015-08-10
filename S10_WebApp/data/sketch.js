/* 

WebApp Example: A modified version of the basic LibPd example. This code is entirely built on javascript using WebAudio API. 
The core libraries that are used:

P5JS : the framework that makes possible to write processing-like code using cutting edge web technologies (canvas, sockets, webrtc, etc)
WebPd : the framework that makes possible to turn your Pd patches into javascript and render audio using WebAudio API

Thus, by targeting the web, you can try your code on iOS, Android, and any Browser that supports HTML5 Canvas and WebAudio.
See readme file on more info how to try this example.

Sonic Instruments Workshop / 2015
(c) stc@binaura.net

*/

//	use this for manually start DSP (because of iOS restrictions)
//	notice: in js world, all variables are declared as "var" + name

var canstart = true;

//	notice: functions are called "void" in processing, 
//	but they are called "function" in javascript

function setup() {	
	//	instead of size, use this
	createCanvas(windowWidth,windowHeight);
	background(255);
}

function draw() {
	if(canstart) {
		noStroke();
		fill(0);
		textSize(30);
		textAlign( CENTER, CENTER );
		text( "Touch to start drawing & make some noise", width / 2, height / 2 );
	}
}

function mouseDragged() {
	if(canstart) {
    	Pd.start();
    	background(255);
    	canstart = false;
  	}
  	Pd.send('pitch', [ map( mouseX, 0, width, 0, 1 ) ]);
  	Pd.send('volume', [ map( mouseY, 0, height, 1, 0 ) ]);
	ellipse( mouseX, mouseY, 10, 10 );
}