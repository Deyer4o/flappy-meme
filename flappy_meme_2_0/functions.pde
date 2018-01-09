void prepare_loading()
{
  //images:
  background = loadImage("background.jpg");
  background.resize(displayWidth,displayHeight);
  launch = loadImage("launch.jpg");
  launch.resize(displayHeight/3,displayHeight/3);
  bird = loadImage("yellowbird.png");
  bird.resize(params_birds,params_birds);
  bird_down = loadImage("yellowbird_down.png");
  bird_down.resize(params_birds,params_birds);
  bird_up = loadImage("yellowbird_up.png");
  bird_up.resize(params_birds,params_birds);
  pipe_above = loadImage("pipe_above.png");
  pipe_above.resize(params_pipes_x,params_pipes_y);
  pipe_under = loadImage("pipe_under.png");
  pipe_under.resize(params_pipes_x,params_pipes_y);
  score_img = loadImage("score.png");
  score_img.resize(displayHeight/3,displayHeight/12);
  dead_screen = loadImage("end-of-game.png");
  dead_screen.resize(int(displayWidth/1.5),int(displayHeight/1.5));
  music_on = loadImage("audio_on.png");
  music_on.resize(displayHeight/12,displayHeight/12);
  music_off = loadImage("audio_off.png");
  music_off.resize(displayHeight/12,displayHeight/12);
  //sounds:
  dead_scream = new SoundFile(this,"dead_scream.mp3");
  play_theme = new SoundFile(this,"Doom_original.mp3");
}


void event_checker()
{
  
  if(keyCode=='R')
    {
      keyCode='B';
      event="NOTHING";
      
    }
    
  // EVENT NOTHING //
  
  if(event=="NOTHING")
  {
    real_closest_pipe=0;
    started=false;
    score=0;
    pipes_num=0;
    
    image(launch,displayWidth/3,displayHeight/3);
   
    //if button pressed:
    if(mousePressed == true && mouseX>=displayWidth/3 && mouseY>=displayHeight/3 && mouseX<=displayWidth/3+displayHeight/3 && mouseY<=displayHeight/3+displayHeight/3)
    {
      mousePressed=false;
      started=true;
      event="PLAY";
    }
  }
  
  // EVENT PLAY //
  
  if(event=="PLAY")
  {
    //for(int bb=0;bb<=11;bb++)
    if(abs (pipe_x[pipes_num] - bird_x) <= 30)
    {
      //pipes_num++;
      prov_pipe=true;
    }
    else
    {
      if(prov_pipe==true)
      {
        prov_pipe=false;
        //do dat shit
        score++;
        
         pipes_num++;
        if(pipes_num>11)pipes_num=0;
      }
    }
    if(song_theme==false)
    {
      score=0;
      song_theme=true;
      play_theme.play();
    }
    image(score_img,displayWidth/2-displayHeight/5,displayHeight/108);
    textSize(30);
    fill(255);
    text(score,displayWidth/2-displayHeight/20,displayHeight/15);
  }
  else
  {
    pipes_num=0;
    song_theme=false;
    play_theme.stop();
  }
  
  // EVENT DEAD //
  
  if(event=="DEAD")
  {
   started=false;
   
   if(song_log==false)
   {
     pipes_num=0;
     song_log=true;
     dead_scream.play();
   }
   image(dead_screen,displayWidth/10,displayHeight/10);
   image(score_img,displayWidth/2-displayHeight/16,displayHeight/2);
   textSize(30);
   fill(255);
   text(score,displayWidth/2+displayHeight/11,displayHeight/2+displayHeight/15);
   fill(#FC001E);
   rect(displayWidth/2-displayHeight/16/5,displayHeight/2+displayHeight/10,displayHeight/3-displayHeight/12-displayHeight/16/5,displayHeight/12);
   textSize(40);
   fill(255);
   text("RETRY",displayWidth/2-displayHeight/16+displayHeight/9,displayHeight/2+displayHeight/10+displayHeight/20);
   //on click:
   if(mousePressed&&mouseX>=displayWidth/2-displayHeight/16/5&&mouseX<=displayWidth/2-displayHeight/16/5+displayHeight/3-displayHeight/12-displayHeight/16/5&&mouseY>=displayHeight/2+displayHeight/10&&mouseY<=displayHeight/2+displayHeight/10+displayHeight/12)
   {
     mousePressed=false;
     event="NOTHING";
   }
  }
  else 
  {
    song_log=false;
    dead_scream.stop();
  }
  
  
}

long since(long time){
  return millis() - time;
}

void sound()
{
  
 if(music==true)
 {
   fill(#A2FF86);
   rect(displayWidth-displayHeight/12-10,10,displayHeight/12,displayHeight/12);
   image(music_on,displayWidth-displayHeight/12-10,10);
   dead_scream.amp(1);
   play_theme.amp(1);
 }
 else if(music==false)
 {
   fill(#FF8686);
   rect(displayWidth-displayHeight/12-10,10,displayHeight/12,displayHeight/12);
   image(music_off,displayWidth-displayHeight/12-10,10);
   dead_scream.amp(0);
   play_theme.amp(0);
 }
 
 //on keyPressed
 if(mousePressed&&mouseX>=displayWidth-displayHeight/12-10&&mouseX<=displayWidth-10&&mouseY>=10&&mouseY<=10+displayHeight/12||keyCode==77)
 {
   keyCode=66;
   mousePressed=false;
   if(music==true)music=false;
   else if(music==false)music=true;
 }
 

}

// Developers Stuff O.o i guess a.k.a. mine stuff :O  ... xd wtf..
void developers_stuff()
{
  if(keyCode==93)
  {
    keyCode=66;
    if(dev_mode)
    {
      dev_mode=false;
      
    }
    else if(dev_mode==false)
    {
      dev_mode=true;
           
      
    }
    
  }
   
   if(dev_mode)
    {
      //rects for devs:
      noFill();
      
      //lines and shits:
      stroke(255,0,0);
      line(bird_x+params_birds/2,bird_y+params_birds/2,pipe_x[real_closest_pipe],bird_y+params_birds/2);
      
      //rekt (and circle) for BIRD:
      stroke(255);
      rect(bird_x,bird_y,params_birds,params_birds);
      stroke(0,255,0);
      ellipse(bird_x+params_birds/2,bird_y+params_birds/2,params_pipes_x,params_pipes_x);
      
      //rekt for pipe
      noFill();
      stroke(0,0,255);
      rect(pipe_x[real_closest_pipe],pipe_y[real_closest_pipe]-displayHeight/1.8+displayHeight/1.44,params_pipes_x,displayHeight/1.8+displayHeight/1.44+displayHeight/2.2);
      
      //just for sure default stuff:
      stroke(0);
      
    }
  //do stuff
  if(dev_mode)
  {
    textSize(50);
    fill(0);
    text("DEVELOPER's MODE",displayWidth/1.5,displayHeight/6);
    fill(215,0,0);
    textSize(30);
    text("Event :",displayWidth/1.5,displayHeight/6+40);
    text(event,displayWidth/1.5+270,displayHeight/6+40);
    text("pipe num (0-11) :",displayWidth/1.5,displayHeight/6+2*40);
    text(pipes_num,displayWidth/1.5+270,displayHeight/6+2*40);
    text("Closest pipe :",displayWidth/1.5,displayHeight/6+3*40);
    text(real_closest_pipe,displayWidth/1.5+270,displayHeight/6+3*40);
    text("dist. to closest:",displayWidth/1.5,displayHeight/6+4*40);
    text(abs (pipe_x[real_closest_pipe] - bird_x),displayWidth/1.5+270,displayHeight/6+4*40);
    
  }
}