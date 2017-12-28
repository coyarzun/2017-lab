Analisys analisys;

void setup(){
  analisys = new Analisys();
  analisys.analize("01.gif");
}
void draw(){
}
class Analisys{
  String name;
  PImage img;
  ArrayList<Xcolor> palette;
  
  Analisys(){
    palette = new ArrayList<Xcolor>();
    name = url;
    analize(url);
  }
  void analize(String url){
    img = loadImage(url);
    makePalette();
    inform();
  }
  void makePalette(){
    for(int i=0; i<img.pixels.length; i++){
      color tmp = img.pixels[i];
      boolean exist = false;
      for(Xcolor c:palette){
        if(c.myColor == tmp){
          c.addOne();
          exist = true;
        }
      }
      if(!exist)palette.add(new Xcolor(tmp));
    }
  }
  void inform(){
    println("Source:  "+name);
    println("Colores: "+palette.size());
    for(Xcolor c:palette){
      println(c.myColor+"\t"+c.howMany);
    }
  }
}
class Xcolor{
  color myColor;
  int   howMany;
  
  Xcolor(color c){
    myColor = c;
    howMany = 1;
  }
  void addOne(){
    howMany++;
  }
}
