# Sonic-Instruments-Workshop
Sample code for "Sonic instruments" workshop, aka tools designed with Pure Data &amp; Processing

The aim of the workshop is to introduce simple and easy learnable ways to create interactive sounds and music. The workshop is based on two popular, open source languages and the combination of these. Using these free tools it is easy to create user interactions that are targeting the web or mobile devices. By the end of the workshop, each participant will have a general knowledge about (musical, artistic) interfaces and their cognitive extensions, basics of digital sound & interface design.

For more info, visit the [official workshop site](http://www.binaura.net/stc/ws/isea/)

## What tools do we use?

[Processing](https://processing.org/): Processing is a programming language, development environment, and online community. Since 2001, Processing has promoted software literacy within the visual arts and visual literacy within technology. Initially created to serve as a software sketchbook and to teach computer programming fundamentals within a visual context, Processing evolved into a development tool for professionals. Today, there are tens of thousands of students, artists, designers, researchers, and hobbyists who use Processing for learning, prototyping, and production.

[Pure Data](http://puredata.info/): Pure Data (aka Pd) is an open source visual programming language. Pd enables musicians, visual artists, performers, researchers, and developers to create software graphically, without writing lines of code. Pd is used to process and generate sound, video, 2D/3D graphics, and interface sensors, input devices, and MIDI.

[LibPd](http://www.libpd.cc): LibPd takes the power of one of the world’s most powerful, most widely-used environments for making original sound and music creations, and lets you put it anywhere. It’s free, open source, and can run on a wide variety of devices from phones to computers. LibPd starts with Pd – Pure Data – a graphical development environment used widely by musicians, composers, and sound designers. In Pd, you create custom synthesizers, effects, musical patterns, and sonic and musical machines by connecting on-screen patch cords. If you already know how to make patches in Pd, you’ll find libpd immensely powerful. If you don’t, Pd is a great way to learn custom music and sound development.

Then, by separating all that sonic power from concerns about hardware input and output, LibPd lets you run Pd anywhere. LibPd isn’t a fork of Pd: it is Pd, but made embeddable. If it can run native code, it can run libpd. That means you can incorporate Pd in your Python game, or your Android or iOS app, or on a Linux stompbox you built with a Beagleboard using an app you wrote in C, or Mac or Windows or Linux software, or anywhere else that can run native code.


## Installation instructions

Download & install [Pure Data](http://puredata.info/downloads) and [Processing](https://processing.org/download/). Select your operating system, the java library that we use for connecting these two tools is compiled for all major platforms. Download the Processing library of [LibPd](https://github.com/libpd/puredatap5/). The directory PureDataP5 contains the source code and dependencies, configured
for development on Mac OS. You won't need to look at this unless you want to participate in the development of this library. If you just want to use libpd with Processing, then you can unpack the file
pdp5.zip into the libraries folder of Processing. On my Mac, that folder is Documents/Processing/libraries. Open any example from the source and start experimenting. The compiled library should work with Linux & Windows too, however we couldn't test.

There are interesting examples at the official [LibPd site](http://www.libpd.cc) on LibPd related projects.


## Folder Structure

All the examples look like this:

.     
**sketchname.pde** our main processing sketch (same name as folder name)     
**... .pde** additional files, classes, functions, if we have     
**data** any external content we use within the sketch     
----------**patchname.pd** our main pd patch     
----------**images** if we have images, put them here     
----------**sounds** if we have sounds, put them here     
----------**...** textfiles, videos, tables, etc.     
**code**    
----------**libraryname.jar** if we use other libs, we can put them here or in the processing folder     


## Editing

The main sketch can be edited with the Processing IDE that is built in the Processing download package. If you need more features than the basic editor,  other options might be [Sublime Text](http://www.sublimetext.com/) that has great module based integration, or [Eclipse](https://eclipse.org/) which is a professional code editing IDE. The puredata patches can be edited with both Pd-Extended or the basic Pd distribution. The difference is, that the extended version contains lots of objects by different developers. Very useful if you dive in Pd, but no need for libPd: by default, it is built only on the vanilla objects. If you really need an external, you can build it for libPd. There are several online resources that might help you, depending on your targeted OS. 

## Testing your project

Open the sketch in Processing, hit run. You should hear the sounds made by Pd, and interact with the Processing interface. To test on an Android device, first follow the steps on this [guide on the Processing + Android wiki](https://github.com/processing/processing-android/wiki). After steps are complete, switch the sketch into Android mode and run your sketch in the android simulator or an Android Device. Please note, Android versions below 2.3.3 (API 10) won't work with Processing. (Note: we won't cover Android installation steps on the workshop, since the timeframe is very tight). If you are a web developer or mobile app maker (including iOS), there is also a very promising way to test your project in HTML5 environments (based on WebAudio API) using [WebPd](https://github.com/sebpiq/WebPd) and [P5JS](http://p5js.org/) which are javascript ports of the Pure Data and Processing tools, however these are in a very experimental state as of the time of this workshop. Example 10 is about to build your project as a web based application. 

## Examples

- **S01_HelloPd** : the official example that arrives with the puredataP5 repository.
- **S02_PureDataBasics** : supercompressed overview of objects, workflow, time & making sounds in Pure Data 
- **S03_ProcessingBasics** : overview of user inputs, functions, for loop and classes in Processing
- **S04_SimpleUIElements** : creating basic UI elements in processing, trigger sounds & adjust panning on the Pd side
- **S05_SoundAnalysis** : getting and displaying waveform, spectrum and gain of an incoming live soundstream. This example also shows, how to read arrays from within PureData
- **S06_Sonification** : turning colors into sounds. Pixel color values are driving corresponding oscillator's pitches 
- **S07_GenerativeMusic** : creating self-modifying melodies and rhythm patterns on the Pd side, visualize actual sonic parameters on the Processing side. This patch is using some abstractions from an excellent high-level object library for pd, named [RjLib](https://github.com/rjdj/rjlib). This set of building blocks (synths, logical mappings, instruments, effects & utilities) is one of the most important addons ever made for Pure Data. rjLib originally came alive with the rise of mobile platforms (iOS, Android) made by the RjDj crew, it is intended to make interactive music in a very unique and streamlined way. 
- **S08_VisualMusic** : Demonstrating how to play polyphonic sound samples of the same sound 
with different pitches. The behaviour of visual elements are triggering the sounds. The example is using [PolySample](https://github.com/stc/polySample) , a custom made polyphonic soundplayer with adjustable sample speed. 
- **S09_GrainField** : A 32 channel granular synthesis engine with custom controls. This technique is about taking apart an existing sound sample into small grains that remain individually controllable fragments. Useful for creating sound textures, sound design, rythmic patterns.
- **S10_WebApp** : A modified version of the basic LibPd example. This code is entirely built on javascript using WebAudio API. The core libraries that are used: [P5JS](http://p5js.org/), aka the framework that makes possible to write processing-like code using cutting edge web technologies (canvas, sockets, webrtc, etc), [WebPd](https://github.com/sebpiq/WebPd), aka the framework that makes possible to turn your Pd patches into javascript and render audio using WebAudio API. In order to try the example, you need to start a local server to be able to open your Pd patch since it is an async request from your browser. A very simple tool for this is [Python's SimpleHTTPServer](http://www.pythonforbeginners.com/modules-in-python/how-to-use-simplehttpserver/). On OSX, open Terminal, navigate to WebApp folder and type "python -m SimpleHTTPServer 8000". You just started a local server in your folder that is hosting on port 8000. Now go to your favourite browser (that supports WebAudio) and open localhost:8000. ( Hint: If you open this address from an iOS device, you can add it to your homescreen and launch it anytime as a regular application ) Try the online [demo here] (http://www.binaura.net/stc/ws/isea/webapp/)


All code is under GPLv3 License.
