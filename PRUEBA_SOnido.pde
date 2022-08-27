import processing.sound.*;
String [] nombre={"fragmento02", "fragmento03", "fragmento04", "fragmento05", "fragmento06",
  "fragmento07", "fragmento08", "fragmento09", "fragmento010", "fragmento011", "fragmento012", "fragmento013",
  "fragmento014", "fragmento015", "fragmento016", "fragmento017", "fragmento018",
  "fragmento019", "fragmento020", "fragmento021", "fragmento022", "fragmento023", "fragmento024",
  "fragmento025", "fragmento026", "fragmento027", "fragmento028", "fragmento029", "fragmento030", "fragmento031"};
SoundFile[] fragmento;
int numeroDeFragmento=2;
int tiempo= 2000;
int marcaDeTiempo=0;
int marcaDeTiempo2=0;
void setup(){
fragmento=new SoundFile[30];

for (int i=0; i<30; i++) {
    fragmento [i]= new SoundFile(this, nombre[i]+".wav");
    }}
void draw(){
  boolean quedaSonando=false;
int queF=0;
int queFNo=0;
marcaDeTiempo=millis()-marcaDeTiempo2;

if(marcaDeTiempo>tiempo){
//fragmento[numeroDeFragmento].play();
marcaDeTiempo2=millis();
fragmento[numeroDeFragmento].play();
numeroDeFragmento++;

}
if(mousePressed==true && numeroDeFragmento%2==0){queF=queFragmentoEntro();
quedaSonando=true;
}
else{
queFNo=queFragmentoNoEntro();
fragmento[queFNo].amp(0.0);}
if(numeroDeFragmento>8){numeroDeFragmento=0;}
println(marcaDeTiempo,queF,quedaSonando);
if(quedaSonando==true){ fragmento[queFragmentoEntro()].amp(0.2);}


}
int queFragmentoEntro() {
return(numeroDeFragmento);}
int queFragmentoNoEntro() {
return(numeroDeFragmento);}
