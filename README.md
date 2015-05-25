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

Download & install [Pure Data](http://puredata.info/downloads) and [Processing](https://processing.org/download/). Select your operating system, the java library that we use for connecting these two tools is compiled for all major platforms. Download the Processing library of [LibPd](https://github.com/libpd/puredatap5/). After download, extract, and place PureDataP5 to your processing sketches directory so that Processing will know from where to load the library. By default, it can be found under your ~/Documents folder. Open any example from the source and start experimenting.

There are interesting examples at the official [LibPd site](http://www.libpd.cc) on LibPd related projects.


## Folder Structure

All the examples are look like this:

.     
**sketchname.pde** our main processing sketch (same name as folder name)     
**... .pde** additional files, classes, functions, if we have     
**data** any external content we use within the sketch     
**--- patchname.pd** our main pd patch     
**--- images** if we have images, put them here     
**--- sounds** if we have sounds, put them here     
**--- ...** textfiles, videos, tables, etc.     
**code**    
**--- libraryname.jar** if we use other libs, we can put them here or in the processing folder     


## Editing

The main sketch can be edited with the Processing IDE that is built in the Processing download package. If you need more features than the basic editor,  other options might be [Sublime Text](http://www.sublimetext.com/) that has great module based integration, or [Eclipse](https://eclipse.org/) which is a professional code editing IDE. The puredata patches can be edited with both Pd-Extended or the basic Pd distribution. The difference is, that the extended version contains lots of objects by different developers. Very useful if you dive in Pd, but no need for libPd: by default, it is built only on the vanilla objects. If you really need an external, you can build it for libPd. There are several online resources that might help you, depending on your targeted OS. 

## Testing your project

Open the sketch in Processing, hit run. You should hear the sounds made by Pd, and interact with the Processing interface. To test on an Android device, switch the sketch into Android mode. (More on this, later)

## Examples

- S01_HelloPd : the official example that arrives with the puredataP5 repository.
- S02_PureDataBasics : supercompressed overview of objects, workflow, time & making sounds in Pure Data 


All code is under GPLv3 License.
