import processing.sound.*;
SoundFile music;
boolean isPlaying = true;
float skyR,skyG,skyB;
float windowR,windowG,windowB;
float fan = 0.0;
float lp = 0.0;
color c1,c2;
PFont pixelFont, musicFont1, musicFont2;
int x1=510;
int y1=220;
int s,m,h;
float volume = 0.5;
float currentTime = 0;

void setup(){
  size(700,600);
  noStroke();
  frameRate(10);
  pixelFont = loadFont("Minecraft-48.vlw");
  musicFont1 = loadFont("fontbottonsmusic-48.vlw");
  musicFont2 = loadFont("ToneDeafBB-48.vlw");
  c1 = color(163,199,235);
  c2 = color(213,173,222);
  music = new SoundFile(this, "backgroundMusic.mp3");
  music.loop();
}

void draw(){
  background(230,230,255);
  
  //하늘
  skyR = map(mouseX, 0, height, 240, 90);
  skyG = map(mouseX, 0, height, 215, 95);
  skyB = map(mouseX, 0, height, 250, 155);
  fill(skyR, skyG, skyB);
  rect(30,30,640,280,10);
  
    //낮
  if(mouseX<350){
    //해
    fill(255,251,180,25);
    ellipse(100,100,100,100);
    fill(255,251,180,50);
    ellipse(100,100,90,90);
    fill(255,251,180,100);
    ellipse(100,100,85,85);
    fill(255,251,180,150);
    ellipse(100,100,80,80);
    fill(255,251,180,200);
    ellipse(100,100,75,75);
  }
  
  //밤
  if(mouseX>=350){
    //별
    for(int i=0; i<15; i++){
      fill(255);
      ellipse(random(30,670), random(30,310), 3, 3);
    }
    //달
    fill(250,240,200);
    ellipse(600,90,70,70);
    fill(skyR, skyG, skyB);
    ellipse(590,80,80,80);
  }

  //창문
  windowR = map(mouseX, 0, height, 230, 200);
  windowG = map(mouseX, 0, height, 180, 200);
  windowB = map(mouseX, 0, height, 208, 255);
  fill(windowR,windowG,windowB);
  rect(30,30,640,10,15);
  rect(30,170,640,5,15);
  rect(30,310,640,5,15);
  rect(30,30,5,283,15);
  rect(347.5,30,5,283,15);
  rect(665,30,5,283,15);
  
  //선반
  quad(30,315, 345,315, 323,345, 8,345);
  //선인장화분
  fill(100,135,90);
  ellipse(100.5,280,30,50);
  fill(150,185,140);
  ellipse(96,300,25,40);
  fill(170,210,195);
  quad(70,300, 125,300, 115,330, 80,330);
  //꽃화분
  stroke(110,135,95);
  strokeWeight(2);
  line(170,265,160,320);
  noStroke();
  fill(235,185,125);
  rect(150,290, 35,40,15,15,5,5);
  fill(230,195,100);
  ellipse(165,265,11,13);
  ellipse(175,265,11,13);
  ellipse(170,260,13,11);
  ellipse(170,270,13,11);
  fill(255);
  ellipse(170,265,6,6);
  strokeWeight(2);
  stroke(255);
  for (int i=0; i<32; i+=8){
    line(151,298+i,183,298+i);
  }
  noStroke();
  //물뿌리개
  stroke(236,114,114);
  strokeWeight(5);
  fill(0,0);
  bezier(290,295, 315,295, 315,315, 290,320);
  noStroke();
  fill(236,114,114);
  rect(250,290,45,40, 10,10,10,10);
  quad(253,300, 253,320, 225,285, 225,280);
  fill(180,60,60);
  arc(272.5,292,30,15,radians(0),radians(180));
 
  
  //선풍기
  fill(130,170,220);
  ellipse(50,480,60,30);
  rect(40,390,15,90, 10,10,10,10);
  fill(140,180,210);
  rect(40,390,50,20, 10,10,10,10);
  fill(154,197,244);
  ellipse(100,400,30,30);
  fill(255,100);
  pushMatrix();
  fill(255,200);
  translate(100,400);
  rotate(fan); //선풍기 돌아가는 코드
  ellipse(0,-25, 20,35);
  ellipse(0,25, 20,35);
  ellipse(25,0, 35,20);
  ellipse(-25,0, 35,20);
  popMatrix();
  fan += 0.5;
  stroke(100,145,195);
  strokeWeight(2);
  fill(222,243,255,50);
  ellipse(100,400,95,95);
  noStroke();
  fill(154,197,244);
  textFont(pixelFont);
  textSize(25);
  text("~",160,400);
  text("~",160,410);
  text("~",160,420);
  
  //책상
  fill(110,115,180);
  rect(295,405,20,150, 0,0,5,5);
  rect(375,315,20,180, 0,0,5,5);
  fill(160,165,230);
  quad(370,315, 780,315, 705,405, 295,405);
  
  //모니터
  setGradient(430,160,250,160,c2,c1);
  noStroke();
  fill(215,190,235);
  rect(430,295, 250,25);
  fill(210,180,225);
  quad(530,320, 580,320, 590,340, 520,340);
  fill(215,190,235);
  rect(515,340,80,7, 10);
  
  //화면
  fill(250,240,228,100);
  rect(475,180,160,100,15);
  fill(50);
  ellipse(520,230,60,60);
  fill(232,151,176);
  ellipse(520,230,18,18);
  ellipse(590,230,30,30);
  fill(100);
  textFont(musicFont1);
  textSize(13);
  text("f",559.5,235.5);
  text("e",608.5,235.5);
  
  //음악 재생, 멈춤
  if (isPlaying == true){
    fill(50);
    textFont(musicFont1);
    textSize(15);
    text("b",583,234.5);
    strokeWeight(1);
    stroke(200);
    fill(0,0);
    pushMatrix(); //lp 돌아가는 코드
    translate(520,230);
    rotate(lp);
    arc(0,0,50,50,radians(0), radians(45));
    arc(0,0,40,40,radians(0), radians(35));
    arc(0,0,50,50,radians(180), radians(225));
    arc(0,0,40,40,radians(180), radians(215));
    noStroke();
    popMatrix();
    lp += 0.3;
    textFont(musicFont2); //음표
    fill(255,180);
    text("a", x1, y1);
    text("b", x1+25, y1-15);
    text("c", x1+50, y1-30);
    text("d", x1+75, y1-45);
    text("e", x1+110, y1-60);
    text("f", x1+125, y1-75);
    text("g", x1+150, y1-90);
    x1 += 1.0;
    y1 -= 1.0;
    if(x1+100>width){
      x1 = 510;
      y1 = 220;
    }
  }else{
    fill(50);
    textFont(musicFont1);
    textSize(15);
    text("a",585,236.5);
  }
  
  //시계
  fill(50,50,100);
  quad(386,335,390,335,384,360,380,360);
  quad(436,335,440,335,448,360,444,360); //시계다리
  fill(250,245,230);
  rect(415,290,3,30);
  fill(250,245,230,100);
  ellipse(416.5,290,15,15);
  fill(250,245,230);
  ellipse(416.5,290,10,10); //시계안테나
  fill(235,215,222);
  ellipse(415,328,120,45);
  fill(50,50,100);
  rect(377,313,75,30,15);
  fill(230,150,175);
  m = minute();
  h = hour();
  textFont(pixelFont);
  textSize(20);
  //시간이 한자리수일때 앞에 0*시0*분으로 나타내기 위한 if문
  if (m<10){
     text(h+" : 0"+m, 388, 335);
  }
  else if (h<10){
     text("0"+h+" : "+m, 388, 335);
  }
  else if (m<10 && h<10){
     text("0"+h+" : 0"+m, 388, 335);
  }
  else{
     text(h+" : "+m, 388, 335);
  }
  
  //의자
  fill(205,205,245);
  rect(475,520,20,70, 0,0,5,5);
  rect(652,500,20,90, 0,0,5,5);
  fill(185,185,225);
  rect(450,470,20,85, 0,0,5,5);
  rect(630,470,20,85, 0,0,5,5);
  fill(205,205,245);
  quad(450,470, 600,470, 600,520, 475,520);
  fill(210,210,255);
  rect(473,370,200,150, 48,48,20,20);

  //강아지쿠션
  fill(210,210,255);
  ellipse(150,530,250,100);
  
  //강아지
  fill(245,240,225);
  ellipse(130,505,130,100);
  ellipse(110,525,100,50);
  fill(250,245,230);
  ellipse(180,515,100,80);
  ellipse(225,525,30,40);
  ellipse(135,525,30,40);
  fill(0);
  ellipse(180,523,10,5);
  ellipse(195,530,10,8);
  ellipse(210,523,10,5);
  if (mousePressed){
    fill(250,245,230);
    ellipse(180,505,100,80);
    ellipse(225,515,30,40);
    ellipse(135,515,30,40);
    fill(245,240,225);
    ellipse(70,480,40,40);
    fill(0);
    ellipse(180,513,10,10);
    ellipse(195,520,10,8);
    ellipse(210,513,10,10);
    textFont(pixelFont);
    textSize(20);
    fill(230,150,175);
    text("!?",210,465);
  }else{
    textFont(pixelFont);
    textSize(20);
    fill(160,160,205);
    text("zZ",210,470);
  }
 
  currentTime = music.position() / 1000.0 ;
}

void keyPressed(){
  if (key == ' ') {
    if (isPlaying) {
      music.pause();
    }else{
      music.play();
  }
  isPlaying = !isPlaying;
  }
  else if (keyCode == UP){
    volume = min(1.0, volume + 0.1);
    music.amp(volume);
    fill(255,150);
    rect(530,205,50,50, 15);
    fill(0,150);
    textFont(musicFont1);
    textSize(25);
    text(",",545,240);
  }
  else if (keyCode == DOWN){
    volume = max(0.0, volume - 0.1);
    music.amp(volume);
    fill(255,150);
    rect(530,205,50,50, 15);
    fill(0,150);
    textFont(musicFont1);
    textSize(25);
    text("+",545,240);
  }
  else if (keyCode == RIGHT){
    music.rate(1.5);
    fill(255,150);
    rect(530,205,50,50, 15);
    fill(0,150);
    textFont(musicFont1);
    textSize(25);
    text("3",545,240);
  }
  else if (keyCode == LEFT){
    music.rate(0.8);
    fill(255,150);
    rect(530,205,50,50, 15);
    fill(0,150);
    textFont(musicFont1);
    textSize(25);
    text("4",545,240);
  }
  else if (keyCode == ENTER){
    music.rate(1);
    fill(255,150);
    rect(530,205,50,50, 15);
    fill(0,150);
    textFont(musicFont1);
    textSize(25);
    text("9",545,240);
  }
}

void setGradient(int x, int y, float w, float h, color c1, color c2){
   for (int i = x; i <= x+w; i++) {
     float inter = map(i, x, x+w, 0, 1);
     color c = lerpColor(c1, c2, inter);
     stroke(c);
     line(i, y, i, y+h);
    }
}
