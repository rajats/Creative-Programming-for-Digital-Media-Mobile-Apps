//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//Credits: Images used are taken from google.com/images

Maxim maxim;
AudioPlayer sample1;
AudioPlayer sample2; 
AudioPlayer sample3; 
AudioPlayer sample4;
AudioPlayer sample5;

AudioPlayer bassSound;
AudioPlayer snareSound; 
AudioPlayer hihatSound; 
AudioPlayer crashSound;
AudioPlayer htomSound;
AudioPlayer ltomSound;
AudioPlayer mtomSound;
AudioPlayer chinaSound;

boolean[] track1;
boolean[] track2;
boolean[] track3;
boolean[] track4;
boolean[] track5;

int playhead;

int numBeats;
int currentBeat;
int buttonWidth;
int buttonHeight;
Boolean showGUI=true,isdrum=false,isseq=false,drumpressed=true,seqpressed=true;

PImage bImage; 
Button bassb=new Button("  BASS  ",0,220,150,58);
Button snareb=new Button("  SNARE  ",0,278,150,58);
Button hihatb=new Button(" HIHAT ",0,336,150,58);
Button tomb=new Button(" TOM  ",0,394,150,58);
Button clap=new Button(" CLAP  ",0,452,150,58);


PImage bass,crash,hihat,snare,htom,ltom1,ltom2,mtom,china,logo; 
 Button drums=new Button(" DRUM KIT",950,300,200,100);
 Button seq=new Button(" DRUM MACHINE",950,520,200,100);
 Button back=new Button("BACK",1050,40,100,100);


void setup() {
  size(1200, 700);
  background(255);
  numBeats = 16;
  currentBeat =2;
  buttonWidth = width/numBeats;
  buttonHeight = height/12;
  maxim = new Maxim(this);
  bassSound = maxim.loadFile("bd1.wav");
  bassSound.setLooping(false);
 // bassSound.volume(1.0);
  snareSound = maxim.loadFile("sn1.wav");
  snareSound.setLooping(false);
 // snareSound.volume(1.0);
  hihatSound = maxim.loadFile("hh1.wav");
  hihatSound.setLooping(false);
  crashSound = maxim.loadFile("crash1.wav");
  crashSound.setLooping(false);
  htomSound = maxim.loadFile("hitom1.wav");
  htomSound.setLooping(false);
  ltomSound = maxim.loadFile("lotom1.wav");
  ltomSound.setLooping(false);
  mtomSound = maxim.loadFile("midtom1.wav");
  mtomSound.setLooping(false);
  chinaSound = maxim.loadFile("china1.wav");
  chinaSound.setLooping(false);
  
  sample1 = maxim.loadFile("bd1.wav");
  sample1.volume(0.5);
  sample1.setLooping(false);
  sample2 = maxim.loadFile("sn1.wav");
  sample2.setLooping(false);
  sample2.volume(1);
  sample3 = maxim.loadFile("hh1.wav");
  sample3.volume(0.5);
  sample3.setLooping(false);
  sample4 = maxim.loadFile("sn2.wav");
  sample4.setLooping(false);
  sample5 = maxim.loadFile("clap.wav");
  sample5.setLooping(false);
  
  track1 = new boolean[numBeats];
  track2 = new boolean[numBeats];
  track3 = new boolean[numBeats];
  track4 = new boolean[numBeats];
  track5 = new boolean[numBeats];
  
  bImage = loadImage("mmb1.jpg");
  bImage.resize(1200,700);
  
  // set up the sequences
 frameRate(60);

  
}

void draw() {
  if(showGUI) {
   logo=loadImage("logo1.png");
   image(logo,100,100);
   drums.display();
   seq.display();
  }
  
  if(isseq) { 
  //background(0);
  fill(0);
  rect(0,220,width,290);
  stroke(255);
  bassb.display();
  snareb.display();
  hihatb.display();
  tomb.display();
  clap.display();
  for (int i = 0; i < 6; i++)
    line(150, 220+(i*height/12), width, 220+(i*height/12));
  for (int i = 2; i < numBeats + 1; i++)
    line((i*width/numBeats), 220, (i*width/numBeats), 220+(5*height/12));


  // draw a moving square showing where the sequence is 
  fill(255,215,0, 120);
  rect(150+((currentBeat-2)*buttonWidth), 220, buttonWidth, 290);

  for (int i = 2; i < numBeats; i++)
  {
    noStroke();
    fill(0,250,250);

    if (track1[i])
      rect((i*buttonWidth), 220+(0*buttonHeight), buttonWidth, buttonHeight);
    if (track2[i])
      rect((i*buttonWidth), 220+(1*buttonHeight), buttonWidth, buttonHeight);
    if (track3[i])
      rect((i*buttonWidth), 220+(2*buttonHeight), buttonWidth, buttonHeight);
    if (track4[i])
      rect((i*buttonWidth), 220+(3*buttonHeight), buttonWidth, buttonHeight);
    if (track5[i])
      rect((i*buttonWidth), 220+(4*buttonHeight), buttonWidth, buttonHeight);
  }

  playhead ++;
  //if (frameCount%4==0) {// 4 frames have passed check if we need to play a beat
  if(playhead % 4 == 0){
    if (track1[currentBeat]) // track1 wants to play on this beat
    {
      sample1.cue(0);
      sample1.play();
    }
    if (track2[currentBeat]) {
      sample2.cue(0);
      sample2.play();
    }
    if (track3[currentBeat]) {
      sample3.cue(0);  
      sample3.play();
    }
    if (track4[currentBeat]) {
      sample4.cue(0);
      sample4.play();
    }
    if (track5[currentBeat]) {
      sample5.cue(0);
      sample5.play();
    }
    // move to the next beat ready for next time
    currentBeat++;
    if (currentBeat >= numBeats)
      currentBeat = 2;
    
   }
    
    
  }
}

void mousePressed() {
  if(drums.mousePressed() && drumpressed) {
      showGUI=false;
      isdrum=true;
      seqpressed=false;
      background(255);
      bass=loadImage("bassdrum1.png");
      bass.resize(300,300);
      image(bass,450,350);
      snare=loadImage("snare2.png");
      snare.resize(200,200);
      image(snare,480,150);
      htom=loadImage("tom1.png");
      htom.resize(200,200);
      image(htom,230,250);
      mtom=loadImage("tom2.jpg");
      mtom.resize(200,200);
      image(mtom,740,250);
      ltom1=loadImage("lowtom.jpg");
      ltom1.resize(200,200);
      image(ltom1,780,500);
      ltom2=loadImage("lowtom.jpg");
      ltom2.resize(200,200);
      image(ltom2,220,500);
      hihat=loadImage("hihat1.png");
      hihat.resize(150,150);
      image(hihat,280,80);
      crash=loadImage("crash1.png");
      crash.resize(150,150);
      image(crash,720,80);
      china=loadImage("china.jpg");
      china.resize(120,120);
      image(china,520,10); 
      
      back.display();
     
    
  }
   if(isdrum) {
       if(mouseX >= 450 && mouseX <= 750 && mouseY >= 350 && mouseY <= 650) {
          bassSound.cue(0);
          bassSound.play();
       }
       else if(mouseX >= 480 && mouseX <= 680 && mouseY >= 150 && mouseY <= 350) {
          snareSound.cue(0);
          snareSound.play();
       }
       else if(mouseX >= 230 && mouseX <= 430 && mouseY >= 250 && mouseY <= 450) {
          htomSound.cue(0);
          htomSound.play();
       }
       else if(mouseX >= 740 && mouseX <= 940 && mouseY >= 250 && mouseY <= 450) {
          mtomSound.cue(0);
          mtomSound.play();
       }
       else if(mouseX >= 780 && mouseX <= 980 && mouseY >= 500 && mouseY <= 700) {
          ltomSound.cue(0);
          ltomSound.play();
       }
       else if(mouseX >= 220 && mouseX <= 420 && mouseY >= 500 && mouseY <= 700) {
          ltomSound.cue(0);
          ltomSound.play();
       }
       else if(mouseX >= 280 && mouseX <= 480 && mouseY >= 80 && mouseY <= 280) {
          hihatSound.cue(0);
          hihatSound.play();
       }
       else if(mouseX >= 720 && mouseX <= 920 && mouseY >= 80 && mouseY <= 280) {
          crashSound.cue(0);
          crashSound.play();
       }
       else if(mouseX >= 520 && mouseX <= 720 && mouseY >= 10 && mouseY <= 210) {
          chinaSound.cue(0);
          chinaSound.play();
       }
   }
     
     if(seq.mousePressed() && seqpressed){
       image(bImage, 0, 0);
       showGUI=false;
       drumpressed=false;
       isseq=true;
       back.display();
    } 
    if(back.mousePressed()) {
        background(255);
        showGUI=true;
        isseq=false;
        isdrum=false;
        seqpressed=true;
        drumpressed=true;
        numBeats = 16;
        currentBeat =2;
        buttonWidth = width/numBeats;
        buttonHeight = height/12;
        track1 = new boolean[numBeats];
        track2 = new boolean[numBeats];
        track3 = new boolean[numBeats];
        track4 = new boolean[numBeats];
        track5 = new boolean[numBeats];
      }  
     if(isseq ) {
       int index = (int) Math.floor((mouseX)*numBeats/width);   
       int track = (int) Math.floor((mouseY-220)*(12/(float)height));
 
        if (track == 0)
          track1[index] = !track1[index];
        if (track == 1)
          track2[index] = !track2[index];
        if (track == 2)
          track3[index] = !track3[index];
        if (track == 3)
          track4[index] = !track4[index]; 
        if (track == 4)
          track5[index] = !track5[index]; 
     } 
}
