void start_beg()
{
 if(started==false)
 {
   
   for(int a=0;a<=11;a++)
  {
    //pipe_av[a]=0;
    pipe_x[a]=int(displayWidth/0.48)+int(displayWidth/3.2)*a;
    //pipe_x[a]=4000;
    pipe_y[a]=int(random(0,displayHeight/2));
  }
   
 
 }
}