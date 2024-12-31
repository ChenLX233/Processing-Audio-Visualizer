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
