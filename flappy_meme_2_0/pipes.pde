void pipes()
{
  if(started==true)
  {
    //
    for(int a=0;a<=11;a++)
    {
      if(abs (pipe_x[a] - bird_x) <= abs(pipe_x[real_closest_pipe] - bird_x))
      {
        real_closest_pipe=a;
      }
      if( abs (pipe_x[a] - bird_x) <= params_pipes_x && ((pipe_y[a] - displayHeight/1.8+displayHeight/1.44)-params_birds > bird_y || pipe_y[a] + displayHeight/2.5 -params_birds < bird_y)    && (bird_x>pipe_x[real_closest_pipe] && bird_x<pipe_x[real_closest_pipe]+params_pipes_x)   )
   
    //those above are silly
    
     {
      event="DEAD";
      
    }
      if(event!="DEAD")pipe_x[a]-=displayWidth/192;
        if(pipe_x[a]<=-(displayWidth/0.96))pipe_x[a]=int(displayWidth/0.37);
    }
    
    //lemme fix this:
    
    //if((abs(pipe_x[real_closest_pipe]-bird_x<=params_pipes_x))&&((pipe_y[a] - displayHeight/1.8+displayHeight/1.44)-params_birds > bird_y || pipe_y[a] + displayHeight/2.5 < bird_y)&&(bird_x>pipe_x[real_closest_pipe]&&bird_x<pipe_x[real_closest_pipe]+params_pipes_x))
   
  }
}
void pipe_draw()
{
  if(started==true)
  {
    for(int a=0;a<=11;a++)
    {
      image(pipe_above,pipe_x[a],pipe_y[a]-displayHeight/1.8);
      image(pipe_under,pipe_x[a],pipe_y[a]+displayHeight/2.2);
      //gets interesting if ya put pipe_x[pipes_num]-=20;
      //if(pipe_av[a]==1)
    }
  }
}