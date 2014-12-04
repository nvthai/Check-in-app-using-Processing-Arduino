void loadClientInfo()
{
    //clear();
    background(255);
    mainLayout();

    boolean flag = false;
    for (int i = 0; i < client.length; i++) 
    {
      println("Searching");
      XML idElement = client[i].getChild("id");
      id = idElement.getContent();
      if (id.equals(val))
      {
        println("Found");
        flag = true;
        XML nameElement = client[i].getChild("name");
        name = nameElement.getContent();
        XML phoneElement = client[i].getChild("phone");
        phone = phoneElement.getContent();
        XML emailElement = client[i].getChild("email");
        email = emailElement.getContent();
        XML addressElement = client[i].getChild("address");
        address = addressElement.getContent();

        loadAvatar();
        drawClientInfo(id, name, phone, email, address);
        return;
      }
    }

    if (flag == false)
    {
      // clear();
      // textSize(32);  textAlign(LEFT);
      // fill(255, 0, 0);
      // text("ID: " + val + "\n"
      //   + "ID NOT FOUND", 10, 50);
      
      name = "NOT FOUND";
      loadAvatar();
      drawClientInfo(val, name, "", "", "");
    }
}

void drawClientInfo(String _id, String _name, String _phone, String _email, String _address)
{
  namePosW = avaPW*2 + avaW;
  namePosH = avaPH + avaH/3;
  idPosW = namePosW;// under Avatar: avaPW + avaW/2;
  idPosH = namePosH + avaH/3;// under Avatar: avaPH + avaH + 50;
  infoPosW = namePosW;
  infoPosH = bannerH + 60;
  infoLength = width - (infoPosW + 150);

  textSize(50);  textAlign(LEFT);
  //fill(255);
  //text(_name, namePosW, namePosH);  
  strokeText(_name, namePosW, namePosH, 255, 0);

  textSize(32);  textAlign(LEFT);
  // fill(255);
  // text("("+_id+")", idPosW, idPosH);
  strokeText("("+_id+")", idPosW, idPosH, 255, 0);

  textSize(32);
  fill(0, 0, 255);
  textAlign(LEFT);
  text("Phone: " + "\n" 
        + "Email: " + "\n" 
        + "Address: ", infoPosW, infoPosH);

  fill(0, 204, 204);
  text(_phone + "\n" 
        + _email + "\n" 
        + _address, infoPosW + 140, infoPosH - 30, infoLength, height);
}

void loadAvatar()
{
  avaW = width/8;
  avaH = width/8;
  avaPW = width/15;
  avaPH = bannerH-width/8+40;
  
  stroke(0);strokeCap(ROUND);strokeWeight(10);noFill();
  rect(avaPW-5, avaPH-5, avaW+10, avaH+10);
  stroke(255);strokeCap(ROUND);strokeWeight(10);noFill();
  rect(avaPW-4, avaPH-4, avaW+8, avaH+8);
  
  ava = loadImage("photo/" + id + ".jpg");
  if (ava != null)
  {    
    image(ava, avaPW, avaPH, avaW, avaH);
  }
  else
  {
    image(noAva, avaPW, avaPH, avaW, avaH);
  }
}
