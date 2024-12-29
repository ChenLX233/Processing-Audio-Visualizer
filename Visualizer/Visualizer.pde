import ddf.minim.*;
import ddf.minim.analysis.BeatDetect;
import java.util.ArrayList;
import java.io.File;
import com.github.kokorin.jaffree.ffmpeg.FFmpeg;
import com.github.kokorin.jaffree.ffmpeg.UrlInput;
import com.github.kokorin.jaffree.ffmpeg.UrlOutput;

// 音频处理相关变量
Minim minim;
AudioPlayer player;
BeatDetect beat;
ArrayList<String> musicFiles;
int currentSongIndex = 0;
boolean isFlacPlaying = false;
Thread flacThread;

boolean runOnce = true;
boolean musicStarted = false;
boolean firstMusicStarted = false; // 标志第一次音乐已开始
int startTime;

// 新增变量，用于切换颜色模式
boolean colorMode = false;

// 图形处理相关变量
PGraphics PG_MS;
PGraphics PG_FX;
Ease EA;
MGSystem MS;

// setup 函数：初始化环境和变量
void setup() {
  // 初始化 Minim 库
  minim = new Minim(this);
  // 从当前目录加载音乐文件
  musicFiles = loadMusicFiles();

  if (musicFiles.size() == 0) {
    // 如果没有找到音乐文件，退出程序
    exit();
  }

  // 加载第一首歌曲但不开始播放
  loadMusic(currentSongIndex);

  // 初始化节拍检测器
  beat = new BeatDetect();
  beat.setSensitivity(15); // 设置节拍检测器的灵敏度

  // 初始化 Ease 和 MGSystem
  EA = new Ease();
  MS = new MGSystem();

  // 设置全屏模式和帧率
  fullScreen(P2D);
  frameRate(90);
  smooth(8);

  // 设置后处理效果
  SetupPostFX();

  // 创建用于绘制的 PGraphics 对象
  PG_MS = createGraphics(width, height);
  PG_FX = createGraphics(width, height, P2D);

  // 记录开始时间
  startTime = millis();
}

// draw 函数：每帧调用，处理图形更新和绘制
void draw() {
  // 检查是否经过了 2 秒，并且音乐尚未开始播放
  if (millis() - startTime >= 2000 && !musicStarted) {
    startMusic(); // 开始播放音乐
    musicStarted = true;
    firstMusicStarted = true; // 标志第一次音乐已开始
  }

  // 检查当前歌曲是否播放完毕，但不包括第一次
  if (firstMusicStarted && player != null && !player.isPlaying() && !isFlacPlaying) {
    playNextSong(); // 播放下一首歌曲
  }

  // 如果没有 FLAC 文件在播放，进行节拍检测
  //if (!isFlacPlaying && player != null) { 
  beat.detect(player.mix);
  //}

  // 更新和渲染图形系统
  MS.update();
  MS.render(PG_MS);

  PG_FX.beginDraw();
  PG_FX.image(PG_MS, 0, 0);
  PG_FX.endDraw();

  // 增加节拍检测频率，每帧检测多次
  for (int i = 0; i <= 10; i++) {
    if ((beat.isOnset() || beat.isKick() || beat.isSnare() || beat.isHat()) && runOnce) {
      MS.addMG(new Polygon(random(width), random(height)));
      runOnce = false;
      break;
    }

    if (!beat.isOnset() && !beat.isKick() && !beat.isSnare() && !beat.isHat()) {
      runOnce = true;
    }
  }

  // 绘制背景和应用后处理效果
  background(255);
  blendMode(BLEND);
  image(PG_FX, 0, 0);
  ApplyPostFX(PG_FX);
}

// mousePressed 函数：鼠标按下事件处理
void mousePressed() {
  // 切换颜色模式
  colorMode = !colorMode;
}

// keyPressed 函数：键盘按下事件处理
void keyPressed() {
  if (key == 'n' || key == 'N') {
    // 停止当前歌曲并加载下一首
    playNextSong();
  } else if (key == 'p' || key == 'P') {
    // 停止当前歌曲并加载上一首
    currentSongIndex = (currentSongIndex - 1 + musicFiles.size()) % musicFiles.size();
    loadMusic(currentSongIndex);
    startMusic(); // 确保新歌曲开始播放
  }
}

// loadMusic 函数：加载指定索引的音乐文件
void loadMusic(int index) {
  if (player != null) {
    player.close();
  }

  if (isFlacPlaying && flacThread != null) {
    flacThread.interrupt();  // 停止 FLAC 播放线程
    isFlacPlaying = false;
  }

  if (index < 0 || index >= musicFiles.size()) {
    return;
  }

  String filename = musicFiles.get(index);
  if (filename.endsWith(".flac")) {
    // 检查是否已经存在对应的 WAV 文件
    String wavFilename = filename.substring(0, filename.lastIndexOf('.')) + ".wav";
    File wavFile = new File(sketchPath(wavFilename));
    if (wavFile.exists()) {
      player = minim.loadFile(wavFilename);
    } else {
      convertFlacToWav(filename);
    }
  } else {
    player = minim.loadFile(filename);

    if (player == null) {
      exit();
    }
  }
}

// startMusic 函数：开始播放当前加载的音乐
void startMusic() {
  if (player != null) {
    player.play();
  }
}

// playNextSong 函数：播放下一首歌曲
void playNextSong() {
  // 确保当前歌曲停止播放并关闭
  if (player != null) {
    player.close();
    player = null;
  }

  currentSongIndex = (currentSongIndex + 1) % musicFiles.size();
  loadMusic(currentSongIndex);
  startMusic();
}

// loadMusicFiles 函数：从当前目录加载音乐文件
ArrayList<String> loadMusicFiles() {
  ArrayList<String> files = new ArrayList<String>();
  File folder = new File(sketchPath(""));
  File[] listOfFiles = folder.listFiles();

  if (listOfFiles != null) {
    for (File file : listOfFiles) {
      if (file.isFile() && (file.getName().endsWith(".mp3") || file.getName().endsWith(".wav") || file.getName().endsWith(".au") || file.getName().endsWith(".flac"))) {
        // 只添加原始文件，不重复添加转换后的 WAV 文件
        if (!file.getName().endsWith(".wav") || !new File(sketchPath(file.getName().replace(".wav", ".flac"))).exists()) {
          files.add(file.getName());
        }
      }
    }
  }

  return files;
}

// 将 FLAC 文件转换为 WAV 文件并播放
void convertFlacToWav(String filename) {
  isFlacPlaying = true;
  String wavFilename = filename.substring(0, filename.lastIndexOf('.')) + ".wav";
  FFmpeg ffmpeg = FFmpeg.atPath();

  flacThread = new Thread(() -> {
    try {
      ffmpeg.addInput(UrlInput.fromPath(new File(sketchPath(filename)).toPath()))
            .addOutput(UrlOutput.toPath(new File(sketchPath(wavFilename)).toPath()))
            .execute();
      player = minim.loadFile(wavFilename);
      if (player != null) {
        player.play();
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      isFlacPlaying = false;
    }
  });
  flacThread.start();
}

// SetupPostFX 函数：后处理效果的设置（占位符）
void SetupPostFX() {
  // 在此添加你的后处理设置代码
}

// ApplyPostFX 函数：应用后处理效果（占位符）
void ApplyPostFX(PGraphics pg) {
  // 在此添加你的后处理应用代码
}

// Arc 类：绘制弧线效果
class Arc extends MG {
  float d1, d2, angle, len;
  int off;

  Arc(float x, float y) {
    super(x, y);

    T = floor(random(20, 30));
    float size = random(200, height);
    
    d1 = random(size * 0.9);
    d2 = d1 + random((size - d1) * 0.8);
    angle = random(TWO_PI);
    len = angle + random(PI);
    off = 4;
  }

  void gradientArc(PGraphics pg, float t) {
    pg.push();
    pg.blendMode(BLEND);
    pg.translate(x, y);
    pg.noFill();
    pg.stroke(0);
    pg.strokeWeight(off);
    
    int n = floor((d2 - d1) / off);
    for (int i = 0; i < floor(n * EA.easeInOutExpo(t)); i++) {
      float d = map(i, 0, n, d1, d2);
      pg.arc(0, 0, d, d, angle, len);
    }
    pg.pop();
  }

  void render(PGraphics pg) {
    pg.push();
    float t1 = EA.clamp(t, 0, 0.5, true);
    float t2 = EA.clamp(t, 0.5, 1, true);
    
    if (t < 0.5) {
      gradientArc(pg, t1);
    } else {
      gradientArc(pg, 1 - t2);
    }
    pg.pop();
  }
}

// Ease 类：处理缓动效果
class Ease {
  float clamp(float t, float minV, float maxV, boolean remap) {
    t = min(max(t, minV), maxV);
    return remap ? map(t, minV, maxV, 0, 1) : t;
  }

  float easeInExpo(float t) {
    return t == 0 ? 0 : pow(2, 10 * t - 10);
  }

  float easeOutExpo(float t) {
    return t == 1 ? 1 : 1 - pow(2, -10 * t);
  }

  float easeInOutExpo(float t) {
    if (t == 0) return 0;
    if (t == 1) return 1;
    return t < 0.5 ? pow(2, 20 * t - 10) * 0.5 : (2 - pow(2, -20 * t + 10)) * 0.5;
  }
}

// MGSystem 类：管理图形效果系统
class MGSystem {
  ArrayList<MG> mgs;
  boolean black;

  MGSystem() {
    mgs = new ArrayList<MG>();
    black = true;
  }

  void update() {
    for (int i = mgs.size() - 1; i >= 0; i--) {
      MG mg = mgs.get(i);
      mg.update();

      if (mg.done) {
        mgs.remove(i);
        mg.fade();
      }
    }
  }

  void render(PGraphics pg) {
    pg.beginDraw();
    pg.background(black ? 0 : 255);  // 黑色为 0，白色为 255

    pg.strokeCap(SQUARE);
    pg.blendMode(DIFFERENCE);

    for (MG mg : mgs) {
      mg.render(pg);
    }

    pg.endDraw();
  }

  void addMG(MG mg) {
    mgs.add(mg);
  }

  void reverse() {
    black = !black;
  }
}

// MG 类：图形效果的基类
class MG {
  float x, y;
  int T, startF;
  float t;
  boolean done;

  MG() {}

  MG(float x, float y) {
    this.x = x;
    this.y = y;
    T = floor(random(60, 120));
    startF = frameCount;
  }

  void update() {
    int f = (frameCount - startF);
    t = (f % T) / (float) T;
    done = (f % T == 0);
  }

  void render(PGraphics pg) {}

  void fade() {}
}

// Polygon 类：绘制多边形效果
class Polygon extends MG {
  boolean bReverse;
  float num;
  int dir;
  float sw, size, angle;
  float maxSize, maxAngle;
  color c; // 新增颜色属性

  Polygon(float x, float y) {
    super(x, y);

    bReverse = random(8) < 1;
    num = floor(random(3, 7));
    if (random(8) < 1) num = 0;

    dir = random(2) < 1 ? 1 : -1;
    size = 0;
    angle = 0;
    maxSize = random(height * 0.1, height * 1.3);
    maxAngle = random(HALF_PI, TWO_PI);

    // 如果 colorMode 为 true，则赋予随机颜色
    if (colorMode) {
      c = color(random(255), random(255), random(255));
    } else {
      c = color(255); // 黑白模式下为白色
    }
  }

  void update() {
    super.update();

    sw = EA.easeInExpo(1 - t) * maxSize * 0.25;
    size = EA.easeOutExpo(t) * maxSize;
    angle = EA.easeOutExpo(t) * maxAngle * dir;
  }

  void render(PGraphics pg) {
    pg.push();
    pg.strokeWeight(sw);
    pg.translate(x, y);
    pg.rotate(angle);

    if (bReverse) {
      pg.fill(c);
      pg.noStroke();
    } else {
      pg.noFill();
      pg.stroke(c);
    }

    if (num == 0) {
      pg.circle(0, 0, size * 2);
    } else {
      pg.beginShape();
      for (int i = 0; i < num; i++) {
        float a = map(i, 0, num, 0, TWO_PI);
        float vx = size * cos(a);
        float vy = size * sin(a);
        pg.vertex(vx, vy);
      }
      pg.endShape(CLOSE);
    }
    pg.pop();
  }

  void fade() {
    if (bReverse) MS.reverse();
  }
}
