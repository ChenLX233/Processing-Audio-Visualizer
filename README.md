#English Version

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

#Chinese Version

# Visualizer
Visualizer 是一个基于 Processing 框架的音频可视化项目，旨在通过图形效果展示音频的节奏和波形。此项目借鉴并修改自[EveOneSketch](https://github.com/hh-1106/EveOneSketch/tree/main/easing)，采用 MIT 许可证发布，致力于延续开源精神。

## 项目功能

Visualizer 项目包括以下几个主要功能：

1. **音频加载和播放**：支持从指定目录加载并播放多种格式的音频文件，包括 .mp3, .wav, .au, 和 .flac 文件。用户可以通过按键实现音频文件的切换。

2. **节拍检测**：利用 Minim 库的 BeatDetect 类检测音频中的节拍，包括鼓点、刮擦声和高帽声等，触发相应的图形效果。

3. **图形渲染**：根据音频节拍生成并渲染多种图形效果，包括动态多边形和弧线，实时变化以创造丰富的视觉效果。

4. **颜色模式切换**：你可以通过鼠标左击在黑白模式和彩色模式之间切换。黑白模式下的图形效果主要以白色呈现，而彩色模式则以随机颜色呈现，增强了视觉表现力和互动性。

5. **后处理效果**：支持自定义的后处理效果，如模糊、色调调整等，用户可以根据需求在代码中添加和调整这些效果。

## 依赖项

Visualizer 项目依赖以下几个库和工具：

1. **Processing**：作为项目的基础框架，Processing 提供强大的图形处理能力和简洁的编程接口。需安装 Processing 环境以运行项目。

2. **Minim 音频库**：一个功能强大的音频库，支持音频的加载、播放和分析。本项目使用 Minim 处理音频文件并进行节拍检测。

3. **Jaffree 库**：用于音频和视频处理的 Java 库，本项目使用其将 FLAC 格式音频文件转换为 WAV 格式以便播放。

## 操作指南

以下是项目的详细操作指南，帮助你正确运行和使用 Visualizer 项目。

### 环境配置

##(1)**直接使用EXE文件体验而不用配置环境文件**： 从Release下载最新版本并直接解压运行  **参考教程:[从Github下载Release文件](https://zhuanlan.zhihu.com/p/148270917?from_voters_page=true)**

##(2)**使用原始代码配置：**

1. **安装 Processing**：从 [Processing 官方网站](https://processing.org/download/) 下载并安装最新版本的 Processing 软件。

2. **下载项目文件**：将 Visualizer 项目克隆到本地计算机。你可以使用以下命令将项目克隆到本地：
   ```shell
   git clone https://github.com/ChenLX233/Visualizer.git
3. **安装 Minim 库**: 在 Processing 软件中，打开“Sketch”菜单，选择“Import Library...”，然后选择“Add Library...”。在弹出的窗口中搜索 Minim 并点击安装。

4. **安装 Jaffree 库**: 确保下载完整的项目文件，项目中已包含 Jaffree 库的 .jar 文件。                                                                                       
5. **安装FFmpeg**：您需要安装FFmpeg工具，可以从FFmpeg官网下载适用于您操作系统的版本。安装FFmpeg并确保其可执行文件路径已添加到系统的环境变量中。你可以参考：[ffmpeg安装教程](https://blog.csdn.net/m0_47449768/article/details/130102406) 或直接搜索"如何安装FFmpeg"。                                                                                                                   
7. **目录结构：**                                                                                                                                                                                                         
Visualizer/                                                                                                                                                               
├── README.md                                                                                                                                                                           
├── Visualizer/                                                                                                                                                                                 
│         ├── Visualizer.pde                                                                                                                                                                        
│         ├── song1.mp3                                                                                                                                                                        
│         ├── song2.flac                                                                                                                                                                        
│         ├── song3.wav                                                                                                                                                                           
│         └── code/                                                                                                                                                                                 
│             ├── jaffree-2024.08.29.jar                                                                                                                                                                                 
│             ├── slf4j-api-2.0.16.jar                                                                                                                                                                  
│             └── slf4j-simple-2.0.16.jar                                                                                                                                                         
**请确保在 .pde 文件所在目录中添加 .mp3, .wav, .au, 或 .flac 格式的音乐文件**

## 运行项目

### 打开项目文件

在 Processing 软件中，打开 `Visualizer/Visualizer.pde` 文件。这是项目的主文件，包含了所有的核心代码。

### 运行项目

点击 Processing 软件界面左上角的“Run”按钮，项目将开始运行。程序会自动从当前目录加载音频文件并开始播放和可视化。

## 交互

### 鼠标点击

你可以通过点击鼠标在黑白模式和彩色模式之间切换。每次左击鼠标，图形效果的颜色模式会发生改变，从而提供不同的视觉体验。

### 按键操作

- **按键 `N` 或 `n`**：播放下一首音频文件。当你按下 `N` 键时，程序会停止当前的音频播放并加载下一首音频文件进行播放。
- **按键 `P` 或 `p`**：播放上一首音频文件。当你按下 `P` 键时，程序会停止当前的音频播放并加载上一首音频文件进行播放。

## 总结

Visualizer 项目展示了音频处理与图形渲染的结合，创造丰富的视觉效果。项目适用于实际应用场景，也可作为学习和研究的工具，帮助理解音频可视化技术。

希望这份详细的介绍与使用说明能帮助您更好地理解和使用 Visualizer 项目。如有任何问题或需要进一步帮助，请访问 Processing 官方网站。
