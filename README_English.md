# Visualizer
Visualizer is an audio visualization project based on the Processing framework, aiming to display the rhythm and waveform of audio through graphical effects. This project is inspired by and modified from [EveOneSketch](https://github.com/hh-1106/[...]).

## Project Features

Visualizer includes the following main features:

1. **Audio Loading and Playback**: Supports loading and playing various audio formats from a specified directory, including .mp3, .wav, .au, and .flac files. Users can switch audio files using keyboard keys.

2. **Beat Detection**: Utilizes the BeatDetect class from the Minim library to detect beats in the audio, including drum hits, scratches, and hi-hats, triggering corresponding graphical effects.

3. **Graphics Rendering**: Generates and renders various graphical effects based on the audio beats, including dynamic polygons and arcs, which change in real-time to create rich visual effects.

4. **Color Mode Switching**: You can switch between black-and-white mode and color mode by left-clicking the mouse. In black-and-white mode, the graphical effects are mainly presented in white, while in color mode, they are presented in random colors.

5. **Post-Processing Effects**: Supports custom post-processing effects such as blur and hue adjustment. Users can add and adjust these effects in the code according to their needs.

## Dependencies

The Visualizer project relies on the following libraries and tools:

1. **Processing**: The fundamental framework for the project, providing powerful graphical processing capabilities and a simple programming interface. The Processing environment needs to be installed to run the project.

2. **Minim Audio Library**: A powerful audio library that supports audio loading, playback, and analysis. This project uses Minim to handle audio files and perform beat detection.

3. **Jaffree Library**: A Java library for audio and video processing. This project uses it to convert FLAC audio files to WAV format for playback.

## User Guide

Below is a detailed user guide to help you correctly run and use the Visualizer project.

### Environment Setup

1. **Directly Use EXE File Without Environment Configuration**: Download the latest version from Release and run it directly after unzipping. **Reference Tutorial: [Download Release Files from Github](https://zhuanlan.zhihu.com/p/148[...]).

2. **Using Original Code Configuration**:

   1. **Install Processing**: Download and install the latest version of Processing software from the [Processing official website](https://processing.org/download/).

   2. **Download Project Files**: Clone the Visualizer project to your local computer. You can use the following command to clone the project locally:
      ```shell
      git clone https://github.com/ChenLX233/Visualizer.git
      ```
   3. **Install Minim Library**: In the Processing software, open the "Sketch" menu, select "Import Library...", and then select "Add Library...". In the pop-up window, search for Minim and click Install.

   4. **Install Jaffree Library**: Ensure you download the complete project files, which include the .jar files for the Jaffree library.

   5. **Install FFmpeg**: You need to install the FFmpeg tool, which can be downloaded from the FFmpeg official website for your operating system. Install FFmpeg and ensure its executable file path is added to the system's environment variables.

7. **Directory Structure**:
Visualizer/
├── README.md

├── Visualizer/ 

│      ├── Visualizer.pde

│       ├── song1.mp3

│         ├── song2.flac

│         ├── song3.wav

│          └── code/

│               ├── jaffree-2024.08.29.jar

│                   ├── slf4j-api-2.0.16.jar

│ └── slf4j-simple-2.0.16.jar

Code 

**Make sure to add .mp3, .wav, .au, or .flac format music files in the directory where the .pde file is located.**

## Running the Project

### Open Project Files

In the Processing software, open the `Visualizer/Visualizer.pde` file. This is the main file of the project, containing all the core code.

### Run the Project

Click the "Run" button in the upper left corner of the Processing software interface. The project will start running. The program will automatically load audio files from the current directory and start playing and visualizing them.

## Interaction

### Mouse Click

You can switch between black-and-white mode and color mode by clicking the mouse. Each time you left-click the mouse, the color mode of the graphical effects will change, providing different visual experiences.

### Keyboard Operations

- **Key `N` or `n`**: Play the next audio file. When you press the `N` key, the program will stop the current audio playback and load the next audio file for playback.
- **Key `P` or `p`**: Play the previous audio file. When you press the `P` key, the program will stop the current audio playback and load the previous audio file for playback.

## Summary

The Visualizer project demonstrates the combination of audio processing and graphics rendering, creating rich visual effects. The project is suitable for practical application scenarios and can also be used as a tool for learning and research to help understand audio visualization.

I hope this detailed introduction and user guide will help you better understand and use the Visualizer project. If you have any questions or need further assistance, please visit the Processing official website.
