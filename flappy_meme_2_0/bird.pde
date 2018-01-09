void bird()
{
   
  if(started==true||event=="DEAD")
  {
    
    
    bird_y=bird_y-2*bird_usk;
    bird_usk-=1.2;
    //onClick : (withoust the button for sound) 
    if(((mousePressed&&!(mouseX>=displayWidth-displayHeight/12-10&&mouseX<=displayWidth-10&&mouseY>=10&&mouseY<=10+displayHeight/12))||keyCode==32||keyCode==38)&&event=="PLAY")
    {
     
      mousePressed=false;
      keyCode=66;
      bird_usk=int(displayHeight/63.5);
    }
    
    if(bird_y<=0)
    {
      bird_y=0;
    }
    if(bird_y>=displayHeight-displayHeight/13)
    {
      bird_y=displayHeight-displayHeight/13;
      event="DEAD";
     
    }
    
    
    
  }
  
  
  
  
  
}
void bird_print()
{
  if(started==true||event=="DEAD")
  {
  if(bird_usk>=6)image(bird_up,bird_x,bird_y);
  if(bird_usk<6&&bird_usk>=-3)image(bird,bird_x,bird_y);
  if(bird_usk<-3)image(bird_down,bird_x,bird_y);
  }
  if(event=="NOTHING")
  {
    image(bird,displayWidth/5,displayHeight/2);
    bird_x=displayWidth/5;
    bird_y=displayHeight/2;
    bird_usk=int(displayHeight/63.5);
  }
}