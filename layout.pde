void mainLayout()
{
  //banner
  float ratio = (float)width/banner.width;
  bannerH = Math.round(banner.height*ratio);
  // println(banner.width + " - " + banner.height + " -> ratio = " + ratio);
  // println(width + " - " + bannerH + "|" + f);

  image(banner, 0, 0, width, bannerH);
  line(0, bannerH, width, bannerH);

  //logo
  image(logo, 0, height-logo.height);
  
  //copyright
  textSize(28);  textAlign(RIGHT);
  fill(0);
  text("nvthai.fr@gmail.com", width, height-10);
}

void strokeText(String message, int x, int y, int textColor, int strokeColor) 
{ 
  fill(strokeColor); 
  text(message, x-1, y); 
  text(message, x, y-1); 
  text(message, x+1, y); 
  text(message, x, y+1); 
  fill(textColor); 
  text(message, x, y); 
} 