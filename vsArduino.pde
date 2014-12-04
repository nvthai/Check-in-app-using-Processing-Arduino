import processing.serial.*;
// import fullscreen.*; 
//import java.io.NullPointerException;

//Port controller
Serial myPort;  // Create object from Serial class
String[] serialString;  
String serialCheck;  
String portNameLinux1 = "/dev/ttyUSB";   // /dev/ttyS
String portNameLinux2 = "/dev/ttyS";
String portNameWin = "COM"; //for window 
int portNumber;  
int serialIndex; 

//Data variables
XML xml;
XML[] client;

String val = "";
String lastVal = "null";
String id, name, phone, email, address;
int lf = 10;      // ASCII linefeed 

//Graphics variables
// FullScreen fs;
PFont myFont = createFont("Geogore", 32);

PImage ava, noAva, banner, logo;
int bannerH;
int avaW, avaH, avaPW, avaPH;
int namePosW, namePosH, idPosW, idPosH, infoPosW, infoPosH, infoLength;

void setup()
{
  //load data + resource
  try
  {
    //load data from file XML
    xml = loadXML("ClientData.xml");
    client = xml.getChildren("client");
    
    //load resource
    banner = loadImage("layout/banner.jpg");
    logo = loadImage("layout/logo.png");
    noAva = loadImage("layout/noAva.jpg");
  }
  catch (NullPointerException e)
  {
    e.printStackTrace();
    println("Check Resource: images, data XML,..");
  }
  
  //setting up window size
  size(displayWidth, displayHeight);
  // fs = new FullScreen(this);
  // fs.enter();
  //frame.setResizable(true);
  
  //find and select port serial
  findSerialPort(); 
 
  myPort = new Serial(this, Serial.list()[portNumber], 115200);  
  myPort.clear(); 

  myPort.bufferUntil(lf); 
  
  //set display text Font
  textFont(myFont);
}

void draw()
{
  //mainLayout();

  if (lastVal.equals(val))
    return;
  else
  {
    loadClientInfo();
    lastVal = val;
  }
}

void serialEvent(Serial p) { 
  val = p.readString();
  val = val.substring(0, val.length()-1);
} 

void findSerialPort() {  
  serialString = Serial.list();  
   
  println(serialString);   
   
  for (int i = serialString.length - 1; i > 0; i--) 
  {     
    serialCheck = serialString[i];  
    //for Window
    serialIndex = serialCheck.indexOf(portNameWin);  
    if (serialIndex > -1)
    { 
      portNumber = i;
      return;
    }  
     
    //for Linux
    serialIndex = serialCheck.indexOf(portNameLinux1);  
    if (serialIndex > -1)
    { 
      portNumber = i;
      return;
    }
    serialIndex = serialCheck.indexOf(portNameLinux2);  
    if (serialIndex > -1)
    { 
      portNumber = i;
      return;
    }
  }
}  
