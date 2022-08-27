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
boolean [] entroFragmento;
int a;
void setup(){
fragmento=new SoundFile[30];
entroFragmento= new boolean[30];
for (int i=0; i<30; i++) {
    fragmento [i]= new SoundFile(this, nombre[i]+".wav");
    }}
    
    void draw(){
  marcaDeTiempo=millis()-marcaDeTiempo2;
if(entroFragmento[1]==true){fragmento[1].amp(0.2);}
if(entroFragmento[2]==true){fragmento[2].amp(0.2);}
if(entroFragmento[3]==true){fragmento[3].amp(0.2);}
if(entroFragmento[4]==true){fragmento[4].amp(0.2);}
if(entroFragmento[5]==true){fragmento[5].amp(0.2);}
if(entroFragmento[6]==true){fragmento[6].amp(0.2);}
if(entroFragmento[7]==true){fragmento[7].amp(0.2);}
if(entroFragmento[8]==true){fragmento[8].amp(0.2);}
if(entroFragmento[9]==true){fragmento[9].amp(0.2);}
if(entroFragmento[10]==true){fragmento[10].amp(0.2);}
if(entroFragmento[11]==true){fragmento[11].amp(0.2);}
if(entroFragmento[12]==true){fragmento[12].amp(0.2);}
if(entroFragmento[13]==true){fragmento[13].amp(0.2);}
if(entroFragmento[14]==true){fragmento[14].amp(0.2);}
if(entroFragmento[15]==true){fragmento[15].amp(0.2);}
if(entroFragmento[16]==true){fragmento[16].amp(0.2);}
if(entroFragmento[17]==true){fragmento[17].amp(0.2);}
if(entroFragmento[18]==true){fragmento[18].amp(0.2);}
if(entroFragmento[19]==true){fragmento[19].amp(0.2);}
if(entroFragmento[20]==true){fragmento[20].amp(0.2);}
if(entroFragmento[21]==true){fragmento[21].amp(0.2);}
if(entroFragmento[22]==true){fragmento[22].amp(0.2);}
if(entroFragmento[23]==true){fragmento[23].amp(0.2);}
if(entroFragmento[24]==true){fragmento[24].amp(0.2);}
if(entroFragmento[25]==true){fragmento[25].amp(0.2);}
if(entroFragmento[26]==true){fragmento[26].amp(0.2);}
if(entroFragmento[27]==true){fragmento[27].amp(0.2);}
if(entroFragmento[28]==true){fragmento[28].amp(0.2);}
if(entroFragmento[29]==true){fragmento[29].amp(0.2);}

if(marcaDeTiempo>tiempo){
//fragmento[numeroDeFragmento].play();
marcaDeTiempo2=millis();
fragmento[numeroDeFragmento].play();
fragmento[numeroDeFragmento].amp(0.0);
numeroDeFragmento++;

}
    if(numeroDeFragmento>28){numeroDeFragmento=0;}
    println(a,entroFragmento[1],entroFragmento[2],entroFragmento[3],entroFragmento[4],numeroDeFragmento);
    
    
    }
    void mouseClicked(){
    
    entroFragmento[numeroDeFragmento]=true;
    }
