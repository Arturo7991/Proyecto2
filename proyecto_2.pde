//proyecto2
//Edgar Arturo Yebra González
int P=1, L=0, X, Y, DX;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

class pixelarts{
int x,y;
int pa;
pixelarts(int x_,int y_,int pa_){
x=x_;
y=y_;
pa=pa_;
}
void dpa(){
  switch(pa){
  case 1:{pa1();}break;
  case 2:{pa2();}break;
}}}

class Box{
  Body body;
int w,h;
int r,g,b;
Box(int x, int y,int r_,int g_,int b_){
w=19;
h=20;  
r=r_;
g=g_;
b=b_;

    BodyDef bd = new BodyDef();      
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    
    body = box2d.createBody(bd);

    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
   
    fd.density = 1;
    fd.friction = 0.5;
    fd.restitution = 0.5;
    
    body.createFixture(fd);
}
 //void killBody() {
 //box2d.destroyBody(body);}
    
    void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    pushMatrix();
    fill(r,g,b);
    stroke(0);
    rectMode(CENTER);
    rect(pos.x,pos.y,w,h);
    popMatrix();
}}

class Boundary {
float x,y,w,h;
Body b;
Boundary(float x_,float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
  PolygonShape sd = new PolygonShape();
  
  float box2dW = box2d.scalarPixelsToWorld(w/2);
  float box2dH = box2d.scalarPixelsToWorld(h/2);
    
  sd.setAsBox(box2dW, box2dH);

  BodyDef bd = new BodyDef();
  bd.type = BodyType.STATIC;
  bd.position.set(box2d.coordPixelsToWorld(x,y));
  b = box2d.createBody(bd);
    
  b.createFixture(sd,1);
    
  b.setUserData(this);
  }
  void display() {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}

Boundary wall;
ArrayList<Box> boxes;
pixelarts pa1;
pixelarts pa2;
Box2DProcessing box2d;  

void setup(){
size(500,700);
rectMode(CENTER);
pa1=new pixelarts(0,0,1);
pa2=new pixelarts(0,0,2);
box2d = new Box2DProcessing(this);  
box2d.createWorld();
boxes = new ArrayList<Box>();
wall = new Boundary(250,650,400,1);
wall = new Boundary(50,325,1,650);
wall = new Boundary(70,325,1,650);
wall = new Boundary(90,325,1,650);
wall = new Boundary(110,325,1,650);
wall = new Boundary(130,325,1,650);
wall = new Boundary(150,325,1,650);
wall = new Boundary(170,325,1,650);
wall = new Boundary(190,325,1,650);
wall = new Boundary(210,325,1,650);
wall = new Boundary(230,325,1,650);
wall = new Boundary(250,325,1,650);
wall = new Boundary(270,325,1,650);
wall = new Boundary(290,325,1,650);
wall = new Boundary(310,325,1,650);
wall = new Boundary(330,325,1,650);
wall = new Boundary(350,325,1,650);
wall = new Boundary(370,325,1,650);
wall = new Boundary(390,325,1,650);
wall = new Boundary(410,325,1,650);
wall = new Boundary(430,325,1,650);
wall = new Boundary(450,325,1,650);
}

void draw(){
if(P==1){
  pantalla1();}
if(P==2){
  pantalla2();}
if(P==3){
  pantalla3();}
}
  
void espacio(){
if(key==' '){
  P=2;}}
  
//void p(){
//if(key=='p'){
//P=1;
//L=0;}}
   
  
void eleccion(){
if(mouseX<200 && mouseX>80 && mouseY<463 && mouseY>337){
noFill();
stroke(36, 113, 163);
strokeWeight(7);
rect(140,400,120,127,7);}
if(mouseX<414 && mouseX>306 && mouseY<463 && mouseY>337){
noFill();
stroke(36, 113, 163);
strokeWeight(7);
rect(360,400,120,129,7);}
if(mouseX<329 && mouseX>171 && mouseY<605 && mouseY>535){
noFill();
stroke(36, 113, 163);
strokeWeight(7);
rect(250,570,158,70,7);}}

void mouseClicked(){
if(P==2){
  if(mouseX<200 && mouseX>80 && mouseY<463 && mouseY>337){
  P=3;
  L=1;}
  if(mouseX<414 && mouseX>306 && mouseY<463 && mouseY>337){
  P=3;
  L=2;}
  if(mouseX<329 && mouseX>171 && mouseY<605 && mouseY>535){
  P=3;}}}

void pantalla1(){
background(0);
textSize(70);
fill(255);
text("Drop",140,300);
text("Pixel",200,370);
textSize(20);
text("presiona espacio para continuar",100,650);
espacio();}

void pantalla2(){
background(0);
textSize(30);
text("SELECCIONA UN PIXEL ART",60,80);
textSize(25);
text("¡modo libre!",176,575);
noFill();
stroke(255);
strokeWeight(7);
rect(140,400,120,127,7);
rect(360,400,120,129,7);
rect(250,570,158,70,7);
eleccion();
if(P==2){
  scale(.28);
  translate(250,968);
pa1.dpa();
  translate(787,10);
pa2.dpa();}
}

void pantalla3(){
background(255);
line(50,650,450,650);
line(50,650,50,0);
line(450,650,450,0);
line(70,650,70,0);
line(90,650,90,0);
line(110,650,110,0);
line(130,650,130,0);
line(150,650,150,0);
line(170,650,170,0);
line(190,650,190,0);
line(210,650,210,0);
line(230,650,230,0);
line(250,650,250,0);
line(270,650,270,0);
line(290,650,290,0);
line(310,650,310,0);
line(330,650,330,0);
line(350,650,350,0);
line(370,650,370,0);
line(390,650,390,0);
line(410,650,410,0);
line(430,650,430,0);

textAlign(CENTER);
fill(0);
textSize(15);
text("-Presiona 'Esc' para salir",250,675);
text("'colores'",37,675);
text("q -",15,425);
text("w -",15,440);
text("e -",15,455);
text("r -",15,470);
text("t -",15,485);
text("y -",15,500);
text("u -",15,515);
text("i -",15,530);
text("o -",15,545);
text("a -",15,560);
text("s -",15,575);
text("d -",15,590);
text("f -",15,605);
text("g -",15,620);
text("h -",15,635);
text("j -",15,650);
textAlign(LEFT);
fill(0);
ellipse(35,420,13,13);
fill(255);
ellipse(35,435,13,13);
fill(255,0,0);
ellipse(35,450,13,13);
fill(255,166,0);
ellipse(35,465,13,13);
fill(255,255,0);
ellipse(35,480,13,13);
fill(166,255,0);
ellipse(35,495,13,13);
fill(0,255,0);
ellipse(35,510,13,13);
fill(0,255,166);
ellipse(35,525,13,13);
fill(0,255,255);
ellipse(35,540,13,13);
fill(0,166,255);
ellipse(35,555,13,13);
fill(0,0,255);
ellipse(35,570,13,13);
fill(166,0,255);
ellipse(35,585,13,13);
fill(255,0,255);
ellipse(35,600,13,13);
fill(255,0,166);
ellipse(35,615,13,13);
fill(166,94,46);
ellipse(35,630,13,13);
fill(87,166,57);
ellipse(35,645,13,13);
fill(0);
rect(X,10,20,20);
  X+=DX;
  if((X>=490) && (Y>=0)){
  DX=DX*-1;}
  if(X<=0){
   DX=DX+1;}
box2d.step();    
  if (keyPressed){
    if(key=='q'){
    Box p = new Box(X,10,0,0,0);
    boxes.add(p);
    keyPressed = false;}
    if(key=='w'){
    Box p = new Box(X,10,255,255,255);
    boxes.add(p);
  keyPressed = false;}
    if(key=='e'){
    Box p = new Box(X,10,255,0,0);
    boxes.add(p);
  keyPressed = false;}
    if(key=='r'){
    Box p = new Box(X,10,255,166,0);
    boxes.add(p);
  keyPressed = false;}
    if(key=='t'){
    Box p = new Box(X,10,255,255,0);
    boxes.add(p);
  keyPressed = false;}
    if(key=='y'){
    Box p = new Box(X,10,166,255,0);
    boxes.add(p);
  keyPressed = false;}
    if(key=='u'){
    Box p = new Box(X,10,0,255,0);
    boxes.add(p);
  keyPressed = false;}
    if(key=='i'){
    Box p = new Box(X,10,0,255,166);
    boxes.add(p);
  keyPressed = false;}
    if(key=='o'){
    Box p = new Box(X,10,0,255,255);
    boxes.add(p);
  keyPressed = false;}
    if(key=='a'){
    Box p = new Box(X,10,0,166,255);
    boxes.add(p);
  keyPressed = false;}
    if(key=='s'){
    Box p = new Box(X,10,0,0,255);
    boxes.add(p);
  keyPressed = false;}
    if(key=='d'){
    Box p = new Box(X,10,166,0,255);
    boxes.add(p);
  keyPressed = false;}
    if(key=='f'){
    Box p = new Box(X,10,255,0,255);
    boxes.add(p);
  keyPressed = false;}
    if(key=='g'){
    Box p = new Box(X,10,255,0,166);
    boxes.add(p);
  keyPressed = false;}
    if(key=='h'){
    Box p = new Box(X,10,166,94,46);
    boxes.add(p);
  keyPressed = false;}
    if(key=='j'){
    Box p = new Box(X,10,87,166,57);
    boxes.add(p);
  keyPressed = false;}
  }
  for (Box b: boxes) {
    b.display();
  }
  if(L==1){
  scale(.38);
  translate(850,-100);
pa1.dpa();}
else if(L==2){
   scale(.38);
   translate(850,-100);
pa2.dpa();}
//p();

}
 
// void keyPressed(){}
 
void pa1(){
strokeWeight(2);
//1
fill(255);
stroke(0);
rect(60,660,20,20);
rect(80,660,20,20);
rect(100,660,20,20);
rect(120,660,20,20);
rect(140,660,20,20);
fill(0);
stroke(255);
rect(160,660,20,20);
rect(180,660,20,20);
fill(255);
stroke(0);
rect(200,660,20,20);
rect(220,660,20,20);
rect(240,660,20,20);
fill(0);
stroke(255);
rect(260,660,20,20);
rect(280,660,20,20);
fill(255);
stroke(0);
rect(300,660,20,20);
rect(320,660,20,20);
rect(340,660,20,20);
rect(360,660,20,20);
rect(380,660,20,20);
rect(400,660,20,20);
rect(420,660,20,20);
rect(440,660,20,20);
//2
rect(60,640,20,20);
rect(80,640,20,20);
rect(100,640,20,20);
rect(120,640,20,20);
rect(140,640,20,20);
fill(0);
stroke(255);
rect(160,640,20,20);
fill(255);
stroke(0);
rect(180,640,20,20);
rect(200,640,20,20);
rect(220,640,20,20);
rect(240,640,20,20);
fill(0);
stroke(255);
rect(260,640,20,20);
fill(255);
stroke(0);
rect(280,640,20,20);
rect(300,640,20,20);
rect(320,640,20,20);
rect(340,640,20,20);
rect(360,640,20,20);
rect(380,640,20,20);
rect(400,640,20,20);
rect(420,640,20,20);
rect(440,640,20,20);
//3
rect(60,620,20,20);
rect(80,620,20,20);
rect(100,620,20,20);
rect(120,620,20,20);
rect(140,620,20,20);
fill(0);
stroke(255);
rect(160,620,20,20);
rect(180,620,20,20);
fill(255);
stroke(0);
rect(200,620,20,20);
rect(220,620,20,20);
rect(240,620,20,20);
fill(0);
stroke(255);
rect(260,620,20,20);
fill(255);
stroke(0);
rect(280,620,20,20);
rect(300,620,20,20);
rect(320,620,20,20);
rect(340,620,20,20);
rect(360,620,20,20);
rect(380,620,20,20);
rect(400,620,20,20);
rect(420,620,20,20);
rect(440,620,20,20);
//4
rect(60,600,20,20);
rect(80,600,20,20);
rect(100,600,20,20);
rect(120,600,20,20);
rect(140,600,20,20);
fill(0);
stroke(255);
rect(160,600,20,20);
rect(180,600,20,20);
rect(200,600,20,20);
fill(255);
stroke(0);
rect(220,600,20,20);
fill(0);
stroke(255);
rect(240,600,20,20);
rect(260,600,20,20);
fill(255);
stroke(0);
rect(280,600,20,20);
rect(300,600,20,20);
rect(320,600,20,20);
rect(340,600,20,20);
rect(360,600,20,20);
rect(380,600,20,20);
rect(400,600,20,20);
rect(420,600,20,20);
rect(440,600,20,20);
//5
rect(60,580,20,20);
rect(80,580,20,20);
rect(100,580,20,20);
rect(120,580,20,20);
rect(140,580,20,20);
fill(0);
stroke(255);
rect(160,580,20,20);
rect(180,580,20,20);
rect(200,580,20,20);
rect(220,580,20,20);
rect(240,580,20,20);
rect(260,580,20,20);
fill(255);
stroke(0);
rect(280,580,20,20);
rect(300,580,20,20);
rect(320,580,20,20);
rect(340,580,20,20);
rect(360,580,20,20);
rect(380,580,20,20);
rect(400,580,20,20);
rect(420,580,20,20);
rect(440,580,20,20);
//6
rect(60,560,20,20);
rect(80,560,20,20);
rect(100,560,20,20);
rect(120,560,20,20);
fill(0);
stroke(255);
rect(140,560,20,20);
rect(160,560,20,20);
rect(180,560,20,20);
rect(200,560,20,20);
rect(220,560,20,20);
rect(240,560,20,20);
rect(260,560,20,20);
fill(255);
stroke(0);
rect(280,560,20,20);
rect(300,560,20,20);
rect(320,560,20,20);
rect(340,560,20,20);
rect(360,560,20,20);
rect(380,560,20,20);
rect(400,560,20,20);
rect(420,560,20,20);
rect(440,560,20,20);
//7
rect(60,540,20,20);
rect(80,540,20,20);
rect(100,540,20,20);
fill(0);
stroke(255);
rect(120,540,20,20);
rect(140,540,20,20);
rect(160,540,20,20);
rect(180,540,20,20);
rect(200,540,20,20);
rect(220,540,20,20);
rect(240,540,20,20);
rect(260,540,20,20);
rect(280,540,20,20);
fill(255);
stroke(0);
rect(300,540,20,20);
rect(320,540,20,20);
rect(340,540,20,20);
rect(360,540,20,20);
rect(380,540,20,20);
rect(400,540,20,20);
rect(420,540,20,20);
rect(440,540,20,20);
//8
rect(60,520,20,20);
rect(80,520,20,20);
fill(0);
stroke(255);
rect(100,520,20,20);
rect(120,520,20,20);
rect(140,520,20,20);
rect(160,520,20,20);
rect(180,520,20,20);
rect(200,520,20,20);
rect(220,520,20,20);
rect(240,520,20,20);
rect(260,520,20,20);
rect(280,520,20,20);
rect(300,520,20,20);
fill(255);
stroke(0);
rect(320,520,20,20);
rect(340,520,20,20);
rect(360,520,20,20);
rect(380,520,20,20);
rect(400,520,20,20);
rect(420,520,20,20);
rect(440,520,20,20);
//9
rect(60,500,20,20);
fill(0);
stroke(255);
rect(80,500,20,20);
rect(100,500,20,20);
rect(120,500,20,20);
rect(140,500,20,20);
rect(160,500,20,20);
rect(180,500,20,20);
rect(200,500,20,20);
rect(220,500,20,20);
rect(240,500,20,20);
rect(260,500,20,20);
rect(280,500,20,20);
rect(300,500,20,20);
rect(320,500,20,20);
fill(255);
stroke(0);
rect(340,500,20,20);
rect(360,500,20,20);
rect(380,500,20,20);
rect(400,500,20,20);
rect(420,500,20,20);
rect(440,500,20,20);
//10
fill(0);
stroke(255);
rect(60,480,20,20);
rect(80,480,20,20);
rect(100,480,20,20);
rect(120,480,20,20);
rect(140,480,20,20);
rect(160,480,20,20);
rect(180,480,20,20);
rect(200,480,20,20);
rect(220,480,20,20);
rect(240,480,20,20);
rect(260,480,20,20);
rect(280,480,20,20);
rect(300,480,20,20);
rect(320,480,20,20);
fill(255);
stroke(0);
rect(340,480,20,20);
rect(360,480,20,20);
rect(380,480,20,20);
rect(400,480,20,20);
rect(420,480,20,20);
rect(440,480,20,20);
//11
fill(0);
stroke(255);
rect(60,460,20,20);
rect(80,460,20,20);
rect(100,460,20,20);
fill(255);
stroke(0);
rect(120,460,20,20);
rect(140,460,20,20);
rect(160,460,20,20);
fill(0);
stroke(255);
rect(180,460,20,20);
rect(200,460,20,20);
rect(220,460,20,20);
rect(240,460,20,20);
rect(260,460,20,20);
rect(280,460,20,20);
rect(300,460,20,20);
rect(320,460,20,20);
fill(255);
stroke(0);
rect(340,460,20,20);
fill(0);
stroke(255);
rect(360,460,20,20);
fill(255);
stroke(0);
rect(380,460,20,20);
rect(400,460,20,20);
rect(420,460,20,20);
rect(440,460,20,20);
//12
fill(0);
stroke(255);
rect(60,440,20,20);
rect(80,440,20,20);
fill(255);
stroke(0);
rect(100,440,20,20);
rect(120,440,20,20);
rect(140,440,20,20);
rect(160,440,20,20);
rect(180,440,20,20);
fill(0);
stroke(255);
rect(200,440,20,20);
rect(220,440,20,20);
rect(240,440,20,20);
rect(260,440,20,20);
rect(280,440,20,20);
rect(300,440,20,20);
rect(320,440,20,20);
rect(340,440,20,20);
rect(360,440,20,20);
fill(255);
stroke(0);
rect(380,440,20,20);
rect(400,440,20,20);
rect(420,440,20,20);
rect(440,440,20,20);
//13
fill(0);
stroke(255);
rect(60,420,20,20);
fill(255);
stroke(0);
rect(80,420,20,20);
rect(100,420,20,20);
rect(120,420,20,20);
rect(140,420,20,20);
rect(160,420,20,20);
rect(180,420,20,20);
rect(200,420,20,20);
fill(0);
stroke(255);
rect(220,420,20,20);
rect(240,420,20,20);
rect(260,420,20,20);
rect(280,420,20,20);
rect(300,420,20,20);
rect(320,420,20,20);
fill(255);
stroke(0);
rect(340,420,20,20);
rect(360,420,20,20);
rect(380,420,20,20);
rect(400,420,20,20);
rect(420,420,20,20);
rect(440,420,20,20);
//14
fill(0);
stroke(255);
rect(60,400,20,20);
fill(255);
stroke(0);
rect(80,400,20,20);
rect(100,400,20,20);
rect(120,400,20,20);
rect(140,400,20,20);
rect(160,400,20,20);
rect(180,400,20,20);
rect(200,400,20,20);
rect(220,400,20,20);
fill(0);
stroke(255);
rect(240,400,20,20);
rect(260,400,20,20);
rect(280,400,20,20);
rect(300,400,20,20);
rect(320,400,20,20);
fill(255);
stroke(0);
rect(340,400,20,20);
rect(360,400,20,20);
rect(380,400,20,20);
rect(400,400,20,20);
rect(420,400,20,20);
rect(440,400,20,20);
//15
rect(60,380,20,20);
rect(80,380,20,20);
rect(100,380,20,20);
rect(120,380,20,20);
rect(140,380,20,20);
rect(160,380,20,20);
rect(180,380,20,20);
rect(200,380,20,20);
rect(220,380,20,20);
rect(240,380,20,20);
fill(0);
stroke(255);
rect(260,380,20,20);
rect(280,380,20,20);
rect(300,380,20,20);
rect(320,380,20,20);
rect(340,380,20,20);
rect(360,380,20,20);
rect(380,380,20,20);
rect(400,380,20,20);
fill(255);
stroke(0);
rect(420,380,20,20);
rect(440,380,20,20);
//16
rect(60,360,20,20);
rect(80,360,20,20);
rect(100,360,20,20);
rect(120,360,20,20);
rect(140,360,20,20);
rect(160,360,20,20);
rect(180,360,20,20);
rect(200,360,20,20);
rect(220,360,20,20);
rect(240,360,20,20);
fill(0);
stroke(255);
rect(260,360,20,20);
rect(280,360,20,20);
rect(300,360,20,20);
rect(320,360,20,20);
rect(340,360,20,20);
fill(255);
stroke(0);
rect(360,360,20,20);
rect(380,360,20,20);
rect(400,360,20,20);
rect(420,360,20,20);
rect(440,360,20,20);
//17
rect(60,340,20,20);
rect(80,340,20,20);
rect(100,340,20,20);
rect(120,340,20,20);
rect(140,340,20,20);
rect(160,340,20,20);
rect(180,340,20,20);
rect(200,340,20,20);
rect(220,340,20,20);
rect(240,340,20,20);
fill(0);
stroke(255);
rect(260,340,20,20);
rect(280,340,20,20);
rect(300,340,20,20);
rect(320,340,20,20);
rect(340,340,20,20);
rect(360,340,20,20);
rect(380,340,20,20);
rect(400,340,20,20);
rect(420,340,20,20);
rect(440,340,20,20);
//18
fill(255);
stroke(0);
rect(60,320,20,20);
rect(80,320,20,20);
rect(100,320,20,20);
rect(120,320,20,20);
rect(140,320,20,20);
rect(160,320,20,20);
rect(180,320,20,20);
rect(200,320,20,20);
rect(220,320,20,20);
rect(240,320,20,20);
fill(0);
stroke(255);
rect(260,320,20,20);
rect(280,320,20,20);
rect(300,320,20,20);
rect(320,320,20,20);
rect(340,320,20,20);
rect(360,320,20,20);
rect(380,320,20,20);
rect(400,320,20,20);
rect(420,320,20,20);
rect(440,320,20,20);
//19
fill(255);
stroke(0);
rect(60,300,20,20);
rect(80,300,20,20);
rect(100,300,20,20);
rect(120,300,20,20);
rect(140,300,20,20);
rect(160,300,20,20);
rect(180,300,20,20);
rect(200,300,20,20);
rect(220,300,20,20);
rect(240,300,20,20);
fill(0);
stroke(255);
rect(260,300,20,20);
rect(280,300,20,20);
rect(300,300,20,20);
rect(320,300,20,20);
rect(340,300,20,20);
rect(360,300,20,20);
rect(380,300,20,20);
rect(400,300,20,20);
rect(420,300,20,20);
rect(440,300,20,20);
//20
fill(255);
stroke(0);
rect(60,280,20,20);
rect(80,280,20,20);
rect(100,280,20,20);
rect(120,280,20,20);
rect(140,280,20,20);
rect(160,280,20,20);
rect(180,280,20,20);
rect(200,280,20,20);
rect(220,280,20,20);
rect(240,280,20,20);
fill(0);
stroke(255);
rect(260,280,20,20);
rect(280,280,20,20);
fill(255);
stroke(0);
rect(300,280,20,20);
fill(0);
stroke(255);
rect(320,280,20,20);
rect(340,280,20,20);
rect(360,280,20,20);
rect(380,280,20,20);
rect(400,280,20,20);
rect(420,280,20,20);
rect(440,280,20,20);
//21
fill(255);
stroke(0);
rect(60,260,20,20);
rect(80,260,20,20);
rect(100,260,20,20);
rect(120,260,20,20);
rect(140,260,20,20);
rect(160,260,20,20);
rect(180,260,20,20);
rect(200,260,20,20);
rect(220,260,20,20);
rect(240,260,20,20);
rect(260,260,20,20);
fill(0);
stroke(255);
rect(280,260,20,20);
rect(300,260,20,20);
rect(320,260,20,20);
rect(340,260,20,20);
rect(360,260,20,20);
rect(380,260,20,20);
rect(400,260,20,20);
rect(420,260,20,20);
fill(255);
stroke(0);
rect(440,260,20,20);
}

void pa2(){
stroke(0);  
fill(255);
strokeWeight(2);
rect(60,660,20,20);
rect(60,640,20,20);
rect(60,620,20,20);
rect(60,600,20,20);
rect(60,580,20,20);
rect(60,560,20,20);
rect(60,540,20,20);
rect(60,520,20,20);
rect(60,500,20,20);
rect(60,480,20,20);
rect(60,460,20,20);
rect(60,440,20,20);
rect(60,420,20,20);
rect(60,400,20,20);
rect(60,380,20,20);
rect(60,360,20,20);
rect(60,340,20,20);
rect(60,320,20,20);
rect(60,300,20,20);
rect(60,280,20,20);
rect(60,260,20,20);
rect(60,240,20,20);

rect(440,660,20,20);
rect(440,640,20,20);
rect(440,620,20,20);
rect(440,600,20,20);
rect(440,580,20,20);
rect(440,560,20,20);
rect(440,540,20,20);
rect(440,520,20,20);
rect(440,500,20,20);
rect(440,480,20,20);
rect(440,460,20,20);
rect(440,440,20,20);
rect(440,420,20,20);
rect(440,400,20,20);
rect(440,380,20,20);
rect(440,360,20,20);
rect(440,340,20,20);
rect(440,320,20,20);
rect(440,300,20,20);
rect(440,280,20,20);
rect(440,260,20,20);
rect(440,240,20,20);
//1
rect(80,660,20,20);
rect(100,660,20,20);
rect(120,660,20,20);
rect(140,660,20,20);
rect(160,660,20,20);
rect(180,660,20,20);
rect(200,660,20,20);
fill(166,94,46);
rect(220,660,20,20);
rect(240,660,20,20);
rect(260,660,20,20);
rect(280,660,20,20);
fill(255);
rect(300,660,20,20);
rect(320,660,20,20);
rect(340,660,20,20);
rect(360,660,20,20);
rect(380,660,20,20);
rect(400,660,20,20);
rect(420,660,20,20);
//2
rect(80,640,20,20);
rect(100,640,20,20);
rect(120,640,20,20);
rect(140,640,20,20);
rect(160,640,20,20);
rect(180,640,20,20);
rect(200,640,20,20);
fill(166,94,46);
rect(220,640,20,20);
rect(240,640,20,20);
rect(260,640,20,20);
rect(280,640,20,20);
fill(255);
rect(300,640,20,20);
rect(320,640,20,20);
rect(340,640,20,20);
rect(360,640,20,20);
rect(380,640,20,20);
rect(400,640,20,20);
rect(420,640,20,20);
//3
rect(80,620,20,20);
rect(100,620,20,20);
rect(120,620,20,20);
rect(140,620,20,20);
rect(160,620,20,20);
rect(180,620,20,20);
rect(200,620,20,20);
fill(166,94,46);
rect(220,620,20,20);
rect(240,620,20,20);
rect(260,620,20,20);
rect(280,620,20,20);
fill(255);
rect(300,620,20,20);
rect(320,620,20,20);
rect(340,620,20,20);
rect(360,620,20,20);
rect(380,620,20,20);
rect(400,620,20,20);
rect(420,620,20,20);
//4
rect(80,600,20,20);
rect(100,600,20,20);
rect(120,600,20,20);
rect(140,600,20,20);
rect(160,600,20,20);
rect(180,600,20,20);
fill(166,94,46);
rect(200,600,20,20);
rect(220,600,20,20);
rect(240,600,20,20);
rect(260,600,20,20);
rect(280,600,20,20);
rect(300,600,20,20);
fill(255);
rect(320,600,20,20);
rect(340,600,20,20);
rect(360,600,20,20);
rect(380,600,20,20);
rect(400,600,20,20);
rect(420,600,20,20);
//5
rect(80,580,20,20);
rect(100,580,20,20);
rect(120,580,20,20);
rect(140,580,20,20);
rect(160,580,20,20);
rect(180,580,20,20);
rect(200,580,20,20);
fill(87,166,57);
rect(220,580,20,20);
rect(240,580,20,20);
rect(260,580,20,20);
rect(280,580,20,20);
fill(255);
rect(300,580,20,20);
rect(320,580,20,20);
rect(340,580,20,20);
rect(360,580,20,20);
rect(380,580,20,20);
rect(400,580,20,20);
rect(420,580,20,20);
//6
rect(80,560,20,20);
rect(100,560,20,20);
rect(120,560,20,20);
rect(140,560,20,20);
rect(160,560,20,20);
rect(180,560,20,20);
rect(200,560,20,20);
fill(87,166,57);
rect(220,560,20,20);
rect(240,560,20,20);
rect(260,560,20,20);
rect(280,560,20,20);
fill(255);
rect(300,560,20,20);
rect(320,560,20,20);
rect(340,560,20,20);
rect(360,560,20,20);
rect(380,560,20,20);
rect(400,560,20,20);
rect(420,560,20,20);
//7
rect(80,540,20,20);
rect(100,540,20,20);
rect(120,540,20,20);
rect(140,540,20,20);
rect(160,540,20,20);
rect(180,540,20,20);
fill(87,166,57);
rect(200,540,20,20);
rect(220,540,20,20);
rect(240,540,20,20);
rect(260,540,20,20);
rect(280,540,20,20);
rect(300,540,20,20);
fill(255);
rect(320,540,20,20);
rect(340,540,20,20);
rect(360,540,20,20);
rect(380,540,20,20);
rect(400,540,20,20);
rect(420,540,20,20);
//8
rect(80,520,20,20);
rect(100,520,20,20);
rect(120,520,20,20);
rect(140,520,20,20);
rect(160,520,20,20);
rect(180,520,20,20);
fill(87,166,57);
rect(200,520,20,20);
rect(220,520,20,20);
rect(240,520,20,20);
rect(260,520,20,20);
rect(280,520,20,20);
rect(300,520,20,20);
fill(255);
rect(320,520,20,20);
rect(340,520,20,20);
rect(360,520,20,20);
rect(380,520,20,20);
rect(400,520,20,20);
rect(420,520,20,20);
//9
rect(80,500,20,20);
fill(87,166,57);
rect(100,500,20,20);
rect(120,500,20,20);
rect(140,500,20,20);
rect(160,500,20,20);
rect(180,500,20,20);
rect(200,500,20,20);
rect(220,500,20,20);
rect(240,500,20,20);
rect(260,500,20,20);
rect(280,500,20,20);
rect(300,500,20,20);
fill(255);
rect(320,500,20,20);
rect(340,500,20,20);
rect(360,500,20,20);
rect(380,500,20,20);
rect(400,500,20,20);
rect(420,500,20,20);
//10
fill(87,166,57);
rect(80,480,20,20);
rect(100,480,20,20);
rect(120,480,20,20);
rect(140,480,20,20);
rect(160,480,20,20);
rect(180,480,20,20);
rect(200,480,20,20);
rect(220,480,20,20);
rect(240,480,20,20);
rect(260,480,20,20);
rect(280,480,20,20);
rect(300,480,20,20);
fill(255);
rect(320,480,20,20);
rect(340,480,20,20);
rect(360,480,20,20);
rect(380,480,20,20);
rect(400,480,20,20);
rect(420,480,20,20);
//11
fill(87,166,57);
rect(80,460,20,20);
rect(100,460,20,20);
rect(120,460,20,20);
fill(255);
rect(140,460,20,20);
rect(160,460,20,20);
rect(180,460,20,20);
fill(87,166,57);
rect(200,460,20,20);
rect(220,460,20,20);
rect(240,460,20,20);
rect(260,460,20,20);
rect(280,460,20,20);
rect(300,460,20,20);
rect(320,460,20,20);
rect(340,460,20,20);
rect(360,460,20,20);
rect(380,460,20,20);
rect(400,460,20,20);
fill(255);
rect(420,460,20,20);
//12
fill(87,166,57);
rect(80,440,20,20);
rect(100,440,20,20);
rect(120,440,20,20);
fill(255);
rect(140,440,20,20);
rect(160,440,20,20);
rect(180,440,20,20);
fill(87,166,57);
rect(200,440,20,20);
rect(220,440,20,20);
rect(240,440,20,20);
rect(260,440,20,20);
rect(280,440,20,20);
rect(300,440,20,20);
rect(320,440,20,20);
rect(340,440,20,20);
rect(360,440,20,20);
rect(380,440,20,20);
rect(400,440,20,20);
rect(420,440,20,20);
//13
fill(87,166,57);
rect(80,420,20,20);
rect(100,420,20,20);
rect(120,420,20,20);
fill(255);
rect(140,420,20,20);
rect(160,420,20,20);
fill(87,166,57);
rect(180,420,20,20);
rect(200,420,20,20);
fill(0);
rect(220,420,20,20);
fill(87,166,57);
rect(240,420,20,20);
rect(260,420,20,20);
rect(280,420,20,20);
rect(300,420,20,20);
fill(255);
rect(320,420,20,20);
rect(340,420,20,20);
rect(360,420,20,20);
fill(87,166,57);
rect(380,420,20,20);
rect(400,420,20,20);
rect(420,420,20,20);
//14
rect(80,400,20,20);
rect(100,400,20,20);
rect(120,400,20,20);
fill(255);
rect(140,400,20,20);
rect(160,400,20,20);
fill(87,166,57);
rect(180,400,20,20);
rect(200,400,20,20);
fill(0);
rect(220,400,20,20);
fill(87,166,57);
rect(240,400,20,20);
rect(260,400,20,20);
rect(280,400,20,20);
rect(300,400,20,20);
fill(255);
rect(320,400,20,20);
rect(340,400,20,20);
rect(360,400,20,20);
fill(87,166,57);
rect(380,400,20,20);
rect(400,400,20,20);
rect(420,400,20,20);
//15
fill(255);
rect(80,380,20,20);
fill(87,166,57);
rect(100,380,20,20);
fill(255);
rect(120,380,20,20);
rect(140,380,20,20);
rect(160,380,20,20);
fill(87,166,57);
rect(180,380,20,20);
rect(200,380,20,20);
rect(220,380,20,20);
rect(240,380,20,20);
rect(260,380,20,20);
rect(280,380,20,20);
rect(300,380,20,20);
fill(255);
rect(320,380,20,20);
rect(340,380,20,20);
rect(360,380,20,20);
fill(87,166,57);
rect(380,380,20,20);
rect(400,380,20,20);
rect(420,380,20,20);
//16
fill(255);
rect(80,360,20,20);
rect(100,360,20,20);
rect(120,360,20,20);
rect(140,360,20,20);
rect(160,360,20,20);
fill(87,166,57);
rect(180,360,20,20);
fill(0);
rect(200,360,20,20);
fill(87,166,57);
rect(220,360,20,20);
fill(0);
rect(240,360,20,20);
fill(87,166,57);
rect(260,360,20,20);
rect(280,360,20,20);
rect(300,360,20,20);
fill(255);
rect(320,360,20,20);
rect(340,360,20,20);
rect(360,360,20,20);
fill(87,166,57);
rect(380,360,20,20);
rect(400,360,20,20);
rect(420,360,20,20);
//17
fill(255);
rect(80,340,20,20);
rect(100,340,20,20);
rect(120,340,20,20);
rect(140,340,20,20);
rect(160,340,20,20);
fill(87,166,57);
rect(180,340,20,20);
fill(0);
rect(200,340,20,20);
fill(87,166,57);
rect(220,340,20,20);
fill(0);
rect(240,340,20,20);
fill(87,166,57);
rect(260,340,20,20);
rect(280,340,20,20);
rect(300,340,20,20);
fill(255);
rect(320,340,20,20);
rect(340,340,20,20);
rect(360,340,20,20);
fill(87,166,57);
rect(380,340,20,20);
rect(400,340,20,20);
rect(420,340,20,20);
//18
fill(255);
rect(80,320,20,20);
rect(100,320,20,20);
rect(120,320,20,20);
rect(140,320,20,20);
rect(160,320,20,20);
fill(87,166,57);
rect(180,320,20,20);
fill(0);
rect(200,320,20,20);
fill(87,166,57);
rect(220,320,20,20);
fill(0);
rect(240,320,20,20);
fill(87,166,57);
rect(260,320,20,20);
rect(280,320,20,20);
rect(300,320,20,20);
fill(255);
rect(320,320,20,20);
rect(340,320,20,20);
rect(360,320,20,20);
rect(380,320,20,20);
fill(87,166,57);
rect(400,320,20,20);
fill(255);
rect(420,320,20,20);
//19
rect(80,300,20,20);
rect(100,300,20,20);
rect(120,300,20,20);
rect(140,300,20,20);
rect(160,300,20,20);
fill(87,166,57);
rect(180,300,20,20);
rect(200,300,20,20);
rect(220,300,20,20);
rect(240,300,20,20);
rect(260,300,20,20);
rect(280,300,20,20);
rect(300,300,20,20);
fill(255);
rect(320,300,20,20);
rect(340,300,20,20);
rect(360,300,20,20);
rect(380,300,20,20);
rect(400,300,20,20);
rect(420,300,20,20);
//20
rect(80,280,20,20);
rect(100,280,20,20);
rect(120,280,20,20);
rect(140,280,20,20);
rect(160,280,20,20);
fill(87,166,57);
rect(180,280,20,20);
rect(200,280,20,20);
rect(220,280,20,20);
rect(240,280,20,20);
rect(260,280,20,20);
rect(280,280,20,20);
fill(255);
rect(300,280,20,20);
rect(320,280,20,20);
rect(340,280,20,20);
rect(360,280,20,20);
rect(380,280,20,20);
rect(400,280,20,20);
rect(420,280,20,20);
//21
rect(80,260,20,20);
rect(100,260,20,20);
rect(120,260,20,20);
rect(140,260,20,20);
rect(160,260,20,20);
rect(180,260,20,20);
fill(87,166,57);
rect(200,260,20,20);
rect(220,260,20,20);
rect(240,260,20,20);
rect(260,260,20,20);
rect(280,260,20,20);
fill(255);
rect(300,260,20,20);
rect(320,260,20,20);
rect(340,260,20,20);
rect(360,260,20,20);
rect(380,260,20,20);
rect(400,260,20,20);
rect(420,260,20,20);
//22
rect(80,240,20,20);
rect(100,240,20,20);
rect(120,240,20,20);
rect(140,240,20,20);
rect(160,240,20,20);
rect(180,240,20,20);
rect(200,240,20,20);
fill(87,166,57);
rect(220,240,20,20);
rect(240,240,20,20);
rect(260,240,20,20);
fill(255);
rect(280,240,20,20);
rect(300,240,20,20);
rect(320,240,20,20);
rect(340,240,20,20);
rect(360,240,20,20);
rect(380,240,20,20);
rect(400,240,20,20);
rect(420,240,20,20);
}