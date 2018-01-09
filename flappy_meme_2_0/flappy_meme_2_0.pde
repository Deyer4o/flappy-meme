import processing.sound.*;
//all params
long currentMillis;
long prev_millis_1=0,prev_millis_10=0,prev_millis_20=0,prev_millis_pipes=0,prev_millis_var=0,prev_millis_bird=0;
long lastFrameTime=1;

//logistics:
boolean dev_mode=false;
boolean started=false;
String event="NOTHING";
boolean music=true;
int score = 0;
int real_closest_pipe=0;
boolean song_log=false,song_theme=false;


//bird:
int bird_x=0,bird_y=0,bird_usk=1;


//pipes
int pipes_num=0;
boolean prov_pipe=false;
float ran_dom=0;
int[] pipe_x = new int [22];
int[] pipe_y = new int [22];
//int[] pipe_av= new int [22];

//pics and sounds:
SoundFile dead_scream,play_theme;
PImage bird,pipe_above,pipe_under,bird_down,bird_up,background,score_img,dead_screen;
//menu and stuff:
PImage launch, music_on,music_off;

static int interval_1=1,interval_10,interval_20=20,interval_pipes=10,interval_var=10,interval_bird=3;

//next variables are a little bit confusing couse WHY FUCKING NOT PUTING THEM TO 10???. (they change a few lines under it)
int params_birds=10,params_pipes_x=10,params_pipes_y=10;

void setup()
{  
  
  fullScreen();
  params_birds=displayHeight/10;
  params_pipes_x=displayHeight/6;
  params_pipes_y=int(displayHeight/1.44);
  prepare_loading();
}



void draw()
{ 
  
  
  currentMillis=millis();
  background(255);
  image(background,0,0);
  
  
  
  start_beg();
  
  pipe_draw();
  
  event_checker();
  
  lastFrameTime = millis();
  
  
//  *since(lastFrameTime
  
  
  //every (interval_1) miliseconds //
  if(currentMillis-prev_millis_1>=interval_1)
  {
     prev_millis_1=currentMillis;
     
     
     
     
     
     
  }
  
  
  //every (interval_bird) miliseconds //
  if(currentMillis-prev_millis_bird>=interval_bird)
  {
     prev_millis_bird=currentMillis;
     
     
     bird();
     
     
     
  }
  
  bird_print();
  
  
  //every (interval_10)miliseconds//
  if(currentMillis-prev_millis_10>=interval_10)
  {
    prev_millis_10=currentMillis;
     
     ran_dom=random(0,displayHeight/2);
  }
  
  
  //every (interval_20)miliseconds//
  if(currentMillis-prev_millis_20>=interval_20)
  {
    prev_millis_20=currentMillis;
     
     
  }
  
  
  //every (interval_pipes)miliseconds//
  if(currentMillis-prev_millis_pipes>=interval_pipes)
  {
    prev_millis_pipes=currentMillis;
    
    pipes();
     
  }
  
  //every (interval_var)miliseconds//
  if(currentMillis-prev_millis_var>=interval_var)
  {
    prev_millis_var=currentMillis;
     
     
  }

 sound();
 developers_stuff();
 
}